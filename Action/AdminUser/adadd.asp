<%
'乘风广告联盟系统 Sql版
'作者QQ：178575
'作者EMail：yliangcf@163.com
'作者网站：http://www.qqcf.com
'详细简介：http://www.qqcf.com/cfwztg.htm
'上面有程序在线演示，安装演示，使用疑难解答，最新版本下载等内容
'因为这些内容可能时常更新，就没有放在程序里，请自己上网站查看
%>
<%
AdUserName=ChkStr(Request("AdUserName"),1)

If AdUserName="" Then RefUrl=ChkStr(Request.ServerVariables("Http_Referer"),1) Else RefUrl=ChkStr(Request("RefUrl"),1)
%>
<SCRIPT>
$(function(){

$("#t_sitetype_1").hide();
$("#t_sitetype_2").hide();
$("#t_sitetype_3").hide();
$("#t_ad_url_android").hide();
$("#t_ad_url_iphone").hide();
$("#t_adwidth").hide();
$("#t_adheight").hide();
$("#t_clicksemul").hide();



function adadd_initial(){
 $("#t_adshowtype,#t_adshowtype2,#t_adtitle,#t_adintro,#t_ad,#t_ad_2,#t_uploadfiles,#t_ad_url,#t_adsimpleurl,#t_softexename,#t_softtctype,#t_adwidth,#t_adheight,#t_cycstate,#t_adsize").show();
 $("#t_ad1,#t_ad2,#t_ad3,#t_clickstate1,#t_clickstate2,#t_clickstate3,#t_clickstate4,#t_clickstate5,#t_clicksestate").show();
 $("#adwidth").val("");
 $("#adheight").val("");

 $("#clickstate_1,#clickstate_2,#clickstate_3,#clickstate_4,#clicksestate_1,#clicksestate_2").prop('checked',false);
 $("#clicksestate_0").prop('checked',true);
 $("#t_clicksemul").hide();
}

//:前需有空格
$("#t_adsize :radio").click(function(){
 wh = $(this).val();
 if(wh==""){
  $("#t_adwidth,#t_adheight").show();
  $("#adwidth").val(wh);
  $("#adheight").val(wh);
 }else{
  $("#t_adwidth,#t_adheight").hide();
  $("#adwidth").val(wh.substr(0,wh.indexOf("x")));
  $("#adheight").val(wh.substr(wh.indexOf("x")+1));
 }
});


$("#ad_url_typeset_1").click(function(){
 $("#t_ad_url_android").hide();
 $("#t_ad_url_iphone").hide();
});

$("#ad_url_typeset_2").click(function(){
 $("#t_ad_url_android").show();
 $("#t_ad_url_iphone").show();
});

$("#sitetypeset_0").click(function(){
 $("#t_sitetype_1").hide();
 $("#t_sitetype_2").hide();
 $("#t_sitetype_3").hide();
});

$("#sitetypeset_1").click(function(){
 $("#t_sitetype_1").show();
 $("#t_sitetype_2").hide();
 $("#t_sitetype_3").hide();
});

$("#sitetypeset_2").click(function(){
 $("#t_sitetype_1").hide();
 $("#t_sitetype_2").show();
 $("#t_sitetype_3").hide();
});

$("#sitetypeset_3").click(function(){
 $("#t_sitetype_1").hide();
 $("#t_sitetype_2").hide();
 $("#t_sitetype_3").show();
});

$("#clicksestate_0").click(function(){
 $("#t_clicksemul").hide();
});

$("#clicksestate_1,#clicksestate_2").click(function(){
 $("#t_clicksemul").show();
});



//直链广告
$("#ad_class_1").click(function(){
 adadd_initial();
 $("#t_adshowtype,#t_adshowtype2,#t_adtitle,#t_adintro,#t_ad_2,#t_uploadfiles,#t_adsimpleurl,#t_softexename,#t_softtctype,#t_adwidth,#t_adheight,#t_adsize,#t_ad2,#t_clickstate2").hide();
 $("#t_ad1").html("<input name='ad' id='ad' type='text' size='40' style='width:400px'>");
 $("#t_clickstate5").html("点击或弹出获利(CPC)");
});

//直图广告
$("#ad_class_2").click(function(){
 adadd_initial();
 $("#t_adshowtype,#t_adshowtype2,#t_adtitle,#t_adintro,#t_ad,#t_adsimpleurl,#t_softexename,#t_softtctype,#t_adwidth,#t_adheight,#t_cycstate,#t_adsize,#t_ad2,#t_clickstate2").hide();
 $("#t_ad3").html("<input name='ad_2' id='ad_2' type='text' size='40' style='width:400px'>");
 $("#t_ad4").html("<br>直接填写http://或https://开头图片外链，或使用下面上传功能上传广告图片支持200K以下jpg,gif和swf格式的文件上传");
 $("#t_clickstate5").html("点击获利(CPC)");
});

//普通文字
$("#ad_class_3").click(function(){
 adadd_initial();
 $("#t_adshowtype,#t_adshowtype2,#t_adtitle,#t_adintro,#t_ad_2,#t_uploadfiles,#t_adsimpleurl,#t_softexename,#t_softtctype,#t_adwidth,#t_adheight,#t_cycstate").hide();
 $("#t_ad1").html("<textarea name='ad' cols='38' rows='5' style='width:400px'></textarea>");
 $("#t_ad2").html("<br>支持外部广告联盟代码直接发布");
 $("#t_clickstate5").html("点击获利(CPC)");
});

//普通图片
$("#ad_class_4").click(function(){
 adadd_initial();
 $("#t_adshowtype,#t_adshowtype2,#t_adtitle,#t_adintro,#t_ad,#t_adsimpleurl,#t_softexename,#t_softtctype,#t_adwidth,#t_adheight,#t_ad2").hide();
 $("#t_ad3").html("<textarea name='ad_2' id='ad_2' cols='38' rows='5' style='width:400px'></textarea>");
 $("#t_ad4").html("<br>支持外部广告联盟代码直接发布，或直接填写http://或https://开头的图片外链，或使用下面上传功能上传广告图片支持200K以下jpg,gif和swf格式的文件上传");
 $("#t_clickstate5").html("点击获利(CPC)");
});

//混合文字
$("#ad_class_5").click(function(){
 adadd_initial();
 $("#t_adshowtype,#t_adshowtype2,#t_ad,#t_ad_2,#t_uploadfiles,#t_softexename,#t_softtctype,#t_adwidth,#t_adheight,#t_cycstate,#t_adsize,#t_clickstate3,#t_clickstate4").hide();
 $("#t_clickstate5").html("点击获利(CPC)");
 $("#adwidth").val(0);
 $("#adheight").val(0);
});

//混合图片
$("#ad_class_6").click(function(){
 adadd_initial();
 $("#t_adshowtype,#t_adshowtype2,#t_ad,#t_adintro,#t_adsimpleurl,#t_softexename,#t_softtctype,#t_cycstate,#t_ad2,#t_clickstate3,#t_clickstate4").hide();
 $("#t_ad3").html("<input name='ad_2' id='ad_2' type='text' size='40' style='width:400px'>");
 $("#t_clickstate5").html("点击获利(CPC)");
});

//富媒体
$("#ad_class_7").click(function(){
 adadd_initial();
 $("#t_adshowtype2,#t_adtitle,#t_adintro,#t_ad_2,#t_uploadfiles,#t_adsimpleurl,#t_softexename,#t_softtctype,#t_adwidth,#t_adheight").hide();
 $("#t_ad1").html("<textarea name='ad' cols='38' rows='5' style='width:400px'></textarea>");
 $("#t_ad2").html("<br>支持外部广告联盟代码直接发布，或直接填写http://或https://开头的图片外链，或请在[<a href='?Action=imglist' target='_blank'>上传管理</a>]里上传后图片复制绝对路径在广告文字里");
 $("#t_clickstate5").html("点击获利(CPC)");
});

//强弹轮循
$("#ad_class_8").click(function(){
 adadd_initial();
 $("#t_adshowtype,#t_adshowtype2,#t_ad,#t_adtitle,#t_adintro,#t_ad_2,#t_uploadfiles,#t_adsimpleurl,#t_softexename,#t_softtctype,#t_adwidth,#t_adheight,#t_cycstate,#t_adsize,#t_ad2,#t_clickstate2,#t_clickstate3,#t_clickstate4").hide();
 $("#t_clickstate5").html("弹出获利(CPC)");
});

//退弹轮循
$("#ad_class_9").click(function(){
 adadd_initial();
 $("#t_adshowtype,#t_adshowtype2,#t_ad,#t_adtitle,#t_adintro,#t_ad_2,#t_uploadfiles,#t_adsimpleurl,#t_softexename,#t_softtctype,#t_adwidth,#t_adheight,#t_cycstate,#t_adsize,#t_ad2,#t_clickstate2,#t_clickstate3,#t_clickstate4").hide();
 $("#t_ad1").html("<input name='ad' id='ad' type='text' size='40' style='width:400px'>");
 $("#t_clickstate5").html("弹出获利(CPC)");
});

//标签云
$("#ad_class_10").click(function(){
 adadd_initial();
 $("#t_adshowtype,#t_adshowtype2,#t_ad,#t_ad_2,#t_adintro,#t_adsimpleurl,#t_softexename,#t_softtctype,#t_uploadfiles,#t_adwidth,#t_adheight,#t_cycstate,#t_adsize,#t_ad2,#t_clickstate2,#t_clickstate3,#t_clickstate4").hide();
 $("#t_clickstate5").html("点击获利(CPC)");
 $("#adwidth").val(0);
 $("#adheight").val(0);
});

//混合富媒体广告
$("#ad_class_11").click(function(){
 adadd_initial();
 $("#t_adshowtype,#t_ad,#t_adsimpleurl,#t_softexename,#t_softtctype,#t_adwidth,#t_adheight,#t_cycstate,#t_adsize,#t_ad2,#t_clickstate3,#t_clickstate4").hide();
 $("#t_ad3").html("<input name='ad_2' id='ad_2' type='text' size='40' style='width:400px'>");
 $("#t_clickstate5").html("点击获利(CPC)");
 $("#adwidth").val(0);
 $("#adheight").val(0);
});

//软件下载
$("#ad_class_12").click(function(){
 adadd_initial();
 $("#t_adshowtype,#t_adshowtype2,#t_ad,#t_adsimpleurl,#t_adwidth,#t_adheight,#t_cycstate,#t_adsize,#t_ad2,#t_clickstate2").hide();
 $("#t_ad1").html("<input name='ad' id='ad' type='text' size='40' style='width:400px'>");
 $("#t_clickstate5").html("下载获利(CPC)");
 $("#adwidth").val(0);
 $("#adheight").val(0);
});

$("#adshowtype").change(function(){
if($('#adshowtype').val()==''){$('#t_adshowtypetext').html('')}

<%
Sql="Select * From CFWztg_SetContent Where SetBClassFlag='AdminTemplet' And SetSClassFlag='AdminTemplet_AdCode' Order By SetTaxis"
Set Rs2=Conn.Execute(Sql)
While Not Rs2.Eof

Response.write "if($('#adshowtype').val()=='"&Rs2("SetFlag")&"'){$('#t_adshowtypetext').html('<br>"&Rs2("SetDesc_2")&"')}"&chr(13)&chr(10)

Rs2.MoveNext
Wend
Rs2.Close
%>
}); 




//CPC,CPV,CPA
$("#clickstate_1,#clickstate_2,#clickstate_3").click(function(){
 $("#t_unit_cent1").hide();
});

//CPS
$("#clickstate_4").click(function(){
 $("#t_unit_cent1").show();
 $("#t_unit_cent1").html("<br>商品获利(CPS)的这里价格是指实现CPS前的每个注册CPA的价格，CPS本身是通过返回商品订单按比例提成的");
});

//cpc选中时
$("#clickstate_1").click(function(){
 $("#clicksestate_0").prop('checked',true);
 $("#t_clicksemul").hide();

 if($("#ad_class_3").prop("checked")||$("#ad_class_4").prop("checked")||$("#ad_class_5").prop("checked")||$("#ad_class_6").prop("checked")||$("#ad_class_7").prop("checked")||$("#ad_class_11").prop("checked")){
  $("#t_clicksestate1").hide(); 
  $("#t_clicksestate2").show(); 
 }else{
  $("#t_clicksestate1,#t_clicksestate2").hide();
 }
});


//CPV选中时
$("#clickstate_2").click(function(){
 $("#clicksestate_0").prop('checked',true);
 $("#t_clicksemul").hide();

 if($("#ad_class_3").prop("checked")||$("#ad_class_4").prop("checked")||$("#ad_class_5").prop("checked")||$("#ad_class_6").prop("checked")||$("#ad_class_7").prop("checked")||$("#ad_class_11").prop("checked")){
  $("#t_clicksestate1").show(); 
  $("#t_clicksestate2").hide(); 
 }else{
  $("#t_clicksestate1,#t_clicksestate2").hide();
 }
});

//cpa或cps选中时
$("#clickstate_3,#clickstate_4").click(function(){
 $("#clicksestate_0").prop('checked',true);
 $("#t_clicksemul").hide();

 if($("#ad_class_1").prop("checked")||$("#ad_class_2").prop("checked")){
  $("#t_clicksestate1").show(); 
  $("#t_clicksestate2").hide(); 
 }
 if($("#ad_class_3").prop("checked")||$("#ad_class_4").prop("checked")){
  $("#t_clicksestate1").show(); 
  $("#t_clicksestate2").show(); 
 }
 if($("#ad_class_7").prop("checked")){
  $("#t_clicksestate1").show(); 
  $("#t_clicksestate2").show(); 
 }
 if($("#ad_class_11").prop("checked")){
  $("#t_clicksestate1").show(); 
  $("#t_clicksestate2").hide(); 
 }
});

$('#unit_cent_first').bind('input propertychange', function() {
 if(!isNaN($('#unit_cent_first').val())){
  $('#t_unit_cent2').html("<br>换算:"+parseFloat($('#unit_cent_first').val()*1000).toFixed(2)+'元/千IP');
  $('#t_moblie_mul_first1').html("<br>换算:"+parseFloat($('#unit_cent_first').val()*$('#moblie_mul_first').val()*1000).toFixed(2)+'元/千IP');
  $('#t_clicksemul1').html("<br>换算:"+parseFloat($('#unit_cent_first').val()*$('#clicksemul').val()*1000).toFixed(2)+'元/千IP');
 }
});

$('#moblie_mul_first').bind('input propertychange', function() {
 if(!isNaN($('#unit_cent_first').val())&&!isNaN($('#moblie_mul_first').val())){
  $('#t_moblie_mul_first1').html("<br>换算:"+parseFloat($('#unit_cent_first').val()*$('#moblie_mul_first').val()*1000).toFixed(2)+'元/千IP');
 }
});

$('#clicksemul').bind('input propertychange', function() {
 if(!isNaN($('#unit_cent_first').val())&&!isNaN($('#clicksemul').val())){
  $('#t_clicksemul1').html("<br>换算:"+parseFloat($('#unit_cent_first').val()*$('#clicksemul').val()*1000).toFixed(2)+'元/千IP');
 }
});


$("#adaddsave").click(function(){


if($("#AdUserName option:selected").val()==""){
 alert('请选择一个广告主', '', function () {$("#AdUserName").focus();});
 return false;
}

if($('#plan_id').val()==""){
 alert('请选择广告计划', '', function () {$("#plan_id").focus();});
 return false;
}


if(!$("#ad_class_1").prop("checked")&&!$("#ad_class_2").prop("checked")&&!$("#ad_class_3").prop("checked")&&!$("#ad_class_4").prop("checked")&&!$("#ad_class_5").prop("checked")&&!$("#ad_class_6").prop("checked")&&!$("#ad_class_7").prop("checked")&&!$("#ad_class_8").prop("checked")&&!$("#ad_class_9").prop("checked")&&!$("#ad_class_10").prop("checked")&&!$("#ad_class_11").prop("checked")&&!$("#ad_class_12").prop("checked")){
 alert('请选择要发布哪类广告', '', function () {$("#ad_class_1").focus();});
 return false;
}

if($('#adname').val()==""){
 alert('广告名称必须填写', '', function () {$("#adname").focus();});
 return false;
}

if($('#siteclassid').val()==""){
 alert('请选择广告所属行业分类', '', function () {$("#siteclassid").focus();});
 return false;
}

if($('#ad_url').val().substr(0,7)!="http://"&&$('#ad_url').val().substr(0,8)!="https://"){
 alert('PC广告链接网址请以http://或https://开头', '', function () {$("#ad_url").focus();});
 return false;
}

//指定不同设备时的网址
if($("#ad_url_typeset_2").is(":checked")&&($('#ad_url_android')!=""&&$('#ad_url_android').val().substr(0,7)!="http://"&&$('#ad_url_android').val().substr(0,8)!="https://")){
 alert('安卓设备广告链接网址请以http://或https://开头', '', function () {$("#ad_url_android").focus();});
 return false;
}

if($("#ad_url_typeset_2").is(":checked")&&($('#ad_url_iphone')!=""&&$('#ad_url_iphone').val().substr(0,7)!="http://"&&$('#ad_url_iphone').val().substr(0,8)!="https://")){
 alert('苹果设备广告链接网址请以http://或https://开头', '', function () {$("#ad_url_iphone").focus();});
 return false;
}

if(!$("#clickstate_1").prop("checked")&&!$("#clickstate_2").prop("checked")&&!$("#clickstate_3").prop("checked")&&!$("#clickstate_4").prop("checked")){
 alert('广告获利方式必须选择', '', function () {$("#clickstate_1").focus();});
 return false;
}

if($('#unit_cent_first').val()==""){
 alert('广告单价必须填写', '', function () {$("#unit_cent_first").focus();});
 return false;
}

if($('#unit_cent_first').val()<0){
 alert('广告单价必须不能为负数', '', function () {$("#unit_cent_first").focus();});
 return false;
}

if($('#moblie_mul_first').val()==""){
 alert('移动设备广告单价的倍数必须填写', '', function () {$("#moblie_mul_first").focus();});
 return false;
}

if($('#moblie_mul_first').val()<1){
 alert('移动设备广告单价的倍数不能小于1倍', '', function () {$("#moblie_mul_first").focus();});
 return false;
}

//指定投放的设备
if(!$("#sitetypeset_0").prop("checked")&&!$("#sitetypeset_1").prop("checked")&&!$("#sitetypeset_2").prop("checked")&&!$("#sitetypeset_3").prop("checked")){
 alert('请选择投放设备类型', '', function () {$("#sitetypeset_0").focus();});
 return false;
}

if($("#sitetypeset_1").is(":checked")&&$("input:checkbox[name='sitetype1']:checked").length == 0){
 alert('请选择指定的投放设备', '', function () {$("#sitetypeset_1").focus();});
 return false;
}

if($("#sitetypeset_2").is(":checked")&&$("input:checkbox[name='sitetype2']:checked").length == 0){
 alert('请选择指定的投放设备', '', function () {$("#sitetypeset_2").focus();});
 return false;
}

if($("#sitetypeset_3").is(":checked")&&$("input:checkbox[name='sitetype3']:checked").length == 0){
 alert('请选择指定的投放设备', '', function () {$("#sitetypeset_3").focus();});
 return false;
}

//开启了次数计费时
if($("#clicksestate_1").is(":checked")||$("#clicksestate_2").is(":checked")){
 if($('#clicksemul').val()==""){
  alert('请填写次要单价是首要单价的多少倍', '', function () {$("#clicksemul").focus();});
  return false;
 }

 if($('#clicksemul').val()<=0){
  alert('次要单价是首要单价的倍数填写需大于0', '', function () {$("#clicksemul").focus();});
  return false;
 }
}


//直链广告
if($("#ad_class_1").prop("checked")){
 if($('#ad').val()==""){
  alert('广告文字必须填写', '', function () {$("#ad").focus();});
  return false;
 }
 if($('#ad_url').val()==""){
  alert('广告链接必须填写', '', function () {$("#ad_url").focus();});
  return false;
 }
}

//直图广告
if($("#ad_class_2").prop("checked")){
 if($('#ad_2').val()==""){
  alert('广告图片必须填写路径或上传图片文件', '', function () {$("#ad_2").focus();});
  return false;
 }
 if($('#ad_url').val()==""){
  alert('广告链接必须填写', '', function () {$("#ad_url").focus();});
  return false;
 }
}

//普通文字广告
if($("#ad_class_3").prop("checked")){
 if($('#ad').val()==""){
  alert('广告文字必须填写', '', function () {$("#ad").focus();});
  return false;
 }
 if($('#ad_url').val()==""){
  alert('广告链接必须填写', '', function () {$("#ad_url").focus();});
  return false;
 }
 if($('#adwidth').val()==""){
  alert('广告宽度必须填写', '', function () {$("#adwidth").focus();});
  return false;
 }
 if($('#adheight').val()==""){
  alert('广告高度必须填写', '', function () {$("#adheight").focus();});
  return false;
 }
}

//普通图片广告
if($("#ad_class_4").prop("checked")){
 if($('#ad_2').val()==""){
  alert('广告图片必须填写路径或上传图片文件', '', function () {$("#ad_2").focus();});
  return false;
 }
 if($('#ad_url').val()==""){
  alert('广告链接必须填写', '', function () {$("#ad_url").focus();});
  return false;
 }
 if($('#adwidth').val()==""){
  alert('广告宽度必须填写', '', function () {$("#adwidth").focus();});
  return false;
 }
 if($('#adheight').val()==""){
  alert('广告高度必须填写', '', function () {$("#adheight").focus();});
  return false;
 }
}

//混合文字广告
if($("#ad_class_5").prop("checked")){
 if($('#adtitle').val()==""){
  alert('广告标题必须填写', '', function () {$("#adtitle").focus();});
  return false;
 }
 if($('#adintro').val()==""){
  alert('广告简介必须填写', '', function () {$("#adintro").focus();});
  return false;
 }
 if($('#ad_url').val()==""){
  alert('广告链接必须填写', '', function () {$("#ad_url").focus();});
  return false;
 }
 if($('#adsimpleurl').val()==""){
  alert('广告前台显示链接必须填写', '', function () {$("#adsimpleurl").focus();});
  return false;
 }
 if($('#adwidth').val()==""){
  alert('广告宽度必须填写', '', function () {$("#adwidth").focus();});
  return false;
 }
 if($('#adheight').val()==""){
  alert('广告高度必须填写', '', function () {$("#adheight").focus();});
  return false;
 }
}

//混合图片广告
if($("#ad_class_6").prop("checked")){
 if($('#adtitle').val()==""){
  alert('广告标题必须填写', '', function () {$("#adtitle").focus();});
  return false;
 }
 if($('#ad_2').val()==""){
  alert('广告图片必须填写路径或上传图片文件', '', function () {$("#ad_2").focus();});
  return false;
 }
 if($('#ad_url').val()==""){
  alert('广告链接必须填写', '', function () {$("#ad_url").focus();});
  return false;
 }
}

//富媒体
if($("#ad_class_7").prop("checked")){
 if($('#adshowtype').val()==""){
  alert('请选择富媒体广告效果', '', function () {$("#adshowtype").focus();});
  return false;
 }
 if($('#adwidth').val()==""){
  alert('请填写广告宽度', '', function () {$("#adwidth").focus();});
  return false;
 }
 if($('#adheight').val()==""){
  alert('请填写广告高度', '', function () {$("#adheight").focus();});
  return false;
 }
}

//强弹轮循
if($("#ad_class_8").prop("checked")){
 if($('#ad_url').val()==""){
  alert('广告链接必须填写', '', function () {$("#ad_url").focus();});
  return false;
 }
}

//退弹轮循
if($("#ad_class_9").prop("checked")){
 if($('#ad_url').val()==""){
  alert('广告链接必须填写', '', function () {$("#ad_url").focus();});
  return false;
 }
}

//标签云
if($("#ad_class_10").prop("checked")){
 if($('#adtitle').val()==""){
  alert('广告标题必须填写', '', function () {$("#adtitle").focus();});
  return false;
 }
 if($('#ad_url').val()==""){
  alert('广告链接必须填写', '', function () {$("#ad_url").focus();});
  return false;
 }
}

//混合富媒体
if($("#ad_class_11").prop("checked")){
 if($('#adtitle').val()==""){
  alert('广告标题必须填写', '', function () {$("#adtitle").focus();});
  return false;
 }
 if($('#adintro').val()==""){
  alert('广告简介必须填写', '', function () {$("#adintro").focus();});
  return false;
 }
 if($('#ad_2').val()==""){
  alert('广告图片必须填写路径或上传图片文件', '', function () {$("#ad_2").focus();});
  return false;
 }
 if($('#ad_url').val()==""){
  alert('广告链接必须填写', '', function () {$("#ad_url").focus();});
  return false;
 }
}

//软件下载
if($("#ad_class_12").prop("checked")){
 if($('#ad_2').val()==""){
  alert('广告请上传软件图片', '', function () {$("#ad_2").focus();});
  return false;
 }
 if($('#adintro').val()==""){
  alert('软件简介必须填写', '', function () {$("#adintro").focus();});
  return false;
 }
 if($('#ad_url').val()==""){
  alert('软件下载链接必须填写', '', function () {$("#ad_url").focus();});
  return false;
 }
 if($('#adwidth').val()==""){
  alert('广告宽度必须填写', '', function () {$("#adwidth").focus();});
  return false;
 }
 if($('#adheight').val()==""){
  alert('广告高度必须填写', '', function () {$("#adheight").focus();});
  return false;
 }
}


});


});
</script>


<a href="<%=RefUrl%>" class="actionBtn"><i class="mdi mdi-keyboard-return"></i>返回列表</a>

<form method="post" action="../../AdminUser.aspx?Action=adaddsave&RefUrl=<%=Server.URLEncode(RefUrl)%>" name=form_adadd id=form_adadd>
<table class="tb_1" id='tbu'>
  <tr class="tr_1"> 
    <td colspan="2">广告发布 (请从上到下逐项选择或填写)</td>
  </tr>

    <tr> 
      <td width="200" class="td_r">广告主用户名：</td>
      <td>
<select name='AdUserName' id='AdUserName' onChange="window.location='?Action=adadd&AdUserName='+document.getElementById('AdUserName').options[document.getElementById('AdUserName').selectedIndex].value+'&RefUrl=<%=Server.URLEncode(RefUrl)%>'">
<option value=''>请选择广告主</option>
<%
Sql="Select UserName From CFWztg_User Where UserType=2 And UserState=1 Order By UserName"
Set Rs = Server.CreateObject("Adodb.Recordset")
Rs.open Sql,Conn,1,1
While Not Rs.Eof
 Response.Write "<option value='"&Rs("UserName")&"'"
 If AdUserName=Rs("UserName") Then Response.write " selected"
 Response.Write ">"&Rs("UserName")&"</option>"
Rs.MoveNext
Wend
Rs.Close
%>
</select>*
</td>
</tr>

<TR id="t_plan_id"> 
<TD class="td_r">选择计划：</TD>
<TD>
<%
If AdUserName<>"" Then
Sql="Select ID,PlanName From CFWztg_Plan Where AdUserName='"&AdUserName&"' And PlanState=2 Order By ID Desc"
Set Rs2=Conn.Execute(Sql)
If Not Rs2.Eof Then
Response.write "<select name='plan_id' id='plan_id' style='width:400px'>"
Response.write "<option selected value=''>请选择计划</option>"
While Not Rs2.Eof
 Response.write "<option value='"&Rs2("ID")&"'>"&Rs2("PlanName")&"</option>"
Rs2.MoveNext
Wend
Response.write "</select>"
Rs2.Close
Else
 Response.write "广告主"&AdUserName&"没有可以选择的广告计划，请先为此广告<a href='?Action=planadd'>新建广告计划</a>"
End If
End If
%>
</TD>
</TR>


<tr id="t_ad_class">
<td class="td_r">你想发布哪种类型广告：</td>
<td>
<%If InStr(RsSet("AdListOpenClass"),",7,")>0 or InStr(RsSet("AdListOpenClass"),",-7,")>0 Then%><li style="width:135px;float:left;"><input type="radio" name="ad_class" value="7" id="ad_class_7">富媒体(含轮循)</li><%End If%>
<%If InStr(RsSet("AdListOpenClass"),",1,")>0 or InStr(RsSet("AdListOpenClass"),",-1,")>0 Then%><li style="width:135px;float:left;"><input type="radio" name="ad_class" value="1" id="ad_class_1">直链广告(含轮循)</li><%End If%>
<%If InStr(RsSet("AdListOpenClass"),",4,")>0 or InStr(RsSet("AdListOpenClass"),",-4,")>0 Then%><li style="width:135px;float:left;"><input type="radio" name="ad_class" value="4" id="ad_class_4">普通图片(含轮循)</li><%End If%>
<%If InStr(RsSet("AdListOpenClass"),",8,")>0 Then%><li style="width:135px;float:left;"><input type="radio" name="ad_class" value="8" id="ad_class_8">轮循强弹</li><%End If%>
<%If InStr(RsSet("AdListOpenClass"),",9,")>0 Then%><li style="width:135px;float:left;"><input type="radio" name="ad_class" value="9" id="ad_class_9">轮循退弹</li><%End If%>

<li style="clear:both;"></li>
<%If InStr(RsSet("AdListOpenClass"),",11,")>0 Then%><li style="width:135px;float:left;"><input type="radio" name="ad_class" value="11" id="ad_class_11">混合富媒体</li><%End If%>
<%If InStr(RsSet("AdListOpenClass"),",5,")>0 Then%><li style="width:135px;float:left;"><input type="radio" name="ad_class" value="5" id="ad_class_5">混合文字</li><%End If%>
<%If InStr(RsSet("AdListOpenClass"),",6,")>0 Then%><li style="width:135px;float:left;"><input type="radio" name="ad_class" value="6" id="ad_class_6">混合图片</li><%End If%>
<%If InStr(RsSet("AdListOpenClass"),",10,")>0 Then%><li style="width:135px;float:left;"><input type="radio" name="ad_class" value="10" id="ad_class_10">混合标签云</li><%End If%>

<li style="clear:both;"></li>
<%If InStr(RsSet("AdListOpenClass"),",2,")>0 Then%><li style="width:135px;float:left;"><input type="radio" name="ad_class" value="2" id="ad_class_2">直链图片</li><%End If%>
<%If InStr(RsSet("AdListOpenClass"),",3,")>0 Then%><li style="width:135px;float:left;"><input type="radio" name="ad_class" value="3" id="ad_class_3">普通文字</li><%End If%>
<%If InStr(RsSet("AdListOpenClass"),",12,")>0 Then%><li style="width:135px;float:left;"><input type="radio" name="ad_class" value="12" id="ad_class_12">软件下载安装</li><%End If%>
</td>
</tr>

<TR id="t_cycstate">
<TD class="td_r">加入轮循：</TD>
<TD>
<input name="cycstate" type="radio" value="1" checked>
是 
<input name="cycstate" type="radio" value="0">
否
</TD>
</TR>

<TR id="t_adshowtype"> 
<TD class="td_r">富媒体广告效果：</TD>
<TD>
<%
Response.write "<select name='adshowtype' id='adshowtype' style='width:400px'>"
Sql="Select * From CFWztg_SetContent Where SetBClassFlag='AdminTemplet' And SetSClassFlag='AdminTemplet_AdCode' And SetState=1 Order By SetTaxis"
Set Rs2=Conn.Execute(Sql)
Response.write "<option selected value=''>请选择富媒体广告效果</option>"
While Not Rs2.Eof
 Response.write "<option value='"&Rs2("SetFlag")&"'>"&Rs2("SetDesc")&"</option>"
Rs2.MoveNext
Wend
Rs2.Close
Response.write "</select>"
%><span id="t_adshowtypetext"></span>
</TD>
</TR>

<TR id="t_adshowtype2"> 
<TD class="td_r">混合富媒体广告效果：</TD>
<TD>
<%
Response.write "<select name='adshowtype2' id='adshowtype2' style='width:400px'>"
Sql="Select * From CFWztg_SetContent Where SetBClassFlag='AdminTemplet' And SetSClassFlag='AdminTemplet_MixCode' And SetState=1 Order By SetTaxis"
Set Rs2=Conn.Execute(Sql)
Response.write "<option selected value=''>请选择混合富媒体广告效果</option>"
While Not Rs2.Eof
 Response.write "<option value='"&Rs2("SetFlag")&"'>"&Rs2("SetDesc")&"</option>"
Rs2.MoveNext
Wend
Rs2.Close
Response.write "</select>"
%><span id="t_adshowtypetext"></span>
</TD>
</TR>


<tr id="t_adname"> 
<td class="td_r">广告名称：</td>
<td><input name="adname" id="adname" type="text" size="40" style="width:400px"></td>
</tr>
	


<tr id="t_siteclassid">
<td class="td_r">广告所属行业：</td>
<td>
<select name="siteclassid" id="siteclassid" style="width:400px;">
<option selected value="">请选择分类</option>
<%
Sql="Select * From CFWztg_SiteClass Order By SiteClassName"
Set Rs2 = Server.CreateObject("ADODB.Recordset")
Rs2.open Sql,Conn,1,1
While Not Rs2.Eof
%>
<option value="<%=Rs2("ID")%>"><%=Rs2("SiteClassName")%></option>
<%
Rs2.MoveNext
Wend
%>
</select>
</td>
</tr>
	
<tr id="t_ad">
<td class="td_r">广告文字或图片：</td>
<td><span id="t_ad1"><input name='ad' id='ad' type='text' size='40' style="width:400px"></span><span id="t_ad2"></span></td>
</tr>

<tr id="t_adtitle">
<td class="td_r">广告标题：</td>
<td><input name="adtitle" type="text" id="adtitle" size="40" style="width:400px"></td>
</tr>

<tr id="t_adintro"> 
<td class="td_r">广告简介：</td>
<td><input name="adintro" type="text" id="adintro" size="40" style="width:400px"></td>
</tr>

<tr id="t_ad_2"> 
<td class="td_r">广告图片：</td>
<td><span id="t_ad3"><textarea name='ad_2' id='ad_2' cols='38' rows='5' style='width:400px'></textarea></span><span id="t_ad4"></span>
</td>
</tr>

<TR id="t_uploadfiles"> 
<TD class="td_r"></TD>
<TD>图片上传：<iframe style="top:2px" ID="UploadFiles" src="../../include/upfile.asp?UserType=adminuser&Site=adadd&AdUserName=<%=AdUserName%>" frameborder=0 scrolling=no width="350" height="30" allowtransparency="true"></iframe></TD>
</TR>

<TR id="t_ad_url"> 
<TD class="td_r">PC广告链接：</TD>
<TD><input name="ad_url" type="text" id="ad_url" size="40" style="width:400px">
<br>链接请以http://或https://开头，支持的标签包括{username},{userid},{ad_id},{selfvar},{returnflag},{ip},{currtime},{returncode}，可以不用标签</TD>
</TR>

<TR id="t_ad_url_typeset"> 
<TD class="td_r">移动设备广告链接：</TD>
<TD>
<input type="radio" name="ad_url_typeset" id="ad_url_typeset_1" value="0" checked />和PC广告链接相同
<input type="radio" name="ad_url_typeset" id="ad_url_typeset_2" value="1" />和PC广告链接不同,分别指定</TD>
</TR>

<TR id="t_ad_url_android"> 
<TD class="td_r">安卓设备广告链接：</TD>
<TD><input name="ad_url_android" type="text" id="ad_url_android" size="40" style="width:400px"></TD>
</TR>

<TR id="t_ad_url_iphone"> 
<TD class="td_r">苹果设备广告链接：</TD>
<TD><input name="ad_url_iphone" type="text" id="ad_url_iphone" size="40" style="width:400px"></TD>
</TR>

<TR id="t_adsimpleurl"> 
<TD class="td_r">广告前台显示链接：</TD>
<TD><input name="adsimpleurl" type="text" id="adsimpleurl" size="40" style="width:400px"><br />
不必带http://或https://，只填写域名就可以，如www.a.com</TD>
</TR>

<TR id="t_softexename">
  <TD class="td_r">软件安装后主程序名称：</TD>
  <TD><input name="softexename" type="text" id="softexename" size="40" style="width:400px">如填写须带扩展名，可留空则不判断是否主程序是否存在</TD>
</TR>

<TR id="t_softtctype">
  <TD class="td_r">软件安装何时才计费</TD>
  <TD>
<input type="radio" name="softtctype" value="1" checked />安装后即计费
<input type="radio" name="softtctype" value="2" />安装后需等待符合一定条件确认
<input type="radio" name="softtctype" value="3" />安装后多少分钟内卸载无效
</TD>
</TR>
<TR id="t_adsize"> 
<TD class="td_r">选择广告尺寸：</TD>
<TD>

<li style="clear:both;">横向</li>
<%
Sql="Select * From CFwztg_AdSize where Direction=1 Order By Direction,Width Desc,Height Desc"

Set Rs = Server.CreateObject("ADODB.Recordset")
Rs.open Sql,Conn,1,1
While Not Rs.Eof
Response.write "<li style='width:100px;float:left;'>"
Response.write "<input type='radio' name='adsize' value='"&Rs("Width")&"x"&Rs("Height")&"' id='adsize'>" & Rs("Width")&"x"&Rs("Height")
Response.write "</li>"
Rs.MoveNext
Wend
%>
<li style="clear:both;">纵向</li>
<%
Sql="Select * From CFwztg_AdSize where Direction=2 Order By Direction,Width Desc,Height Desc"

Set Rs = Server.CreateObject("ADODB.Recordset")
Rs.open Sql,Conn,1,1
While Not Rs.Eof
Response.write "<li style='width:100px;float:left;'>"
Response.write "<input type='radio' name='adsize' value='"&Rs("Width")&"x"&Rs("Height")&"' id='adsize'>" & Rs("Width")&"x"&Rs("Height")
Response.write "</li>"
Rs.MoveNext
Wend
%>
<li style="clear:both;">方形</li>
<%
Sql="Select * From CFwztg_AdSize where Direction=3 Order By Direction,Width Desc,Height Desc"

Set Rs = Server.CreateObject("ADODB.Recordset")
Rs.open Sql,Conn,1,1
While Not Rs.Eof
Response.write "<li style='width:100px;float:left;'>"
Response.write "<input type='radio' name='adsize' value='"&Rs("Width")&"x"&Rs("Height")&"' id='adsize'>" & Rs("Width")&"x"&Rs("Height")
Response.write "</li>"
Rs.MoveNext
Wend
%>
<li style="clear:both;">其它</li>
<li style='width:100px;float:left;'><input type='radio' name='adsize' value='' id='adsize'>自定义尺寸</li>

</TD>
</TR>

<TR id="t_adwidth"> 
<TD class="td_r">广告宽度：</TD>
<TD><input name="adwidth" type="text" id="adwidth" size="10" style="width:100px"> px<br></TD>
</TR>

<TR id="t_adheight"> 
<TD class="td_r">广告高度：</TD>
<TD><input name="adheight" type="text" id="adheight" size="10" style="width:100px"> px</TD>
</TR>


<TR id="t_clickstate"> 
<TD class="td_r">
首要计费模式：</TD>
<TD>
<span id="t_clickstate1"><input name='clickstate' type='radio' value='1' id="clickstate_1"></span><span id="t_clickstate5">点击获利(CPC)</span>
<span id="t_clickstate2"><input name='clickstate' type='radio' value='2' id="clickstate_2">显示获利(CPV)</span>
<span id="t_clickstate3"><input name='clickstate' type='radio' value='3' id="clickstate_3">注册获利(CPA)</span>
<span id="t_clickstate4"><input name='clickstate' type='radio' value='4' id="clickstate_4">商品获利(CPS)</span>

</TD>
</TR>


<TR id="t_unit_cent"> 
<TD class="td_r"><span  id="t1">首要单价：</span></TD>
<TD><input name="unit_cent_first" type="text" id="unit_cent_first" size="10" style="width:100px">
元/IP（注：精确到0.00001元，即0.001代表1厘,0.01为1分,0.1为1角)<span id="t_unit_cent1"></span><span id="t_unit_cent2"></span></TD>
</TR>

<TR id="t_mobile"> 
<TD class="td_r"><span  id="t1">移动设备单价是单价的多少倍：</span></TD>
<TD><input name="moblie_mul_first" type="text" id="moblie_mul_first" size="10" style="width:100px">倍(注：精确到0.01倍)<span id="t_moblie_mul_first1"></span></TD>
</TR>

<TR id="t_clicksestate"> 
<TD class="td_r">
次要计费模式：</TD>
<TD>
<input name='clicksestate' type='radio' value='0' id="clicksestate_0">关闭
<span id="t_clicksestate1"><input name='clicksestate' type='radio' value='1' id="clicksestate_1">开启-点击获利(CPC)</span>
<span id="t_clicksestate2"><input name='clicksestate' type='radio' value='2' id="clicksestate_2">开启-显示获利(CPV)</span>
</TD>
</TR>

<TR id="t_clicksemul"> 
<TD class="td_r"><span  id="t1">次要价格是首要单价的多少倍：</span></TD>
<TD><input name="clicksemul" type="text" id="clicksemul" size="10" style="width:100px">倍(注：精确到0.00001倍)<span id='t_clicksemul1'></span></TD>
</TR>

<TR> 
<TD class="td_r"><span  id="t3">投放设备：</span></TD>
<TD><input type="radio" name="sitetypeset" id="sitetypeset_0" value="0" />不限
<input type="radio" name="sitetypeset" id="sitetypeset_1" value="1" />指定终端(包含微信)
<input type="radio" name="sitetypeset" id="sitetypeset_2" value="2" />只投微信
<input type="radio" name="sitetypeset" id="sitetypeset_3" value="3" />指定终端(排除微信)
</TD>
</TR>


<tr id="t_sitetype_1">
  <td>&nbsp;</td>
  <td>
<input type="checkbox" name="sitetype1" id="sitetype" value="pc,pcwx">桌面电脑&nbsp;&nbsp;&nbsp;&nbsp;

<input type="checkbox" name="sitetype1" id="sitetype" value="android,androidwx">安卓手机&nbsp;&nbsp;&nbsp;&nbsp;
<input type="checkbox" name="sitetype1" id="sitetype" value="apad,apadwx">安卓平板&nbsp;&nbsp;&nbsp;&nbsp;

<input type="checkbox" name="sitetype1" id="sitetype" value="ios,ioswx">苹果手机&nbsp;&nbsp;&nbsp;&nbsp;
<input type="checkbox" name="sitetype1" id="sitetype" value="ipad,ipadwx">苹果平板&nbsp;&nbsp;&nbsp;&nbsp;

<input type="checkbox" name="sitetype1" id="sitetype" value="winphone,winphonewx">微软WP
</td>
</tr>

<tr id="t_sitetype_2">
  <td>&nbsp;</td>
  <td>
<input type="checkbox" name="sitetype2" id="sitetype" value="pcwx">桌面电脑微信&nbsp;&nbsp;&nbsp;&nbsp;

<input type="checkbox" name="sitetype2" id="sitetype" value="androidwx">安卓手机微信&nbsp;&nbsp;&nbsp;&nbsp;
<input type="checkbox" name="sitetype2" id="sitetype" value="apadwx">安卓平板微信&nbsp;&nbsp;&nbsp;&nbsp;

<input type="checkbox" name="sitetype2" id="sitetype" value="ioswx">苹果手机微信&nbsp;&nbsp;&nbsp;&nbsp;
<input type="checkbox" name="sitetype2" id="sitetype" value="ipadwx">苹果平板微信&nbsp;&nbsp;&nbsp;&nbsp;

<input type="checkbox" name="sitetype2" id="sitetype" value="winphonewx">微软WP微信
</td>
</tr>

<tr id="t_sitetype_3">
  <td>&nbsp;</td>
  <td>
<input type="checkbox" name="sitetype3" id="sitetype" value="pc">桌面电脑&nbsp;&nbsp;&nbsp;&nbsp;

<input type="checkbox" name="sitetype3" id="sitetype" value="android">安卓手机&nbsp;&nbsp;&nbsp;&nbsp;
<input type="checkbox" name="sitetype3" id="sitetype" value="apad">安卓平板&nbsp;&nbsp;&nbsp;&nbsp;

<input type="checkbox" name="sitetype3" id="sitetype" value="ios">苹果手机&nbsp;&nbsp;&nbsp;&nbsp;
<input type="checkbox" name="sitetype3" id="sitetype" value="ipad">苹果平板&nbsp;&nbsp;&nbsp;&nbsp;

<input type="checkbox" name="sitetype3" id="sitetype" value="winphone">微软WP
</td>
</tr>

<tr> 
<td>&nbsp;</td>
<td>
<input type="submit" name="submit" id="adaddsave" value="发布新广告" class="btn btn-primary">

</td>
</tr>

</table>
</form> 

