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
  <td colspan="2">����ѯ</td>
</tr>

<%If Ad_Class=1 Or Ad_Class=2 Or Ad_Class=3 Or Ad_Class=4 Or Ad_Class=7 Then%> 
<TR>
<TD class="td_r" style="width:120px">�Ʒѷ�ʽ��</TD>
<TD>
<label class='lyear-radio radio-primary m-t-10'>
<input name="ClickState" type="radio" value="0"
<%
Response.write " onclick=""location.href='?Action="&action&"&ad_class="&ad_class&"&ClickState=0#adnav'"""
If ClickState=0 Then Response.write " checked"%>><span>ȫ���Ʒ�
<%
 Sql="Select count(1) From CFWztg_AD a inner join CFWztg_Plan b on a.Plan_ID=b.ID where a.AdState=2 And b.PlanState=2 And a.AdListShowState=1"
 If Ad_Class<>0 Then  Sql=Sql&" And a.Ad_Class=" & Abs(Ad_Class)
 If Ad_Class=-4 Or Ad_Class=-7 Then  Sql=Sql&" and a.CycState=1"
 Set Rs=Conn.Execute(Sql)
 Response.write "[��"&Rs(0)&"�����]"
 Rs.Close
%></span></label>

<label class='lyear-radio radio-primary m-t-10'>
<input name="ClickState" type="radio" value="1"
<%
Response.write " onclick=""location.href='?Action="&action&"&ad_class="&ad_class&"&ClickState=1#adnav'"""
If ClickState=1 Then Response.write " checked"%>><span>����Ʒ�(CPC)
<%
 Sql="Select count(1) From CFWztg_AD a inner join CFWztg_Plan b on a.Plan_ID=b.ID where a.AdState=2 And b.PlanState=2 And a.ClickState=1 And a.AdListShowState=1"
 If Ad_Class<>0 Then  Sql=Sql&" And a.Ad_Class=" & Abs(Ad_Class)
 If Ad_Class=-4 Or Ad_Class=-7 Then  Sql=Sql&" and a.CycState=1"
 Set Rs=Conn.Execute(Sql)
 Response.write "[��"&Rs(0)&"�����]"
 Rs.Close
%></span></label>

<%If Ad_Class=0 Or Ad_Class=3 Or Abs(Ad_Class)=4 Or Ad_Class=5 Or Ad_Class=6 Or Abs(Ad_Class)=7 Or Ad_Class=8 Or Ad_Class=9 Or Ad_Class=10 Or Ad_Class=11 Then%>
<label class='lyear-radio radio-primary m-t-10'>
<input name="ClickState" type="radio" value="2"<%
Response.write " onclick=""location.href='?Action="&action&"&ad_class="&ad_class&"&ClickState=2#adnav'"""
If ClickState=2 Then Response.write " checked"%>><span>��ʾ�Ʒ�(CPV)
<%
 Sql="Select count(1) From CFWztg_AD a inner join CFWztg_Plan b on a.Plan_ID=b.ID where a.AdState=2 And b.PlanState=2 And a.ClickState=2 And a.AdListShowState=1"
 If Ad_Class<>0 Then  Sql=Sql&" And a.Ad_Class=" & Abs(Ad_Class)
 If Ad_Class=-4 Or Ad_Class=-7 Then  Sql=Sql&" and a.CycState=1"
 Set Rs=Conn.Execute(Sql)
 Response.write "[��"&Rs(0)&"�����]"
 Rs.Close
%></span></label>
<%End If%>

<label class='lyear-radio radio-primary m-t-10'>
<input name="ClickState" type="radio" value="3"<%
Response.write " onclick=""location.href='?Action="&action&"&ad_class="&ad_class&"&ClickState=3#adnav'"""
If ClickState=3 Then Response.write " checked"%>><span>ע��Ʒ�(CPA)
<%
 Sql="Select count(1) From CFWztg_AD a inner join CFWztg_Plan b on a.Plan_ID=b.ID where a.AdState=2 And b.PlanState=2 And a.ClickState=3 And a.AdListShowState=1"
 If Ad_Class<>0 Then  Sql=Sql&" And a.Ad_Class=" & Abs(Ad_Class)
 If Ad_Class=-4 Or Ad_Class=-7 Then  Sql=Sql&" and a.CycState=1"
 Set Rs=Conn.Execute(Sql)
 Response.write "[��"&Rs(0)&"�����]"
 Rs.Close
%></span></label>

<label class='lyear-radio radio-inline radio-primary'>
<input name="ClickState" type="radio" value="4"<%
Response.write " onclick=""location.href='?Action="&action&"&ad_class="&ad_class&"&ClickState=4#adnav'"""
If ClickState=4 Then Response.write " checked"%>><span>�����Ʒ�(CPS)
<%
 Sql="Select count(1) From CFWztg_AD a inner join CFWztg_Plan b on a.Plan_ID=b.ID where a.AdState=2 And b.PlanState=2 And a.ClickState=4 And a.AdListShowState=1"
 If Ad_Class<>0 Then  Sql=Sql&" And a.Ad_Class=" & Abs(Ad_Class)
 If Ad_Class=-4 Or Ad_Class=-7 Then  Sql=Sql&" and a.CycState=1"
 Set Rs=Conn.Execute(Sql)
 Response.write "[��"&Rs(0)&"�����]"
 Rs.Close
%></span></label>
</TD>
  </TR>
<%End If%>


<%If Ad_Class=7 Then%>
<TR>
<TD class="td_r">��ý��Ч����</TD>
<TD>

<div>
<ul>
<li style="100%;">
<%
Response.write "<label class='lyear-radio radio-primary m-t-10'><input name='adshowtype' type='radio' value='' onclick=""location.href='?Action="&action&"&ad_class="&ad_class&"&clickstate="&clickstate&"&adshowtype=#adnav'"""
If adshowtype="" Then Response.write " checked"
Response.write "><span>ȫ��Ч��"
 Sql="Select count(1) From CFWztg_AD a inner join CFWztg_Plan b on a.Plan_ID=b.ID where a.AdState=2 And b.PlanState=2 And a.AdListShowState=1 And a.Ad_Class=" & Abs(Ad_Class)
 If Ad_Class=-4 Or Ad_Class=-7 Then  Sql=Sql&" and a.CycState=1"
 If ClickState<>0 Then Sql=Sql&" And a.ClickState=" & ClickState
 Set Rs2=Conn.Execute(Sql)
 
 Response.write "[��"&Rs2(0)&"�����]"&"</span></label></li>"
 Rs2.Close
%>
</li>
<%
Sql="Select * From CFWztg_SetContent Where SetBClassFlag='AdminTemplet' And SetSClassFlag='AdminTemplet_AdCode' And SetState=1 Order By SetTaxis"
Set Rs=Conn.Execute(Sql)

While Not Rs.Eof

 Sql="Select count(1) From CFWztg_AD a inner join CFWztg_Plan b on a.Plan_ID=b.ID where a.AdState=2 And b.PlanState=2 And a.AdListShowState=1 And a.Ad_Class=" & Abs(Ad_Class)  &" and a.AdShowType='"&Rs("SetFlag")&"'"
 If Ad_Class=-4 Or Ad_Class=-7 Then  Sql=Sql&" and a.CycState=1"
 If ClickState<>0 Then Sql=Sql&" And a.ClickState=" & ClickState
 Set Rs2=Conn.Execute(Sql)

 If Rs2(0)>0 Then'--���������й��ų���
  Response.write "<li style='width:48%;float:left;'><label class='lyear-radio radio-primary m-t-10'><input type='radio' name='adshowtype' value='"&Rs("SetFlag")&"' id='adshowtype' onclick=""location.href='?Action="&action&"&ad_class="&ad_class&"&clickstate="&clickstate&"&adshowtype="&Rs("SetFlag")&"#adnav'"""
  If adshowtype = Rs("SetFlag") Then Response.write " checked"
  Response.write "><span>"&Rs("SetDesc")


  Response.write "[��"&Rs2(0)&"�����]"&"</span></label></li>"
 End If
 Rs2.Close
Rs.MoveNext
Wend
Rs.Close
%>
</ul>
</div>
</TD>
</TR>
<%End If%>



<%If Ad_Class=3 or Abs(Ad_Class)=4 or Ad_Class=6 or Abs(Ad_Class)=7 Then%>
<TR> 
<TD class="td_r">ѡ����ߴ磺</TD>
<TD>
<li style="100%;">
<%
Response.write "<label class='lyear-radio radio-primary m-t-10'><input name='ad_size' type='radio' value='' onclick=""location.href='?Action="&action&"&ad_class="&ad_class&"&clickstate="&clickstate&"&adshowtype="&adshowtype&"&ad_size=#adnav'"""
If ad_size="" Then Response.write " checked"
Response.write "><span>ȫ���ߴ�"
 Sql="Select count(1) From CFWztg_AD a inner join CFWztg_Plan b on a.Plan_ID=b.ID where a.AdState=2 And b.PlanState=2 And a.AdListShowState=1"
 If Ad_Class<>0 Then Sql=Sql&" And a.Ad_Class=" & Abs(Ad_Class)
 If Ad_Class=-4 Or Ad_Class=-7 Then  Sql=Sql&" and a.CycState=1"
 If ClickState<>0 Then Sql=Sql&" And a.ClickState=" & ClickState
 If Abs(Ad_Class)=7 And adshowtype<>"" Then  Sql=Sql&" and a.adshowtype='"&adshowtype&"'"
 Set Rs2=Conn.Execute(Sql)
 
 Response.write "[��"&Rs2(0)&"�����]"&"</span></label></li>"
 Rs2.Close
%>
</li>

<li style="clear:both;">����</li>
<%
Sql="Select * From CFwztg_AdSize where Direction=1 Order By Direction,Width Desc,Height Desc"

Set Rs = Server.CreateObject("ADODB.Recordset")
Rs.open Sql,Conn,1,1
While Not Rs.Eof

 Sql="Select count(1) From CFWztg_AD a inner join CFWztg_Plan b on a.Plan_ID=b.ID where a.AdState=2 And b.PlanState=2 And a.AdListShowState=1 and convert(varchar,a.adwidth)+'x'+convert(varchar,a.adheight)='"&Rs("Width")&"x"&Rs("Height")&"'"
 If Ad_Class<>0 Then Sql=Sql&" And a.Ad_Class=" & Abs(Ad_Class)
 If Ad_Class=-4 Or Ad_Class=-7 Then  Sql=Sql&" and a.CycState=1"
 If ClickState<>0 Then Sql=Sql&" And a.ClickState=" & ClickState
 If Abs(Ad_Class)=7 And adshowtype<>"" Then  Sql=Sql&" and a.adshowtype='"&adshowtype&"'"

 Set Rs2=Conn.Execute(Sql)
 If Rs2(0)>0 Then
  Response.write "<li style='width:185px;float:left;'><label class='lyear-radio radio-primary m-t-10'><input type='radio' name='ad_size' value='"&Rs("Width")&"x"&Rs("Height")&"' id='ad_size' onclick=""location.href='?Action="&action&"&ad_class="&ad_class&"&clickstate="&clickstate&"&adshowtype="&adshowtype&"&ad_size="&Rs("Width")&"x"&Rs("Height")&"#adnav'"""
  If Ad_Size = Rs("Width")&"x"&Rs("Height") Then Response.write " checked"
  Response.write "><span>" & Rs("Width")&"x"&Rs("Height")
  Response.write "[��"&Rs2(0)&"�����]</span></label></li>"
 End If
 Rs2.Close

Rs.MoveNext
Wend
Rs.Close
%>
<li style="clear:both;">����</li>
<%
Sql="Select * From CFwztg_AdSize where Direction=2 Order By Direction,Width Desc,Height Desc"

Set Rs = Server.CreateObject("ADODB.Recordset")
Rs.open Sql,Conn,1,1
While Not Rs.Eof
 Sql="Select count(1) From CFWztg_AD a inner join CFWztg_Plan b on a.Plan_ID=b.ID where a.AdState=2 And b.PlanState=2 And a.AdListShowState=1 and convert(varchar,a.adwidth)+'x'+convert(varchar,a.adheight)='"&Rs("Width")&"x"&Rs("Height")&"'"
 If Ad_Class<>0 Then Sql=Sql&" And a.Ad_Class=" & Abs(Ad_Class)
 If Ad_Class=-4 Or Ad_Class=-7 Then  Sql=Sql&" and a.CycState=1"
 If ClickState<>0 Then Sql=Sql&" And a.ClickState=" & ClickState
 If Abs(Ad_Class)=7 And adshowtype<>"" Then  Sql=Sql&" and a.adshowtype='"&adshowtype&"'"
 
 Set Rs2=Conn.Execute(Sql)
 If Rs2(0)>0 Then
  Response.write "<li style='width:185px;float:left;'><label class='lyear-radio radio-primary m-t-10'><input type='radio' name='ad_size' value='"&Rs("Width")&"x"&Rs("Height")&"' id='ad_size' onclick=""location.href='?Action="&action&"&ad_class="&ad_class&"&clickstate="&clickstate&"&adshowtype="&adshowtype&"&ad_size="&Rs("Width")&"x"&Rs("Height")&"#adnav'"""
  If Ad_Size = Rs("Width")&"x"&Rs("Height") Then Response.write " checked"
  Response.write "><span>" & Rs("Width")&"x"&Rs("Height")
  Response.write "[��"&Rs2(0)&"�����]</span></label></li>"
 End If
 Rs2.Close

Rs.MoveNext
Wend
Rs.Close
%>
<li style="clear:both;">����</li>
<%
Sql="Select * From CFwztg_AdSize where Direction=3 Order By Direction,Width Desc,Height Desc"

Set Rs = Server.CreateObject("ADODB.Recordset")
Rs.open Sql,Conn,1,1
While Not Rs.Eof
 Sql="Select count(1) From CFWztg_AD a inner join CFWztg_Plan b on a.Plan_ID=b.ID where a.AdState=2 And b.PlanState=2 And a.AdListShowState=1 and convert(varchar,a.adwidth)+'x'+convert(varchar,a.adheight)='"&Rs("Width")&"x"&Rs("Height")&"'"
 If Ad_Class<>0 Then Sql=Sql&" And a.Ad_Class=" & Abs(Ad_Class)
 If Ad_Class=-4 Or Ad_Class=-7 Then  Sql=Sql&" and a.CycState=1"
 If ClickState<>0 Then Sql=Sql&" And a.ClickState=" & ClickState
 If Abs(Ad_Class)=7 And adshowtype<>"" Then  Sql=Sql&" and a.adshowtype='"&adshowtype&"'"
 
 Set Rs2=Conn.Execute(Sql)
 If Rs2(0)>0 Then
  Response.write "<li style='width:185px;float:left;'><label class='lyear-radio radio-primary m-t-10'><input type='radio' name='ad_size' value='"&Rs("Width")&"x"&Rs("Height")&"' id='ad_size' onclick=""location.href='?Action="&action&"&ad_class="&ad_class&"&clickstate="&clickstate&"&adshowtype="&adshowtype&"&ad_size="&Rs("Width")&"x"&Rs("Height")&"#adnav'"""
  If Ad_Size = Rs("Width")&"x"&Rs("Height") Then Response.write " checked"
  Response.write "><span>" & Rs("Width")&"x"&Rs("Height")
  Response.write "[��"&Rs2(0)&"�����]</span></label></li>"
 End If
 Rs2.Close

Rs.MoveNext
Wend
Rs.Close
%>
<li style="clear:both;">����</li>
<%
Sql="Select distinct convert(varchar,a.AdWidth)+'x'+convert(varchar,a.AdHeight) adx From CFWztg_AD a inner join CFWztg_Plan b on a.Plan_ID=b.ID And a.AdListShowState=1 where a.AdState=2 And b.PlanState=2"
If Ad_Class<>0 Then Sql=Sql&" And a.Ad_Class=" & Abs(Ad_Class)
If Ad_Class=-4 Or Ad_Class=-7 Then  Sql=Sql&" and a.CycState=1"
If ClickState<>0 Then Sql=Sql&" And a.ClickState=" & ClickState
If Abs(Ad_Class)=7 And adshowtype<>"" Then  Sql=Sql&" and a.adshowtype='"&adshowtype&"'"
Sql=Sql&" and convert(varchar,a.AdWidth)+'x'+convert(varchar,a.AdHeight) not in(Select convert(varchar,c.Width)+'x'+convert(varchar,c.Height) From CFwztg_AdSize c)"
 
Set Rs = Server.CreateObject("ADODB.Recordset")
Rs.open Sql,Conn,1,1
While Not Rs.Eof
 Sql="Select count(1) From CFWztg_AD a inner join CFWztg_Plan b on a.Plan_ID=b.ID where a.AdState=2 And b.PlanState=2 And a.AdListShowState=1 and convert(varchar,a.adwidth)+'x'+convert(varchar,a.adheight)='"&Rs("adx")&"'"
 If Ad_Class<>0 Then Sql=Sql&" And a.Ad_Class=" & Abs(Ad_Class)
 If Ad_Class=-4 Or Ad_Class=-7 Then  Sql=Sql&" and a.CycState=1"
 If ClickState<>0 Then Sql=Sql&" And a.ClickState=" & ClickState
 If Abs(Ad_Class)=7 And adshowtype<>"" Then  Sql=Sql&" and a.adshowtype='"&adshowtype&"'"
 
 Set Rs2=Conn.Execute(Sql)
 If Rs2(0)>0 Then
  Response.write "<li style='width:185px;float:left;'><label class='lyear-radio radio-primary m-t-10'><input type='radio' name='ad_size' value='"&Rs("adx")&"' id='ad_size' onclick=""location.href='?Action="&action&"&ad_class="&ad_class&"&clickstate="&clickstate&"&adshowtype="&adshowtype&"&ad_size="&Rs("adx")&"#adnav'"""
  If Ad_Size = Rs("adx") Then Response.write " checked"
  Response.write "><span>" & Rs("adx")
  Response.write "[��"&Rs2(0)&"�����]</span></label></li>"
 End If
 Rs2.Close

Rs.MoveNext
Wend
Rs.Close
%>

</TD>
</TR>
<%End If%>

<tr class="tr_1">
  <td colspan="2">����б�</td>
</tr>
</table>

<%
PageUrl = "?Action="&Action&"&Ad_Class="&Ad_Class&"&ClickState="&ClickState&"&Ad_Size="&Ad_Size

Set Rs = Server.CreateObject("Adodb.RecordSet")

Sql="Select a.*,b.TotalClick_Cent,b.SpareClick_Cent From CFWztg_AD a inner join CFWztg_Plan b on a.plan_id=b.id Where a.AdState=2 And a.AdListShowState=1 And a.Ad_Class=" & Ad_Class &" and b.PlanState=2"

If ClickState>0 Then Sql=Sql&" And a.ClickState="&ClickState
If AdShowType<>"" Then Sql=Sql&" And a.AdShowType='"&AdShowType&"'"

If Ad_Size<>"" Then
 Sql=Sql&" And a.AdWidth="&AdWidth
 Sql=Sql&" And a.AdHeight="&AdHeight
End If





Sql=Sql&" Order By a.ListID Desc,a.ID Desc"

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

While Not Rs.Eof And MyPageSize>0

%>
<!--#Include File="adinfo.asp"-->
<%
MyPageSize=MyPageSize-1
Rs.MoveNext
Wend
Rs.Close
%>


<%
Call ShowPage(TotalRs,TotalPage,Page,PageUrl,Px)
%>
