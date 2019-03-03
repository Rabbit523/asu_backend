<?php

namespace App\Http\Controllers\Dashboard;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

use App\Tag;
use App\Category;
use App\DataTables\TagsDataTable;
use App\Http\Requests\ValidateTag;

class TagController extends Controller
{
    function __construct()
    {
         $this->middleware('permission:tag.index');
         $this->middleware('permission:tag.store', ['only' => ['store']]);
         $this->middleware('permission:tag.update', ['only' => ['update']]);

         $this->middleware('permission:tag.destroy', ['only' => ['destroy']]);
    }

    /**
     * Display a listing of the resource.
     *
     * @return TagsDataTable $dataTable
     */
    public function index(TagsDataTable $dataTable)
    {
        $types = array_combine(Tag::TYPE, array_map('strtoupper', Tag::TYPE));

        return $dataTable->render('tags.index', ['types' => $types]);
    }

    public function filter(Request $request)
    {
        $locale = app()->getLocale();

        $tags = Tag::withType($request->type)
                    ->containing($request->term);

        if ($request->is_category) {
            $tags = $tags->whereDoesntHave('category');
        }

        $tags = $tags->select("name->$locale as text", "id")
        ->get()
        ->toArray();

        return response()->json($tags);
    }

    public function filterByCategory(Request $request) {
        $category = Category::find($request->category);

        $tags = $category->tags()->get()->map(function($tag) {
            return [
                'text' => $tag->name,
                'id' => $tag->id
            ];
        });

        return response()->json($tags);
    }

     /**
     * Store a newly created resource in storage.
     *
     * @param ValidateTag  $request
     * @return \Illuminate\Http\Response
     */
    public function store(ValidateTag $request)
    {
        Tag::create($request->all());

        alert()->success(trans('messages.created'))->autoclose(3000);

        return redirect()->route('dashboard.tag.index');
    }

    /**
     * Update the specified resource in storage.
     *
     * @param ValidateTag  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(ValidateTag $request, $id)
    {
        $tag = Tag::find($id);

        $tag->name = $request->name;
        $tag->save();

        alert()->success(trans('messages.updated'))->autoclose(3000);

        return redirect()->route('dashboard.tag.index');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $tag = Tag::find($id);
        $tag->delete();

        alert()->success(trans("messages.deleted"))->autoclose(3000);

        return redirect()->route('dashboard.tag.index');
    }
}
