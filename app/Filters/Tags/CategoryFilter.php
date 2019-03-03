<?php

namespace App\Filters\Tags;

use Spatie\QueryBuilder\Filters\Filter;
use Illuminate\Database\Eloquent\Builder;

class CategoryFilter implements Filter {

    public function __invoke(Builder $query, $value, string $property) : Builder
    {
        return $query->where('category_id', $value);
    }

}

