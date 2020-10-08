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
      <td>网站主</td>
      <td><input name="UserName" type="text" id="UserName" value="<%=UserName%>" size="10"></td>
 
      <td><input type="submit" name="search"  id="search" value="查询" class="btn btn-sm btn-primary"></td>
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
 
   Response.Write("<a href='?Action="&Action&"&ID="&I+1&"'class='"&ClassName&"' style='margin-right:5px;'>第" & I + 1 & "页</a>")
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
 
   Response.Write("<a href='?Action="&Action&"&UserName="&UserName&"&ID="&I+1&"'class='"&ClassName&"' style='margin-right:5px;'>第" & I + 1 & "页</a>")
 Next
%>
</td>
</tr>
</table>
<script src="<%=ServerUrl & "User.aspx?Action=showlist&UserName="&UserName&"&CheckTime="&CheckTime&"&Site=admin&CheckCode="&Md5("showlist" & UserName & CheckTime & "admin" & RsSet("SysCode"), 2)%>"></script>
<%End If%>

<%End If%>

