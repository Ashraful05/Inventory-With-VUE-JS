<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Models\Expense;
use Illuminate\Http\Request;
use DB;

class ExpenseController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $expenses = Expense::all();
        return response()->json($expenses);
    }


    public function store(Request $request)
    {
        $this->validate($request,[
           'details' => 'required',
           'amount' => 'required',
        ]);
        $expense = new Expense();
        $expense->details = $request->details;
        $expense->amount = $request->amount;
        $expense->expense_date = date('y/m/d');
        $expense->save();
    }


    public function show($id)
    {
        $editExpense = DB::table('expenses')->where('id',$id)->first();
        return response()->json($editExpense);
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
        $this->validate($request,[
           'amount'=>'required'
        ]);
        $updateExpense = Expense::find($id);
        $updateExpense->details = $request->details;
        $updateExpense->amount = $request->amount;
        $updateExpense->update();

    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $delete = Expense::find($id);
        $delete->delete();
    }
}
