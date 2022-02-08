<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Models\Salary;
use Illuminate\Http\Request;
use DB;

class SalaryController extends Controller
{
    public function paidSalary(Request $request,$id){
       $this->validate($request,[
          'salary_month'=>'required',
       ]);
       $month = $request->salary_month;

       $check = DB::table('salaries')->where('employee_id',$id)->where('salary_month',$month)->first();
//       $check = Salary::find('employee_id',$id)->get('salary_month',$month)->first();
       if($check){
            return response()->json('Salary already paid!!!');
       }else{
           $paidSalary = new Salary();
           $paidSalary->employee_id = $id;
           $paidSalary->amount = $request->salary;
           $paidSalary->salary_date = date('d/m/Y');
           $paidSalary->salary_month = $month;
           $paidSalary->salary_year = date("Y");
           $paidSalary->save();
       }


    }
    public function allSalary(){
        $allSalary = DB::table('salaries')->select('salary_month')->groupBy('salary_month')->get();
        return response()->json($allSalary);
    }
    public function viewSalary($id){
        $month = $id;
        $view = DB::table('salaries')
            ->join('employees','salaries.employee_id','employees.id')
            ->select('employees.name','salaries.*')
            ->where('salaries.salary_month',$month)
            ->get();
        return response()->json($view);
    }
    public function editSalary($id){
        $view = DB::table('salaries')
            ->join('employees','salaries.employee_id','employees.id')
            ->select('employees.name','employees.email','salaries.*')
            ->where('salaries.id',$id)
            ->first();
        return response()->json($view);
    }
    public function updateSalary(Request $request,$id)
    {
        $this->validate($request,[
           'amount'=>'required',
           'salary_month'=>'required'
        ]);
        $data = array();
        $data['employee_id'] = $request->employee_id;
        $data['salary_month'] = $request->salary_month;
        $data['amount'] = $request->amount;

        DB::table('salaries')->where('id',$id)->update($data);
    }
}
