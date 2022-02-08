<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Models\Customer;
use App\Models\Employee;
use Illuminate\Http\Request;
use Intervention\Image\Facades\Image as Image;
use DB;

class CustomerController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $customer = Customer::all();
        return response()->json($customer);
    }



    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $this->validate($request,[
            'name' => 'required',
            'phone' => 'required|unique:customers',
            'address' => 'required',
        ]);

        if($request->photo){
            $position = strpos($request->photo,';');
            $sub = substr($request->photo,0,$position);
            $image_exist = explode('/',$sub)[1];
            $name = time().".".$image_exist;
            $image = Image::make($request->photo)->resize(240,200);
            $uploadPath = 'backend/customer/';
            $imageUrl = $uploadPath.$name;
            $image->save($imageUrl);

            $saveCustomer = new Customer();
            $saveCustomer->name= $request->name;
            $saveCustomer->email = $request->email;
            $saveCustomer->phone = $request->phone;
            $saveCustomer->address = $request->address;
            $saveCustomer->photo = $imageUrl;
            $saveCustomer->save();

        }else{
            $saveCustomer = new Employee();
            $saveCustomer->name= $request->name;
            $saveCustomer->email = $request->email;
            $saveCustomer->phone = $request->phone;
            $saveCustomer->address = $request->address;
            $saveCustomer->save();

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
        $editCustomer = Customer::find($id);
        return response()->json($editCustomer);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $data = array();
        $data['name']=$request->name;
        $data['email']=$request->email;
        $data['phone']=$request->phone;
        $data['address'] = $request->address;
        $newImage = $request->newphoto;

        if($newImage){
            $position = strpos($newImage,';');
            $sub = substr($newImage,0,$position);
            $ext = explode('/',$sub)[1];

            $name = time().".".$ext;
            $img = Image::make($newImage)->resize(240,200);
            $uploadPath = 'backend/customer/';
            $imageUrl = $uploadPath.$name;
            $success = $img->save($imageUrl);
            if($success){
                $data['photo'] = $imageUrl;
                $employeeImage = DB::table('customers')->where('id',$id)->first();
                $imagePath = $employeeImage->photo;
                $unlinkImage = unlink($imagePath);
                $customer = DB::table('customers')->where('id',$id)->update($data);
            }
        }else{
            $oldImage = $request->photo;
            $data['photo'] = $oldImage;
            $customer = DB::table('customers')->where('id',$id)->update($data);
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
        $deleteCustomer = DB::table('customers')->where('id',$id)->first();
        $photo = $deleteCustomer->photo;
        if($photo){
            unlink($photo);
            DB::table('customers')->where('id',$id)->delete();
        }else{
            DB::table('customers')->where('id',$id)->delete();
        }
    }
}
