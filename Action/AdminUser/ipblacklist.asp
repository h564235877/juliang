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
IP=ChkStr(Request("IP"),1)
IpType=ChkStr(Request("IpType"),2)
Px=ChkStr(Request("Px"),1):If Px="" Then  Px="AddTime"

Ip_1=0
Ip_2=0
Ip_3=0

If Instr(IP,":")=0 And Instr(IP,".")>0 Then
 MyArray = Split(IP, ".") 
 If Ubound(MyArray)>=2 Then
  Ip_1 = CInt(MyArray(0))
  Ip_2 = CInt(MyArray(1))
  Ip_3 = CInt(MyArray(2))
 End If
End If
%>

<script>
$(function(){

$("#search").click(function(){
 var searchurl ="?Action=<%=Action%>";
 searchurl += '&IP=' + $('#IP').val();
 searchurl += '&IpType=' + $('#IpType').val();

 location.href=searchurl;
});

});
</script>

<table class="tb_1">
<tr> 
<td>
IP

<input name="IP" type="text" id="IP" value="<%=IP%>" size="10">


<select name="IpType" id="IpType">
<option value=""<%If IpType="" Then Response.write " selected"%>>全部分类</option>
<option value="1"<%If IpType="1" Then Response.write " selected"%>>单个IP</option>
<option value="2"<%If IpType="2" Then Response.write " selected"%>>IP的C段</option>
</select>



<input type="submit" name="submit" value="查询" class="btn btn-sm btn-primary" id="search">

<a href="?Action=ipblacklistadd" class="actionBtn add"><i class="mdi mdi-plus"></i><span>手工增加IP黑名单</span></a>
<a href="?Action=ipblacklistmoreadd" class="actionBtn add"><i class="mdi mdi-plus"></i><span>批量导入IP黑名单</span></a>
</td>

</tr>
</table>





<table class="tb_2">
<tr>
<td><div class="explain">
点击标题可排序，开启后在黑名单里的ip点击无效，
IP黑名单永久表开启防御：<%if rs("IpBlackListOpen")=1 then Response.write "是" else Response.write "否"%>，
无效IP表里的刷IP的单个类型加入IP临时黑名单防御：<%if rs("IpBlackFlagOpen")=1 then Response.write "是" else Response.write "否"%>，
无效IP表里的刷IP的C段类型加入IP临时黑名单防御：<%if rs("IpSegmentBlackFlagOpen")=1 then Response.write "是" else Response.write "否"%>
</div>
</td>
</tr>
</table>

<%
PageUrl = "?Action="&Action&"&IP="&IP&"&IpType="&IpType

Call PxFilter(Px,"AddTime,IP_1,IP_2,IP_3,IP,IpType,AddTime")



Sql="Select * From CFWztg_IpBlackList Where 1=1"

If IpType="" Then
 If IP<>"" Then Sql=Sql&" And IP='"&IP&"' Or (Ip_1="&Ip_1&" And Ip_2="&Ip_2&" And Ip_3="&Ip_3&")"

ElseIf IpType="1" Then
 If IP<>"" Then Sql=Sql&" And IpType=1 And IP='"&IP&"'" Else Sql=Sql&" And IpType=1"
 
ElseIf IpType="2" Then
 If IP<>"" Then Sql=Sql&" And IpType=2 And (Ip_1="&Ip_1&" And Ip_2="&Ip_2&" And Ip_3="&Ip_3&")" Else Sql=Sql&" And IpType=2"
 
End If


Sql=Sql&" Order By "&Px&" Desc"


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

<form name="form_ipblacklist" id="form_ipblacklist" method="post" action="../../AdminUser.aspx?Action=ipblacklistseldel">
<table class="tb_1">
<tr class="tr_1"> 
<td><input name="chkall" type="checkbox" id="chkall" onclick="selectcheckbox(this.form)" value="check"></td>
<td><a href="<%=PageUrl%>&Px=AddTime">序号</a></td>
<td><a href="<%=PageUrl%>&Px=IP_1">IP第A段</a></td>
<td><a href="<%=PageUrl%>&Px=IP_2">IP第B段</a></td>
<td><a href="<%=PageUrl%>&Px=IP_3">IP第C段</a></td>
<td><a href="<%=PageUrl%>&Px=IP">IP地址</a></td>
<td><a href="<%=PageUrl%>&Px=IpType">黑名单类型</a></td>
<td><a href="<%=PageUrl%>&Px=AddTime">加入时间</a></td>
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
<td style="font-weight:bold;"><%=Rs.RecordCount-Rs.Pagesize*(Page)+MyPageSize%></td>
<td><%=rs("Ip_1")%></td>
<td><%=rs("Ip_2")%></td>
<td><%=rs("Ip_3")%></td>
<td><%=rs("Ip")%></td>
<td><%
If Rs("IpType")=1 Then
 Response.Write "封单个IP"
ElseIf Rs("IpType")=2 Then
 Response.Write "封IP的C段"
End If
%></td>
<td><%=rs("AddTime")%></td>
<td><a href="?Action=ipblacklistmodify&id=<%=rs("id")%>" class="btn_edit"><i class="mdi mdi-pencil"></i>修改</a>
  <a href="javascript:;" onclick="$(function () { confirm('确定要删除吗?', '', function (isConfirm) {if (isConfirm) {gotoUrl('../../AdminUser.aspx?Action=ipblacklistdel&ID=<%=Rs("ID")%>')}}, {confirmButtonText: '确定', cancelButtonText: '取消', width: 400});});" class="btn_del"><i class="mdi mdi-window-close"></i>删除</a>
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

<a href="javascript:;" onclick="$(function () { confirm('你确定要删除选择的记录吗?', '', function (isConfirm) {if (isConfirm) {$('#form_ipblacklist').submit();}}, {confirmButtonText: '确定', cancelButtonText: '取消', width: 400});});" class="btn btn-xs btn-danger"><i class="mdi mdi-window-close"></i>删除选择</a>

<a href="javascript:;" onclick="$(function () { confirm('你确定要清空所有记录吗?', '', function (isConfirm) {if (isConfirm) {gotoUrl('../../AdminUser.aspx?Action=ipblacklistalldel')}}, {confirmButtonText: '确定', cancelButtonText: '取消', width: 400});});" class="btnyellow"><i class="mdi mdi-window-close"></i> 清空所有记录</a>

<a href="javascript:;" onclick="$(function () { confirm('你确定要删除所有单个IP记录吗?', '', function (isConfirm) {if (isConfirm) {gotoUrl('../../AdminUser.aspx?Action=ipblacklistallipdel')}}, {confirmButtonText: '确定', cancelButtonText: '取消', width: 400});});" class="btnyellow"><i class="mdi mdi-window-close"></i> 删除所有单个IP记录</a>

<a href="javascript:;" onclick="$(function () { confirm('你确定要删除所有IP段记录吗?', '', function (isConfirm) {if (isConfirm) {gotoUrl('../../AdminUser.aspx?Action=ipblacklistallipsegdel')}}, {confirmButtonText: '确定', cancelButtonText: '取消', width: 400});});" class="btnyellow"><i class="mdi mdi-window-close"></i> 删除所有IP段记录</a>

<%
Call ShowPage(TotalRs,TotalPage,Page,PageUrl,Px)
%>
