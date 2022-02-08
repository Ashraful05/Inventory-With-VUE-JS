<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Models\Employee;
use Illuminate\Http\Request;
use Intervention\Image\Facades\Image as Image;
use DB;

class EmployeeController extends Controller
{

    public function index()
    {
        $employees = Employee::all();
//        $employees = Employee::get();
//        return $employees;
        return response()->json($employees);
    }

    public function store(Request $request)
    {
        $this->validate($request,[
            'name' => 'required',
            'email' => 'required|unique:employees',
            'phone' => 'required|unique:employees',
            'nid' => 'required',
            'address' => 'required',
            'salary' => 'required',
        ]);

        if($request->photo){
            $position = strpos($request->photo,';');
            $sub = substr($request->photo,0,$position);
            $image_exist = explode('/',$sub)[1];
            $name = time().".".$image_exist;
            $image = Image::make($request->photo)->resize(240,200);
            $uploadPath = 'backend/employee/';
            $imageUrl = $uploadPath.$name;
            $image->save($imageUrl);

            $saveEmployee = new Employee();
            $saveEmployee->name= $request->name;
            $saveEmployee->email = $request->email;
            $saveEmployee->phone = $request->phone;
            $saveEmployee->nid = $request->nid;
            $saveEmployee->joining_date = $request->joining_date;
            $saveEmployee->address = $request->address;
            $saveEmployee->salary = $request->salary;
            $saveEmployee->photo = $imageUrl;
            $saveEmployee->save();

        }else{
            $saveEmployee = new Employee();
            $saveEmployee->name= $request->name;
            $saveEmployee->email = $request->email;
            $saveEmployee->phone = $request->phone;
            $saveEmployee->nid = $request->nid;
            $saveEmployee->joining_date = $request->joining_date;
            $saveEmployee->address = $request->address;
            $saveEmployee->salary = $request->salary;
            $saveEmployee->save();

        }
    }


    public function show($id)
    {
        $editEmployee = DB::table('employees')->where('id',$id)->first();
        return response()->json($editEmployee);
    }


    public function update(Request $request, $id)
    {
        $data = array();
        $data['name']=$request->name;
        $data['email']=$request->email;
        $data['phone']=$request->phone;
        $data['nid'] = $request->nid;
        $data['salary']=$request->salary;
        $data['joining_date']=$request->joining_date;
        $data['address'] = $request->address;
        $newImage = $request->newphoto;

        if($newImage){
            $position = strpos($newImage,';');
            $sub = substr($newImage,0,$position);
            $ext = explode('/',$sub)[1];

            $name = time().".".$ext;
            $img = Image::make($newImage)->resize(240,200);
            $uploadPath = 'backend/employee/';
            $imageUrl = $uploadPath.$name;
            $success = $img->save($imageUrl);
            if($success){
                $data['photo'] = $imageUrl;
                $employeeImage = DB::table('employees')->where('id',$id)->first();
                $imagePath = $employeeImage->photo;
                $unlinkImage = unlink($imagePath);
                $employee = DB::table('employees')->where('id',$id)->update($data);
            }
        }else{
            $oldImage = $request->photo;
            $data['photo'] = $oldImage;
            $employee = DB::table('employees')->where('id',$id)->update($data);
        }
    }

    public function destroy($id)
    {
        $deleteEmployee = DB::table('employees')->where('id',$id)->first();
        $photo = $deleteEmployee->photo;
        if($photo){
            unlink($photo);
            DB::table('employees')->where('id',$id)->delete();
        }else{
             DB::table('employees')->where('id',$id)->delete();
        }
    }
}
