<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use DB;

class CartController extends Controller
{
    public function AddToCart(Request $request,$id){
        $product = DB::table('products')->where('id',$id)->first();

        $check = DB::table('pos')->where('pro_id',$id)->first();
        if($check){
            DB::table('pos')->where('pro_id',$id)->increment('pro_quantity');
            $product = DB::table('pos')->where('pro_id',$id)->first();
            $subtotal = $product->pro_quantity * $product->pro_price;
            DB::table('pos')->where('pro_id',$id)->update(['sub_total' => $subtotal]);
        }else{
            $data = array();
            $data['pro_id'] = $id;
            $data['pro_name'] = $product->product_name;
            $data['pro_quantity'] = 1;
            $data['pro_price'] = $product->selling_price;
            $data['sub_total'] = $product->selling_price;
            DB::table('pos')->insert($data);
        }


    }
    public function cartProduct()
    {
        $cart = DB::table('pos')->get();
//        return $cart;
        return response()->json($cart);
    }
    public function cartRemove($id)
    {
        DB::table('pos')->where('id',$id)->delete();
        return response()->json('Done');
    }
    public function cartIncrement($id){
        $quantity = DB::table('pos')->where('id',$id)->increment('pro_quantity');
        $product = DB::table('pos')->where('id',$id)->first();
        $subtotal = $product->pro_quantity * $product->pro_price;
        DB::table('pos')->where('id',$id)->update(['sub_total' => $subtotal]);
        return response()->json('Done');
    }
    public function cartDecrement($id){
        $quantity = DB::table('pos')->where('id',$id)->decrement('pro_quantity');
        $product = DB::table('pos')->where('id',$id)->first();
        $subtotal = $product->pro_quantity * $product->pro_price;
        DB::table('pos')->where('id',$id)->update(['sub_total' => $subtotal]);
        return response()->json('Done');
    }
    public function Vats(){
        $vat = DB::table("extra")->first();
        return response()->json($vat);
    }
}
