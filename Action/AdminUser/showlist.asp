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
UserName=ChkStr(Request("UserName"),1)

CacheServer=RsSet("CacheServer")

AdminUserName=GetStr(Session("CFWztgAdmin"),"AdminUserName")
CheckTime=DateDiff("s","1970-1-1",now)
%>

<script>
$(function(){

$("#search").click(function(){
 var searchurl = "?Action=<%=Action%>";
 searchurl += '&UserName=' + $('#UserName').val();

 location.href=searchurl;
});

});
</script>

<table style="margin-bottom:10px;">
<tr> 
      <td>��վ��</td>
      <td><input name="UserName" type="text" id="UserName" value="<%=UserName%>" size="10"></td>
 
      <td><input type="submit" name="search"  id="search" value="��ѯ" class="btn btn-sm btn-primary"></td>
  </tr>
</table>


<%If UserName="" Then%>

<%If CacheServer="" Then%>
<script src="../../AdminUser.aspx?Action=showlist&AdminUserName=<%=AdminUserName%>&CheckTime=<%=CheckTime%>&CheckCode=<%=Md5("showlist" & AdminUserName & CheckTime & RsSet("SysCode"), 2)%>"></script>
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
<script src="<%=ServerUrl & "AdminUser.aspx?Action=showlist&AdminUserName="&AdminUserName&"&CheckTime="&CheckTime&"&CheckCode="&Md5("showlist" & AdminUserName & CheckTime & RsSet("SysCode"), 2)%>"></script>
<%End If%>

<%Else%>


<%If CacheServer="" Then%>
<script src="../../User.aspx?Action=showlist&UserName=<%=UserName%>&CheckTime=<%=CheckTime%>&Site=admin&CheckCode=<%=Md5("showlist" & UserName & CheckTime & "admin" & RsSet("SysCode"), 2)%>"></script>
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
 
   Response.Write("<a href='?Action="&Action&"&UserName="&UserName&"&ID="&I+1&"'class='"&ClassName&"' style='margin-right:5px;'>��" & I + 1 & "ҳ</a>")
 Next
%>
</td>
</tr>
</table>
<script src="<%=ServerUrl & "User.aspx?Action=showlist&UserName="&UserName&"&CheckTime="&CheckTime&"&Site=admin&CheckCode="&Md5("showlist" & UserName & CheckTime & "admin" & RsSet("SysCode"), 2)%>"></script>
<%End If%>

<%End If%>

