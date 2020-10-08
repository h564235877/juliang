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

Set Rs = Server.CreateObject("ADODB.Recordset")
Sql="Select * From CFWztg_IpBlackList where ID="&ID
Rs.open Sql,Conn,1,1
%>

<a href="<%=ChkStr(Request.ServerVariables("Http_Referer"),1)%>" class="actionBtn"><i class="mdi mdi-keyboard-return"></i>返回列表</a>

<form id="form_infoadd" name="form_infoadd" method="post" action="../../AdminUser.aspx?Action=ipblacklistmodifysave&ID=<%=ID%>&RefUrl=<%=Server.URLEncode(Request.ServerVariables("Http_Referer"))%>" onsubmit="return infoaddcheck()">
<table class="tb_1">
<tr class="tr_1"> 
<td colspan="2">IP黑名单修改</td>
</tr>
<tr>
  <td class="td_r">IP地址：</td>
  <td><input name="Ip" type="text" id="Ip" value="<%=rs("Ip")%>" size="30">*</td>
</tr>
<tr> 
<td width="100" class="td_r">黑名单类型：</td>
<td>
<select name="IpType" id="IpType">
<option value="1"<%If rs("IpType")=1 Then Response.write " selected"%>>封单个IP</option>
<option value="2"<%If rs("IpType")=2 Then Response.write " selected"%>>封IP的C段</option>
</select>
*
</td>
</tr>
<tr>
<td class="td_r">加入时间：</td>
<td><input name="addtime" type="text" id="addtime" value="<%=rs("AddTime")%>" size="16">*</td>
</tr>
<tr> 
  <td></td>
  <td>
  <input type="submit" name="submit" id="submit" value="修改" class="btn btn-primary">
  </td>
</tr>
</table></form>