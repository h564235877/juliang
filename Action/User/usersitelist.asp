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
Sql="Select a.ID,a.SiteUrl,a.SiteState,a.AlexaRank,a.AddDate,b.SiteClassName From CFWztg_UserSite a Left Join CFWztg_SiteClass b on a.SiteClassID=b.ID  Where a.UserName='"&UserName&"' Order By a.ID Desc"
Set Rs = Server.CreateObject("Adodb.RecordSet")
Rs.Open Sql,Conn,1,1
%>

<a href="?Action=usersiteadd" class="actionBtn add" style="margin-top:10px;"><i class="mdi mdi-plus"></i><span>����Ҫ��˵���վ</span></a>
<%If RsSet("SiteAutoPass")=1 Then%>
<table class="tb_2">
<tr>
<td>
<div class="explain">
ע���¼����վ��ϵͳ�Զ���ʱͨ����˳ɹ�
</div>
</td>
</tr>
</table>
<%End If%>


<table class="tb_1">
  <tr class="tr_1"> 
    <td>��ַ</td>
    <td>����</td>
    <td>���״̬</td>
	<td>Alexa����</td>
    <td>ʱ ��</td>
    <td>����</td>
  </tr>
  <%
While Not Rs.Eof
I=I+1
%>
  <tr class="tr_2"> 
    <td><%=Rs("SiteUrl")%></td>
    <td><%=Rs("SiteClassName")%></td>
    <td>
        <%
	If Rs("SiteState")=1 Then
	 Response.Write "�����"
	ElseIf Rs("SiteState")=2 Then
	 Response.Write "��˳ɹ�"
	ElseIf Rs("SiteState")=3 Then
	 Response.Write "���ʧ��"
	End if%>
    </td>
	<td><%=Rs("AlexaRank")%> </td>
    <td><%=Rs("AddDate")%></td>
    <td>
<a href="javascript:;" onclick="$(function () { confirm('��ȷ��Ҫɾ����?', '', function (isConfirm) {if (isConfirm) {gotoUrl('../../User.aspx?Action=usersitedel&ID=<%=Rs("ID")%>')}}, {confirmButtonText: 'ȷ��', cancelButtonText: 'ȡ��', width: 400});});" class="btn_del"><i class="mdi mdi-window-close"></i> ɾ��</a>

	</td>
  </tr>
<%
Rs.MoveNext
Wend
%>
</table>