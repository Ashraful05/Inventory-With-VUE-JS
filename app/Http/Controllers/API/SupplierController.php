<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Models\Supplier;
use Illuminate\Http\Request;
use Intervention\Image\Facades\Image as Image;
use DB;

class SupplierController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $suppliers = Supplier::all();
        return response()->json($suppliers);
    }


    public function store(Request $request)
    {
        $this->validate($request,[
           'name'=>'required',
           'email'=>'required',
           'phone'=>'required|unique:suppliers'
        ]);
        if($request->photo){
            $position = strpos($request->photo,';');
            $sub = substr($request->photo,0,$position);
            $image_exist = explode('/',$sub)[1];
            $name = time().".".$image_exist;
            $image = Image::make($request->photo)->resize(240,200);
            $uploadPath = 'backend/supplier/';
            $imageUrl = $uploadPath.$name;
            $image->save($imageUrl);

            $saveSupplier = new Supplier();
            $saveSupplier->name= $request->name;
            $saveSupplier->email = $request->email;
            $saveSupplier->phone = $request->phone;
            $saveSupplier->address = $request->address;
            $saveSupplier->shopname = $request->shopname;
            $saveSupplier->photo = $imageUrl;
            $saveSupplier->save();

        }else{
            $saveSupplier = new Supplier();
            $saveSupplier->name= $request->name;
            $saveSupplier->email = $request->email;
            $saveSupplier->phone = $request->phone;
            $saveSupplier->address = $request->address;
            $saveSupplier->shopname = $request->shopname;
            $saveSupplier->save();

        }
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $editSupplier= DB::table('suppliers')->where('id',$id)->first();
        return response()->json($editSupplier);
    }


    public function update(Request $request, $id)
    {
        $this->validate($request,[
           'name'=>'required',
           'email'=>'required',
           'phone'=>'required'
        ]);
        $data = array();
        $data['name']=$request->name;
        $data['email']=$request->email;
        $data['phone']=$request->phone;
        $data['shopname']=$request->shopname;
        $data['address'] = $request->address;
        $newImage = $request->newphoto;

        if($newImage){
            $position = strpos($newImage,';');
            $sub = substr($newImage,0,$position);
            $ext = explode('/',$sub)[1];

            $name = time().".".$ext;
            $img = Image::make($newImage)->resize(240,200);
            $uploadPath = 'backend/supplier/';
            $imageUrl = $uploadPath.$name;
            $success = $img->save($imageUrl);
            if($success){
                $data['photo'] = $imageUrl;
                $supplierImage = DB::table('suppliers')->where('id',$id)->first();
                $imagePath = $supplierImage->photo;
                $unlinkImage = unlink($imagePath);
                $supplier = DB::table('suppliers')->where('id',$id)->update($data);
            }
        }else{
            $oldImage = $request->photo;
            $data['photo'] = $oldImage;
            $supplier = DB::table('suppliers')->where('id',$id)->update($data);
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $deleteSupplier = DB::table('suppliers')->where('id',$id)->first();
        $photo = $deleteSupplier->photo;
        if($photo){
            unlink($photo);
            DB::table('suppliers')->where('id',$id)->delete();
        }else{
            DB::table('suppliers')->where('id',$id)->delete();
        }
    }
}
