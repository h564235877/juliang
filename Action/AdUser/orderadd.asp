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
OrderCode=ChkStr(Request("OrderCode"),1)
OrderUser=ChkStr(Request("OrderUser"),1)
OrderUserType=ChkStr(Request("OrderUserType"),2)
OrderCent=ChkStr(Request("OrderCent"),2)
OrderTcRate=ChkStr(Request("OrderTcRate"),2)
TcObject=ChkStr(Request("TcObject"),2)
TcType=ChkStr(Request("TcType"),2)

GoodsName=server.HTMLEncode(ChkStr(Request("GoodsName"),1))
GoodsTime=ChkStr(Request("GoodsTime"),3)
GoodsTotal=ChkStr(Request("GoodsTotal"),2)
%>

<script>
$(function(){

$("#submit").click(function(){
 if($("#Ad_ID option:selected").val()==""){
  alert('��ѡ��һ��CPS���', '', function () {$("#Ad_ID").focus();});
  return false;
 }

 if($("#OrderCode").val()==""){
  alert('����д������', '', function () {$("#OrderCode").focus();});
  return false;
 }
 
 if($("#OrderUser").val()==""){
  alert('����д�����û���', '', function () {$("#OrderUser").focus();});
  return false;
 }
 
 if(!$("#OrderUserType_1").prop("checked")&&!$("#OrderUserType_2").prop("checked")){
  alert('��ѡ�񶩵��û�������', '', function () {$("#OrderUserType_1").focus();});
  return false;
 }
 
 if($("#OrderCent").val()==""){
  alert('����д�������', '', function () {$("#OrderCent").focus();});
  return false;
 }
 
 if(isNaN($("#OrderCent").val())){
  alert('�����������������', '', function () {$("#OrderCent").focus();});
  return false
 }
 
 if($("#OrderTcRate").val()==""){
  alert('����дʵ����ɱ���', '', function () {$("#OrderTcRate").focus();});
  return false;
 }
 
 if(isNaN($("#OrderTcRate").val())){
  alert('ʵ����ɱ�������������', '', function () {$("#OrderTcRate").focus();});
  return false
 }
 
 if(!$("#TcObject_1").prop("checked")&&!$("#TcObject_1").prop("checked")){
  alert('��ѡ�񶨵���ɶ���', '', function () {$("#TcObject_1").focus();});
  return false;
 }
 
 if(!$("#TcType_1").prop("checked")&&!$("#TcType_2").prop("checked")){
  alert('��ѡ����ɷ�ʽ', '', function () {$("#TcType_1").focus();});
  return false;
 }
 
});


});
</script>

<form name="form2" method="post" action="?Action=orderadd_2">
<table class="tb_1"><tr class="tr_1"> 
<td colspan="2">�ֹ���������CPS����</td>
</tr>
<tr> 
<td width="180" class="td_r">ѡ���뵽�ĸ�CPS��棺</td>
<td>
<select name="Ad_ID" id="Ad_ID">
<option selected value="">��ѡ��һ��CPS���</option>
<%
Sql="Select a.id,a.adname From CFWztg_AD a inner join CFWztg_Plan b on a.plan_id=b.id Where a.AdUserName='"&AdUserName&"' And a.ClickState=4 And a.AdState=2 And b.PlanState=2 Order By a.ID Desc"
Set Rs2 = Server.CreateObject("ADODB.Recordset")
Rs2.open Sql,Conn,1,1
While Not Rs2.Eof
%>
<option value="<%=Rs2("ID")%>"><%=Rs2("adname")%>[<%=Rs2("ID")%>]</option>
<%
Rs2.MoveNext
Wend
Rs2.Close
%>
</select>
</td>
</tr>

    <tr> 
      <td class="td_r">�����ţ�</td>
      <td><input name="OrderCode" id="OrderCode" type="text" value="<%=OrderCode%>"></td>
    </tr>
    <tr> 
      <td class="td_r">�����û�����</td>
      <td><input name="OrderUser" id="OrderUser" type="text" value="<%=OrderUser%>"></td>
    </tr>
    <tr> 
      <td class="td_r">�����û������ͣ�</td>
      <td>
<input type="radio" name="OrderUserType" id="OrderUserType_1" value="1"<%If OrderUserType="1" Then Response.write " checked"%>>Ӣ��ID
<input type="radio" name="OrderUserType" id="OrderUserType_2" value="2"<%If OrderUserType="2" Then Response.write " checked"%>>����ID      </td>
    </tr>
	<tr> 
      <td class="td_r">������</td>
      <td><input name="OrderCent" id="OrderCent" type="text" value="<%=OrderCent%>">
        ��ԪΪ��λ</td>
    </tr>
    <tr> 
      <td class="td_r">ʵ����ɱ�����</td>
      <td><input name="OrderTcRate" id="OrderTcRate" type="text" value="<%=OrderTcRate%>">
        %(��������գ����յĻ���ɱ���ΪϵͳĬ�ϵ�<%=RsSet("UserOrderTcRate")%>%)</td>
    </tr>
    <tr> 
      <td class="td_r">������ɶ���</td>
      <td><input type="radio" name="TcObject" id="TcObject_1" value="1"<%If TcObject="1" Then Response.write " checked"%>>�����˵��Ƽ���
        <input type="radio" name="TcObject" id="TcObject_2" value="2"<%If TcObject="2" Then Response.write " checked"%>>�������Լ�</td>
    </tr>
    <tr> 
      <td class="td_r">��ɷ�ʽ��</td>
      <td><input type="radio" name="TcType" id="TcType_1" value="1"<%If TcType="1" Then Response.write " checked"%>>��ʱ���
        <input type="radio" name="TcType" id="TcType_2" value="2"<%If TcType="2" Then Response.write " checked"%>>�ȴ�ȷ��</td>
    </tr>
	<tr>
	  <td class="td_r">��Ʒ���ƣ�</td>
	  <td><input name="GoodsName" type="text" value="<%=GoodsName%>">(������)</td>
    </tr>
	<tr>
	  <td class="td_r">��Ʒ����ʱ�䣺</td>
	  <td><input name="GoodsTime" type="text" value="<%=GoodsTime%>">(�����ղ���д,��д�Ļ���ʽ��:1970-1-1 0:0:0)</td>
    </tr>
	<tr>
	  <td class="td_r">��Ʒ��������</td>
	  <td><input name="GoodsTotal" type="text" value="<%=GoodsTotal%>">(�����ղ���д)</td>
    </tr>
	<tr> 
      <td></td>
	  <td>
          <input type="submit" name="submit" id="submit" value="����" class="btn btn-primary">      </td>
    </tr>
</table>
</form>