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
Sql="Select * From CFwztg_AdSize where ID="&ID
Rs.open Sql,Conn,1,1
%>

<a href="<%=ChkStr(Request.ServerVariables("Http_Referer"),1)%>" class="actionBtn"><i class="mdi mdi-keyboard-return"></i>返回列表</a>

<form name="form4" method="post" action="../../AdminUser.aspx?Action=adsizemodifysave&ID=<%=ID%>&RefUrl=<%=Server.URLEncode(Request.ServerVariables("Http_Referer"))%>">
<table class="tb_1">
<tr class="tr_1"> 
<td colspan="2">修改广告尺寸</td>
</tr>
<tr>
<td width="60" class="td_r">方向：</td>
<td>
<input type="radio" name="Direction" id="Direction" value="1"<%If Rs("Direction")=1 Then Response.write " checked"%>>横向
<input type="radio" name="Direction" id="Direction" value="2"<%If Rs("Direction")=2 Then Response.write " checked"%>>纵向
<input type="radio" name="Direction" id="Direction" value="3"<%If Rs("Direction")=3 Then Response.write " checked"%>>方形
</td>
</tr>

<tr>
<td class="td_r">宽度：</td>
<td><input name="Width" type="text" id="Width" value="<%=Rs("Width")%>"> px</td>
</tr>
<tr> 

<td class="td_r">高度：</td>
<td><input name="Height" type="text" id="Height" value="<%=Rs("Height")%>"> px</td>
</tr>
<tr> 
<td></td>
<td><input type="submit" name="submit" value="修改" class="btn btn-primary"></td>
</tr>
</table>
</form>