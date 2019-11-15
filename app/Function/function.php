<?php

/**
 * 字符串两次md5加密
 * @param $str 要加密的字符串
 */
function double_md5($str) {
 
 return md5(md5(trim($str)));
}


?>