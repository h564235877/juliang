<%
'�˷�������ϵͳ Sql��
'����QQ��178575
'����EMail��yliangcf@163.com
'������վ��http://www.qqcf.com
'��ϸ��飺http://www.qqcf.com/cfwztg.htm
'�����г���������ʾ����װ��ʾ��ʹ�����ѽ�����°汾���ص�����
'��Ϊ��Щ���ݿ���ʱ�����£���û�з��ڳ�������Լ�����վ�鿴
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

//:ǰ���пո�
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



//ֱ�����
$("#ad_class_1").click(function(){
 adadd_initial();
 $("#t_adshowtype,#t_adshowtype2,#t_adtitle,#t_adintro,#t_ad_2,#t_uploadfiles,#t_adsimpleurl,#t_softexename,#t_softtctype,#t_adwidth,#t_adheight,#t_adsize,#t_ad2,#t_clickstate2").hide();
 $("#t_ad1").html("<input name='ad' id='ad' type='text' size='40' style='width:400px'>");
 $("#t_clickstate5").html("����򵯳�����(CPC)");
});

//ֱͼ���
$("#ad_class_2").click(function(){
 adadd_initial();
 $("#t_adshowtype,#t_adshowtype2,#t_adtitle,#t_adintro,#t_ad,#t_adsimpleurl,#t_softexename,#t_softtctype,#t_adwidth,#t_adheight,#t_cycstate,#t_adsize,#t_ad2,#t_clickstate2").hide();
 $("#t_ad3").html("<input name='ad_2' id='ad_2' type='text' size='40' style='width:400px'>");
 $("#t_ad4").html("<br>ֱ����дhttp://��https://��ͷͼƬ��������ʹ�������ϴ������ϴ����ͼƬ֧��200K����jpg,gif��swf��ʽ���ļ��ϴ�");
 $("#t_clickstate5").html("�������(CPC)");
});

//��ͨ����
$("#ad_class_3").click(function(){
 adadd_initial();
 $("#t_adshowtype,#t_adshowtype2,#t_adtitle,#t_adintro,#t_ad_2,#t_uploadfiles,#t_adsimpleurl,#t_softexename,#t_softtctype,#t_adwidth,#t_adheight,#t_cycstate").hide();
 $("#t_ad1").html("<textarea name='ad' cols='38' rows='5' style='width:400px'></textarea>");
 $("#t_ad2").html("<br>֧���ⲿ������˴���ֱ�ӷ���");
 $("#t_clickstate5").html("�������(CPC)");
});

//��ͨͼƬ
$("#ad_class_4").click(function(){
 adadd_initial();
 $("#t_adshowtype,#t_adshowtype2,#t_adtitle,#t_adintro,#t_ad,#t_adsimpleurl,#t_softexename,#t_softtctype,#t_adwidth,#t_adheight,#t_ad2").hide();
 $("#t_ad3").html("<textarea name='ad_2' id='ad_2' cols='38' rows='5' style='width:400px'></textarea>");
 $("#t_ad4").html("<br>֧���ⲿ������˴���ֱ�ӷ�������ֱ����дhttp://��https://��ͷ��ͼƬ��������ʹ�������ϴ������ϴ����ͼƬ֧��200K����jpg,gif��swf��ʽ���ļ��ϴ�");
 $("#t_clickstate5").html("�������(CPC)");
});

//�������
$("#ad_class_5").click(function(){
 adadd_initial();
 $("#t_adshowtype,#t_adshowtype2,#t_ad,#t_ad_2,#t_uploadfiles,#t_softexename,#t_softtctype,#t_adwidth,#t_adheight,#t_cycstate,#t_adsize,#t_clickstate3,#t_clickstate4").hide();
 $("#t_clickstate5").html("�������(CPC)");
 $("#adwidth").val(0);
 $("#adheight").val(0);
});

//���ͼƬ
$("#ad_class_6").click(function(){
 adadd_initial();
 $("#t_adshowtype,#t_adshowtype2,#t_ad,#t_adintro,#t_adsimpleurl,#t_softexename,#t_softtctype,#t_cycstate,#t_ad2,#t_clickstate3,#t_clickstate4").hide();
 $("#t_ad3").html("<input name='ad_2' id='ad_2' type='text' size='40' style='width:400px'>");
 $("#t_clickstate5").html("�������(CPC)");
});

//��ý��
$("#ad_class_7").click(function(){
 adadd_initial();
 $("#t_adshowtype2,#t_adtitle,#t_adintro,#t_ad_2,#t_uploadfiles,#t_adsimpleurl,#t_softexename,#t_softtctype,#t_adwidth,#t_adheight").hide();
 $("#t_ad1").html("<textarea name='ad' cols='38' rows='5' style='width:400px'></textarea>");
 $("#t_ad2").html("<br>֧���ⲿ������˴���ֱ�ӷ�������ֱ����дhttp://��https://��ͷ��ͼƬ������������[<a href='?Action=imglist' target='_blank'>�ϴ�����</a>]���ϴ���ͼƬ���ƾ���·���ڹ��������");
 $("#t_clickstate5").html("�������(CPC)");
});

//ǿ����ѭ
$("#ad_class_8").click(function(){
 adadd_initial();
 $("#t_adshowtype,#t_adshowtype2,#t_ad,#t_adtitle,#t_adintro,#t_ad_2,#t_uploadfiles,#t_adsimpleurl,#t_softexename,#t_softtctype,#t_adwidth,#t_adheight,#t_cycstate,#t_adsize,#t_ad2,#t_clickstate2,#t_clickstate3,#t_clickstate4").hide();
 $("#t_clickstate5").html("��������(CPC)");
});

//�˵���ѭ
$("#ad_class_9").click(function(){
 adadd_initial();
 $("#t_adshowtype,#t_adshowtype2,#t_ad,#t_adtitle,#t_adintro,#t_ad_2,#t_uploadfiles,#t_adsimpleurl,#t_softexename,#t_softtctype,#t_adwidth,#t_adheight,#t_cycstate,#t_adsize,#t_ad2,#t_clickstate2,#t_clickstate3,#t_clickstate4").hide();
 $("#t_ad1").html("<input name='ad' id='ad' type='text' size='40' style='width:400px'>");
 $("#t_clickstate5").html("��������(CPC)");
});

//��ǩ��
$("#ad_class_10").click(function(){
 adadd_initial();
 $("#t_adshowtype,#t_adshowtype2,#t_ad,#t_ad_2,#t_adintro,#t_adsimpleurl,#t_softexename,#t_softtctype,#t_uploadfiles,#t_adwidth,#t_adheight,#t_cycstate,#t_adsize,#t_ad2,#t_clickstate2,#t_clickstate3,#t_clickstate4").hide();
 $("#t_clickstate5").html("�������(CPC)");
 $("#adwidth").val(0);
 $("#adheight").val(0);
});

//��ϸ�ý����
$("#ad_class_11").click(function(){
 adadd_initial();
 $("#t_adshowtype,#t_ad,#t_adsimpleurl,#t_softexename,#t_softtctype,#t_adwidth,#t_adheight,#t_cycstate,#t_adsize,#t_ad2,#t_clickstate3,#t_clickstate4").hide();
 $("#t_ad3").html("<input name='ad_2' id='ad_2' type='text' size='40' style='width:400px'>");
 $("#t_clickstate5").html("�������(CPC)");
 $("#adwidth").val(0);
 $("#adheight").val(0);
});

//�������
$("#ad_class_12").click(function(){
 adadd_initial();
 $("#t_adshowtype,#t_adshowtype2,#t_ad,#t_adsimpleurl,#t_adwidth,#t_adheight,#t_cycstate,#t_adsize,#t_ad2,#t_clickstate2").hide();
 $("#t_ad1").html("<input name='ad' id='ad' type='text' size='40' style='width:400px'>");
 $("#t_clickstate5").html("���ػ���(CPC)");
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
 $("#t_unit_cent1").html("<br>��Ʒ����(CPS)������۸���ָʵ��CPSǰ��ÿ��ע��CPA�ļ۸�CPS������ͨ��������Ʒ������������ɵ�");
});

//cpcѡ��ʱ
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


//CPVѡ��ʱ
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

//cpa��cpsѡ��ʱ
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
  $('#t_unit_cent2').html("<br>����:"+parseFloat($('#unit_cent_first').val()*1000).toFixed(2)+'Ԫ/ǧIP');
  $('#t_moblie_mul_first1').html("<br>����:"+parseFloat($('#unit_cent_first').val()*$('#moblie_mul_first').val()*1000).toFixed(2)+'Ԫ/ǧIP');
  $('#t_clicksemul1').html("<br>����:"+parseFloat($('#unit_cent_first').val()*$('#clicksemul').val()*1000).toFixed(2)+'Ԫ/ǧIP');
 }
});

$('#moblie_mul_first').bind('input propertychange', function() {
 if(!isNaN($('#unit_cent_first').val())&&!isNaN($('#moblie_mul_first').val())){
  $('#t_moblie_mul_first1').html("<br>����:"+parseFloat($('#unit_cent_first').val()*$('#moblie_mul_first').val()*1000).toFixed(2)+'Ԫ/ǧIP');
 }
});

$('#clicksemul').bind('input propertychange', function() {
 if(!isNaN($('#unit_cent_first').val())&&!isNaN($('#clicksemul').val())){
  $('#t_clicksemul1').html("<br>����:"+parseFloat($('#unit_cent_first').val()*$('#clicksemul').val()*1000).toFixed(2)+'Ԫ/ǧIP');
 }
});


$("#adaddsave").click(function(){


if($("#AdUserName option:selected").val()==""){
 alert('��ѡ��һ�������', '', function () {$("#AdUserName").focus();});
 return false;
}

if($('#plan_id').val()==""){
 alert('��ѡ����ƻ�', '', function () {$("#plan_id").focus();});
 return false;
}


if(!$("#ad_class_1").prop("checked")&&!$("#ad_class_2").prop("checked")&&!$("#ad_class_3").prop("checked")&&!$("#ad_class_4").prop("checked")&&!$("#ad_class_5").prop("checked")&&!$("#ad_class_6").prop("checked")&&!$("#ad_class_7").prop("checked")&&!$("#ad_class_8").prop("checked")&&!$("#ad_class_9").prop("checked")&&!$("#ad_class_10").prop("checked")&&!$("#ad_class_11").prop("checked")&&!$("#ad_class_12").prop("checked")){
 alert('��ѡ��Ҫ����������', '', function () {$("#ad_class_1").focus();});
 return false;
}

if($('#adname').val()==""){
 alert('������Ʊ�����д', '', function () {$("#adname").focus();});
 return false;
}

if($('#siteclassid').val()==""){
 alert('��ѡ����������ҵ����', '', function () {$("#siteclassid").focus();});
 return false;
}

if($('#ad_url').val().substr(0,7)!="http://"&&$('#ad_url').val().substr(0,8)!="https://"){
 alert('PC���������ַ����http://��https://��ͷ', '', function () {$("#ad_url").focus();});
 return false;
}

//ָ����ͬ�豸ʱ����ַ
if($("#ad_url_typeset_2").is(":checked")&&($('#ad_url_android')!=""&&$('#ad_url_android').val().substr(0,7)!="http://"&&$('#ad_url_android').val().substr(0,8)!="https://")){
 alert('��׿�豸���������ַ����http://��https://��ͷ', '', function () {$("#ad_url_android").focus();});
 return false;
}

if($("#ad_url_typeset_2").is(":checked")&&($('#ad_url_iphone')!=""&&$('#ad_url_iphone').val().substr(0,7)!="http://"&&$('#ad_url_iphone').val().substr(0,8)!="https://")){
 alert('ƻ���豸���������ַ����http://��https://��ͷ', '', function () {$("#ad_url_iphone").focus();});
 return false;
}

if(!$("#clickstate_1").prop("checked")&&!$("#clickstate_2").prop("checked")&&!$("#clickstate_3").prop("checked")&&!$("#clickstate_4").prop("checked")){
 alert('��������ʽ����ѡ��', '', function () {$("#clickstate_1").focus();});
 return false;
}

if($('#unit_cent_first').val()==""){
 alert('��浥�۱�����д', '', function () {$("#unit_cent_first").focus();});
 return false;
}

if($('#unit_cent_first').val()<0){
 alert('��浥�۱��벻��Ϊ����', '', function () {$("#unit_cent_first").focus();});
 return false;
}

if($('#moblie_mul_first').val()==""){
 alert('�ƶ��豸��浥�۵ı���������д', '', function () {$("#moblie_mul_first").focus();});
 return false;
}

if($('#moblie_mul_first').val()<1){
 alert('�ƶ��豸��浥�۵ı�������С��1��', '', function () {$("#moblie_mul_first").focus();});
 return false;
}

//ָ��Ͷ�ŵ��豸
if(!$("#sitetypeset_0").prop("checked")&&!$("#sitetypeset_1").prop("checked")&&!$("#sitetypeset_2").prop("checked")&&!$("#sitetypeset_3").prop("checked")){
 alert('��ѡ��Ͷ���豸����', '', function () {$("#sitetypeset_0").focus();});
 return false;
}

if($("#sitetypeset_1").is(":checked")&&$("input:checkbox[name='sitetype1']:checked").length == 0){
 alert('��ѡ��ָ����Ͷ���豸', '', function () {$("#sitetypeset_1").focus();});
 return false;
}

if($("#sitetypeset_2").is(":checked")&&$("input:checkbox[name='sitetype2']:checked").length == 0){
 alert('��ѡ��ָ����Ͷ���豸', '', function () {$("#sitetypeset_2").focus();});
 return false;
}

if($("#sitetypeset_3").is(":checked")&&$("input:checkbox[name='sitetype3']:checked").length == 0){
 alert('��ѡ��ָ����Ͷ���豸', '', function () {$("#sitetypeset_3").focus();});
 return false;
}

//�����˴����Ʒ�ʱ
if($("#clicksestate_1").is(":checked")||$("#clicksestate_2").is(":checked")){
 if($('#clicksemul').val()==""){
  alert('����д��Ҫ��������Ҫ���۵Ķ��ٱ�', '', function () {$("#clicksemul").focus();});
  return false;
 }

 if($('#clicksemul').val()<=0){
  alert('��Ҫ��������Ҫ���۵ı�����д�����0', '', function () {$("#clicksemul").focus();});
  return false;
 }
}


//ֱ�����
if($("#ad_class_1").prop("checked")){
 if($('#ad').val()==""){
  alert('������ֱ�����д', '', function () {$("#ad").focus();});
  return false;
 }
 if($('#ad_url').val()==""){
  alert('������ӱ�����д', '', function () {$("#ad_url").focus();});
  return false;
 }
}

//ֱͼ���
if($("#ad_class_2").prop("checked")){
 if($('#ad_2').val()==""){
  alert('���ͼƬ������д·�����ϴ�ͼƬ�ļ�', '', function () {$("#ad_2").focus();});
  return false;
 }
 if($('#ad_url').val()==""){
  alert('������ӱ�����д', '', function () {$("#ad_url").focus();});
  return false;
 }
}

//��ͨ���ֹ��
if($("#ad_class_3").prop("checked")){
 if($('#ad').val()==""){
  alert('������ֱ�����д', '', function () {$("#ad").focus();});
  return false;
 }
 if($('#ad_url').val()==""){
  alert('������ӱ�����д', '', function () {$("#ad_url").focus();});
  return false;
 }
 if($('#adwidth').val()==""){
  alert('����ȱ�����д', '', function () {$("#adwidth").focus();});
  return false;
 }
 if($('#adheight').val()==""){
  alert('���߶ȱ�����д', '', function () {$("#adheight").focus();});
  return false;
 }
}

//��ͨͼƬ���
if($("#ad_class_4").prop("checked")){
 if($('#ad_2').val()==""){
  alert('���ͼƬ������д·�����ϴ�ͼƬ�ļ�', '', function () {$("#ad_2").focus();});
  return false;
 }
 if($('#ad_url').val()==""){
  alert('������ӱ�����д', '', function () {$("#ad_url").focus();});
  return false;
 }
 if($('#adwidth').val()==""){
  alert('����ȱ�����д', '', function () {$("#adwidth").focus();});
  return false;
 }
 if($('#adheight').val()==""){
  alert('���߶ȱ�����д', '', function () {$("#adheight").focus();});
  return false;
 }
}

//������ֹ��
if($("#ad_class_5").prop("checked")){
 if($('#adtitle').val()==""){
  alert('�����������д', '', function () {$("#adtitle").focus();});
  return false;
 }
 if($('#adintro').val()==""){
  alert('����������д', '', function () {$("#adintro").focus();});
  return false;
 }
 if($('#ad_url').val()==""){
  alert('������ӱ�����д', '', function () {$("#ad_url").focus();});
  return false;
 }
 if($('#adsimpleurl').val()==""){
  alert('���ǰ̨��ʾ���ӱ�����д', '', function () {$("#adsimpleurl").focus();});
  return false;
 }
 if($('#adwidth').val()==""){
  alert('����ȱ�����д', '', function () {$("#adwidth").focus();});
  return false;
 }
 if($('#adheight').val()==""){
  alert('���߶ȱ�����д', '', function () {$("#adheight").focus();});
  return false;
 }
}

//���ͼƬ���
if($("#ad_class_6").prop("checked")){
 if($('#adtitle').val()==""){
  alert('�����������д', '', function () {$("#adtitle").focus();});
  return false;
 }
 if($('#ad_2').val()==""){
  alert('���ͼƬ������д·�����ϴ�ͼƬ�ļ�', '', function () {$("#ad_2").focus();});
  return false;
 }
 if($('#ad_url').val()==""){
  alert('������ӱ�����д', '', function () {$("#ad_url").focus();});
  return false;
 }
}

//��ý��
if($("#ad_class_7").prop("checked")){
 if($('#adshowtype').val()==""){
  alert('��ѡ��ý����Ч��', '', function () {$("#adshowtype").focus();});
  return false;
 }
 if($('#adwidth').val()==""){
  alert('����д�����', '', function () {$("#adwidth").focus();});
  return false;
 }
 if($('#adheight').val()==""){
  alert('����д���߶�', '', function () {$("#adheight").focus();});
  return false;
 }
}

//ǿ����ѭ
if($("#ad_class_8").prop("checked")){
 if($('#ad_url').val()==""){
  alert('������ӱ�����д', '', function () {$("#ad_url").focus();});
  return false;
 }
}

//�˵���ѭ
if($("#ad_class_9").prop("checked")){
 if($('#ad_url').val()==""){
  alert('������ӱ�����д', '', function () {$("#ad_url").focus();});
  return false;
 }
}

//��ǩ��
if($("#ad_class_10").prop("checked")){
 if($('#adtitle').val()==""){
  alert('�����������д', '', function () {$("#adtitle").focus();});
  return false;
 }
 if($('#ad_url').val()==""){
  alert('������ӱ�����д', '', function () {$("#ad_url").focus();});
  return false;
 }
}

//��ϸ�ý��
if($("#ad_class_11").prop("checked")){
 if($('#adtitle').val()==""){
  alert('�����������д', '', function () {$("#adtitle").focus();});
  return false;
 }
 if($('#adintro').val()==""){
  alert('����������д', '', function () {$("#adintro").focus();});
  return false;
 }
 if($('#ad_2').val()==""){
  alert('���ͼƬ������д·�����ϴ�ͼƬ�ļ�', '', function () {$("#ad_2").focus();});
  return false;
 }
 if($('#ad_url').val()==""){
  alert('������ӱ�����д', '', function () {$("#ad_url").focus();});
  return false;
 }
}

//�������
if($("#ad_class_12").prop("checked")){
 if($('#ad_2').val()==""){
  alert('������ϴ����ͼƬ', '', function () {$("#ad_2").focus();});
  return false;
 }
 if($('#adintro').val()==""){
  alert('�����������д', '', function () {$("#adintro").focus();});
  return false;
 }
 if($('#ad_url').val()==""){
  alert('����������ӱ�����д', '', function () {$("#ad_url").focus();});
  return false;
 }
 if($('#adwidth').val()==""){
  alert('����ȱ�����д', '', function () {$("#adwidth").focus();});
  return false;
 }
 if($('#adheight').val()==""){
  alert('���߶ȱ�����д', '', function () {$("#adheight").focus();});
  return false;
 }
}


});


});
</script>


<a href="<%=RefUrl%>" class="actionBtn"><i class="mdi mdi-keyboard-return"></i>�����б�</a>

<form method="post" action="../../AdminUser.aspx?Action=adaddsave&RefUrl=<%=Server.URLEncode(RefUrl)%>" name=form_adadd id=form_adadd>
<table class="tb_1" id='tbu'>
  <tr class="tr_1"> 
    <td colspan="2">��淢�� (����ϵ�������ѡ�����д)</td>
  </tr>

    <tr> 
      <td width="200" class="td_r">������û�����</td>
      <td>
<select name='AdUserName' id='AdUserName' onChange="window.location='?Action=adadd&AdUserName='+document.getElementById('AdUserName').options[document.getElementById('AdUserName').selectedIndex].value+'&RefUrl=<%=Server.URLEncode(RefUrl)%>'">
<option value=''>��ѡ������</option>
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
<TD class="td_r">ѡ��ƻ���</TD>
<TD>
<%
If AdUserName<>"" Then
Sql="Select ID,PlanName From CFWztg_Plan Where AdUserName='"&AdUserName&"' And PlanState=2 Order By ID Desc"
Set Rs2=Conn.Execute(Sql)
If Not Rs2.Eof Then
Response.write "<select name='plan_id' id='plan_id' style='width:400px'>"
Response.write "<option selected value=''>��ѡ��ƻ�</option>"
While Not Rs2.Eof
 Response.write "<option value='"&Rs2("ID")&"'>"&Rs2("PlanName")&"</option>"
Rs2.MoveNext
Wend
Response.write "</select>"
Rs2.Close
Else
 Response.write "�����"&AdUserName&"û�п���ѡ��Ĺ��ƻ�������Ϊ�˹��<a href='?Action=planadd'>�½����ƻ�</a>"
End If
End If
%>
</TD>
</TR>


<tr id="t_ad_class">
<td class="td_r">���뷢���������͹�棺</td>
<td>
<%If InStr(RsSet("AdListOpenClass"),",7,")>0 or InStr(RsSet("AdListOpenClass"),",-7,")>0 Then%><li style="width:135px;float:left;"><input type="radio" name="ad_class" value="7" id="ad_class_7">��ý��(����ѭ)</li><%End If%>
<%If InStr(RsSet("AdListOpenClass"),",1,")>0 or InStr(RsSet("AdListOpenClass"),",-1,")>0 Then%><li style="width:135px;float:left;"><input type="radio" name="ad_class" value="1" id="ad_class_1">ֱ�����(����ѭ)</li><%End If%>
<%If InStr(RsSet("AdListOpenClass"),",4,")>0 or InStr(RsSet("AdListOpenClass"),",-4,")>0 Then%><li style="width:135px;float:left;"><input type="radio" name="ad_class" value="4" id="ad_class_4">��ͨͼƬ(����ѭ)</li><%End If%>
<%If InStr(RsSet("AdListOpenClass"),",8,")>0 Then%><li style="width:135px;float:left;"><input type="radio" name="ad_class" value="8" id="ad_class_8">��ѭǿ��</li><%End If%>
<%If InStr(RsSet("AdListOpenClass"),",9,")>0 Then%><li style="width:135px;float:left;"><input type="radio" name="ad_class" value="9" id="ad_class_9">��ѭ�˵�</li><%End If%>

<li style="clear:both;"></li>
<%If InStr(RsSet("AdListOpenClass"),",11,")>0 Then%><li style="width:135px;float:left;"><input type="radio" name="ad_class" value="11" id="ad_class_11">��ϸ�ý��</li><%End If%>
<%If InStr(RsSet("AdListOpenClass"),",5,")>0 Then%><li style="width:135px;float:left;"><input type="radio" name="ad_class" value="5" id="ad_class_5">�������</li><%End If%>
<%If InStr(RsSet("AdListOpenClass"),",6,")>0 Then%><li style="width:135px;float:left;"><input type="radio" name="ad_class" value="6" id="ad_class_6">���ͼƬ</li><%End If%>
<%If InStr(RsSet("AdListOpenClass"),",10,")>0 Then%><li style="width:135px;float:left;"><input type="radio" name="ad_class" value="10" id="ad_class_10">��ϱ�ǩ��</li><%End If%>

<li style="clear:both;"></li>
<%If InStr(RsSet("AdListOpenClass"),",2,")>0 Then%><li style="width:135px;float:left;"><input type="radio" name="ad_class" value="2" id="ad_class_2">ֱ��ͼƬ</li><%End If%>
<%If InStr(RsSet("AdListOpenClass"),",3,")>0 Then%><li style="width:135px;float:left;"><input type="radio" name="ad_class" value="3" id="ad_class_3">��ͨ����</li><%End If%>
<%If InStr(RsSet("AdListOpenClass"),",12,")>0 Then%><li style="width:135px;float:left;"><input type="radio" name="ad_class" value="12" id="ad_class_12">������ذ�װ</li><%End If%>
</td>
</tr>

<TR id="t_cycstate">
<TD class="td_r">������ѭ��</TD>
<TD>
<input name="cycstate" type="radio" value="1" checked>
�� 
<input name="cycstate" type="radio" value="0">
��
</TD>
</TR>

<TR id="t_adshowtype"> 
<TD class="td_r">��ý����Ч����</TD>
<TD>
<%
Response.write "<select name='adshowtype' id='adshowtype' style='width:400px'>"
Sql="Select * From CFWztg_SetContent Where SetBClassFlag='AdminTemplet' And SetSClassFlag='AdminTemplet_AdCode' And SetState=1 Order By SetTaxis"
Set Rs2=Conn.Execute(Sql)
Response.write "<option selected value=''>��ѡ��ý����Ч��</option>"
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
<TD class="td_r">��ϸ�ý����Ч����</TD>
<TD>
<%
Response.write "<select name='adshowtype2' id='adshowtype2' style='width:400px'>"
Sql="Select * From CFWztg_SetContent Where SetBClassFlag='AdminTemplet' And SetSClassFlag='AdminTemplet_MixCode' And SetState=1 Order By SetTaxis"
Set Rs2=Conn.Execute(Sql)
Response.write "<option selected value=''>��ѡ���ϸ�ý����Ч��</option>"
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
<td class="td_r">������ƣ�</td>
<td><input name="adname" id="adname" type="text" size="40" style="width:400px"></td>
</tr>
	


<tr id="t_siteclassid">
<td class="td_r">���������ҵ��</td>
<td>
<select name="siteclassid" id="siteclassid" style="width:400px;">
<option selected value="">��ѡ�����</option>
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
<td class="td_r">������ֻ�ͼƬ��</td>
<td><span id="t_ad1"><input name='ad' id='ad' type='text' size='40' style="width:400px"></span><span id="t_ad2"></span></td>
</tr>

<tr id="t_adtitle">
<td class="td_r">�����⣺</td>
<td><input name="adtitle" type="text" id="adtitle" size="40" style="width:400px"></td>
</tr>

<tr id="t_adintro"> 
<td class="td_r">����飺</td>
<td><input name="adintro" type="text" id="adintro" size="40" style="width:400px"></td>
</tr>

<tr id="t_ad_2"> 
<td class="td_r">���ͼƬ��</td>
<td><span id="t_ad3"><textarea name='ad_2' id='ad_2' cols='38' rows='5' style='width:400px'></textarea></span><span id="t_ad4"></span>
</td>
</tr>

<TR id="t_uploadfiles"> 
<TD class="td_r"></TD>
<TD>ͼƬ�ϴ���<iframe style="top:2px" ID="UploadFiles" src="../../include/upfile.asp?UserType=adminuser&Site=adadd&AdUserName=<%=AdUserName%>" frameborder=0 scrolling=no width="350" height="30" allowtransparency="true"></iframe></TD>
</TR>

<TR id="t_ad_url"> 
<TD class="td_r">PC������ӣ�</TD>
<TD><input name="ad_url" type="text" id="ad_url" size="40" style="width:400px">
<br>��������http://��https://��ͷ��֧�ֵı�ǩ����{username},{userid},{ad_id},{selfvar},{returnflag},{ip},{currtime},{returncode}�����Բ��ñ�ǩ</TD>
</TR>

<TR id="t_ad_url_typeset"> 
<TD class="td_r">�ƶ��豸������ӣ�</TD>
<TD>
<input type="radio" name="ad_url_typeset" id="ad_url_typeset_1" value="0" checked />��PC���������ͬ
<input type="radio" name="ad_url_typeset" id="ad_url_typeset_2" value="1" />��PC������Ӳ�ͬ,�ֱ�ָ��</TD>
</TR>

<TR id="t_ad_url_android"> 
<TD class="td_r">��׿�豸������ӣ�</TD>
<TD><input name="ad_url_android" type="text" id="ad_url_android" size="40" style="width:400px"></TD>
</TR>

<TR id="t_ad_url_iphone"> 
<TD class="td_r">ƻ���豸������ӣ�</TD>
<TD><input name="ad_url_iphone" type="text" id="ad_url_iphone" size="40" style="width:400px"></TD>
</TR>

<TR id="t_adsimpleurl"> 
<TD class="td_r">���ǰ̨��ʾ���ӣ�</TD>
<TD><input name="adsimpleurl" type="text" id="adsimpleurl" size="40" style="width:400px"><br />
���ش�http://��https://��ֻ��д�����Ϳ��ԣ���www.a.com</TD>
</TR>

<TR id="t_softexename">
  <TD class="td_r">�����װ�����������ƣ�</TD>
  <TD><input name="softexename" type="text" id="softexename" size="40" style="width:400px">����д�����չ�������������ж��Ƿ��������Ƿ����</TD>
</TR>

<TR id="t_softtctype">
  <TD class="td_r">�����װ��ʱ�żƷ�</TD>
  <TD>
<input type="radio" name="softtctype" value="1" checked />��װ�󼴼Ʒ�
<input type="radio" name="softtctype" value="2" />��װ����ȴ�����һ������ȷ��
<input type="radio" name="softtctype" value="3" />��װ����ٷ�����ж����Ч
</TD>
</TR>
<TR id="t_adsize"> 
<TD class="td_r">ѡ����ߴ磺</TD>
<TD>

<li style="clear:both;">����</li>
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
<li style="clear:both;">����</li>
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
<li style="clear:both;">����</li>
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
<li style="clear:both;">����</li>
<li style='width:100px;float:left;'><input type='radio' name='adsize' value='' id='adsize'>�Զ���ߴ�</li>

</TD>
</TR>

<TR id="t_adwidth"> 
<TD class="td_r">����ȣ�</TD>
<TD><input name="adwidth" type="text" id="adwidth" size="10" style="width:100px"> px<br></TD>
</TR>

<TR id="t_adheight"> 
<TD class="td_r">���߶ȣ�</TD>
<TD><input name="adheight" type="text" id="adheight" size="10" style="width:100px"> px</TD>
</TR>


<TR id="t_clickstate"> 
<TD class="td_r">
��Ҫ�Ʒ�ģʽ��</TD>
<TD>
<span id="t_clickstate1"><input name='clickstate' type='radio' value='1' id="clickstate_1"></span><span id="t_clickstate5">�������(CPC)</span>
<span id="t_clickstate2"><input name='clickstate' type='radio' value='2' id="clickstate_2">��ʾ����(CPV)</span>
<span id="t_clickstate3"><input name='clickstate' type='radio' value='3' id="clickstate_3">ע�����(CPA)</span>
<span id="t_clickstate4"><input name='clickstate' type='radio' value='4' id="clickstate_4">��Ʒ����(CPS)</span>

</TD>
</TR>


<TR id="t_unit_cent"> 
<TD class="td_r"><span  id="t1">��Ҫ���ۣ�</span></TD>
<TD><input name="unit_cent_first" type="text" id="unit_cent_first" size="10" style="width:100px">
Ԫ/IP��ע����ȷ��0.00001Ԫ����0.001����1��,0.01Ϊ1��,0.1Ϊ1��)<span id="t_unit_cent1"></span><span id="t_unit_cent2"></span></TD>
</TR>

<TR id="t_mobile"> 
<TD class="td_r"><span  id="t1">�ƶ��豸�����ǵ��۵Ķ��ٱ���</span></TD>
<TD><input name="moblie_mul_first" type="text" id="moblie_mul_first" size="10" style="width:100px">��(ע����ȷ��0.01��)<span id="t_moblie_mul_first1"></span></TD>
</TR>

<TR id="t_clicksestate"> 
<TD class="td_r">
��Ҫ�Ʒ�ģʽ��</TD>
<TD>
<input name='clicksestate' type='radio' value='0' id="clicksestate_0">�ر�
<span id="t_clicksestate1"><input name='clicksestate' type='radio' value='1' id="clicksestate_1">����-�������(CPC)</span>
<span id="t_clicksestate2"><input name='clicksestate' type='radio' value='2' id="clicksestate_2">����-��ʾ����(CPV)</span>
</TD>
</TR>

<TR id="t_clicksemul"> 
<TD class="td_r"><span  id="t1">��Ҫ�۸�����Ҫ���۵Ķ��ٱ���</span></TD>
<TD><input name="clicksemul" type="text" id="clicksemul" size="10" style="width:100px">��(ע����ȷ��0.00001��)<span id='t_clicksemul1'></span></TD>
</TR>

<TR> 
<TD class="td_r"><span  id="t3">Ͷ���豸��</span></TD>
<TD><input type="radio" name="sitetypeset" id="sitetypeset_0" value="0" />����
<input type="radio" name="sitetypeset" id="sitetypeset_1" value="1" />ָ���ն�(����΢��)
<input type="radio" name="sitetypeset" id="sitetypeset_2" value="2" />ֻͶ΢��
<input type="radio" name="sitetypeset" id="sitetypeset_3" value="3" />ָ���ն�(�ų�΢��)
</TD>
</TR>


<tr id="t_sitetype_1">
  <td>&nbsp;</td>
  <td>
<input type="checkbox" name="sitetype1" id="sitetype" value="pc,pcwx">�������&nbsp;&nbsp;&nbsp;&nbsp;

<input type="checkbox" name="sitetype1" id="sitetype" value="android,androidwx">��׿�ֻ�&nbsp;&nbsp;&nbsp;&nbsp;
<input type="checkbox" name="sitetype1" id="sitetype" value="apad,apadwx">��׿ƽ��&nbsp;&nbsp;&nbsp;&nbsp;

<input type="checkbox" name="sitetype1" id="sitetype" value="ios,ioswx">ƻ���ֻ�&nbsp;&nbsp;&nbsp;&nbsp;
<input type="checkbox" name="sitetype1" id="sitetype" value="ipad,ipadwx">ƻ��ƽ��&nbsp;&nbsp;&nbsp;&nbsp;

<input type="checkbox" name="sitetype1" id="sitetype" value="winphone,winphonewx">΢��WP
</td>
</tr>

<tr id="t_sitetype_2">
  <td>&nbsp;</td>
  <td>
<input type="checkbox" name="sitetype2" id="sitetype" value="pcwx">�������΢��&nbsp;&nbsp;&nbsp;&nbsp;

<input type="checkbox" name="sitetype2" id="sitetype" value="androidwx">��׿�ֻ�΢��&nbsp;&nbsp;&nbsp;&nbsp;
<input type="checkbox" name="sitetype2" id="sitetype" value="apadwx">��׿ƽ��΢��&nbsp;&nbsp;&nbsp;&nbsp;

<input type="checkbox" name="sitetype2" id="sitetype" value="ioswx">ƻ���ֻ�΢��&nbsp;&nbsp;&nbsp;&nbsp;
<input type="checkbox" name="sitetype2" id="sitetype" value="ipadwx">ƻ��ƽ��΢��&nbsp;&nbsp;&nbsp;&nbsp;

<input type="checkbox" name="sitetype2" id="sitetype" value="winphonewx">΢��WP΢��
</td>
</tr>

<tr id="t_sitetype_3">
  <td>&nbsp;</td>
  <td>
<input type="checkbox" name="sitetype3" id="sitetype" value="pc">�������&nbsp;&nbsp;&nbsp;&nbsp;

<input type="checkbox" name="sitetype3" id="sitetype" value="android">��׿�ֻ�&nbsp;&nbsp;&nbsp;&nbsp;
<input type="checkbox" name="sitetype3" id="sitetype" value="apad">��׿ƽ��&nbsp;&nbsp;&nbsp;&nbsp;

<input type="checkbox" name="sitetype3" id="sitetype" value="ios">ƻ���ֻ�&nbsp;&nbsp;&nbsp;&nbsp;
<input type="checkbox" name="sitetype3" id="sitetype" value="ipad">ƻ��ƽ��&nbsp;&nbsp;&nbsp;&nbsp;

<input type="checkbox" name="sitetype3" id="sitetype" value="winphone">΢��WP
</td>
</tr>

<tr> 
<td>&nbsp;</td>
<td>
<input type="submit" name="submit" id="adaddsave" value="�����¹��" class="btn btn-primary">

</td>
</tr>

</table>
</form> 

