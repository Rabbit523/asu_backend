<?php

namespace App\Http\Controllers\Dashboard;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

use App\Tag;
use App\Category;
use App\DataTables\CategoriesDataTable;
use App\Http\Requests\ValidateCategory;

class CategoryController extends Controller
{
    function __construct()
    {
         $this->middleware('permission:category.index');
         $this->middleware('permission:category.store', ['only' => ['store']]);
         $this->middleware('permission:category.update', ['only' => ['update', 'show']]);

         $this->middleware('permission:category.destroy', ['only' => ['destroy']]);
    }

    /**
     * Display a listing of the resource.
     *
     * @return CategoriesDataTable $dataTable
     */
    public function index(CategoriesDataTable $dataTable) 
    {
        return $dataTable->render('categories.index');
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show(Category $category)
    {
        return response()
             ->json([
                 'name' => $category->name,
                 'tags' => $category->tags()->get()->map(function($tag) {
                    return [
                        'text' => $tag->name,
                        'id' => $tag->id
                    ];
                 }),
             ]);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param ValidateCategory  $request
     * @return \Illuminate\Http\Response
     */
    public function store(ValidateCategory $request) 
    {
        $category = Category::create($request->only('name'));

        if ($request->tags){
            $tags = Tag::whereIn('id', $request->tags)->get()->map(function ($tag) use($category) {
                $tag->category_id = $category->id;
                $tag->save();
            });
        }

        alert()->success(trans('messages.created'))->autoclose(3000);

        return redirect()->route('dashboard.category.index');
    }

    /**
     * Update the specified resource in storage.
     *
     * @param ValidateCategory  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(ValidateCategory $request, Category $category) 
    {
        $category->update($request->only('name'));
        $tagsIds = $request->tags;

        Tag::where('category_id','=',$category->id)->whereNotIn('id', $tagsIds)
        ->update([ 'category_id' => null ]);

        if ($tagsIds) {
            Tag::whereRaw('(category_id is null OR category_id<>'.$category->id.')')
                ->whereIn('id',$tagsIds)->update(['category_id'=>$category->id]);
        }

        alert()->success(trans('messages.updated'))->autoclose(3000);

        return redirect()->route('dashboard.category.index');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy(Category $category) 
    {
        Tag::where('category_id','=',$category->id)
            ->update([ 'category_id' => null ]);

        $category->delete();

        alert()->success(trans("messages.deleted"))->autoclose(3000);

        return redirect()->route('dashboard.category.index');
    }
}
