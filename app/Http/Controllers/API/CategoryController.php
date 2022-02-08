<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Models\Category;
use Illuminate\Http\Request;
use DB;

class CategoryController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $categories = Category::all();
        return response()->json($categories);
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
            'category_name'=>'required|unique:categories'
        ]);
        $category = new Category();
        $category->category_name = $request->category_name;
        $category->save();
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $editCategory = Category::find($id);
//        $editCategory = DB::table('categories')->where('id',$id)->first();
        return response()->json($editCategory);
    }


    public function update(Request $request, $id)
    {
        $this->validate($request,[
            'category_name'=>'required'
        ]);
        $data = array();
        $data['category_name'] = $request->category_name;
        $updateCategory = DB::table('categories')->where('id',$id)->update($data);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $deleteCategory = DB::table('categories')->where('id',$id)->delete();
    }
}
