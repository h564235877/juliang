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
Assort=ChkStr(Request("Assort"),2)

PageUrl = "?Action="&Action&"&Assort="&Assort

Sql="Select * From CFWztg_SysInfo Where 1=1"
If Assort<>"" Then Sql=Sql&" And Assort="&Assort
Sql=Sql&" Order By ListID Desc,ID Desc"

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

<a href="?Action=infoadd" class="actionBtn add"><i class="mdi mdi-plus"></i><span>增加公告和帮助</span></a>

<form name="form_infolist" id="form_infolist" method="post" action="../../AdminUser.aspx?Action=infoseldel">
<table class="tb_1">
<tr class="tr_1"> 
<td><input name="chkall" type="checkbox" id="chkall" onclick="selectcheckbox(this.form)" value="check"></td>
<td>对象</td>
<td>标题</td>
<td>时 间</td>
<td>置顶数字</td>
<td>操作</td>
</tr>
<%
While Not Rs.Eof And MyPageSize>0
%>
<tr class="tr_2"> 
<td> 
<%
Response.write "<input name='ID_Sel' type='checkbox' id='ID_Sel' value='"&rs("ID")&"'>"
%>
</td>
<td>
<%
If Rs("Assort")=1 Then
 Response.Write "网站主公告"
ElseIf Rs("Assort")=2 Then
 Response.Write "广告主公告"
ElseIf Rs("Assort")=3 Then
 Response.Write "网站主常见问题"
ElseIf Rs("Assort")=4 Then
 Response.Write "广告主常见问题"
End If
%>
</td>
<td><%=rs("Title")%></td>
<td><%=rs("AddTime")%></td>
<td><%=rs("ListID")%></td>
<td><a href="?Action=infomodify&id=<%=rs("id")%>" class="btn_edit"><i class="mdi mdi-pencil"></i>修改</a>


<a href="javascript:;" onclick="$(function () { confirm('你确定要删除吗?', '', function (isConfirm) {if (isConfirm) {gotoUrl('../../AdminUser.aspx?Action=infodel&ID=<%=Rs("ID")%>')}}, {confirmButtonText: '确定', cancelButtonText: '取消', width: 400});});" class="btn_del"><i class="mdi mdi-window-close"></i>删除</a>
</td>
</tr>
<%
MyPageSize=MyPageSize-1
Rs.MoveNext
Wend
Rs.Close
%>
</table>
</form>

<a href="javascript:;" onclick="$(function () { confirm('你确定要删除选择的记录吗?', '', function (isConfirm) {if (isConfirm) {$('#form_infolist').submit();}}, {confirmButtonText: '确定', cancelButtonText: '取消', width: 400});});" class="btn btn-xs btn-danger"><i class="mdi mdi-window-close"></i>删除选择</a>

<%
Call ShowPage(TotalRs,TotalPage,Page,PageUrl,Px)
%>


<script>
$(function(){

$("#search").click(function(){
 var searchurl ="?Action=<%=Action%>";
 searchurl += '&assort=' + $('#assort').val();

 location.href=searchurl;
});

});
</script>

<table class="tb_3">
<tr class="tr_1"> 
<td colspan="14">查询</td>
</tr>

<tr>
<td class="td_r">选择分类</td>
<td>

<select name="assort" id="assort">
<option value="">全部分类</option>
<%

Sql="Select * From CFWztg_SysInfoClass Order By ID"
Set Rs2= Server.CreateObject("ADODB.Recordset")
Rs2.open Sql,Conn,1,1
While Not Rs2.Eof
%>
<option value="<%=Rs2("ID")%>"<%If Assort=CStr(Rs2("ID")) Then Response.write " selected"%>><%=Rs2("InfoClassName")%></option>
<%
Rs2.MoveNext
Wend
Rs2.Close
%>
</select>
</td>
</tr>
<tr>
<td></td>
<td><input type="submit" name="submit" value="查询" class="btn btn-primary" id="search"></td>
</tr>
</table>
