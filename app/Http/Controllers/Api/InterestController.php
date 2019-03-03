<?php

namespace App\Http\Controllers\Api;

use Illuminate\Http\Request;
use Spatie\QueryBuilder\Filter;
use App\Http\Controllers\Controller;
use Spatie\QueryBuilder\QueryBuilder;

use App\Tag;
use App\Http\Resources\Interest\InterestCollection;

class InterestController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $query = QueryBuilder::for(Tag::class)
                ->allowedFilters(
                    Filter::partial('name')
                )
                ->interests()
                ->select('id', 'name')
                ->get();

        return new InterestCollection($query);
    }
}
