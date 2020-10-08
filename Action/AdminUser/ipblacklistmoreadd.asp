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
If Request("RefUrl")="" Then
 RefUrl=ChkStr(Request.ServerVariables("Http_Referer"),1) 
Else
 RefUrl=ChkStr(Request("RefUrl"),1)
End If
%>


<a href="<%=RefUrl%>" class="actionBtn"><i class="mdi mdi-keyboard-return"></i>返回列表</a>

<form id="form_infoadd" name="form_infoadd" method="post" action="../../AdminUser.aspx?Action=ipblacklistmoreaddsave&RefUrl=<%=Server.URLEncode(Request.ServerVariables("Http_Referer"))%>" onsubmit="return infoaddcheck()">
<table class="tb_1">
<tr class="tr_1"> 
<td colspan="2">IP黑名单批量增加</td>
</tr>
<tr>
  <td class="td_r" width="400">在无效列表里单个IP大于或等于多少点击导入到黑名单：</td>
  <td><input name="IpTotal" type="text" id="IpTotal" value="20" size="8">个(数据太多的话只导入前500条)</td>
</tr>
<tr>
  <td class="td_r" width="380">在无效列表里IP的C段合计大于或等于多少导入到黑名单的C段：</td>
  <td><input name="IpSegmenTotal" type="text" id="IpSegmenTotal" value="100" size="8">个(数据太多的话只导入前500条)</td>
</tr>
<tr> 
  <td></td>
  <td>
  <input type="submit" name="submit" id="submit" value="导入" class="btn btn-primary">
  </td>
</tr>
</table></form>



<%
PageUrl = "?Action="&Action&"&IP="&IP&"&IpType="&IpType&"&RefUrl="&Server.URLEncode(RefUrl)


Sql="SELECT Top 500  count(1) IpTotal, Ip_1, Ip_2, Ip_3,max(Ip_all) Ip_all,max(Ip) Ip FROM CFWztg_Invalid_Ip GROUP BY Ip_1, Ip_2, Ip_3 order by IpTotal desc"


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
<td>序号</a></td>
<td>IP第A段</a></td>
<td>IP第B段</a></td>
<td>IP第C段</a></td>
<td>C段IP点击数量</a></td>
<td>&nbsp;</td>
</tr>
<%
While Not Rs.Eof And MyPageSize>0
%>
<tr class="tr_2"> 
<td style="font-weight:bold;"><%=Rs.RecordCount-Rs.Pagesize*(Page)+MyPageSize%></td>
<td><%=rs("Ip_1")%></td>
<td><%=rs("Ip_2")%></td>
<td><%=rs("Ip_3")%></td>
<td><%=rs("IpTotal")%></td>
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