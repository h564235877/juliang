<%
'�˷�������ϵͳ Sql��
'����QQ��178575
'����EMail��yliangcf@163.com
'������վ��http://www.qqcf.com
'��ϸ��飺http://www.qqcf.com/cfwztg.htm
'�����г���������ʾ����װ��ʾ��ʹ�����ѽ�����°汾���ص�����
'��Ϊ��Щ���ݿ���ʱ�����£���û�з��ڳ�������Լ�����վ�鿴
%>
<%
If Request("RefUrl")="" Then
 RefUrl=ChkStr(Request.ServerVariables("Http_Referer"),1) 
Else
 RefUrl=ChkStr(Request("RefUrl"),1)
End If
%>


<a href="<%=RefUrl%>" class="actionBtn"><i class="mdi mdi-keyboard-return"></i>�����б�</a>

<form id="form_infoadd" name="form_infoadd" method="post" action="../../AdminUser.aspx?Action=ipblacklistmoreaddsave&RefUrl=<%=Server.URLEncode(Request.ServerVariables("Http_Referer"))%>" onsubmit="return infoaddcheck()">
<table class="tb_1">
<tr class="tr_1"> 
<td colspan="2">IP��������������</td>
</tr>
<tr>
  <td class="td_r" width="400">����Ч�б��ﵥ��IP���ڻ���ڶ��ٵ�����뵽��������</td>
  <td><input name="IpTotal" type="text" id="IpTotal" value="20" size="8">��(����̫��Ļ�ֻ����ǰ500��)</td>
</tr>
<tr>
  <td class="td_r" width="380">����Ч�б���IP��C�κϼƴ��ڻ���ڶ��ٵ��뵽��������C�Σ�</td>
  <td><input name="IpSegmenTotal" type="text" id="IpSegmenTotal" value="100" size="8">��(����̫��Ļ�ֻ����ǰ500��)</td>
</tr>
<tr> 
  <td></td>
  <td>
  <input type="submit" name="submit" id="submit" value="����" class="btn btn-primary">
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
<td>���</a></td>
<td>IP��A��</a></td>
<td>IP��B��</a></td>
<td>IP��C��</a></td>
<td>C��IP�������</a></td>
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