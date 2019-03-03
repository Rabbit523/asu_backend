<?php

namespace App\Filters\Jobs;

use Spatie\QueryBuilder\Filters\Filter;
use Illuminate\Database\Eloquent\Builder;

class NameFilter implements Filter {

    protected $defaultProperty = "title";

    public function __invoke(Builder $query, $value, string $property) : Builder
    {
        $wrappedProperty = $query->getQuery()->getGrammar()->wrap($this->defaultProperty);

        $sql = "LOWER({$wrappedProperty}) LIKE ?";

        $value = mb_strtolower($value, 'UTF8');

        return $query->whereRaw($sql, ["%{$value}%"]);
    }

}

