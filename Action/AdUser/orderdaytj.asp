<%
'�˷�������ϵͳ Sql��
'����QQ��178575
'����EMail��yliangcf@163.com
'������վ��http://www.qqcf.com
'��ϸ��飺http://www.qqcf.com/cfwztg.htm
'�����г���������ʾ����װ��ʾ��ʹ�����ѽ�����°汾���ص�����
'��Ϊ��Щ���ݿ���ʱ�����£���û�з��ڳ�������Լ�����վ�鿴
%>


<table class="tb_1">
  <tr class="tr_1"> 
    <td>�ա���</td>
    <td>��ȷ�϶�������</td>
    <td>��ȷ�϶����ܽ��</td>
    <td>��ȷ����֧��</td>
    <td>δȷ�϶�������</td>
    <td>δȷ�϶����ܽ��</td>
	<td>δȷ����֧��</td>
    <td>�١���</td>
  </tr>
<%
PageUrl = "?Action="&Action

Sql="select convert(varchar(10),addtime,120) as adddate from CFWztg_AdUser_Order Where AdUserName='"&AdUserName&"' group by convert(varchar(10),addtime,120) Order By AddDate Desc"

Set Rs = Server.CreateObject("ADODB.Recordset")
Rs.open Sql,Conn,1,1

If Not rs.eof then
 Page=CLng(ChkStr(Request("Page"),2)):If Page=0 Then Page=1 
 rs.pagesize=20
 totalrs=rs.RecordCount
 totalpage=rs.pageCount
 mypagesize=rs.pagesize
 FixedSize=Rs.PageSize
 rs.absolutepage=page
End If


While Not Rs.Eof And MyPageSize>0

Sql="select count(1) as ordernum,IsNull(sum(ordercent),0) as ordercent,IsNull(sum(ordercent * ordertcrate/100),0) as tccent from CFWztg_AdUser_Order Where AdUserName='" & AdUserName & "' and Datediff(d,'"&Rs("AddDate")&"',AddTime)=0 And (OrderState=1 or OrderState=3 or OrderState=5 or OrderState=7)"

Set Rs2=Conn.Execute(Sql)

Sql="select count(1) as ordernum,IsNull(sum(ordercent),0) as ordercent,IsNull(sum(ordercent * ordertcrate/100),0) as tccent from CFWztg_AdUser_Order Where AdUserName='" & AdUserName & "' and Datediff(d,'"&Rs("AddDate")&"',AddTime)=0 And (OrderState=2 or OrderState=6)"

Set Rs3=Conn.Execute(Sql)
%>
  <tr> 
    <td><%=Rs("AddDate")%></td>
    <td><%=Rs2("ordernum")%></td>
    <td><%=GetTurnCent(Rs2("ordercent"))%>Ԫ</td>
    <td><%=GetTurnCent(Rs2("tccent"))%>Ԫ</td>
    <td><%=Rs3("ordernum")%></td>
    <td><%=GetTurnCent(Rs3("ordercent"))%>Ԫ</td>
	<td><%=GetTurnCent(Rs3("tccent"))%>Ԫ</td>
    <td>
<a href="?Action=orderlist&AddTime=<%=Rs("AddDate")%>">�鿴��ϸ</a><br />
<a href="javascript:;"  onclick="$(function () { confirm('ȷ��Ҫ�ѵ�������Ϊ <%=Rs("AddDate")%> �����û��ȷ�ϵĶ���ȫ��ȷ��Ϊ�ɹ�״̬��?', '', function (isConfirm) {if (isConfirm) {gotoUrl('../../AdminUser.aspx?Action=ordermodifysave&AddTime=<%=Rs("AddDate")%>')}}, {confirmButtonText: 'ȷ��', cancelButtonText: 'ȡ��', width: 400});});">ȷ�ϴ���δȷ�϶���</a>
	</td>
  </tr>
<%
Rs2.Close
Mypagesize=Mypagesize-1
Rs.MoveNext
Wend
Rs.Close
%>

<tr>
<td colspan="8">
������ͳ�Ƶ��Ǽ�ʱȷ�ϻ��Ѿ�ȷ�ϳɹ��Ķ���
�������ȴ�ȷ�ϻ�ȷ��ʧ�ܵĶ���
</td>
</tr>
</table>

<%
Call ShowPage(TotalRs,TotalPage,Page,PageUrl,Px)
%>
