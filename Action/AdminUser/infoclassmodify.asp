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
Sql="Select * From CFWztg_SysInfoClass where ID="&ID
Rs.open Sql,Conn,1,1
%>

<form name="form4" method="post" action="../../AdminUser.aspx?Action=infoclassmodifysave&ID=<%=ID%>&RefUrl=<%=Server.URLEncode(Request.ServerVariables("Http_Referer"))%>">
<table class="tb_1">
<tr class="tr_1"> 
<td colspan="2">修改类别名        
</td>
</tr>
<tr> 
<td width="80" class="td_r">类别名：</td>
<td><input name="InfoClassName" type="text" id="InfoClassName" value="<%=Rs("InfoClassName")%>"></td>
</tr>
<tr> 
<td></td>
<td><input type="submit" name="submit" value="修改" class="btn btn-primary">(请慎重修改，修改后原选择这个类别的网站需要重新申请审核)</td>
</tr>
</table>
</form>