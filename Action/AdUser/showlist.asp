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
CacheServer=RsSet("CacheServer")
CheckTime=DateDiff("s","1970-1-1",now)
%>
<%If CacheServer="" Then%>
<script src="../../AdUser.aspx?Action=showlist&AdUserName=<%=AdUserName%>&CheckTime=<%=CheckTime%>&CheckCode=<%=Md5("showlist" & AdUserName & CheckTime & RsSet("SysCode"), 2)%>"></script>
<%Else%>

<table class="tb_2">
<tr>
  <td>
<%
If Request("ID")="" Then ID=1 Else ID=ChkStr(Request("ID"),2)

MyArray = Split(CacheServer, ",")

 For I = 0 To UBound(MyArray)
    If I =ID-1 Then
    ServerUrl = MyArray(I)
	ClassName="btn btn-sm btn-primary"
   Else
    ClassName="btn btn-sm btn-dark"
   End If
 
   Response.Write("<a href='?Action="&Action&"&ID="&I+1&"'class='"&ClassName&"' style='margin-right:5px;'>��" & I + 1 & "ҳ</a>")
 Next
%>
</td>
</tr>
</table>
<script src="<%=ServerUrl & "AdUser.aspx?Action=showlist&AdUserName="&AdUserName&"&CheckTime="&CheckTime&"&CheckCode="&Md5("showlist" & AdUserName & CheckTime & RsSet("SysCode"), 2)%>"></script>
<%End If%>

