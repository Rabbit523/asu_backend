<?php

namespace App\Filters;

use Spatie\QueryBuilder\Filters\Filter;
use Illuminate\Database\Eloquent\Builder;

class CategoryFilter implements Filter {

    public function __invoke(Builder $query, $value, string $property) : Builder
    {
        return $query->whereHas('tags', function ($query) use($value) {
                $query->whereIn('id', $value);
        });
    }

}

