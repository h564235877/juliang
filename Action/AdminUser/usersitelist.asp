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
SiteUrl=ChkStr(Request("SiteUrl"),1)
SiteState=ChkStr(Request("SiteState"),2)

PageUrl = "?Action="&Action&"&UserName="&UserName&"&SiteUrl="&SiteUrl&"&SiteState="&SiteState

Sql="Select a.ID,a.UserName,a.SiteUrl,a.SiteState,a.AlexaRank,a.AddDate,b.SiteClassName From CFWztg_UserSite a Left Join CFWztg_SiteClass b on a.SiteClassID=b.ID Where 1=1"


If UserName<>"" Then Sql=Sql&" And a.UserName='"&UserName&"'"
If SiteUrl<>"" Then Sql=Sql&" And a.SiteUrl Like '%"&SiteUrl&"%'"
If SiteState<>"" Then Sql=Sql&" And a.SiteState="&SiteState

Sql=Sql&" Order By a.ID Desc"

Set Rs = Server.CreateObject("Adodb.RecordSet")
Rs.Open Sql,Conn,1,1

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
<td>�û�</td>
<td>��ַ</td>
<td>����</td>
<td>���״̬</td>
<td>Alexa����</td>
<td>ʱ ��</td>
<td>����</td>
</tr>
<%
While Not Rs.Eof And MyPageSize>0
%>
<tr class="tr_2"> 
<td><%=Rs("UserName")%></td>
<td>
<%
If Left(Lcase(Rs("SiteUrl")),7)="http://" Then
 Response.write "<a href='"&Rs("SiteUrl")&"' target='_blank'>"&Rs("SiteUrl")&"</a>"
Else
 Response.write "<a href='http://"&Rs("SiteUrl")&"' target='_blank'>"&Rs("SiteUrl")&"</a>"
End If
%>
</td>
<td><%=Rs("SiteClassName")%></td>
<td>
<%
If Rs("SiteState")=1 Then
Response.Write "�����"
ElseIf Rs("SiteState")=2 Then
Response.Write "��˳ɹ�"
ElseIf Rs("SiteState")=3 Then
Response.Write "���ʧ��"
End if
%>
</td>
<td><%=Rs("AlexaRank")%></td>
<td><%=Rs("AddDate")%></td>
<td>
<a href="?Action=usersitemodify&ID=<%=Rs("ID")%>" class="btn_edit"><i class="mdi mdi-pencil"></i>�޸�</a>

<a href="javascript:;" onclick="$(function () { confirm('��ȷ��Ҫɾ����?', '', function (isConfirm) {if (isConfirm) {gotoUrl('../../AdminUser.aspx?Action=usersitedel&ID=<%=Rs("ID")%>&UserName=<%=Rs("UserName")%>')}}, {confirmButtonText: 'ȷ��', cancelButtonText: 'ȡ��', width: 400});});" class="btn_del"><i class="mdi mdi-window-close"></i>ɾ��</a>
</td>
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

<script>
$(function(){

$("#search").click(function(){
 var searchurl ="?Action=<%=Action%>";
 searchurl += '&UserName=' + $('#UserName').val();
 searchurl += '&SiteUrl=' + $('#SiteUrl').val();
 searchurl += '&SiteState=' + $('#SiteState').val();

 location.href=searchurl;
});

});
</script>

<table class="tb_3">
<tr> 
<td>��վ����</td>
<td><input name="UserName" type="text" id="UserName" value="<%=UserName%>" size="10"></td>
<td>��ַ��</td>
<td><input name="SiteUrl" type="text" id="SiteUrl" value="<%=SiteUrl%>" size="10"></td>
<td>���״̬��</td>
<td>
<select id='SiteState' name='SiteState'>
<option value=""<%If SiteState="" Then Response.Write " selected"%>>ȫ��</option>
<option value="1"<%If SiteState="1" Then Response.Write " selected"%>>�ȴ����</option>
<option value="2"<%If SiteState="2" Then Response.Write " selected"%>>��˳ɹ�</option>
<option value="3"<%If SiteState="3" Then Response.Write " selected"%>>���ʧ��</option>
</select>
</td>
<td><input type="submit" name="submit" value="��ѯ" class="btn btn-sm btn-primary" id="search"></td>
</tr>
</table>
