<?php

/**
 * 字符串两次md5加密
 * @param $str 要加密的字符串
 */
function double_md5($str) {
 
 return md5(md5(trim($str)));
}


if(!function_exists('navtree')){
/**
     * 后台导航树
     * @param string $array 菜单栏数组
     * @param string $level 父类id
     * @return $array  返回菜单树
     */
    function navtree( $data,$level = 0){
        $res = [];
        $linum = 0;
        
        foreach( $data as $item ){
            $arr = [];
            if( $item->parent_id == $level ){
                $arr[$linum] = $item;
                $arr[$linum]->son = navtree($data,$item->id);
                $res[] = $arr[$linum];
                $linum++;
            }
            
        }
        return $res;
    }
        
        
        
}


if(!function_exists('authcode')){
	/**
	 * discuz!金典的加密函数
	 * @param string $string 明文 或 密文
	 * @param string $operation DECODE表示解密,其它表示加密
	 * @param string $key 密匙
	 * @param int $expiry 密文有效期
	 */
	function authcode($string, $operation = 'ENCODE', $key = '', $expiry = 0) {
		// 动态密匙长度，相同的明文会生成不同密文就是依靠动态密匙
		$ckey_length = 4;

		// 密匙
		$key = md5($key ? $key : 'nLywa&123KlA+0*'); // AUTH_KEY 项目配置的密钥

		// 密匙a会参与加解密
		$keya = md5(substr($key, 0, 16));
		// 密匙b会用来做数据完整性验证
		$keyb = md5(substr($key, 16, 16));
		// 密匙c用于变化生成的密文
		$keyc = $ckey_length ? ($operation == 'DECODE' ? substr($string, 0, $ckey_length): substr(md5(microtime()), -$ckey_length)) : '';
		// 参与运算的密匙
		$cryptkey = $keya.md5($keya.$keyc);
		$key_length = strlen($cryptkey);
		// 明文，前10位用来保存时间戳，解密时验证数据有效性，10到26位用来保存$keyb(密匙b)，解密时会通过这个密匙验证数据完整性
		// 如果是解码的话，会从第$ckey_length位开始，因为密文前$ckey_length位保存 动态密匙，以保证解密正确
		$string = $operation == 'DECODE' ? base64_decode(substr($string, $ckey_length)) : sprintf('%010d', $expiry ? $expiry + time() : 0).substr(md5($string.$keyb), 0, 16).$string;
		$string_length = strlen($string);
		$result = '';
		$box = range(0, 255);
		$rndkey = array();
		// 产生密匙簿
		for($i = 0; $i <= 255; $i++) {
			$rndkey[$i] = ord($cryptkey[$i % $key_length]);
		}
		// 用固定的算法，打乱密匙簿，增加随机性，好像很复杂，实际上对并不会增加密文的强度
		for($j = $i = 0; $i < 256; $i++) {
			$j = ($j + $box[$i] + $rndkey[$i]) % 256;
			$tmp = $box[$i];
			$box[$i] = $box[$j];
			$box[$j] = $tmp;
		}
		// 核心加解密部分
		for($a = $j = $i = 0; $i < $string_length; $i++) {
			$a = ($a + 1) % 256;
			$j = ($j + $box[$a]) % 256;
			$tmp = $box[$a];
			$box[$a] = $box[$j];
			$box[$j] = $tmp;
			// 从密匙簿得出密匙进行异或，再转成字符
			$result .= chr(ord($string[$i]) ^ ($box[($box[$a] + $box[$j]) % 256]));
		}

		if($operation == 'DECODE') {
			// substr($result, 0, 10) == 0 验证数据有效性
			// substr($result, 0, 10) - time() > 0 验证数据有效性
			// substr($result, 10, 16) == substr(md5(substr($result, 26).$keyb), 0, 16) 验证数据完整性
			// 验证数据有效性，请看未加密明文的格式
			if((substr($result, 0, 10) == 0 || substr($result, 0, 10) - time() > 0) && substr($result, 10, 16) == substr(md5(substr($result, 26).$keyb), 0, 16)) {
				return substr($result, 26);
			} else {
				return '';
			}
		} else {
			// 把动态密匙保存在密文里，这也是为什么同样的明文，生产不同密文后能解密的原因
			// 因为加密后的密文可能是一些特殊字符，复制过程可能会丢失，所以用base64编码

			return $keyc.str_replace('=', '', base64_encode($result));
		}
	}
}

if(!function_exists('orderNumCreate')){
	/**
	 * 单号生成
	 * @param string $array 菜单栏数组
	 * @param string $level 父类id
	 * @return $array  返回菜单树
	 */
	function orderNumCreate($str = ''){
		@date_default_timezone_set("PRC"); 
			while(true){ 
			//订购日期
			$order_date = date('Y-m-d'); 
			//订单号码主体（YYMMDDHHIISSNNNNNN）
			$order_id_main = substr(date('YmdHis'),2) . rand(10000,99999); 
			//订单号码主体长度
			$order_id_len = strlen($order_id_main);
			$order_id_sum = 0; 
			for($i=0; $i<$order_id_len; $i++){    
				$order_id_sum += (int)(substr($order_id_main,$i,1));
			}
			//唯一订单号码（YYMMDDHHIISSNNNNNN）
			//$order_id = $order_id_main . str_pad((100 - $order_id_sum % 100) % 100,2,'0',STR_PAD_LEFT);
			$order_id = $str.$order_id_main . str_pad((100 - $order_id_sum % 100) % 100,2,'0',STR_PAD_LEFT);
			return $order_id;
		}
	}


}




?>