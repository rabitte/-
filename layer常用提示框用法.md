# layer常用提示框用法

### 一 layer的普通提示框

效果：


代码：

layer.alert('次案件已回库，请选择其他案件', {
icon: 5,
title: "提示"
});

title属性不设置时默认为“信息”。如下



### 二 layer 带输入框的提示框

效果：



注意！必须引入layer.js   如果不行再引入他的延伸js layer.ext.js 或者layer3.0.1版本的layer.js

代码:


layer.prompt({
 formType: 2,
 value: '驳回！',
 title: '请输入驳回理由'
}, function(value, index, elem){
layer.close(index);
//layer.alert(value);
$.ajax({
type: "post",
url: "/visit/updateVisitApply",
data: {
"id": id,
"status": "3",
"reason":value

},
async: true,

});
layer.alert('驳回成功'); 
location=location;
});


   value:输入框的默认值

   title:提示框的标题

   layer.close(index);  点击确定后关闭提示框。

### 三 layer 的判断提示框

效果：


代码：

layer.confirm('您确定要删除这条数据吗？', {
btn: ['确定','取消'] //按钮
}, function()
{
layer.closeAll('dialog');
$.ajax({
type: "post",
url: "${pageContext.request.contextPath}/cuishou/delete",
data: {
"id": id
},
success : function(data){

}
});
});

layer.closeAll('dialog');  点击确定关闭提示框

### 四 layer的iframe弹框

效果：在页面中弹出一个子页面。调用别的jsp



代码：

首先先定义

//定义全局变量
var myLayer = {
index : 0,
close : function() {
layer.close(this.index);
location.reload();
},
parentCaseIds : function() {
var array = new Array();
var checks = $("table tr td input[type='checkbox']:checked");
$.each(checks, function() {
var dataId = $(this).parent().parent().attr("data-id");
if (dataId)
array.push(dataId);
});
return array;
}


};

$("#roleSelect").on("click",function(){
var userId = $("input[type='radio']:checked").val();
if(typeof(userId)=='undefined'){
layer.alert('请选择员工', {
icon: 5
});
return;
}else{
//弹出框分配角色界面
          myLayer.index=layer.open({
           type: 2, 
           title: "角色分配",
           area: ['400px','300px'],
           content:'${pageContext.request.contextPath }/cuishou/roleList?emplist=${emplist}&userId='+userId+''
          }); 
}
});


获取父页面table选中行的参数

js代码：

//获取被选中的tr
var id=$('.selected', window.parent.document).find(".needid").attr('data-id');//获取父页面单选选中的自定义id值

var visitid=$('.selected', window.parent.document).find(".visitid").html();//获取父页面单选选中的行的td根据td的class获取td内容

var empId = $("input[type='radio']:checked").val();//获取本页面单选框的值

 var appointName=$("input[type='radio']:checked").parents("tr").find(".appointName").html();//获取本页面单选选中的行根据td的class获取td内容
