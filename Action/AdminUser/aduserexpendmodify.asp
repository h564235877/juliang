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
ID=ChkStr(Request("ID"),2)

Set Rs = Server.CreateObject("ADODB.Recordset")
Sql="Select * From CFWztg_AdUser_Expend where ID="&ID
Rs.open Sql,Conn,1,1


If Rs("Plan_ID")>0 Then
 Sql="Select PlanName,PlanState From CFWztg_Plan where ID=" & Rs("Plan_ID")
 Set Rs2 = Server.CreateObject("ADODB.Recordset")
 Rs2.open Sql,Conn,1,1
 If Rs2.Eof Then
  Response.write "此广告已经删除，不能进行审核"
  Response.End
 Else
  PlanName=Rs2("PlanName")
  PlanState=Rs2("PlanState")
 End If 
 Rs2.Close
End If


Set Rs2= Server.CreateObject("ADODB.Recordset")
Sql="Select * From CFWztg_User where UserName='"&Rs("AdUserName")&"'"
Rs2.open Sql,Conn,1,1
AdUserName=Rs2("UserName")
Email=Rs2("Email")
%>

<a href="<%=ChkStr(Request.ServerVariables("Http_Referer"),1)%>" class="actionBtn"><i class="mdi mdi-keyboard-return"></i>返回列表</a>

<table class="tb_1">
  <tr class="tr_1"> 
    <td colspan="2">消费审核</td>
  </tr>
  <form name="form4" method="post" action="../../AdminUser.aspx?Action=aduserexpendmodifysave&ID=<%=ID%>&RefUrl=<%=Server.URLEncode(Request.ServerVariables("Http_Referer"))%>">
    <tr> 
      <td width="120" class="td_r">广告用户：</td>
      <td><%=Rs("AdUserName")%></td>
    </tr>
    <tr> 
      <td class="td_r">总收入：</td>
      <td><%=GetTurnCent(Rs2("Total_Cent"))%>元</td>
    </tr>
    <tr> 
      <td class="td_r">已花费：</td>
      <td><%=GetTurnCent(Rs2("Spend_Cent"))%>元</td>
    </tr>
    <tr> 
      <td class="td_r">剩余金额：</td>
      <td><%=GetTurnCent(Rs2("Spare_Cent"))%>元</td>
    </tr>
    <tr> 
      <td class="td_r">此广告花费：</td>
      <td><%=GetTurnCent(Rs("Expend_Cent"))%>元</td>
    </tr>
    <tr>
      <td class="td_r">用途：</td>
      <td>
	  <%=Rs("ExpendDesc")%>
	  </td>
    </tr>
	

    <tr> 
      <td class="td_r">状态：</td>
      <td><%If Rs("AdminCheck")=0 Then%> <select name="ExpendState" id="ExpendState">
          <option value="2"<%If Rs("ExpendState")=2 Then Response.Write " selected"%>>通过审核</option>
          <option value="3"<%If Rs("ExpendState")=3 Then Response.Write " selected"%>>拒绝审核</option>
        </select> <input name="AdminCheck" type="hidden" value="0"> <%Else%> <input name="AdminCheck" type="hidden" value="1"> 
        <%
		 If Rs("ExpendState")=2 Then
		  Response.Write"已经通过消费"
		 ElseIf Rs("ExpendState")=3 Then
		  Response.Write"已经拒绝消费"
		 End If
		 %> <%End If%></td>
    </tr>
    <tr> 
      <td class="td_r">管理员说明：</td>
      <td><textarea name="AdminDesc" cols="40" rows="5"><%=Rs("AdminDesc")%></textarea></td>
    </tr>
    <tr> 
      <td class="td_r">结算时间：</td>
      <td><input name="AdminSpendTime" type="text" id="AdminSpendTime" value="<%If Rs("AdminSpendTime")="" or isnull(Rs("AdminSpendTime")) Then
Response.write Now()
 Else
Response.write Rs("AdminSpendTime")
End If%>"></td>
    </tr>

    <tr class="tr_1"> 
      <td colspan="2">计划信息</td>
    </tr>
    <tr> 
      <td class="td_r">计划ID：</td>
      <td><%=Rs("Plan_ID")%>&nbsp;&nbsp;[计划名称:<%=PlanName%>]</td>
    </tr>
    <tr> 
      <td class="td_r">计划审核状态：</td>
      <td><%=PlanState%></td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td><input type="submit" name="submit" value="修改" class="btn btn-primary"></td>
    </tr>
	

  </form>
  
</table>