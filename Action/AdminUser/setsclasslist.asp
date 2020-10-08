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
SetBclassFlag=ChkStr(Request("SetBclassFlag"),1)

Sql="Select * From CFWztg_SetBClass Where SetBclassFlag='"&SetBclassFlag&"'"
Set Rs=conn.execute(Sql)
SetBClassDesc=Rs("SetBClassDesc")

Sql="Select * From CFWztg_SetSClass Where SetBclassFlag='"&SetBclassFlag&"' Order By SetTaxis"
Set Rs=conn.execute(Sql)
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
	</td>

<td>
<a href="?Action=setbclasslist" class="actionBtn"><i class="mdi mdi-keyboard-return"></i><span>返回一级设置配置列表</span></a>  

<a href="?Action=setsclassadd&SetBclassFlag=<%=SetBclassFlag%>" class="actionBtn add" style="margin-right:10px;"><i class="mdi mdi-plus"></i><span>二级设置配置增加</span></a>

</td>

</tr>



<tr> 
<td colspan="2">
<span class="title">二级设置配置列表 当前位置:<%=SetBClassDesc%></span>
</td>
</tr>

</table>




<table class="tb_1">

    
		  <tr class="tr_1"> 
            <td>设置位置标识</td>
            <td>设置位置描述</td>
            <td>设置类型</td>
			<td>排序数字</td>
            <td>操作</td>
          </tr>
<%
While Not Rs.eof
%>
<tr class="tr_2"> 
            <td><%=Rs("SetSClassFlag")%></td>
            <td><%=Rs("SetSclassDesc")%></td>
            <td><%
If rs("SetType")=1 Then
 Response.write "内部设置"
ElseIf rs("SetType")=2 Then
 Response.write "外部设置"
End If
%></td>
<td><%=Rs("SetTaxis")%></td>
<td class="td_3">
<%
Response.write "<a href='?Action=setsclassmodify&id="&Rs("ID")&"' class=""btn_edit""><i class=""mdi mdi-pencil""></i>修改</a>"
If Rs("SetType")=2 Then
 Response.write "&nbsp;&nbsp;<a href=""javascript:;"" onclick=""$(function () { confirm('你确定要删除吗?', '', function (isConfirm) {if (isConfirm) {gotoUrl('../../AdminUser.aspx?Action=setsclassdel&SetBClassFlag="&Rs("SetBclassFlag")&"&SetSClassFlag="&Rs("SetSClassFlag")&"')}}, {confirmButtonText: '确定', cancelButtonText: '取消', width: 400});});"" class=""btn_del""><i class=""mdi mdi-window-close""></i> 删除</a>"
End If
Response.write "&nbsp;&nbsp;<a href='?Action=setcontentlist&SetBClassFlag="&SetBClassFlag&"&SetSClassFlag="&Rs("SetSClassFlag")&"' class=""btn_add""><i class=""fa fa-sign-out""></i>管理</a>"
%>
</td>
  </tr>

<%
Rs.movenext
wend
%> 
</table>