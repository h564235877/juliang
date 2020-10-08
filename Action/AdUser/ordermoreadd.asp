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
OrderInfo=ChkStr(Request("OrderInfo"),1)
OrderTcRate=ChkStr(Request("OrderTcRate"),2)
TcObject=ChkStr(Request("TcObject"),2)
TcType=ChkStr(Request("TcType"),2)
%>
  
<form name="form2" method="post" action="../../AdUser.aspx?Action=ordermoreaddsave&RefUrl=<%=Server.URLEncode(Request.ServerVariables("Http_Referer"))%>">
<table class="tb_1">
<tr class="tr_1"> 
      <td colspan="2">手工批量导入CPS订单</td>
    </tr>
	
    <tr> 
      <td width="200" class="td_r">选择导入到哪个CPS广告：</td>
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
      <td class="td_r">订单信息：</td>
      <td><textarea name="OrderInfo" cols="40" rows="10"><%=OrderInfo%></textarea>
      <br />
      注：每行一条信息，每行格式：订单号|订单用户名|订单用户名类型|订单金额|商品名称(可留空)|商品购买时间(可留空)|商品购买数量(可留空)</td>
    </tr>
	<tr> 
      <td class="td_r">实际提成比例：</td>
      <td><input name="OrderTcRate" type="text" size="5" value="<%=OrderTcRate%>">
        %(此项可留空，留空的话提成比例为系统默认的<%=RsSet("UserOrderTcRate")%>%)</td>
    </tr>
    <tr> 
      <td class="td_r">定单提成对象：</td>
      <td><input type="radio" name="TcObject" value="1"<%If TcObject="1" Then Response.write " checked"%>>订单人的推荐人
        <input type="radio" name="TcObject" value="2"<%If TcObject="2" Then Response.write " checked"%>>订单人自己</td>
    </tr>

	<tr> 
      <td class="td_r">提成方式：</td>
      <td><input type="radio" name="TcType" value="1"<%If TcType="1" Then Response.write " checked"%>>即时提成
        <input type="radio" name="TcType" value="2"<%If TcType="2" Then Response.write " checked"%>>等待确认</td>
    </tr>
	<tr> 
      <td></td>
	  <td>
          <input type="submit" name="submit" value="导入" onclick="return confirm('确定要确认这些定单吗?')" class="btn btn-primary">      </td>
    </tr>
</table>
</form>