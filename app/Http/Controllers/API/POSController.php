<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Models\Product;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use DateTime;

class POSController extends Controller
{
    public function getProduct($id)
    {
        $getProduct = DB::table('products')->where('category_id',$id)->get();
        return response()->json($getProduct);
    }
    public function orderDone(Request $request)
    {
        $this->validate($request,[
           'customer_id'=>'required',
           'pay_by'=>'required',
        ]);
        $data = array();
        $data['customer_id'] = $request->customer_id;
        $data['qty'] = $request->qty;
        $data['sub_total'] = $request->subtotal;
        $data['vat'] = $request->vat;
        $data['total'] = $request->total;
        $data['pay'] = $request->pay;
        $data['due'] = $request->due;
        $data['pay_by'] = $request->pay_by;
        $data['order_date'] = date('d/m/Y');
        $data['order_month'] = date('F');
        $data['order_year'] = date('Y');
        $order_id = DB::table('orders')->insertGetId($data);

        $posData = DB::table('pos')->get();
        $orderDetails = array();
        foreach ($posData as $pos){
            $orderDetails['order_id']=$order_id;
            $orderDetails['product_id']=$pos->pro_id;
            $orderDetails['pro_quantity']=$pos->pro_quantity;
            $orderDetails['pro_price']=$pos->pro_price;
            $orderDetails['sub_total']=$pos->sub_total;
            DB::table('order_details')->insert($orderDetails);
            DB::table('products')->where('id',$pos->pro_id)
                ->update(['product_quantity' => DB::raw('product_quantity -' .$pos->pro_quantity )]);
        }
        DB::table('pos')->delete();
        return response('Done!!!');
    }

    public function searchOrderByDate(Request $request){
        $orderDate = $request->date;
        $newDate = new DateTime($orderDate);
        $done = $newDate->format('d/m/Y');
        $order = DB::table('orders')
                ->join('customers','orders.customer_id','customers.id')
                ->select('customers.name','orders.*')
                ->where('orders.order_date',$done)
                ->get();
        return response()->json($order);
    }
    public function todaySale(){
        $date = date('d/m/Y');
        $sale = DB::table('orders')->where('order_date',$date)->sum('total');
        return response()->json($sale);
    }
    public function todayIncome(){
        $date = date('d/m/Y');
        $income = DB::table('orders')->where('order_date',$date)->sum('pay');
        return response()->json($income);
    }
    public function todayDue(){
        $date = date('d/m/Y');
        $due = DB::table('orders')->where('order_date',$date)->sum('due');
        return response()->json($due);
    }
    public function todayExpense(){
        $date = date('d/m/Y');
        $expense = DB::table('expenses')->where('expense_date',$date)->sum('amount');
        return response()->json($expense);
    }
    public function todayStockOut(){
        $product = DB::table('products')->where('product_quantity','<','1')->get();
        return response()->json($product);
    }
}
