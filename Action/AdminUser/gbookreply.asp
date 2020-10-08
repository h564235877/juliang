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
ID=ChkStr(request("ID"),2)

RefUrl=ChkStr(Request.ServerVariables("Http_Referer"),1) 

Set Rs = Server.CreateObject("ADODB.Recordset")
Sql="Select * From CFWztg_Gbook where ID="&ID
Rs.open Sql,Conn,1,1
%>

<a href="<%=RefUrl%>" class="actionBtn" style="margin-top:10px;"><i class="mdi mdi-keyboard-return"></i>返回列表</a>

<form name="form2" method="post" action="../../AdminUser.aspx?Action=gbookreplysave&ID=<%=ID%>&RefUrl=<%=Server.URLEncode(Request.ServerVariables("Http_Referer"))%>">
<table class="tb_1"><tr class="tr_1"> 
<td colspan="2">留言回复</td>
</tr>
<tr>
<td width="90" class="td_r">内容：</td>
<td><%=Rs("Content")%></td>
</tr>
<tr>
<td class="td_r"> 回复内容：</td>
<td><textarea name="Reply" cols="60" rows="7" id="textarea"><%=rs("Reply")%></textarea></td>
</tr>
<tr>
<td></td>
<td>
<input type="submit" name="submit" value="回复并同时标识已读" class="btn btn-primary">
</td>
</tr>
</table>
</form>