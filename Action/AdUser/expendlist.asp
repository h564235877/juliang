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
If Request("ExpendType")="" Then ExpendType = -1 Else ExpendType = CInt(ChkStr(Request("ExpendType"),2))

PageUrl = "?Action="&Action&"&ExpendType="&ExpendType

MaxListRs = 2000

Sql="SELECT "
Sql=Sql&"(SELECT Count(1) FROM CFWztg_AdUser_Expend Where AdUserName='"&AdUserName&"' And AdminCheck=0) ExpendNum,"
Sql=Sql&"(SELECT Count(1) FROM CFWztg_AdUser_Expend Where AdUserName='"&AdUserName&"' And AdminCheck=0 And ExpendType=0) ExpendNum_0,"
Sql=Sql&"(SELECT Count(1) FROM CFWztg_AdUser_Expend Where AdUserName='"&AdUserName&"' And AdminCheck=0 And ExpendType=1) ExpendNum_1,"
Sql=Sql&"(SELECT Count(1) FROM CFWztg_AdUser_Expend Where AdUserName='"&AdUserName&"' And AdminCheck=0 And ExpendType=2) ExpendNum_2"
Set Rs=Conn.Execute(Sql)
%>

<ul class="tab">
<li><a href="?Action=<%=Action%>&ExpendType=-1"<%If ExpendType=-1 Then Response.write " class='selected'"%>><span>所有[<%=Rs("ExpendNum")%>]</span></a></li>
<li><a href="?Action=<%=Action%>&ExpendType=0"<%If ExpendType=0 Then Response.write " class='selected'"%>><span>新发布广告审核[<%=Rs("ExpendNum_0")%>]</span></a></li>
<li><a href="?Action=<%=Action%>&ExpendType=1"<%If ExpendType=1 Then Response.write " class='selected'"%>><span>广告追加点数审核[<%=Rs("ExpendNum_1")%>]</span></a></li>
<li><a href="?Action=<%=Action%>&ExpendType=2"<%If ExpendType=2 Then Response.write " class='selected'"%>><span>商品订单审核[<%=Rs("ExpendNum_2")%>]</span></a></li>
</ul>

<div class="explain">
[]内的数字为未审核总数
</div>

 
<%
Sql="Select Top "&MaxListRs&" * From CFWztg_AdUser_Expend where AdUserName='"&AdUserName&"'"
If ExpendType>=0 Then Sql=Sql&" And ExpendType="&ExpendType
Sql=Sql&" Order By ID Desc"

Set Rs = Server.CreateObject("ADODB.Recordset")
Rs.open Sql,Conn,1,1

If Not Rs.eof Then
 Page=CLng(ChkStr(Request("Page"),2)):If Page=0 Then Page=1 
 Rs.pagesize=20
 TotalRs=Rs.RecordCount
 TotalPage=Rs.PageCount
 MyPageSize=Rs.PageSize
 FixedSize=Rs.PageSize
 Rs.AbsolutePage=Page
End If


%>
<table class="tb_1">
  <tr class="tr_1"> 
    <td>消费编号</td>
    <td>广告主</td>
    <td>广告ID</td>
    <td>点数</td>
    <td>消费金额</td>
    <td>用途</td>
    <td>申请时间</td>
    <td>消费审核</td>
    <td>管理审核状态</td>
    <td>管理员说明</td>
    <td>审核时间</td>
  </tr>
  <%
If TotalRs = MaxListRs Then Response.write "记录太多，只列最新"&MaxListRs&"条"

While Not Rs.Eof And MyPageSize>0
%>
  <tr class="tr_2"> 
    <td><%=Rs("ID")%></td>
    <td><%=Rs("AdUserName")%></td>
    <td><%=Rs("Ad_ID")%>[<a href="../../cf.aspx?Action=adview&ID=<%=Rs("Ad_ID")%>" target="_blank">查看</a>]</td>
    <td><%=Rs("ChaseClickNum")%></td>
    <td><%=GetTurnCent(Rs("Expend_Cent"))%>元</td>
    <td width="200"><%=Rs("ExpendDesc")%></td>
    <td><%=Rs("AddTime")%></td>
    <td>
	<%
	IF Rs("ExpendState")=1 Then
	 Response.Write "审核中"
	ElseIf Rs("ExpendState")=2 Then
	 Response.Write "审核成功"
	ElseIf Rs("ExpendState")=3 Then
	 Response.Write "审核失败,"&Rs("ExPendAbortFeedBack")
	End If
	%>	</td>
    <td> <div align="center"> 
        <%If Rs("AdminCheck")=1 Then
	  Response.Write "已审核"
	 Else
	  Response.Write "未审核"
	 End If%>    </td>
    <td><%=Rs("AdminDesc")%></td>
    <td><%=Rs("AdminSpendTime")%></td>
  </tr>
  <%
MyPageSize=MyPageSize-1
Rs.MoveNext
Wend
Rs.Close
%>
</table>

<%
Call ShowPage(TotalRs,TotalPage,Page,PageUrl,Px)
%>
