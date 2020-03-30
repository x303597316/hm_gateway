layui.define('jquery', function(exports){
	"use strict";
	var $ = layui.$
	,hint = layui.hint();
	var CheckBox = function(options){
		this.options = options;
	};
	
	//初始化
	CheckBox.prototype.init = function(elem){
		var that = this;
		elem.addClass('checkBox'); //添加checkBox样式
		that.checkbox(elem);
	};
	
	//树节点解析
	CheckBox.prototype.checkbox = function(elem,children){
		var that = this, options = that.options;
		var nodes = children || options.nodes;
		layui.each(nodes, function(index, item){
			var li;
			if(null==item.attr_value_status){	//属性
				li = $(['<li class="block'+(item.attr_status==1?' on':'')+'" nodename="'+item.attr_name+'"><span>'+item.attr_name+'</span><i class="choice"><i class="triangle"></i><i class="right layui-icon layui-icon-ok"></i></i><span class="hide">'+(item.attr_status==1?'<input type="hidden" name=attr_name nodename="'+item.attr_name+'">':'')+'</span></li>'].join(''));
				if(index==0){
					li = $(['<li class="block'+(item.attr_status==1?' on':'')+'" nodename="'+item.attr_name+'"><span class="ys">'+item.attr_name+'</span><i class="choice"><i class="triangle"></i><i class="right layui-icon layui-icon-ok"></i></i><span class="hide">'+(item.attr_status==1?'<input type="hidden" name=attr_name nodename="'+item.attr_name+'">':'')+'</span></li>'].join(''));
				}
				if(index>2){
					li = $(['<li class="block'+(item.attr_status==1?' on':'')+'" nodename="'+item.attr_name+'"><span>'+item.attr_name+'</span><i class="edit" onclick="edit(this)"><i class="layui-icon layui-icon-edit" ></i></i><i class="choice"><i class="triangle"></i><i class="right layui-icon layui-icon-ok"></i></i><i class="del"><i class="layui-icon layui-icon-delete"></i></i><span class="hide">'+(item.attr_status?'<input type="hidden" name=attr_name nodename="'+item.attr_name+'">':'')+'</span></li>'].join(''));
				}
			}else{		//属性值
				li = $(['<li class="block'+(item.attr_value_status==1?' on':'')+'" nodename="'+item.attr_value_name+'"><span>'+item.attr_value_name+'</span><i class="edit" onclick="editValue(this)"><i class="layui-icon layui-icon-edit" ></i></i><i class="choice"><i class="triangle"></i><i class="right layui-icon layui-icon-ok"></i></i><i class="del"><i class="layui-icon layui-icon-delete"></i></i><span class="hide">'+(item.attr_value_status?'<input type="hidden" name=attr_value_name nodename="'+item.attr_value_name+'">':'')+'</span></li>'].join(''));
			}
			elem.append(li);
			//触发点击节点回调
			typeof options.click === 'function' && that.click(li, item);
			//触发删除节点回调
			typeof options.del === 'function' && that.del(li, item);
		});
	};
	
	//点击节点回调
	CheckBox.prototype.click = function(elem, item){
		var that = this, options = that.options;
		elem.on('click', function(e){
			elem.toggleClass("on");
			if(null==item.attr_value_status){	//属性
				var index = $('#checkbox li').index(this);	//当前li的下标
				if(elem.hasClass("on")){
					item.attr_status = 1;
					arr[index].attr_status = 1;
					elem.children("span.hide").html('<input type="hidden" name=attr_name nodename="'+item.attr_name+'">');
				}else{
					item.attr_status = 0;
					arr[index].attr_status = 0;
					elem.children("span.hide").html('');
				}
				
				$("input[name='attr']").val(JSON.stringify(arr));	//重新赋属性隐藏域 
				
				var i=0;	//遍历li，改变字体颜色
				$('#checkbox').find('li').each(function(){
					if(index==i){
						$(this).children(0).addClass('ys');
					}else{
						$(this).children(0).removeClass('ys');
					}
					i=i+1;
				});
				
				//取出当前attr_id，并查询该attr_id下的所有属性值
				var attr_id=arr[index].attr_id;
				if(attr_id!=null){
					$.ajax({
						url:'getAttrValueList.do',
						data:{'attr_id':attr_id},
						dataType:'json',
						type:'post',
						async:false,
						success:function(res){
							if(res.status==1){
								arrValue=res.attrValueList;
								initCheckValueBox(arrValue);
							}else{
								layer.msg(res.msg,{'icon':2,'time':2000});
							}
						},
						error:function(){
							layer.msg('系统错误',{'icon':2,'time':2000});
						}
					});
				}else{
					arrValue=[];
					initCheckValueBox(arrValue);
				}
				
			}else{	//属性值
				
				var index = $('#checkboxValue li').index(this);	//当前li的下标
				if(elem.hasClass("on")){
					item.attr_value_status = 1;
					arrValue[index].attr_value_status=1;
					elem.children("span.hide").html('<input type="hidden" name=attr_value_name nodename="'+item.attr_value_name+'">');
				}else{
					item.attr_value_status = 0;
					arrValue[index].attr_value_status=0;
					elem.children("span.hide").html('');
				}
				
				$("input[name='attrValue']").val(JSON.stringify(arrValue));		//重新赋属性隐藏域 
			}
		});
	};
	
	//点击节点删除按钮回调
	CheckBox.prototype.del = function(elem, item){
		var that = this, options = that.options;
		elem.children('i.del').on('click', function(e){
			
			if(null==item.attr_value_status){	//属性
				var index = layer.confirm('该操作会删除对应所有属性值，确定删除吗？', {
					btn: ['删除','取消']
				}, function(){
					layer.close(index);
					if(null!=item.attr_id){
						$.ajax({
							url:'delAttr.do',
							data:{'attr_id':item.attr_id,'gc_id':item.gc_id},
							dataType:'json',
							type:'post',
							async:false,
							success:function(res){
								if(res.status==1){
									arr=res.attrList;
									arrValue=res.attrValueList;
									initCheckBox(arr);
									initCheckValueBox(arrValue);
									layer.msg(res.msg,{'icon':1,'time':2000});
								}else{
									layer.msg(res.msg,{'icon':2,'time':2000});
								}
							},
							error:function(){
								layer.msg('系统错误',{'icon':2,'time':2000});
							}
						});
					}else{
						elem.closest(".block").remove();
						layui.stope(e);
					}
				});
				
			}else{	//属性值
				
				var index = layer.confirm('确定删除吗？', {
					btn: ['删除','取消']
				}, function(){
					layer.close(index);
					if(null!=item.attr_value_id){
						$.ajax({
							url:'delAttrValue.do',
							data:{'attr_value_id':item.attr_value_id,'attr_id':item.attr_id},
							dataType:'json',
							type:'post',
							async:false,
							success:function(res){
								if(res.status==1){
									arrValue=res.attrValueList;
									initCheckValueBox(arrValue);
									layer.msg(res.msg,{'icon':1,'time':2000});
								}else{
									layer.msg(res.msg,{'icon':2,'time':2000});
								}
							},
							error:function(){
								layer.msg('系统错误',{'icon':2,'time':2000});
							}
						});
					}else{
						elem.closest(".block").remove();
						layui.stope(e);
					}
				});
			}
		});
	};

	//暴露接口
	exports('checkbox', function(options){
		var checkbox = new CheckBox(options = options || {});
		var elem = $(options.elem);
		if(!elem[0]){
			return hint.error('layui.checkbox 没有找到'+ options.elem +'元素');
		}
		checkbox.init(elem);
	});
}).link('../static/layuiadmin/modules/checkbox.css','checkboxcss');
