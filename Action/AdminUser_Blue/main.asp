<%
'�˷�������ϵͳ Sql��
'����QQ��178575
'����EMail��yliangcf@163.com
'������վ��http://www.qqcf.com
'��ϸ��飺http://www.qqcf.com/cfwztg.htm
'�����г���������ʾ����װ��ʾ��ʹ�����ѽ�����°汾���ص�����
'��Ϊ��Щ���ݿ���ʱ�����£���û�з��ڳ�������Լ�����վ�鿴
%>

<table class="tb_2">
<tr>
<td>
<div class="explain">
���������ֺ�ɫ��ע����ʾ��Ϣ�����⣬������Ϣ�ɲ鿴<a href="../../AspxCheck.aspx" target="_blank" class="btn_add"><i class="fa fa-info-circle"></i> ̽��</a></div>

</td>
</tr>
</table>

<table class="tb_1">
<tr class="tr_1"> 
<td colspan=2>ʱ����Ϣ��ʾ</td>
</tr>
<tr>
  <td width="200" class="td_r">���ص�ǰʱ�䣺</td>
  <td><script>
        var now = new Date();
        
        var year = now.getFullYear();       //��
        var month = now.getMonth() + 1;     //��
        var day = now.getDate();            //��
        
        var hh = now.getHours();            //ʱ
        var mm = now.getMinutes();          //��
        var ss = now.getSeconds();           //��
        
        var clock = year + "-";
        
        if(month < 10)
            clock += "0";
        
        clock += month + "-";
        
        if(day < 10)
            clock += "0";
            
        clock += day + " ";
        
        if(hh < 10)
            clock += "0";
            
        clock += hh + ":";
        if (mm < 10) clock += '0'; 
        clock += mm + ":"; 
         
        if (ss < 10) clock += '0'; 
        clock += ss; 
		
		document.write(clock);
		</script>
		</td>
</tr>
<tr>
<td class="td_r">��������ǰʱ�䣺</td>
<td><%=year(now)&"-"&Right("0"&month(now),2)&"-"&Right("0"&day(now),2)&" "&Right("0"&hour(now),2)&":"&Right("0"&minute(now),2)&":"&Right("0"&second(now),2)%>
<script>
var d = new Date()
if(Math.abs(parseInt(d.getTime()/1000)+28800-parseInt(<%=datediff("s","1970-1-1",now)%>))>3600){
document.write("<font color='#ff0000'>����ʱ��ͷ�����ʱ��������1Сʱ������cookiesʧЧ���������ʱ��������������׼ʱ��</font>");	
}

</script> 

</td>
</tr>


<tr class="tr_1"> 
 <td colspan=2>CDN����������Ϣ��ʾ</td>
</tr>
<tr>
  <td class="td_r">CDN����������ǰ���õ�״̬��</td>
  <td><%If RsSet("portmap")=1 Then Response.write "����" Else Response.write "�ر�" End If%></td>
</tr> 

<tr>
  <td class="td_r">CDN�Ƿ���Ҫ������ʾ��</td>
  <td>
<%
if AdScriptShowDomain="" Then
 Response.write "<script src='../../cf.aspx?Action=cdncheck&RanStr="&DateDiff("s", "1970-1-1", Now)&"'></script>"
Else
 Response.write "<script src='"&AdScriptShowDomain&"cf.aspx?Action=cdncheck&RanStr="&DateDiff("s", "1970-1-1", Now)&"'></script>"
End If
%>
</td>
</tr>

<tr class="tr_1">
 <td colspan=2>.net���а汾���</td>
</tr>
<tr>
  <td class="td_r">.net���а汾��</td>
  <td>
<%
if AdScriptShowDomain="" Then
 Response.write "<iframe scrolling='no' width='100' height='14' src='../../cf.aspx?Action=aspxcheck&RanStr="&DateDiff("s", "1970-1-1", Now)&"' frameborder='0' marginheight=0 marginwidth=0></iframe>"
Else
 Response.write "<iframe scrolling='no' width='100' height='14' src='"&AdScriptShowDomain&"cf.aspx?Action=aspxcheck&RanStr="&DateDiff("s", "1970-1-1", Now)&"' frameborder='0' marginheight=0 marginwidth=0 ></iframe>"
End If
%>

(�粻����ʾ����2.0.50727.8762��ʽ�İ汾�ţ���ʾ.net�����޷����У�����.net2.0��3.0��3.5��֧��)</td>
</tr>


<%
CacheServer=RsSet("CacheServer")
CheckTime  = DateDiff("s", "1970-1-1", Now)
CheckCode  = Md5(CheckTime & RsSet("SysCode"), 2)
If CacheServer <> "" Then
%>
<tr class="tr_1">
 <td colspan=2>���ؾ���վ�����м��</td>
</tr>
<tr>
  <td class="td_r">�������</td>
  <td>
<%
MyArray = Split(CacheServer, ",")

Response.Write("��" & UBound(MyArray) + 1 & "��վ��<br>")
 For I = 0 To UBound(MyArray)
 Response.Write("��" & I + 1 & "��:<iframe scrolling='no' width='450' height='16' src='" & MyArray(I) & "cf.aspx?Action=cachecheck&CacheServer=" & MyArray(I) & "&CheckTime=" & CheckTime & "&CheckCode=" & CheckCode & "' frameborder='0' marginheight=0 marginwidth=0></iframe><br>")
 Next
%>
</td>
</tr>
<%end if%>
  
  <tr class="tr_1"> 
    <td colspan=2>����Ա��Ϣ</td>
  </tr>
<%
Sql="Select * From CFWztg_AdminUser where AdminUserName='"&GetStr(Session("CFWztgAdmin"),"AdminUserName")&"'"
Set Rs=Conn.Execute(Sql)
%>

  

<tr> 
<td class="td_r">
��һ�ε�¼ʱ�䣺
</td>
<td>
<%=Rs("PreviousLoginTime") %>
</td>
</tr>

<tr> 
<td class="td_r">
��һ�ε�¼IP��
</td>
<td>
<%=Rs("PreviousLoginIp")%>/<%=GetIpArea(Rs("PreviousLoginIp"))%>
</td>
</tr>

<tr>
<td class="td_r">δ��˹�淢������</td>
<td>
<%

Sql="Select Count(1) From CFWztg_AdUser_Expend where AdminCheck=0"
Set Rs=Conn.Execute(Sql)
Response.write "<a href='?Action=aduserexpendlist'>"&Rs(0)&"��</a>"
Rs.Close
%>
</td>
</tr>

<tr>
<td class="td_r">δ��˹���޸�����</td>
<td>
<%
Sql="Select Count(1) From CFWztg_AD_Check a inner join CFWztg_AD b on a.ad_id=b.id Where a.CheckState=1"
Set Rs=Conn.Execute(Sql)
Response.write "<a href='?Action=adcheck&CheckState=1'>"&Rs(0)&"��</a>"
Rs.Close
%>
</td>
</tr>

<tr>
<td class="td_r">����Աδ�ظ���������</td>
<td>
<%
Sql="Select Count(1) From CFWztg_Gbook where IsRead_Admin=0"
Set Rs=Conn.Execute(Sql)
Response.write "<a href='?Action=gbooklist'>"&Rs(0)&"��</a>"
Rs.Close
%>
</td>
</tr>

<%If RsSet("UserValid")=3 Then%>
<tr>
<td class="td_r">δ�����վ������</td>
<td>
<%
Sql="Select Count(1) From CFWztg_User where UserType=1 And UserState=3"
Set Rs=Conn.Execute(Sql)
Response.write "<a href='?Action=userlist&&UserState=3'>"&Rs(0)&"��</a>"
Rs.Close
%>
</td>
</tr>
<%End If%>

<%If RsSet("AdUserValid")=3 Then%>
<tr>
<td class="td_r">δ��˹��������</td>
<td>
<%
Sql="Select Count(1) From CFWztg_User where UserType=2 And UserState=3"
Set Rs=Conn.Execute(Sql)
Response.write "<a href='?Action=aduserlist&&UserState=3'>"&Rs(0)&"��</a>"
Rs.Close
%>
</td>
</tr>
<%End If%>
</table>




