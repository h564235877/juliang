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
AdUserName=ChkStr(Request("AdUserName"),1)
UserName=ChkStr(Request("UserName"),1)

PageUrl = "?Action="&Action&"&AdUserName="&AdUserName&"&UserName="&UserName
%>


<table class="tb_1">
  <tr class="tr_1"> 
    <td>�ա���</td>
    <td>��ȷ����</td>
    <td>��ȷ���ܽ��</td>
    <td>��ȷ����֧��</td>
    <td>�۵㶩��</td>
    <td>�۵㶩���ܽ��</td>
    <td>�۵㶩����֧��</td>	
    <td></td>
  </tr>
<%

Sql="select convert(varchar(10),addtime,120) as adddate from CFWztg_AdUser_Order Where 1=1"

If AdUserName<>"" Then Sql=Sql&" And AdUserName='"&AdUserName&"'"
If UserName<>"" Then Sql=Sql&" And UserName='"&UserName&"'"

Sql=Sql&" group by convert(varchar(10),addtime,120) Order By AddDate Desc"

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
%>

<%
While Not Rs.Eof And MyPageSize>0

Sql="select count(1) as ordernum,IsNull(sum(ordercent),0) as ordercent,IsNull(sum(ordercent * ordertcrate/100),0) as tccent from CFWztg_AdUser_Order Where 1=1"

If AdUserName<>"" Then Sql=Sql&" And AdUserName='"&AdUserName&"'"
If UserName<>"" Then Sql=Sql&" And UserName='"&UserName&"'"
 
Sql=Sql&"  and Datediff(d,'"&Rs("AddDate")&"',AddTime)=0 And (OrderState=1 or OrderState=3 or OrderState=5 or OrderState=7)"

Set Rs2=Conn.Execute(Sql)


Sql="select count(1) as ordernum,IsNull(sum(ordercent),0) as ordercent,IsNull(sum(ordercent * ordertcrate/100),0) as tccent from CFWztg_AdUser_Order Where 1=1"

If AdUserName<>"" Then Sql=Sql&" And AdUserName='"&AdUserName&"'"
If UserName<>"" Then Sql=Sql&" And UserName='"&UserName&"'"

Sql=Sql&"  and Datediff(d,'"&Rs("AddDate")&"',AddTime)=0 And (OrderState=5 or OrderState=7)"

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
    <td><a href="?Action=orderlist&AdUserName=<%=Rs("AdUserName")%>&AddTime=<%=Rs("AddDate")%>" class="btn_add"><i class="mdi mdi-eye"></i> �鿴</a></td>
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
�������ȴ�ȷ�ϻ�ȷ��ʧ�ܵĶ���</td>
</tr>
</table>

<%
Call ShowPage(TotalRs,TotalPage,Page,PageUrl,Px)
%>


<script>
$(function(){

$("#search").click(function(){
 var searchurl ="?Action=<%=Action%>";
 searchurl += '&AdUserName=' + $('#AdUserName').val();
 searchurl += '&UserName=' + $('#UserName').val();

 location.href=searchurl;
});

});
</script>

<table class="tb_3"><tr class="tr_1"> 
<td colspan="2">��ѯ</td>
<tr>
<td class="td_r">�������</td>
<td><select name="AdUserName" id='AdUserName'>
<option value="">ȫ�������</option>
<%
Sql="Select AdUserName From CFWztg_AdUser_Order Group By AdUserName Order By AdUserName"
Set Rs = Server.CreateObject("Adodb.Recordset")
Rs.open Sql,Conn,1,1
While Not Rs.Eof
 Response.Write "<option value='"&Rs("AdUserName")&"'"
 If Request("AdUserName")=Cstr(Rs("AdUserName")) Then Response.Write " selected"
 Response.Write ">"&Rs("AdUserName")&"</option>"
Rs.MoveNext
Wend
%>
</select></td></tr>

<tr>
<td class="td_r">�������Ƽ��ˣ�</td>
<td><input name="UserName" type="text" id="UserName" value="<%=UserName%>" size="20"></td></tr>

<tr>
<td>&nbsp;</td>
<td><input type="submit" name="submit" value="��ѯ" class="btn btn-sm btn-primary" id="search"></td></tr>
</table>
