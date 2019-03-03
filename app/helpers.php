<?php 

function humanize($str) {
    return ucwords(str_replace(["_", "-"], " ", $str));
}

function contains_word($str, $character) {
    if (strpos($str, $character) !== false) {
        return true;
    }
    return false;
}
  
function get_access_code($prefix) {
    return strtoupper(uniqid($prefix));
}

function comma_separated_to_array($string, $separator = ',')
{
  $vals = explode($separator, $string);
 
  foreach($vals as $key => $val) {
    $vals[$key] = trim($val);
  }

  return array_diff($vals, array(""));
}