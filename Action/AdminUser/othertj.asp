<%
'�˷�������ϵͳ Sql��
'����QQ��178575
'����EMail��yliangcf@163.com
'������վ��http://www.qqcf.com
'��ϸ��飺http://www.qqcf.com/cfwztg.htm
'�����г���������ʾ����װ��ʾ��ʹ�����ѽ�����°汾���ص�����
'��Ϊ��Щ���ݿ���ʱ�����£���û�з��ڳ�������Լ�����վ�鿴
%>

<div class="tabs_header">
<ul class="tabs">
<li <%If Action="othertj" Then Response.write " class='active'"%>><a href="?Action=othertj"><span>����ͳ��</span></a></li>
<li <%If Action="lowuniondaytjbyusername" Then Response.write " class='active'"%>><a href="?Action=lowuniondaytjbyusername"><span>���ع����ͳ��(�û���)</span></a></li>
<li <%If Action="lowuniondaytjbyuserid" Then Response.write " class='active'"%>><a href="?Action=lowuniondaytjbyuserid"><span>���ع����ͳ��(�û�ID)</span></a></li>
</ul>
</div>

<%
Px=ChkStr(Request("Px"),1):If Px="" Then  Px="Click_Counter"
UserName=ChkStr(Request("UserName"),1)
Ad_ID=ChkStr(Request("Ad_ID"),2)
OtherClass=ChkStr(Request("OtherClass"),1)
AddDate=ChkStr(Request("AddDate"),3):If AddDate="" Then AddDate=CStr(Date)
%>

<script>
$(function(){

$("#search").click(function(){
 var searchurl ="?Action=<%=Action%>&AddDate=<%=AddDate%>"
 searchurl += '&AddDate=' + $('#AddDate').val();
 searchurl += '&UserName=' + $('#UserName').val();
 searchurl += '&Ad_ID=' + $('#Ad_ID').val();
 searchurl += '&OtherClass=' + $('#OtherClass').val();

 location.href=searchurl;
});

});
</script>

<table style="margin-top:10px;margin-bottom:10px;">
  <tr>
      <td>
<select id='AddDate' name='AddDate'>
<option value="">��ѡ���ѯ����</option>
<%Sql="Select AddDate From CFWztg_Other_Day Group By AddDate Order By AddDate Desc"
Set Rs = Server.CreateObject("Adodb.Recordset")
Rs.open Sql,Conn,1,1
While Not Rs.Eof
DateSelStr=DateSelStr&"<option value='"&Rs("AddDate")&"'"
If CDate(AddDate)=Rs("AddDate") Then DateSelStr=DateSelStr&" selected":DateSel=1
DateSelStr=DateSelStr&">"&Rs("AddDate")&"</option>"
Rs.MoveNext
Wend
Rs.Close
If DateSel<>1 Then Response.write "<option value='"&Date&"' selected>"&Date&"</option>"&DateSelStr Else Response.write DateSelStr 
%>
          </select>
 </td>         

      <td>��վ����</td>
      <td><input name="UserName" type="text" id="UserName" value="<%=UserName%>" size="10"></td>

      <td class="td_r">���ID��</td>
      <td><select id='Ad_ID' name="Ad_ID">

<option value="">��ѡ����</option>
          <%
Sql="Select min(b.AdName) as AdName,a.Ad_ID From CFWztg_Other_Day a inner join cfwztg_ad b on a.ad_id=b.id Group By a.Ad_ID Order By a.Ad_ID Desc"
Set Rs = Server.CreateObject("Adodb.Recordset")
Rs.open Sql,Conn,1,1
While Not Rs.Eof
 Response.Write "<option value='"&Rs("Ad_ID")&"'"
 If Ad_ID=Cstr(Rs("Ad_ID")) Then Response.Write " selected"
 Response.Write ">"&Rs("AdName")&"["&Rs("Ad_ID")&"]</option>"
Rs.MoveNext
Wend
%></select></td>

      <td class="td_r">���ࣺ</td>
      <td><Select  name="OtherClass" id="OtherClass">
          <option value="">��ѡ�����</option>
          <%
Sql="Select OtherClass From CFWztg_Other_Day Group By OtherClass Order By OtherClass Desc"
Set Rs = Server.CreateObject("Adodb.Recordset")
Rs.open Sql,Conn,1,1
While Not Rs.Eof
 Response.Write "<option value='"&Rs("OtherClass")&"'"
 If OtherClass=Cstr(Rs("OtherClass")) Then Response.Write " selected"
 Response.Write ">"&Rs("OtherClass")&"</option>"
Rs.MoveNext
Wend
%>
        </select></td>


      <td><input type="submit" name="search"  id="search" value="��ѯ" class="btn btn-sm btn-primary"></td>
    </tr>
	
</table>



  
<%


PageUrl = "?Action="&Action&"&Ad_ID="&Ad_ID&"&UserName="&UserName&"&OtherClass="&OtherClass&"&AddDate="&AddDate

Call PxFilter(Px,"ID,Ad_ID,UserName,OtherClass,OtherFlag,ClickPv_Counter,ClickUv_Counter,Click_Counter,AddTime,LastTime,Ly,Ly_2")

Sql="Select Top 2000 a.Ad_ID,a.UserName,a.OtherClass,a.OtherFlag,a.ClickPv_Counter,a.ClickUv_Counter,a.Click_Counter,a.ClickPv_2_Counter,a.ClickUv_2_Counter,a.Click_2_Counter,a.AddTime,a.LastTime,a.Ly,a.Ly_2 From CFWztg_Other_Day a inner join cfwztg_ad b on a.ad_id=b.id Where 1=1"

If UserName<>"" Then Sql=Sql&" And a.UserName='"&UserName&"'"

If Ad_ID<>"" Then Sql=Sql&" And a.Ad_ID="&Ad_ID
If OtherClass<>"" Then Sql=Sql&" And a.OtherClass='"&OtherClass&"'"
If AddDate<>"" Then Sql=Sql&" And a.AddDate='"&AddDate&"'"
 
Sql=Sql & " Order By a."&Px&" Desc"

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


<table class="tb_2">

<td>
<div class="explain">
�б���ע������Ϊ��ʾ���������ʵ��δ�۵�����֣�������Ϊ��ʾ����վ���Ŀ۹���������</div>
</td>
</tr>
</table>



<table class="tb_1">

  <tr class="tr_1">
	<td><a href="<%=PageUrl%>&Px=UserName">��վ��</a></td>
	<td><a href="<%=PageUrl%>&Px=Ad_ID">���ID</a></td>
	<td><a href="<%=PageUrl%>&Px=OtherClass">����</a></td>
	<td><a href="<%=PageUrl%>&Px=OtherFlag">��ʶ</a></td>
    <td><a href="<%=PageUrl%>&Px=ClickPv_Counter">���PV</a></td>
    <td><a href="<%=PageUrl%>&Px=ClickUv_Counter">���UV</a></td>
    <td><a href="<%=PageUrl%>&Px=Click_Counter">���IP</a></td>
	<td><a href="<%=PageUrl%>&Px=LastTime">���ʱ��</a></td>


  </tr>
<%
While Not Rs.Eof And MyPageSize>0
%>
  <tr> 
	<td><%=Rs("UserName")%></td>
	<td><%=Rs("Ad_ID")%></td>
	<td><%=Rs("OtherClass")%></td>
	<td><%=Rs("OtherFlag")%></td>

    <td><%=Rs("ClickPv_Counter")%>(<%=Rs("ClickPv_2_Counter")%>)</td>
    <td><%=Rs("ClickUv_Counter")%>(<%=Rs("ClickUv_2_Counter")%>)</td>
    <td><%=Rs("Click_Counter")%>(<%=Rs("Click_2_Counter")%>)</td>	
	
	<td><%=GetTurnTime(Hour(Rs("LastTime")))&":"&GetTurnTime(Minute(Rs("LastTime")))&":"&GetTurnTime(Second(Rs("LastTime")))%></td>
  </tr>
  
<%If Rs("Ly")<>"" Then%>
  <tr>
    <td colspan="9"><a href="<%=PageUrl%>&Px=Ly">���ҳ��</a><%
 Response.Write "<a href='"&Rs("Ly")&"' target='_blank'>"&server.HTMLEncode(Rs("Ly"))&"</a>"
%></td>
  </tr>
<%End If%>

<%If Rs("Ly_2")<>"" Then%>
  <tr>
    <td colspan="9"><a href="<%=PageUrl%>&Px=Ly_2">��Դҳ��</a><%
 Response.Write "<a href='"&Rs("Ly_2")&"' target='_blank'>"&server.HTMLEncode(Rs("Ly_2"))&"</a>"
%></td>
  </tr>
<%End If%>

  <tr>
    <td colspan="9" style="border-bottom: 1px dotted #FF0000;empty-cells:show;"><a href="<%=PageUrl%>&Px=AddTime">��ʼʱ�䣺</a><%=GetTurnTime(Hour(Rs("AddTime")))&":"&GetTurnTime(Minute(Rs("AddTime")))&":"&GetTurnTime(Second(Rs("AddTime")))%></td>
  </tr>
  
  <%
Mypagesize=Mypagesize-1
Rs.MoveNext
Wend
Rs.Close
%>

</table>



<%
Call ShowPage(TotalRs,TotalPage,Page,PageUrl,Px)
%>