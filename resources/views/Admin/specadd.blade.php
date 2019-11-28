
<style>
.removes,.diyRemoves,.diyRemovesSon {
    color: #FF5722;
    cursor: pointer;
}
.diyRemovesSon{
	margin-left:5px;
	margin-right:5px;
}
#specTableList tr td{
	text-align:center;
	vertical-align:middle;
}
#diySpecBox .form-control{
	width:40%;
	float:left;
}
#diySpecBox input[type="checkbox"] {
	opacity:1;
}
#diySpecBox button{
	margin-left:20px;
}
.diyScpeAdd{
	float:left;
}
.disSpecson{
	margin-bottom:10px;
	min-height:32px;
	width:100%;
	float:left;
}
.diyScpeSonAdd{
	margin-top:3px;
	float:left;
	margin-left:-5%!important;
}
</style>
<script src="/js/jquery.min.js"></script>
<div class="form-horizontal ">
	
	<div class="form-group">
		<label class="col-md-3 control-label" for="text-input">商品标题</label>
		<div class="col-md-9">
			<input type="text" disabled value="{{$info->title}}" name="title" id="title" class="form-control" placeholder="商品标题">
			<span class="help-block"></span>
		</div>
	</div>
	
	<div class="form-group">
		<label class="col-md-3 control-label" for="text-input">预设规格属性选择</label>
		<div class="col-md-9">
			<select id="specSelect" name="select" class="form-control" style="width:40%;float:left;" size="1">
				@foreach($spectype as $item)
				<option value="{{$item->name}}">{{$item->name}}</option>
				@endforeach
			</select>
			<button type="button" class="btn btn-success" style="margin-left:20px;"id="scpeArr" ><i class="fa fa-plus"></i> 添加规则属性</button>
		</div>
	</div>

	<!-- 自动生成规格选项 -->
	<div class="form-group">
		<label class="col-md-3 control-label" for="text-input">规格属性选择</label>
		<div class="col-md-9" id="specTypeHtml">
		

		</div>
	</div>
	<!-- 自动生成规格选项 -->

	<!-- 添加自定义属性 -->
	<div class="form-group">
		<label class="col-md-3 control-label" for="text-input">自定义规格属性</label>
		<div class="col-md-9" id="diySpecBox">

			
			<div class="diySpec diySpec1" val="1">
				<span class="diyRemoves" style="float:left;margin:8px 10px 0 0;" val="0">&nbsp;　  </span>
				<input type="text" name="title" class="form-control diyScpetitle diyScpetitle1" placeholder="自定义规则属性名">
				
				<button type="button" class="btn btn-success diyScpeAdd" num='1'><i class="fa fa-plus"></i> 添加自定义规则属性</button>
				
				<!-- <div class="disSpecson1">
					<div class="checkbox-custom checkbox-inline">
						
						<input type="checkbox" class="diySpecCheckBox diySpecCheckBox0" id="diycpecSelectBox_0_0" name="spec[]" value="1" str="">
						<input type="text" class="diySpecTextInput" placeholder="请输入自定义属性" >
						<span class="diyRemovesSon" val="0">[ - ]</span>
					</div>
					<button type="button" class="bk-margin-5 btn btn-info btn-xs diyScpeSonAdd" num='1'   ><i class="fa fa-plus"></i> 添加</button>
				</div> -->
			</div>

		</div>
	</div>

	<!-- 添加自定义属性 -->



	<!-- 根据选择标签自动生成表格-->
	<div class="row">
		<div class="panel panel-info">
			<div class="panel-heading ">
				<h6><i class="fa fa-table red"></i><span class="break"></span>规格属性表格</h6>							
			</div>
			<div class="panel-body">
				<div class="table-responsive">
					<table class="table table-bordered">
							<thead>
								<tr id="specTableHeader">
									                                       
								</tr>
							</thead>   
							<tbody id="specTableList" style="vertical-align:middle;">
								<!-- <tr>
									<td>
										<input type="text" name="price" class="form-control">
									</td>   
									<td>
										<input type="text" name="num" class="form-control">
									</td>    
								</tr> -->
										                                  
							</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
	<!-- 根据选择标签自动生成表格-->
	<br>
	<div class="form-group">
		<label class="col-md-3 control-label" for="password-input"></label>
		<div class="col-md-5">
			<input type="hidden" disabled value="{{$info->id}}" name="id" id="id">
			<button  class="btn btn-primary btn-lg btn-block" id="addSubmit" />提 交</button>
		</div>
	</div>
	
	<br>
</div>
<script>

var spectypeArr = {};   //根据后台数据生成数组
var specHtmlArr = [];	//选择添加的规则分类
var diySpecHtmlArr = [];	//选择添加的自定义规则分类
var speccheckBoxArr = [];	//已选择的子类
var diySpeccheckBoxArr = [];	//已选择的自定义子类
var tdArr = [];			//规格分类统计，用于生成表格
var diySpecNum = 1;
var typelist = [];      //所有头部汇总
var writedata = {};    //填写记录保存

	@foreach($spectype as $item)
	spectypeArr["{{$item->name}}"] = [
		@foreach($item->son as $i)
			"{{$i->name}}",
		@endforeach
		]
	@endforeach

//点击自定义属性大类添加按钮触发  
$('.form-horizontal').on('click','.diyScpeAdd',function(){
	var num = $(this).attr('num');
	
	var input = $('.diySpec'+num).find('input').val();
	if( input.length > 0 ){
		
		if($(this).next('div').length == 0){
			diySpecBoxSon(num);
		}
		diySpecNum++;
		diySpecBoxAppend();
		diySpecButton();
	}else{
		alert('自定义属性内容不能为空');
	}
	
})
var nn = 0;
@foreach( $nspectype as $key=>$item)
	diySpecHtmlArr.push("{{$key}}");
	diySpeccheckBoxArr[nn] = [];
	@foreach( $item as $i )
	diySpeccheckBoxArr[nn].push("{{$i}}");
	@endforeach	
	nn++;
@endforeach

window.onload = function(){
	if( diySpecHtmlArr.length ){
		for( var i = 0; i < diySpecHtmlArr.length; i++ ){
			$('.diyScpetitle').eq(i).val(diySpecHtmlArr[i]);
			if($(this).next('div').length == 0){
				diySpecBoxSon(i+1);
			}
			diySpecNum++;
			diySpecBoxAppend();
			diySpecButton();
		}
		for( var i = 0; i < diySpeccheckBoxArr.length; i++ ){
			for( var j = 0; j < diySpeccheckBoxArr[i].length; j++ ){
			}
		}
		for( var i = 0; i < diySpeccheckBoxArr.length; i++ ){
			for( var j = 0; j < diySpeccheckBoxArr[i].length; j++ ){
				if( j+1 < diySpeccheckBoxArr[i].length){
					diySpecBoxSonInput((i+1))
				}
				$('.diySpecTextInput'+(i+1)).eq(j).val(diySpeccheckBoxArr[i][j]);
				$('.diySpecCheckBox'+(i+1)).eq(j).prop('checked',true);
			}
		}
		dgSpec();
		@foreach( $son as $item )
			writedata['/{{$item->type}}'] = {};
			writedata['/{{$item->type}}']['price'] = "{{$item->price}}" 
			writedata['/{{$item->type}}']['num'] = "{{$item->num}}" 
		@endforeach

		loadWriteData();
	}
}

//点击自定义属性input 右边添加按钮触发
$('.form-horizontal').on('click','.diyScpeSonAdd',function(){
	var num = $(this).attr('num');
	diySpecBoxSonInput(num);
});
$('.form-horizontal').on('blur','.diyScpetitle',function(){
	diyHeadAdd();
})
//二级子类失去焦点触发
$('.form-horizontal').on('blur','.diySpecTextInput',function(){
	var num = $(this).attr('val');
	if( $(this).val() == '' ){
		$(this).prev('input').prop('checked',false);
	}
	diyHeadAdd();
})
//点击自定义多选框检测
$('.form-horizontal').on('click','.diySpecCheckBox',function(){
	if( $(this).next('input').val() == '' ){
		$(this).prop('checked',false);
		alert('请先填写自定义属性');
	}
	diyHeadAdd();
})
//点击自定义属性一级大类删除按钮
$('.form-horizontal').on('click','.diyRemoves',function(){
	$(this).parent('div').remove();
	diySpecButton();
	diyHeadAdd();
	
})
//点击自定义属性子类删除按钮
$('.form-horizontal').on('click','.diyRemovesSon',function(){
	$(this).parent('div').remove();
	diyHeadAdd();
})

//添加自定义一级分类按钮显示隐藏
function diySpecButton(){
	$('.diyScpeAdd').css('display','none');
	$('.diyScpeAdd').last().css('display','block');
}

//添加自定义属性规格一级分类
function diySpecBoxAppend(){
	$('#diySpecBox').append('<div class="diySpec diySpec'+diySpecNum+'" val="'+diySpecNum+'"><span class="diyRemoves" style="float:left;margin:8px 10px 0 0;" val="'+diySpecNum+'">[ - ]</span><input type="text" name="title" class="form-control diyScpetitle diyScpetitle'+diySpecNum+'" placeholder="自定义规则属性名"><button type="button" class="btn btn-success diyScpeAdd" num="'+diySpecNum+'"><i class="fa fa-plus"></i> 添加自定义规则属性</button></div>');
}
/*添加自定义属性规格二级分类*/
function diySpecBoxSon(num){
	$('.diySpec'+num).append('<div class="disSpecson disSpecson'+num+'"><div class="checkbox-custom checkbox-inline"><input type="checkbox" class="diySpecCheckBox diySpecCheckBox'+num+'" id="diycpecSelectBox_0_0" name="spec[]" value="'+num+'" str=""><input type="text" class="diySpecTextInput diySpecTextInput'+num+'" placeholder="请输入自定义属性" val="'+num+'" ><span class="diyRemovesSon" val="'+num+'">[ - ]</span></div><button type="button" class="bk-margin-5 btn btn-info btn-xs diyScpeSonAdd" num='+num+'><i class="fa fa-plus"></i> 添加</button></div>');
}
//添加自定义属性规格二级分类input框
function diySpecBoxSonInput(num){
	$('.disSpecson'+num).append('<div class="checkbox-custom checkbox-inline"><input type="checkbox" class="diySpecCheckBox diySpecCheckBox'+num+'" id="diycpecSelectBox_0_0" name="spec[]" value="1" str=""><input type="text" class="diySpecTextInput diySpecTextInput'+num+'"  placeholder="请输入自定义属性" val="'+num+'" ><span class="diyRemovesSon" val="'+num+'">[ - ]</span></div>');
}

$('#scpeArr').click(function(){
	var type = $('#specSelect').val();
	if( specHtmlArr.indexOf(type) == -1 ){
		specHtmlArr.push(type);
	}
	
	specTypeHtml();

});

//添加头部数组
function diyHeadAdd(){
	diySpecHtmlArr = [];
	diySpeccheckBoxArr = [];
	var ind = 0;
	$('.diySpec').each(function(){
		var num = $(this).attr('val');
		if( $('.diyScpetitle'+num).val() && $('.diySpecCheckBox'+num+':checked').length > 0 ){
			var tital = $('.diyScpetitle'+num).val();
			
			
			diySpecHtmlArr.push( tital );
			diySpeccheckBoxArr[ind] = [];
			$.each($('.diySpecCheckBox'+num+':checked'),function(){
				var valText = $(this).next('input').val();
				diySpeccheckBoxArr[ind].push(valText);
			})
			ind++;
		}
	})
	dgSpec();
}

//预设规格 下的 规格属性添加内容
function specTypeHtml(){
	var str = '';
	for(var i in specHtmlArr){
		str = str+'<div class="form-group"><label class="col-md-2 control-label"><span class="removes" val="'+i+'">[ - ]</span>'+specHtmlArr[i]+'</label><div class="col-md-10">';
		

		$.each(spectypeArr[specHtmlArr[i]],function(s,val){
			
			str = str +'<div class="checkbox-custom checkbox-inline"><input type="checkbox" class="specCheckBox specCheckBox'+i+'" id="cpecSelectBox_'+i+'_'+s+'" name="spec[]" value="'+i+'" str="'+val+'"><label for="cpecSelectBox_'+i+'_'+s+'">'+val+'</label></div>';
		});
		str = str+'</div></div>';
	}
	$('#specTypeHtml').html(str);
}

//点击删除标签时删除改属性	
$('.form-horizontal').on('click','.removes',function(){
	tdArr.splice($(this).attr('val'),1);
	specHtmlArr.splice($(this).attr('val'),1);
	specTypeHtml();
});

//点击选择框记录属性	
$('.form-horizontal').on('click','.specCheckBox',function(){
	setScpeCheckBox();
})

//恢复已选规格属性
function checkSpecSelect(){
	for( var i = 0; i < tdArr.length; i++ ){
		for(var j = 0; j < tdArr[i].length; j++){
			$('input[str="'+tdArr[i][j]+'"]').prop('checked',true);
		}
	}

	dgSpec();
}

//设置规格属性数组
function setScpeCheckBox(){
	speccheckBoxArr = [];
	tdArr = [];
	var num = 0;
	$('input[name="spec[]"]').each(function(){
		var ind = $(this).val();
		
		if( $(this).prop('checked') == true ){
			speccheckBoxArr.push($(this).val());
		}
	})

	for(var i = 0; i < specHtmlArr.length;i++){
		
		
		if( $('.specCheckBox'+i+':checked').length > 0 ){
			tdArr[num] = [];
			for(var j = 0; j < $('.specCheckBox'+i+':checked').length; j++ ){
				tdArr[num].push($('.specCheckBox'+i+':checked').eq(j).attr('str'));
			}
			num++;
		}
	}
	dgSpec();
}

//生成表格
function dgSpec( num = 0 ){
	typelist = [];
	var str = '';
	var headStr = '',listStr = '';
	//预设类头部查看是否添加表格头
	for(var i = num; i < specHtmlArr.length;i++){
		
		headStr = headStr + specHtmlStatus(i,specHtmlArr[i]);
	}
	//自定义类头部查看是否添加表格头
	for(var i = num; i < diySpecHtmlArr.length;i++){
		headStr = headStr + diySpecHtmlStatus(i,diySpecHtmlArr[i]);
	}
	
	//查询是否选择规格属性 有 生成表格
	if( tdArr.length || diySpeccheckBoxArr.length ){
		listStr = getSpecStr();
	}
	headStr = headStr + '<th>价格</th><th>库存</th>';


	$('#specTableHeader').html(headStr);
	$('#specTableList').html(listStr);
	loadWriteData();
}



//递归表格数组，生成表格字符串
function getStr(tdArr,num,val=''){
	var arr = [],rStr = '',str='',nal= '';
	for( var i = 0; i < tdArr[num].length; i++ ){
		var reStr = '';
		if( num == 0 || i != 0 ){
			str = '<tr>';
		}else{
			str = '';
		}
		
		
		var rowNum = getRowspanNum(tdArr,num);
		str = str + '<td rowspan="'+rowNum+'">'+tdArr[num][i]+'</td>';
		nal = val+'/'+tdArr[num][i];
		
		if( tdArr.length > num+1 ){
			reStr = getStr(tdArr,num+1,nal);
			for( var j = 0; j < reStr.length; j++ ){
				if(j==0){
					arr.push(str +'' + reStr[j])
				}else{
					arr.push(reStr[j])
				}
			}
		}else{
			if(num+1 == tdArr.length ){
				arr.push(str+'<td><input type="text" infos="'+nal+'" name="price" class="form-control"></td><td><input type="text" name="num" class="form-control"></td></tr>');
			}else{
				arr.push(str);
			}
			
		}
		
	}
	
	return arr;
}
//获取所有的已选择的规格属性
function getSpecStr(colstatus = 0){
	var num = 0,strArr= [],tdAddrNew=[];

	for(var i = 0; i < specHtmlArr.length;i++){
		if( $('.specCheckBox'+i+':checked').length > 0 ){
			tdArr[num] = [];
			tdAddrNew[num] = [];
			for(var j = 0; j < $('.specCheckBox'+i+':checked').length; j++ ){
				tdArr[num].push($('.specCheckBox'+i+':checked').eq(j).attr('str'));
				tdAddrNew[num].push($('.specCheckBox'+i+':checked').eq(j).attr('str'));
			}
			num++;
		}
	}
	for(var j = 0; j < diySpeccheckBoxArr.length;j++){
		tdAddrNew.push(diySpeccheckBoxArr[j]);
	}
	strArr = getStr(tdAddrNew,0);
	

	
	return strArr;
}

//获取rowspan数量
function getRowspanNum(tdArr,num){
	var total = 1;
	
	for(var i = num+1 ; i < tdArr.length; i++){
		total = total * tdArr[i].length;
	}
	

	return total;
}
//判断预定义类头部是否添加格子
function specHtmlStatus(k,v){
	var  headerStatus = 0;

		$.each(speccheckBoxArr,function(key,val){
			if( val == k ){
				headerStatus = 1;
			}

		})

		if( headerStatus ){
			typelist.push(v);
			return '<th>'+v+'</th>';
			
		}
		

}
//判断自定义类头部是否添加格子
function diySpecHtmlStatus(k,v){
	typelist.push(v);
	return '<th>'+v+'</th>';
	
}
//表格写入记录存储
function inWriteData(){
	writedata = {};
	$.each($('#specTableList input[name="price"]'),function(index){
		writedata[$(this).attr('infos')] = {};
		writedata[$(this).attr('infos')]['price'] = $(this).val();
		writedata[$(this).attr('infos')]['num'] =$('#specTableList input[name="num"]').eq(index).val();
	})
		
}

//将填写记录写入表格
function loadWriteData(){
	$.each(writedata,function(k,v){
		$.each($('#specTableList input[name="price"]'),function(index){
			if( k == $(this).attr('infos') ){
				$(this).val(v['price']);
				$('#specTableList input[name="num"]').eq(index).val(v['num']);
			}
		})
		
	})
}
//新生成表格表格数据发生改变时重新写入数据
$('#specTableList').on('blur','input',function(){
	inWriteData()
})

function getTableInfo(){
	var info = {};
	var num = 0;
	for(var i = 0; i < $('input[name="price"]').length; i++){
		info[i] = {};
		if(  $('input[name="price"]').eq(i).val() != '' ){
			info[i]['price'] = $('input[name="price"]').eq(i).val();
		}else{
			alert($('input[name="price"]').eq(i).attr('infos')+'价格不能为空');
			break;
		}

		if(  $('input[name="num"]').eq(i).val() != '' ){
			info[i]['num'] = $('input[name="num"]').eq(i).val();
			info[i]['title'] = $('input[name="price"]').eq(i).attr('infos');
		}else{
			alert($('input[name="price"]').eq(i).attr('infos')+'数量不能为空');
			break;
		}
		info[i]['title'] = $('input[name="price"]').eq(i).attr('infos');
		
		
	}
	return info;
}



$('#addSubmit').click(function(){
	var result = {};
		result['_token']= $('meta[name="csrf-token"]').attr('content');
		result['id'] 	= $('#id').val();
		result['list'] 	= getTableInfo();
		result['typelist'] 	= typelist;
		$.post('/admin/GoodsSon',result,function(data){
			alert(data.message);
			if( data.code == 200 ){
				window.location.href="/admin/Goods";
			}
			
		},'json');

})


</script>




