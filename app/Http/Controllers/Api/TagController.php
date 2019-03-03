<?php

namespace App\Http\Controllers\Api;

use Illuminate\Http\Request;
use Spatie\QueryBuilder\Filter;
use App\Http\Controllers\Controller;
use Spatie\QueryBuilder\QueryBuilder;

use App\Tag;
use App\Filters\Tags\CategoryFilter;
use App\Http\Resources\Tag\TagCollection;

class TagController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $maxResults = request('page', Tag::PAGINATION)['max-results'];

        $query = QueryBuilder::for(Tag::class)
                ->allowedFilters(
                    Filter::exact('id'),
                    Filter::exact('type'),
                    Filter::partial('name'),
                    Filter::custom('category', CategoryFilter::class)
                )
                ->select('id', 'name')
                ->jsonPaginate($maxResults);

        return new TagCollection($query);
    }
}