<?php


namespace App\Http\Controllers\Api;

use Illuminate\Http\Request;
use Spatie\QueryBuilder\Filter;
use App\Http\Controllers\Controller;
use Spatie\QueryBuilder\QueryBuilder;

use App\Category;
use App\Http\Resources\Category\CategoryCollection;

class CategoryController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $maxResults = request('page', Category::PAGINATION)['max-results'];

        $query = QueryBuilder::for(Category::class)
                ->allowedFilters(
                    Filter::exact('id'),
                    Filter::partial('name')
                )
                ->select('id', 'name')
                ->jsonPaginate($maxResults);

        return new CategoryCollection($query);
    }
}