<%
'�˷�������ϵͳ Sql��
'����QQ��178575
'����EMail��yliangcf@163.com
'������վ��http://www.qqcf.com
'��ϸ��飺http://www.qqcf.com/cfwztg.htm
'�����г���������ʾ����װ��ʾ��ʹ�����ѽ�����°汾���ص�����
'��Ϊ��Щ���ݿ���ʱ�����£���û�з��ڳ�������Լ�����վ�鿴
%>

<script>
$(function(){

function clicksestate_0(){
$("#t_clicksemul").hide();
}

function clicksestate_1(){
$("#t_clicksemul").show();
}

function clicksestate_2(){
clicksestate_1();
}

clicksestate_<%=Rs("clicksestate")%>();

$("#clicksestate_0").click(function(){
clicksestate_0();
});

$("#clicksestate_1").click(function(){
clicksestate_1();
});

$("#clicksestate_2").click(function(){
clicksestate_2();
});


$('#t_unit_cent_first').html("<br>����:"+parseFloat($('#unit_cent_first').val()*1000).toFixed(2)+'Ԫ/ǧIP');
$('#t_moblie_mul_first').html("<br>����:"+parseFloat($('#unit_cent_first').val()*$('#moblie_mul_first').val()*1000).toFixed(2)+'Ԫ/ǧIP');
  
$('#t_unit_cent').html("<br>����:"+parseFloat($('#unit_cent').val()*1000).toFixed(2)+'Ԫ/ǧIP');
$('#t_moblie_mul').html("<br>����:"+parseFloat($('#unit_cent').val()*$('#moblie_mul').val()*1000).toFixed(2)+'Ԫ/ǧIP');

$('#t_clicksemul1').html("<br>����:"+parseFloat($('#unit_cent').val()*$('#clicksemul').val()*1000).toFixed(2)+'Ԫ/ǧIP');


$('#unit_cent_first').bind('input propertychange', function() {
 if(!isNaN($('#unit_cent_first').val())){
  $('#t_unit_cent_first').html("<br>����:"+parseFloat($('#unit_cent_first').val()*1000).toFixed(2)+'Ԫ/ǧIP');
  $('#t_moblie_mul_first').html("<br>����:"+parseFloat($('#unit_cent_first').val()*$('#moblie_mul_first').val()*1000).toFixed(2)+'Ԫ/ǧIP');
 }
});

$('#moblie_mul_first').bind('input propertychange', function() {
 if(!isNaN($('#unit_cent_first').val())&&!isNaN($('#moblie_mul_first').val())){
  $('#t_moblie_mul_first').html("<br>����:"+parseFloat($('#unit_cent_first').val()*$('#moblie_mul_first').val()*1000).toFixed(2)+'Ԫ/ǧIP');
 }
});


$('#unit_cent').bind('input propertychange', function() {
 if(!isNaN($('#unit_cent').val())){
  $('#t_unit_cent').html("<br>����:"+parseFloat($('#unit_cent').val()*1000).toFixed(2)+'Ԫ/ǧIP');
  $('#t_moblie_mul').html("<br>����:"+parseFloat($('#unit_cent').val()*$('#moblie_mul').val()*1000).toFixed(2)+'Ԫ/ǧIP');
 }
 
 if(!$("#clicksestate_0").prop("checked")&&!isNaN($('#unit_cent').val())&&!isNaN($('#clicksemul').val())){
  $('#t_clicksemul1').html("<br>����:"+parseFloat($('#unit_cent').val()*$('#clicksemul').val()*1000).toFixed(2)+'Ԫ/ǧIP');
 }
 
});

$('#moblie_mul').bind('input propertychange', function() {
 if(!isNaN($('#unit_cent').val())&&!isNaN($('#moblie_mul').val())){
  $('#t_moblie_mul').html("<br>����:"+parseFloat($('#unit_cent').val()*$('#moblie_mul').val()*1000).toFixed(2)+'Ԫ/ǧIP');
 }
});

$('#clicksemul').bind('input propertychange', function() {
 if(!$("#clicksestate_0").prop("checked")&&!isNaN($('#unit_cent').val())&&!isNaN($('#clicksemul').val())){
  $('#t_clicksemul1').html("<br>����:"+parseFloat($('#unit_cent').val()*$('#clicksemul').val()*1000).toFixed(2)+'Ԫ/ǧIP');
 }
});



$("#adpricebtn").click(function(){
//�����˴�Ҫ�Ʒ�ʱ
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


 if($('#unit_cent').val()>$('#unit_cent_first').val()){
  alert('��վ���ĵ��۲��ܴ��ڹ�����ĵ���', '', function () {$("#unit_cent").focus();});
  return false;
 }
 
 if($('#moblie_mul').val()>$('#moblie_mul_first').val()){
  alert('��վ�����ƶ��豸�������ܴ��ڹ�������ƶ��豸����', '', function () {$("#moblie_mul").focus();});
  return false;
 }
 
});


});
</script>


<table class="tb_1" id="tbu">

<tr class="tr_1">
<td colspan="2">�����Ҫ�۸�</td>
</tr>

<TR> 
<TD width="200" class="td_r">��Ҫ�Ʒ�ģʽ��</TD>
<TD>
<%
If Rs("ClickState")=1 Then
 Response.write "�������(CPC)"
ElseIf Rs("ClickState")=2 Then
 Response.write "��ʾ����(CPV)"
ElseIf Rs("ClickState")=3 Then
 Response.write "ע�����(CPA)"
ElseIf Rs("ClickState")=4 Then
 Response.write "��Ʒ����(CPS)"
End If
%></TD>
</TR>

    <TR> 
      <TD class="td_r">�����֧�����ۣ�</TD>
      <TD><input name="unit_cent_first" type="text" id="unit_cent_first" value="<%=GetTurnCent(Rs("unit_cent_first"))%>">Ԫ/IP (��ȷ����0.00001Ԫ)<span id='t_unit_cent_first'></span></TD>
    </TR>


<TR> 
<TD class="td_r"><span  id="t1">������ƶ��豸֧�����۱�����</span></TD>
<TD><input name="moblie_mul_first" type="text" id="moblie_mul_first" value="<%=Rs("moblie_mul_first")%>">�� (ע����ȷ��0.01)<span id='t_moblie_mul_first'></span></TD>
</TR>


<TR> 
<TD class="td_r">��վ��ʵ�ʵõ��ĵ��ۣ�</TD>
<TD><input name="unit_cent" type="text" id="unit_cent" value="<%=GetTurnCent(Rs("unit_cent"))%>">Ԫ/IP (��ȷ����0.00001Ԫ����С�ڻ���ڹ����֧������)<span id='t_unit_cent'></span>
</TD>
</TR>

<TR> 
<TD class="td_r"><span  id="t1">��վ���ƶ��豸�õ����۱�����</span></TD>
<TD><input name="moblie_mul" type="text" id="moblie_mul" value="<%=Rs("moblie_mul")%>">�� (ע����ȷ��0.01������С�ڻ���ڹ�����ƶ�֧������)<span id='t_moblie_mul'></span></TD>
</TR>


<tr class="tr_1">
<td colspan="2">����Ҫ�۸�</td>
</tr>

<TR id="t_clicksestate"> 
<TD class="td_r">
��Ҫ�Ʒ�ģʽ��</TD>
<TD>


<input name='clicksestate' type='radio' value='0' id="clicksestate_0"<%If Rs("clicksestate")=0 Then Response.write " checked"%>>�ر�

<%
If (Rs("ad_class")=1 Or Rs("ad_class")=2 Or Rs("ad_class")=11) and (Rs("clickstate")=3 or Rs("clickstate")=4) Then clicksestate_1=1
If (Rs("ad_class")=3 Or Rs("ad_class")=4 Or Rs("ad_class")=5 Or Rs("ad_class")=6 Or Rs("ad_class")=7 Or Rs("ad_class")=10 Or Rs("ad_class")=11) and (Rs("clickstate")=2 or Rs("clickstate")=3 or Rs("clickstate")=4) Then clicksestate_1=1
%>
<%If clicksestate_1=1 Then%>
<input name='clicksestate' type='radio' value='1' id="clicksestate_1"<%If Rs("clicksestate")=1 Then Response.write " checked"%>>����-�������(CPC)
<%End If%>

<%
If (Rs("ad_class")=3 Or Rs("ad_class")=4 Or Rs("ad_class")=5 Or Rs("ad_class")=6 Or Rs("ad_class")=7 Or Rs("ad_class")=10 Or Rs("ad_class")=11) and (Rs("clickstate")=1 or Rs("clickstate")=3 or Rs("clickstate")=4) Then clicksestate_1=2
%>
<%If clicksestate_1=2 Then%>
<input name='clicksestate' type='radio' value='2' id="clicksestate_2"<%If Rs("clicksestate")=2 Then Response.write " checked"%>>����-��ʾ����(CPV)
<%End If%>
</TD>
</TR>

<TR id="t_clicksemul"> 
<TD class="td_r"><span  id="t1">��Ҫ�۸�����Ҫ���۵Ķ��ٱ���</span></TD>
<TD><input name="clicksemul" type="text" id="clicksemul" value="<%=GetTurnCent(Rs("clicksemul"))%>">�� (ע����ȷ��0.00001��)<span id='t_clicksemul1'></span></TD>
</TR>



<tr class="tr_1">
<td colspan="2">���۵���</td>
</tr>

<TR> 
<TD class="td_r">���۵��ʣ�</TD>
<TD><input name="AdDeDuct_Rate" type="text" value="<%=Rs("AdDeDuct_Rate")%>">%(������0-100֮�����֣�0Ϊ���۵�)<br>
ע������۵ĵ�����Ա���ã�����˹��ԭʼÿ�����0.10Ԫ����������1000�㣬������100Ԫ������Ŀ۵���Ϊ20%��������������������վ�����ֵ�80Ԫ������Ա���ֵ�20Ԫ��</p></TD>
</TR>

<TR> 
<TD class="td_r">�û��Ĵ˹�������ڶ������Ͽ۵��ʲſ�ʼ��Ч��</TD>
<TD><input name="AdDeDuct_BaseNum" type="text" value="<%=Rs("AdDeDuct_BaseNum")%>">Ĭ��0</TD>
</TR>



<%If Rs("Ad_Class") >2 Then%>
<tr class="tr_1">
<td colspan="2">�������</td>
</tr>

<tr> 
<td class="td_r">������ʣ�</td>
<td><input name="AdClickRate" type="text" id="AdClickRate" value="<%=Rs("AdClickRate")%>">
��(ǧ��֮��,һ����120������,0��ʾ������)</td>
</tr>
<%End If%>


<tr> 
<td>&nbsp;</td>
<td>
<input type="submit" name="adpricebtn" id="adpricebtn" value="�޸�" class="btn btn-primary">
</td>
</tr>

</table>

