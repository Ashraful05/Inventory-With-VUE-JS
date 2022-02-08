<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Models\Employee;
use App\Models\Product;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Intervention\Image\Facades\Image as Image;

class ProductController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $products = DB::table('products')
                    ->join('categories','products.category_id','categories.id')
                    ->join('suppliers','products.supplier_id','suppliers.id')
                    ->select('categories.category_name','suppliers.name','products.*')
                    ->orderby('products.id','desc')
                    ->get();
        return response()->json($products);
    }


    public function store(Request $request)
    {
        $this->validate($request,[
           'product_name'=>'required',
            'product_code'=>'required|unique:products',
            'category_id' => 'required',
            'supplier_id' => 'required',
            'buying_price' => 'required',
            'selling_price' => 'required',
            'buying_date' => 'required',
            'product_quantity' => 'required',
        ]);
        if($request->image){
            $position = strpos($request->image,';');
            $sub = substr($request->image,0,$position);
            $image_exist = explode('/',$sub)[1];
            $name = time().".".$image_exist;
            $image = Image::make($request->image)->resize(240,200);
            $uploadPath = 'backend/product/';
            $imageUrl = $uploadPath.$name;
            $image->save($imageUrl);

            $saveProduct = new Product();
            $saveProduct->product_name= $request->product_name;
            $saveProduct->product_code = $request->product_code;
            $saveProduct->buying_price = $request->buying_price;
            $saveProduct->selling_price = $request->selling_price;
            $saveProduct->buying_date = $request->buying_date;
            $saveProduct->product_quantity = $request->product_quantity;
            $saveProduct->root = $request->root;
            $saveProduct->image = $imageUrl;
            $saveProduct->supplier_id = $request->supplier_id;
            $saveProduct->category_id = $request->category_id;
            $saveProduct->save();

        }else{
            $saveProduct = new Product();
            $saveProduct->product_name= $request->product_name;
            $saveProduct->product_code = $request->product_code;
            $saveProduct->buying_price = $request->buying_price;
            $saveProduct->selling_price = $request->selling_price;
            $saveProduct->buying_date = $request->buying_date;
            $saveProduct->product_quantity = $request->product_quantity;
            $saveProduct->root = $request->root;
            $saveProduct->supplier_id = $request->supplier_id;
            $saveProduct->category_id = $request->category_id;
            $saveProduct->save();

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
        $editProduct = DB::table('products')->where('id',$id)->first();
        return response()->json($editProduct);
    }

    public function update(Request $request, $id)
    {
        $this->validate($request,[
            'product_name'=>'required',
            'product_code'=>'required|unique:products',
            'category_id' => 'required',
            'supplier_id' => 'required',
        ]);

        $data = array();
        $data['product_name']=$request->product_name;
        $data['product_code']=$request->product_code;
        $data['buying_price']=$request->buying_price;
        $data['selling_price'] = $request->selling_price;
        $data['buying_date']=$request->buying_date;
        $data['product_quantity']=$request->product_quantity;
        $data['root'] = $request->root;
        $data['category_id'] = $request->category_id;
        $data['supplier_id'] = $request->supplier_id;
        $newImage = $request->newimage;

        if($newImage){
            $position = strpos($newImage,';');
            $sub = substr($newImage,0,$position);
            $ext = explode('/',$sub)[1];

            $name = time().".".$ext;
            $img = Image::make($newImage)->resize(240,200);
            $uploadPath = 'backend/product/';
            $imageUrl = $uploadPath.$name;
            $success = $img->save($imageUrl);
            if($success){
                $data['image'] = $imageUrl;
                $productImage = DB::table('products')->where('id',$id)->first();
                $imagePath = $productImage->image;
                $unlinkImage = unlink($imagePath);
                $product = DB::table('products')->where('id',$id)->update($data);
            }
        }else{
            $oldImage = $request->image;
            $data['image'] = $oldImage;
            $product = DB::table('products')->where('id',$id)->update($data);
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
        $deleteProduct = DB::table('products')->where('id',$id)->first();
        $image = $deleteProduct->image;
        if($image){
            unlink($image);
            DB::table('products')->where('id',$id)->delete();
        }else{
            DB::table('products')->where('id',$id)->delete();
        }


    }

    public function updateStock(Request $request,$id)
    {
        $data = array();
        $data['product_quantity'] = $request->product_quantity;
        DB::table('products')->where('id',$id)->update($data);
    }
}
