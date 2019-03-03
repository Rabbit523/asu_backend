<?php

namespace App\Traits;

trait FieldFilter
{
    /**
     * Set the keys that are supposed to be filtered out.
     *
     * @param array $fields
     * @return $this
     */
    public function hide($fields)
    {
        $this->withoutFields = $fields;
        return $this;
    }

    /**
     * Remove the filtered keys.
     *
     * @param $array
     * @return array
     */
    protected function filterFields($array)
    {
        $result = empty($this->withoutFields) 
                ? collect($array) 
                : collect($array)->only($this->withoutFields);
                
        return $result->toArray();
    }
}
