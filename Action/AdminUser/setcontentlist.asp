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
SetBClassFlag=ChkStr(Request("SetBClassFlag"),1)
SetSClassFlag=ChkStr(Request("SetSClassFlag"),1)

Px=ChkStr(Request("Px"),1):If Px="" Then Px="SetTaxis"

PageUrl = "?Action="&Action&"&SetBClassFlag="&SetBClassFlag&"&SetSClassFlag="&SetSClassFlag

Call PxFilter(Px,"ID,SetFlag,SetFlag_2,SetDesc,SetType,SetTaxis,SetState")

Sql="Select SetBClassDesc From CFWztg_SetBClass Where SetBClassFlag='"&SetBClassFlag&"'"
Set Rs=Conn.Execute(Sql)
SetBClassDesc=Rs("SetBClassDesc")

Sql="Select SetSclassDesc From CFWztg_SetSClass Where SetBClassFlag='"&SetBClassFlag&"' And SetSClassFlag='"&SetSClassFlag&"'"
Set Rs=Conn.execute(Sql)
SetSclassDesc=Rs("SetSclassDesc")

Sql="Select * From CFWztg_SetContent Where SetBClassFlag='"&SetBClassFlag&"' And SetSClassFlag='"&SetSClassFlag&"' Order By "&Px
Set Rs=Conn.execute(Sql)
%>

<table class="tb_2">
<tr>
<td>


<%
Response.write "<select name='setsite' id='setsite' onChange=""window.location=document.getElementById('setsite').options[document.getElementById('setsite').selectedIndex].value"">"

Response.write "<option value='?Action=setbclasslist'>快速选择需要配置的选项</option>"


Sql="Select * From CFWztg_SetBClass where SetBClassFlag<>'AdminPower' Order By SetTaxis"
Set Rs1=Conn.Execute(Sql)
While Not Rs1.Eof

Response.write "<option value='?Action=setsclasslist&SetBclassFlag="&Rs1("SetBClassFlag")&"'"
If Action="setsclasslist" And Chkstr(Request("SetBclassFlag"),1)=Rs1("SetBClassFlag") Then Response.write " selected"
Response.write ">"&Rs1("SetBClassDesc")&"["&Rs1("SetBClassFlag")&"]</option>"

Sql="Select * From CFWztg_SetSClass Where SetBClassFlag='"&Rs1("SetBClassFlag")&"' Order By SetTaxis"
Set Rs2=Conn.Execute(Sql)
While Not Rs2.Eof
 Response.write "<option value='?Action=setcontentlist&SetBClassFlag="&Rs1("SetBClassFlag")&"&SetSClassFlag="&Rs2("SetSClassFlag")&"'"
 If Action="setcontentlist" And Chkstr(Request("SetBclassFlag"),1)=Rs1("SetBClassFlag") And Chkstr(Request("SetSClassFlag"),1)=Rs2("SetSClassFlag") Then Response.write " selected"
 Response.write ">----"&Rs2("SetSClassDesc")&"["&Rs2("SetSClassFlag")&"]</option>"
 
Sql="Select * From CFWztg_SetContent Where SetBClassFlag='"&Rs1("SetBClassFlag")&"' and SetSClassFlag='"&Rs2("SetSClassFlag")&"' Order By SetTaxis"
Set Rs3=Conn.Execute(Sql)
While Not Rs3.Eof
 Response.write "<option value='?Action=setcontentmodify&SetFlag="&Rs3("SetFlag")&"'"
  If Action="setcontentmodify" And Chkstr(Request("SetFlag"),1)=Rs3("SetFlag") Then Response.write " selected"
 Response.write ">--------"&Rs3("SetDesc")&"["&Rs3("SetFlag")&"]</option>"
Rs3.movenext
Wend
Rs3.Close

Rs2.movenext
Wend
Rs2.Close


Rs1.movenext
Wend
Rs1.Close
Response.write "</select>"
%>



<a href="?Action=setbclasslist" class="actionBtn"><i class="mdi mdi-keyboard-return"></i><span>返回一级设置配置</span></a>
<a href="?Action=setsclasslist&SetBClassFlag=<%=SetBClassFlag%>" class="actionBtn" style="margin-right:10px;"><i class="mdi mdi-keyboard-return"></i><span>返回二级设置配置</span></a>
<a href="?Action=setcontentadd&SetBClassFlag=<%=SetBClassFlag%>&SetSClassFlag=<%=SetSClassFlag%>" class="actionBtn add" style="margin-right:10px;"><i class="mdi mdi-plus"></i><span>增加三级设置配置</span></a>
</td>
</tr>


<tr> 
<td>
<span class="title">三级配置列表 当前位置:<%=SetBClassDesc%>-<%=SetSclassDesc%></span>
</td>
</tr>


</table>


<table class="tb_1">

	<tr class="tr_1"> 
      <td class="td_nowrap"><a href="<%=PageUrl%>&Px=SetFlag">设置标识</a></td>
	  <td class="td_nowrap"><a href="<%=PageUrl%>&Px=SetFlag_2">设置副标识</a></td>
      <td class="td_nowrap"><a href="<%=PageUrl%>&Px=SetDesc">设置描述</a></td>
      <td class="td_nowrap"><a href="<%=PageUrl%>&Px=SetType">设置类型</a></td>
      <td class="td_nowrap"><a href="<%=PageUrl%>&Px=SetTaxis">排序数字</a></td>
      <td class="td_nowrap"><a href="<%=PageUrl%>&Px=SetState">设置状态</a></td>
      <td class="td_nowrap">值</td>
      <td class="td_nowrap">操作</td>
    </tr>
<%
while not rs.eof
%>
    <tr class="tr_2"> 
      <td class="td_nowrap"><%=rs("SetFlag")%></td>
	  <td class="td_nowrap"><%=rs("SetFlag_2")%></td>
      <td><%=rs("SetDesc")%></td>
      <td class="td_nowrap">
<%
If rs("SetType")=1 Then
 Response.write "内部设置"
ElseIf rs("SetType")=2 Then
 Response.write "外部设置"
End If
%></td>
      <td class="td_nowrap"><%=rs("SetTaxis")%></td>
      <td class="td_nowrap">
<%
If rs("SetState")=1 Then
 Response.write "有效"
ElseIf rs("SetState")=0 Then
 Response.write "<font color=ff0000>无效</font>"
End If
%></td>
      <td class="td_nowrap"><input name="textfield" type="text" value="<%=server.HTMLEncode(rs("SetValue"))%>" size="8" readonly /></td>
      <td class="td_3 td_nowrap">
<%
Response.write "<a href='?Action=setcontentmodify&SetFlag="&rs("SetFlag")&"' class=""btn_edit""><i class=""mdi mdi-pencil""></i>修改</a>"

If Rs("SetType")=2 Then
 Response.write "&nbsp;&nbsp;<a href=""javascript:;"" onclick=""$(function () { confirm('你确定要删除吗?', '', function (isConfirm) {if (isConfirm) {gotoUrl('../../AdminUser.aspx?Action=setcontentdel&SetFlag="&Rs("SetFlag")&"&SetBclassFlag="&Rs("SetBclassFlag")&"')}}, {confirmButtonText: '确定', cancelButtonText: '取消', width: 400});});"" class=""btn_del""><i class=""mdi mdi-window-close""></i>删除</a>"
End If
%>
</td>
</tr>
<%
Rs.MoveNext
Wend
%>
</table>