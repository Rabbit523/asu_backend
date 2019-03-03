<?php

namespace App\Filters\Channels;

use Spatie\QueryBuilder\Filters\Filter;
use Illuminate\Database\Eloquent\Builder;

class AccessTypeFilter implements Filter {

    public function __invoke(Builder $query, $value, string $property) : Builder
    {
        return $query->where('meta->custom_type', $value);
    }

}

