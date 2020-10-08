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
'不进行action判断的话会漏洞备份文件名信息
If Action<>"dbdo" Then Response.End
%>


<table class="tb_1">
<tr class="tr_1"> 
<td>执行Sql语句</td>
</tr>
<form name="form_exesql" id="form_exesql" method="post" action="?Action=sqlexesave&CurrUrl=<%=Server.URLEncode(HttpPath(7))%>">
<tr> 
<td><textarea name="sql" cols="80" rows="5" id="sqlcmd"></textarea> 
</td>
</tr>
<tr>
<td>请输入管理员密码确认执行：
<input type="password" name="Pwd"></td>
</tr>
<tr>
<td><a href="javascript:;" onclick="$(function () { confirm('确定执行以上Sql语句吗?', '', function (isConfirm) {if (isConfirm) {$('#form_exesql').submit();}}, {confirmButtonText: '确定', cancelButtonText: '取消', width: 400});});" class="btn btn-primary">确定执行以上Sql语句</a>
注：多行语句执行以回车换行，每一行要求为一完整语句</td>
</tr>
</form>

<tr class="tr_1"> 
<td>数据库表记录数查看</td>
</tr>

<script language=JavaScript>
function searchcheck_rsnumview()
{ 
 var searchurl ="?Action=<%=Action%>&DoType=rsnumview"
 searchurl += '&RsNum=' + document.getElementById('RsNum').value;
 location.href= searchurl ;
}
</script>
<tr> 
<td>查看记录数大于或等于
<%
If Request("RsNum")="" Then
 RsNum = 10000
Else
 RsNum = ChkStr(Request("RsNum"),2)
End If
%>
<input name="RsNum" id="RsNum" type="text" value="<%=RsNum%>" size="10" />
的表的名称
<input type="button" name="submit" value="查看" class="btn btn-primary" onclick="searchcheck_rsnumview()">
&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" name="reset" value="返回" class="btn btn-dark" onclick="location.href='?Action=<%=Action%>';">
</td>
</tr>

<%
If Request("DoType")="rsnumview" Then
%>
<tr> 
<td>

<table>
<%
RsNum=GoBack(ChkStr(Request("RsNum"),2),"请输入记录数")

Sql="select o.name,i.rows from sysobjects o,sysindexes i where o.id=i.id and o.Xtype='U' and i.indid<2 and i.rows>="&RsNum&" order by i.rows desc,o.name"
Set Rs=Conn.Execute(Sql)

If Rs.Eof Then Response.write "没有找到记录数大于"&RsNum&"的表"
While Not Rs.Eof
 Response.write "<tr><td>"&Rs(0)&"</td><td>"&Rs(1)&"</td></tr>"
Rs.MoveNext
Wend
%>
</table>

</td>
</tr>
<%
End If
%>

<tr class="tr_1"> 
<td>数据库日志压缩</td>
</tr>
<tr> 
<td>
<a href="javascript:;" onclick="$(function () { confirm('确定要压缩数据库吗?', '', function (isConfirm) {if (isConfirm) {gotoUrl('../../AdminUser.aspx?Action=dbys')}}, {confirmButtonText: '确定', cancelButtonText: '取消', width: 400});});" class="btn btn-primary">点击压缩数据库</a>

<div class="explain">注：压缩数据库一般在数据库日志文件很大时使用，如上百M，一般不需使用
</div>
</td>
</tr>
<tr class="tr_1"> 
<td> 数据库备份</td>
</tr>
<tr> 
<td>
<a href="javascript:;" onclick="$(function () { confirm('确定要备份数据库吗?', '', function (isConfirm) {if (isConfirm) {gotoUrl('../../AdminUser.aspx?Action=dbbackup')}}, {confirmButtonText: '确定', cancelButtonText: '取消', width: 400});});" class="btn btn-primary">点击备份数据库</a>

<div class="explain">
1.手工备份的条件是程序和数据库放在一台服务器上，速度一般几秒钟即可备份成功，放在虚拟主机上并不能使用此功能备份进行数据库备份。
<br>
2.手工备份的数据库放在程序的data目录里，以backup_开头后面是备份的时间缩写的14位数字，扩展名为.bak。
<br>
3.自动备份的数据库放在程序的data目录里，以backup_开头后面是从1开头的1位或2位数字，扩展名为.bak，轮循备份，备份时间看文件的修改时间就知道。
</div>
</td>
</tr>
<tr> 
<td><%
foldername=server.mappath("../../data")
path=foldername
If Instr(path,"\data")=0 Then Call AlertRef("不能浏览这个目录！")
ShowFolderList(path) 



Function ShowFolderList(folderspec) 
temp=request.ServerVariables("HTTP_REFERER") 
temp=left(temp,Instrrev(temp,"/")) 
temp1=len(folderspec)-len(server.MapPath("./"))-1 
if temp1>0 then 
temp1=right(folderspec,cint(temp1)) 
elseif temp1=-1 then 
temp1="" 
end if 
tempurl=temp+replace(temp1,"\","/")+"/" 
Set fso = CreateObject("Scripting.FileSystemObject") 
upfolderspec=fso.GetParentfoldername(folderspec&"\") 
%>
<table width="100%" border="0" align="center" cellpadding="2" cellspacing="1">
<tr> 
<td>名称</td>
<td>大小</td>
<td>类型</td>
<td>修改时间</td>
</tr>
        <% 
'列出目录 
Set f = fso.GetFolder(folderspec) 
Set fc = f.SubFolders 
For Each f1 in fc 
%>
<tr> 
<td><%= f1.name%></td>
<td>
<%MySize=f1.size/1024
If MySize<1024 Then Response.write FormatNumber(MySize,2,-1,0,0)&"K"
If MySize>=1024 Then Response.write FormatNumber(MySize/1024,2,-1,0,0)&"M"%>
</td>
<td>文件夹</td>
<td><%= f1.datelastmodified%></td>
</tr>
<% 
Next 
foldername=StrReverse(left(StrReverse(folderspec),instr(StrReverse(folderspec),"\")-1))&"/"
'列出文件 
Set fc = f.Files 
For Each f1 in fc 
%>
<tr> 
<td><%= f1.name%></td>
<td> 
<%MySize=f1.size/1024
If MySize<1024 Then Response.write  FormatNumber(MySize,2,-1,0,0)&"K"
If MySize>=1024 Then Response.write  FormatNumber(MySize/1024,2,-1,0,0)&"M"%>
</td>
<td>文件</td>
<td><%= f1.datelastmodified%></td>
</tr>
<% 
Next 
set fso=nothing 
%>
</table>
<%End Function %></td>
</tr>
</table>
</td>
</tr>
</table>