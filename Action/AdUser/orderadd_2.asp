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
Ad_ID=ChkStr(Trim(Request("Ad_ID")),2)
OrderCode=ChkStr(Trim(Request("OrderCode")),1)
OrderUser=ChkStr(Trim(Request("OrderUser")),1)
OrderUserType=ChkStr(Trim(Request("OrderUserType")),2)
OrderCent=ChkStr(Trim(Request("OrderCent")),2)
OrderTcRate=ChkStr(Trim(Request("OrderTcRate")),2)
TcObject=CInt(ChkStr(Trim(Request("TcObject")),2))
TcType=CInt(ChkStr(Trim(Request("TcType")),2))

GoodsName=server.HTMLEncode(ChkStr(Request("GoodsName"),1))
GoodsTime=ChkStr(Request("GoodsTime"),3)
GoodsTotal=ChkStr(Request("GoodsTotal"),2)


Sql="Select * From CFWztg_User Where UserName='"&AdUserName&"'"
Set Rs=Conn.execute(Sql)

CheckCode = Md5(Ad_ID&OrderCode&OrderUser&OrderUserType&OrderCent&OrderTcRate&TcObject&TcType&Rs("RecSafeCode"),2)
%>


<form name="form2" method="post" action="../../CF.aspx?Action=orderadd" target="_blank">
<table class="tb_1">
<tr class="tr_1"> 
      <td colspan="2">订单导入</td>
    </tr>
    <tr> 
      <td width="180" class="td_r">导入到哪个广告：</td>
      <td><input name="Ad_ID" type="hidden" value="<%=Ad_ID%>"> <%=Ad_ID%></td>
    </tr>
    <tr> 
      <td class="td_r">订单号：</td>
      <td><input name="OrderCode" type="hidden" value="<%=OrderCode%>"> <%=OrderCode%></td>
    </tr>
    <tr> 
      <td class="td_r">订单用户名：</td>
      <td><input type="hidden" name="OrderUser" value="<%=OrderUser%>"> <%=OrderUser%> 
      </td>
    </tr>
    <tr> 
      <td class="td_r">订单用户名类型：</td>
      <td><input type="hidden" name="OrderUserType" value="<%=OrderUserType%>"><%
	If OrderUserType = 1 Then
	 Response.write "英文ID"
	ElseIf OrderUserType = 2 Then
	 Response.write "数字ID"
	End If
	%>
      </td>
    </tr>
	<tr> 
      <td class="td_r">订单金额：</td>
      <td><input type="hidden" name="OrderCent" value="<%=OrderCent%>"> <%=OrderCent%>元 
      </td>
    </tr>
    <tr> 
      <td class="td_r">实际提成比例：</td>
      <td><input type="hidden" name="OrderTcRate" value="<%=OrderTcRate%>"> <%=OrderTcRate%> 
        <%
		If OrderTcRate="" Then
        Response.write RsSet("UserOrderTcRate")		
		OrderTcRate=RsSet("UserOrderTcRate")
	  End If%>
        %</td>
    </tr>
    <tr> 
      <td class="td_r">定单提成对象：</td>
      <td><input type="hidden" name="TcObject" value="<%=TcObject%>">
	  <%
	If TcObject = 1 Then
	 Response.write "订单人的推荐人"
	Else
	 Response.write "订单人自己"
	End If
	%></td>
    </tr>
    <tr> 
      <td class="td_r">提成方式：</td>
      <td><input type="hidden" name="TcType" value="<%=TcType%>">
	  <%
	If TcType = 1 Then
	 Response.write "即时提成"
	ElseIf TcType = 2 Then
	 Response.write "等待确认"
	End If
	%></td>
    </tr>

	
	<tr>
	  <td class="td_r">商品名称：</td>
	  <td><input type="hidden" name="GoodsName" value="<%=GoodsName%>"><%=GoodsName%></td>
    </tr>
	<tr>
	  <td class="td_r">商品购买时间：</td>
	  <td><input type="hidden" name="GoodsTime" value="<%=GoodsTime%>"><%=GoodsTime%></td>
    </tr>
	<tr>
	  <td class="td_r">商品总数量：</td>
	  <td><input type="hidden" name="GoodsTotal" value="<%=GoodsTotal%>"><%=GoodsTotal%></td>
    </tr>
	
	<tr> 
      <td class="td_r">提成对象将获利：</td>
      <td><%=OrderCent*CInt(OrderTcRate)/100%>元 </td>
    </tr>
	
	
    <tr> 
      <td></td>
	  <td>
          <input name="AdUserName" type="hidden" value="<%=AdUserName%>">
          <input name="CheckCode" type="hidden" value="<%=CheckCode%>">
          <input type="submit" name="submit" value="确定导入" class="btn btn-primary"></td>
    </tr>
</table>
</form>