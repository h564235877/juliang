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
AdUserName = ChkStr(Request("AdUserName"),1)

AddTime=Goback(ChkStr(Request("AddTime"),3),"���ڲ���Ϊ��")

Sql="select lowunionusername,count(1) as ordertotal from CFWztg_AdUser_Order where AdUserName='"&AdUserName&"' And UserName='"&UserName&"' And (OrderState=1 or OrderState=3) And Datediff(d,addtime,'"&AddTime&"')=0 group by lowunionusername order by ordertotal desc"

Set Rs=Conn.execute(Sql)
While Not Rs.Eof
 If Rs("lowunionusername")<>"" Then OutStr = OutStr & AddTime&"|"&Rs("lowunionusername")&"|"&Rs("ordertotal")&chr(13)
Rs.MoveNext
Wend
%>

<a href="?Action=orderdaytj" class="actionBtn"><i class="mdi mdi-keyboard-return"></i>�����б�</a>

<table class="tb_1">
<tr> 
<td colspan="17">
<select id='AdUserName' onChange="window.location=document.getElementById('AdUserName').options[document.getElementById('AdUserName').selectedIndex].value">
<option value=?Action=<%=Action%>&AddTime=<%=AddTime%>>��ѡ������</option>
<%
Sql="Select AdUserName From CFWztg_AdUser_Order Group By AdUserName Order By AdUserName"
Set Rs = Server.CreateObject("Adodb.Recordset")
Rs.open Sql,Conn,1,1
While Not Rs.Eof
 Response.Write "<option value='?Action="&Action&"&AddTime="&AddTime&"&AdUserName="&Rs("AdUserName")&"'"
 If Request("AdUserName")=Cstr(Rs("AdUserName")) Then Response.Write " selected"
 Response.Write ">"&Rs("AdUserName")&"</option>"
Rs.MoveNext
Wend
%>
        </select></td>
  </tr> 
  
  <tr class="tr_1">   
    <td colspan="4">	
	�����:<%=AdUserName%> ����<%=AddTime%> �¼����˸����û��Ķ�������</td>
  </tr>

<tr>
<td>
<%If AdUserName<>"" Then%>
<textarea name="orderlowinfo" cols="80" rows="20">
<%=OutStr%>
</textarea>
<%Else%>
��������ѡ��һ��������󵼳��¼��������û���������
<%End If%>
</td>
  </tr>
</table>


