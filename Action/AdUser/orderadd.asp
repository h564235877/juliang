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
  alert('请选择一个CPS广告', '', function () {$("#Ad_ID").focus();});
  return false;
 }

 if($("#OrderCode").val()==""){
  alert('请填写订单号', '', function () {$("#OrderCode").focus();});
  return false;
 }
 
 if($("#OrderUser").val()==""){
  alert('请填写订单用户名', '', function () {$("#OrderUser").focus();});
  return false;
 }
 
 if(!$("#OrderUserType_1").prop("checked")&&!$("#OrderUserType_2").prop("checked")){
  alert('请选择订单用户名类型', '', function () {$("#OrderUserType_1").focus();});
  return false;
 }
 
 if($("#OrderCent").val()==""){
  alert('请填写订单金额', '', function () {$("#OrderCent").focus();});
  return false;
 }
 
 if(isNaN($("#OrderCent").val())){
  alert('订单金额请输入数字', '', function () {$("#OrderCent").focus();});
  return false
 }
 
 if($("#OrderTcRate").val()==""){
  alert('请填写实际提成比例', '', function () {$("#OrderTcRate").focus();});
  return false;
 }
 
 if(isNaN($("#OrderTcRate").val())){
  alert('实际提成比例请输入数字', '', function () {$("#OrderTcRate").focus();});
  return false
 }
 
 if(!$("#TcObject_1").prop("checked")&&!$("#TcObject_1").prop("checked")){
  alert('请选择定单提成对象', '', function () {$("#TcObject_1").focus();});
  return false;
 }
 
 if(!$("#TcType_1").prop("checked")&&!$("#TcType_2").prop("checked")){
  alert('请选择提成方式', '', function () {$("#TcType_1").focus();});
  return false;
 }
 
});


});
</script>

<form name="form2" method="post" action="?Action=orderadd_2">
<table class="tb_1"><tr class="tr_1"> 
<td colspan="2">手工单个导入CPS订单</td>
</tr>
<tr> 
<td width="180" class="td_r">选择导入到哪个CPS广告：</td>
<td>
<select name="Ad_ID" id="Ad_ID">
<option selected value="">请选择一个CPS广告</option>
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
      <td class="td_r">订单号：</td>
      <td><input name="OrderCode" id="OrderCode" type="text" value="<%=OrderCode%>"></td>
    </tr>
    <tr> 
      <td class="td_r">订单用户名：</td>
      <td><input name="OrderUser" id="OrderUser" type="text" value="<%=OrderUser%>"></td>
    </tr>
    <tr> 
      <td class="td_r">订单用户名类型：</td>
      <td>
<input type="radio" name="OrderUserType" id="OrderUserType_1" value="1"<%If OrderUserType="1" Then Response.write " checked"%>>英文ID
<input type="radio" name="OrderUserType" id="OrderUserType_2" value="2"<%If OrderUserType="2" Then Response.write " checked"%>>数字ID      </td>
    </tr>
	<tr> 
      <td class="td_r">订单金额：</td>
      <td><input name="OrderCent" id="OrderCent" type="text" value="<%=OrderCent%>">
        以元为单位</td>
    </tr>
    <tr> 
      <td class="td_r">实际提成比例：</td>
      <td><input name="OrderTcRate" id="OrderTcRate" type="text" value="<%=OrderTcRate%>">
        %(此项可留空，留空的话提成比例为系统默认的<%=RsSet("UserOrderTcRate")%>%)</td>
    </tr>
    <tr> 
      <td class="td_r">定单提成对象：</td>
      <td><input type="radio" name="TcObject" id="TcObject_1" value="1"<%If TcObject="1" Then Response.write " checked"%>>订单人的推荐人
        <input type="radio" name="TcObject" id="TcObject_2" value="2"<%If TcObject="2" Then Response.write " checked"%>>订单人自己</td>
    </tr>
    <tr> 
      <td class="td_r">提成方式：</td>
      <td><input type="radio" name="TcType" id="TcType_1" value="1"<%If TcType="1" Then Response.write " checked"%>>即时提成
        <input type="radio" name="TcType" id="TcType_2" value="2"<%If TcType="2" Then Response.write " checked"%>>等待确认</td>
    </tr>
	<tr>
	  <td class="td_r">商品名称：</td>
	  <td><input name="GoodsName" type="text" value="<%=GoodsName%>">(可留空)</td>
    </tr>
	<tr>
	  <td class="td_r">商品购买时间：</td>
	  <td><input name="GoodsTime" type="text" value="<%=GoodsTime%>">(可留空不填写,填写的话格式如:1970-1-1 0:0:0)</td>
    </tr>
	<tr>
	  <td class="td_r">商品总数量：</td>
	  <td><input name="GoodsTotal" type="text" value="<%=GoodsTotal%>">(可留空不填写)</td>
    </tr>
	<tr> 
      <td></td>
	  <td>
          <input type="submit" name="submit" id="submit" value="导入" class="btn btn-primary">      </td>
    </tr>
</table>
</form>