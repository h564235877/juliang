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
Ad_Class=CInt(ChkStr(Request("Ad_Class"),2))
Px = ChkStr(Request("Px"),1):If Px="" Then Px="addtime"
If Request("ClickState")="" Then ClickState=0 Else ClickState=ChkStr(Request("ClickState"),2)
AdShowType = ChkStr(Request("AdShowType"),1)

ad_size=ChkStr(Request("ad_size"),1)
If Ad_Size<>"" Then
 AdWidth=ChkStr(Left(Ad_Size,Instr(Ad_Size,"x")-1),2)
 AdHeight=ChkStr(Mid(Ad_Size,Instr(Ad_Size,"x")+1),2)
End If

PageUrl = "?Action="&Action&"&Ad_Class="&Ad_Class&"&ClickState="&ClickState&"&AdShowType="&AdShowType&"&ad_size="&ad_size

Call PxFilter(Px,"ID,AdUserName,Plan_ID,Ad_Class,Unit_Cent_First,OverClick_Cent,AdDeDuct_Rate,AdListShowState,Weight,CycState,ClickState,AddTime")
%>

<table class="tb_2">
<tr>
<td><span class="title">�Ѿ�ͨ����˵Ĺ��<a name="adnav" id="adnav"></a></span></td>
</tr>
</table>

<table class="tb_1">
<tr class="tr_1"> 
<td colspan="2">����(���ϵ���ѡ��)</td>
</tr>
<TR>
<TD class="td_r" style="width:9%">ѡ�������ͣ�</TD>
<td>
<%
Sql="SELECT "
Sql=Sql&"(SELECT Count(1) FROM CFWztg_AD a inner join CFWztg_Plan b on a.Plan_ID=b.ID where a.AdState=2 And b.PlanState=2 And a.AdUserName='"&AdUserName&"') adclass_0,"
Sql=Sql&"(SELECT Count(1) FROM CFWztg_AD a inner join CFWztg_Plan b on a.Plan_ID=b.ID where a.AdState=2 And b.PlanState=2 And a.Ad_Class=1 And a.AdUserName='"&AdUserName&"') adclass_1,"
Sql=Sql&"(SELECT Count(1) FROM CFWztg_AD a inner join CFWztg_Plan b on a.Plan_ID=b.ID where a.AdState=2 And b.PlanState=2 And a.Ad_Class=2 And a.AdUserName='"&AdUserName&"') adclass_2,"
Sql=Sql&"(SELECT Count(1) FROM CFWztg_AD a inner join CFWztg_Plan b on a.Plan_ID=b.ID where a.AdState=2 And b.PlanState=2 And a.Ad_Class=3 And a.AdUserName='"&AdUserName&"') adclass_3,"
Sql=Sql&"(SELECT Count(1) FROM CFWztg_AD a inner join CFWztg_Plan b on a.Plan_ID=b.ID where a.AdState=2 And b.PlanState=2 And a.Ad_Class=4 And a.AdUserName='"&AdUserName&"') adclass_4,"
Sql=Sql&"(SELECT Count(1) FROM CFWztg_AD a inner join CFWztg_Plan b on a.Plan_ID=b.ID where a.AdState=2 And b.PlanState=2 And a.Ad_Class=5 And a.AdUserName='"&AdUserName&"') adclass_5,"
Sql=Sql&"(SELECT Count(1) FROM CFWztg_AD a inner join CFWztg_Plan b on a.Plan_ID=b.ID where a.AdState=2 And b.PlanState=2 And a.Ad_Class=6 And a.AdUserName='"&AdUserName&"') adclass_6,"
Sql=Sql&"(SELECT Count(1) FROM CFWztg_AD a inner join CFWztg_Plan b on a.Plan_ID=b.ID where a.AdState=2 And b.PlanState=2 And a.Ad_Class=7 And a.AdUserName='"&AdUserName&"') adclass_7,"
Sql=Sql&"(SELECT Count(1) FROM CFWztg_AD a inner join CFWztg_Plan b on a.Plan_ID=b.ID where a.AdState=2 And b.PlanState=2 And a.Ad_Class=8 And a.AdUserName='"&AdUserName&"') adclass_8,"
Sql=Sql&"(SELECT Count(1) FROM CFWztg_AD a inner join CFWztg_Plan b on a.Plan_ID=b.ID where a.AdState=2 And b.PlanState=2 And a.Ad_Class=9 And a.AdUserName='"&AdUserName&"') adclass_9,"
Sql=Sql&"(SELECT Count(1) FROM CFWztg_AD a inner join CFWztg_Plan b on a.Plan_ID=b.ID where a.AdState=2 And b.PlanState=2 And a.Ad_Class=10 And a.AdUserName='"&AdUserName&"') adclass_10,"
Sql=Sql&"(SELECT Count(1) FROM CFWztg_AD a inner join CFWztg_Plan b on a.Plan_ID=b.ID where a.AdState=2 And b.PlanState=2 And a.Ad_Class=11 And a.AdUserName='"&AdUserName&"') adclass_11,"
Sql=Sql&"(SELECT Count(1) FROM CFWztg_AD a inner join CFWztg_Plan b on a.Plan_ID=b.ID where a.AdState=2 And b.PlanState=2 And a.Ad_Class=12 And a.AdUserName='"&AdUserName&"') adclass_12,"
Sql=Sql&"(SELECT Count(1) FROM CFWztg_AgentAd Where 1=1) adclass_f0,"
Sql=Sql&"(SELECT Count(1) FROM CFWztg_AD a inner join CFWztg_Plan b on a.Plan_ID=b.ID where a.AdState=2 And b.PlanState=2 And a.Ad_Class=1 And a.CycState>0 And a.AdUserName='"&AdUserName&"') adclass_f1,"
Sql=Sql&"(SELECT Count(1) FROM CFWztg_AD a inner join CFWztg_Plan b on a.Plan_ID=b.ID where a.AdState=2 And b.PlanState=2 And a.Ad_Class=4 And a.CycState>0 And a.AdUserName='"&AdUserName&"') adclass_f4,"
Sql=Sql&"(SELECT Count(1) FROM CFWztg_AD a inner join CFWztg_Plan b on a.Plan_ID=b.ID where a.AdState=2 And b.PlanState=2 And a.Ad_Class=7 And a.CycState>0 And a.AdUserName='"&AdUserName&"') adclass_f7"

Set Rs=Conn.Execute(Sql)
%>
<li style="float:left;">
<input name="ad_class" type="radio" value="0"
<%
Response.write " onclick=""location.href='?Action="&action&"&Px=addtime#adnav'"""
If Ad_Class=0 Then Response.write " checked"%>>ȫ���������
<%
 Response.write "[��"&Rs("adclass_0")&"�����]"&"</li>"
%>
</li>

<li style="width:100%;clear:both;"></li>

<li style="width:175px;float:left;">
<input name="ad_class" type="radio" value="-7"
<%
Response.write " onclick=""location.href='?Action="&action&"&Ad_Class=-7#adnav'"""
If Ad_Class=-7 Then Response.write " checked"%>>��ѭ��ý��
<%
 Response.write "[��"&Rs("AdClass_f7")&"�����]"&"</li>"
%>
</li>

<li style="width:175px;float:left;">
<input name="ad_class" type="radio" value="-1"
<%
Response.write " onclick=""location.href='?Action="&action&"&Ad_Class=-1#adnav'"""
If Ad_Class=-1 Then Response.write " checked"%>>��ѭֱ��
<%
 Response.write "[��"&Rs("AdClass_f1")&"�����]"&"</li>"
%>
</li>

<li style="width:175px;float:left;">
<input name="ad_class" type="radio" value="-4"
<%
Response.write " onclick=""location.href='?Action="&action&"&Ad_Class=-4#adnav'"""
If Ad_Class=-4 Then Response.write " checked"%>>��ѭͼƬ
<%
 Response.write "[��"&Rs("AdClass_f4")&"�����]"&"</li>"
%>
</li>

<li style="width:175px;float:left;">
<input name="ad_class" type="radio" value="8"
<%
Response.write " onclick=""location.href='?Action="&action&"&Ad_Class=8#adnav'"""
If Ad_Class=8 Then Response.write " checked"%>>��ѭǿ��
<%
 Response.write "[��"&Rs("AdClass_8")&"�����]"&"</li>"
%>
</li>


<li style="width:175px;float:left;">
<input name="ad_class" type="radio" value="9"
<%
Response.write " onclick=""location.href='?Action="&action&"&Ad_Class=9#adnav'"""
If Ad_Class=9 Then Response.write " checked"%>>��ѭǿ��
<%
 Response.write "[��"&Rs("AdClass_9")&"�����]"&"</li>"
%>
</li>

<li style="clear:both;"></li>

<li style="width:175px;float:left;">
<input name="ad_class" type="radio" value="11"
<%
Response.write " onclick=""location.href='?Action="&action&"&Ad_Class=11#adnav'"""
If Ad_Class=11 Then Response.write " checked"%>>��ϸ�ý��
<%
 Response.write "[��"&Rs("AdClass_11")&"�����]"&"</li>"
%>
</li>

<li style="width:175px;float:left;">
<input name="ad_class" type="radio" value="5"
<%
Response.write " onclick=""location.href='?Action="&action&"&Ad_Class=5#adnav'"""
If Ad_Class=5 Then Response.write " checked"%>>�������
<%
 Response.write "[��"&Rs("AdClass_5")&"�����]"&"</li>"
%>
</li>

<li style="width:175px;float:left;">
<input name="ad_class" type="radio" value="6"
<%
Response.write " onclick=""location.href='?Action="&action&"&Ad_Class=6#adnav'"""
If Ad_Class=6 Then Response.write " checked"%>>���ͼƬ
<%
 Response.write "[��"&Rs("AdClass_6")&"�����]"&"</li>"
%>
</li>

<li style="width:175px;float:left;">
<input name="ad_class" type="radio" value="10"
<%
Response.write " onclick=""location.href='?Action="&action&"&Ad_Class=10#adnav'"""
If Ad_Class=10 Then Response.write " checked"%>>��ϱ�ǩ��
<%
 Response.write "[��"&Rs("AdClass_10")&"�����]"&"</li>"
%>
</li>

<li style="clear:both;"></li>

<li style="width:175px;float:left;">
<input name="ad_class" type="radio" value="1"
<%
Response.write " onclick=""location.href='?Action="&action&"&Ad_Class=1#adnav'"""
If Ad_Class=1 Then Response.write " checked"%>>ֱ�����
<%
 Response.write "[��"&Rs("AdClass_1")&"�����]"&"</li>"
%>
</li>

<li style="width:175px;float:left;">
<input name="ad_class" type="radio" value="2"
<%
Response.write " onclick=""location.href='?Action="&action&"&Ad_Class=2#adnav'"""
If Ad_Class=2 Then Response.write " checked"%>>ֱͼ���
<%
 Response.write "[��"&Rs("AdClass_2")&"�����]"&"</li>"
%>
</li>

<li style="width:175px;float:left;">
<input name="ad_class" type="radio" value="3"
<%
Response.write " onclick=""location.href='?Action="&action&"&Ad_Class=3#adnav'"""
If Ad_Class=3 Then Response.write " checked"%>>��ͨ����
<%
 Response.write "[��"&Rs("AdClass_3")&"�����]"&"</li>"
%>
</li>

<li style="width:175px;float:left;">
<input name="ad_class" type="radio" value="4"
<%
Response.write " onclick=""location.href='?Action="&action&"&Ad_Class=4#adnav'"""
If Ad_Class=4 Then Response.write " checked"%>>��ͨͼƬ
<%
 Response.write "[��"&Rs("AdClass_4")&"�����]"&"</li>"
%>
</li>

<li style="width:175px;float:left;">
<input name="ad_class" type="radio" value="7"
<%
Response.write " onclick=""location.href='?Action="&action&"&Ad_Class=7#adnav'"""
If Ad_Class=7 Then Response.write " checked"%>>��ý��
<%
 Response.write "[��"&Rs("AdClass_7")&"�����]"&"</li>"
%>
</li>

<li style="width:175px;float:left;">
<input name="ad_class" type="radio" value="12"
<%
Response.write " onclick=""location.href='?Action="&action&"&Ad_Class=12#adnav'"""
If Ad_Class=12 Then Response.write " checked"%>>������ذ�װ
<%
 Response.write "[��"&Rs("AdClass_12")&"�����]"&"</li>"
%>
</li>
</td>
</tr>

  <TR>
    <TD class="td_r">ѡ��Ʒѷ�ʽ��</TD>
    <TD>
<input name="clickstate" type="radio" value="0"
<%
Response.write " onclick=""location.href='?Action="&action&"&ad_class="&ad_class&"&clickstate=0#adnav'"""
If clickstate=0 Then Response.write " checked"%>>ȫ���Ʒ�
<%
 Sql="Select count(1) From CFWztg_AD a inner join CFWztg_Plan b on a.Plan_ID=b.ID where a.AdState=2 And b.PlanState=2 And a.AdUserName='"&AdUserName&"'"
 If Ad_Class<>0 Then  Sql=Sql&" And a.Ad_Class=" & Abs(Ad_Class)
 If Ad_Class=-4 Or Ad_Class=-7 Then  Sql=Sql&" and a.CycState=1"
 Set Rs=Conn.Execute(Sql)
 Response.write "[��"&Rs(0)&"�����]"&"</li>"
 Rs.Close
%>

<input name="clickstate" type="radio" value="1"
<%
Response.write " onclick=""location.href='?Action="&action&"&ad_class="&ad_class&"&clickstate=1#adnav'"""
If clickstate=1 Then Response.write " checked"%>>����Ʒ�(CPC)
<%
 Sql="Select count(1) From CFWztg_AD a inner join CFWztg_Plan b on a.Plan_ID=b.ID where a.AdState=2 And b.PlanState=2 And a.AdUserName='"&AdUserName&"' And a.ClickState=1"
 If Ad_Class<>0 Then  Sql=Sql&" And a.Ad_Class=" & Abs(Ad_Class)
 If Ad_Class=-4 Or Ad_Class=-7 Then  Sql=Sql&" and a.CycState=1"
 Set Rs=Conn.Execute(Sql)
 Response.write "[��"&Rs(0)&"�����]"&"</li>"
 Rs.Close
%>

<%If Ad_Class=0 Or Ad_Class=3 Or Abs(Ad_Class)=4 Or Ad_Class=5 Or Ad_Class=6 Or Abs(Ad_Class)=7 Or Ad_Class=8 Or Ad_Class=9 Or Ad_Class=10 Or Ad_Class=11 Then%>
<input name="clickstate" type="radio" value="2"<%
Response.write " onclick=""location.href='?Action="&action&"&ad_class="&ad_class&"&clickstate=2#adnav'"""
If clickstate=2 Then Response.write " checked"%>>��ʾ�Ʒ�(CPV)
<%
 Sql="Select count(1) From CFWztg_AD a inner join CFWztg_Plan b on a.Plan_ID=b.ID where a.AdState=2 And b.PlanState=2 And a.AdUserName='"&AdUserName&"' And a.ClickState=2"
 If Ad_Class<>0 Then  Sql=Sql&" And a.Ad_Class=" & Abs(Ad_Class)
 If Ad_Class=-4 Or Ad_Class=-7 Then  Sql=Sql&" and a.CycState=1"
 Set Rs=Conn.Execute(Sql)
 Response.write "[��"&Rs(0)&"�����]"&"</li>"
 Rs.Close
%>
<%End If%>

<input name="clickstate" type="radio" value="3"<%
Response.write " onclick=""location.href='?Action="&action&"&ad_class="&ad_class&"&clickstate=3#adnav'"""
If clickstate=3 Then Response.write " checked"%>>ע��Ʒ�(CPA)
<%
 Sql="Select count(1) From CFWztg_AD a inner join CFWztg_Plan b on a.Plan_ID=b.ID where a.AdState=2 And b.PlanState=2 And a.AdUserName='"&AdUserName&"' And a.ClickState=3"
 If Ad_Class<>0 Then  Sql=Sql&" And a.Ad_Class=" & Abs(Ad_Class)
 If Ad_Class=-4 Or Ad_Class=-7 Then  Sql=Sql&" and a.CycState=1"
 Set Rs=Conn.Execute(Sql)
 Response.write "[��"&Rs(0)&"�����]"&"</li>"
 Rs.Close
%>

<input name="clickstate" type="radio" value="4"<%
Response.write " onclick=""location.href='?Action="&action&"&ad_class="&ad_class&"&clickstate=4#adnav'"""
If clickstate=4 Then Response.write " checked"%>>�����Ʒ�(CPS)
<%
 Sql="Select count(1) From CFWztg_AD a inner join CFWztg_Plan b on a.Plan_ID=b.ID where a.AdState=2 And b.PlanState=2 And a.AdUserName='"&AdUserName&"' And a.ClickState=4"
 If Ad_Class<>0 Then  Sql=Sql&" And a.Ad_Class=" & Abs(Ad_Class)
 If Ad_Class=-4 Or Ad_Class=-7 Then  Sql=Sql&" and a.CycState=1"
 Set Rs=Conn.Execute(Sql)
 Response.write "[��"&Rs(0)&"�����]"&"</li>"
 Rs.Close
%>
</TD>
  </TR>
 

<%If Abs(Ad_Class)=7 Then%>
<TR>
<TD class="td_r">ѡ��ý��Ч����</TD>
<TD>

<div style="width:548px;">
<ul>
<li style="100%;">
<%
Response.write "<input name='adshowtype' type='radio' value='' onclick=""location.href='?Action="&action&"&ad_class="&ad_class&"&clickstate="&clickstate&"&adshowtype=#adnav'"""
If adshowtype="" Then Response.write " checked"
Response.write ">ȫ��Ч��"
 Sql="Select count(1) From CFWztg_AD a inner join CFWztg_Plan b on a.Plan_ID=b.ID where a.AdState=2 And b.PlanState=2 And a.AdUserName='"&AdUserName&"' And a.Ad_Class=" & Abs(Ad_Class)
 If Ad_Class=-4 Or Ad_Class=-7 Then  Sql=Sql&" and a.CycState=1"
 If ClickState<>0 Then Sql=Sql&" And a.ClickState=" & ClickState
 Set Rs2=Conn.Execute(Sql)
 
 Response.write "[��"&Rs2(0)&"�����]"&"</li>"
 Rs2.Close
%>
</li>
<%
Sql="Select * From CFWztg_SetContent Where SetBClassFlag='AdminTemplet' And SetSClassFlag='AdminTemplet_AdCode' And SetState=1 Order By SetTaxis"
Set Rs=Conn.Execute(Sql)

While Not Rs.Eof

 Sql="Select count(1) From CFWztg_AD a inner join CFWztg_Plan b on a.Plan_ID=b.ID where a.AdState=2 And b.PlanState=2 And a.AdUserName='"&AdUserName&"' And a.Ad_Class=" & Abs(Ad_Class)  &" and a.AdShowType='"&Rs("SetFlag")&"'"
 If Ad_Class=-4 Or Ad_Class=-7 Then  Sql=Sql&" and a.CycState=1"
 If ClickState<>0 Then Sql=Sql&" And a.ClickState=" & ClickState
 Set Rs2=Conn.Execute(Sql)

 If Rs2(0)>0 Then'--���������й��ų���
  Response.write "<li style='width:48%;float:left;'><input type='radio' name='adshowtype' value='"&Rs("SetFlag")&"' id='adshowtype' onclick=""location.href='?Action="&action&"&ad_class="&ad_class&"&clickstate="&clickstate&"&adshowtype="&Rs("SetFlag")&"#adnav'"""
  If adshowtype = Rs("SetFlag") Then Response.write " checked"
  Response.write ">"&Rs("SetDesc")


  Response.write "[��"&Rs2(0)&"�����]"&"</li>"
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

<%If Abs(Ad_Class)=11 Then%>
<TR>
<TD class="td_r">ѡ���ϸ�ý��Ч����</TD>
<TD>

<div style="width:680px;">
<ul>
<li style="100%;">
<%
Response.write "<input name='adshowtype' type='radio' value='' onclick=""location.href='?Action="&action&"&ad_class="&ad_class&"&clickstate="&clickstate&"&adshowtype=#adnav'"""
If adshowtype="" Then Response.write " checked"
Response.write ">ȫ��Ч��"
 Sql="Select count(1) From CFWztg_AD a inner join CFWztg_Plan b on a.Plan_ID=b.ID where a.AdState=2 And b.PlanState=2 And a.AdUserName='"&AdUserName&"' And a.Ad_Class=" & Abs(Ad_Class)
 If Ad_Class=-4 Or Ad_Class=-7 Then  Sql=Sql&" and a.CycState=1"
 If ClickState<>0 Then Sql=Sql&" And a.ClickState=" & ClickState
 Set Rs2=Conn.Execute(Sql)
 
 Response.write "[��"&Rs2(0)&"�����]"&"</li>"
 Rs2.Close
%>
</li>
<%
Sql="Select * From CFWztg_SetContent Where SetBClassFlag='AdminTemplet' And SetSClassFlag='AdminTemplet_MixCode' And SetState=1 Order By SetTaxis"
Set Rs=Conn.Execute(Sql)

While Not Rs.Eof

 Sql="Select count(1) From CFWztg_AD a inner join CFWztg_Plan b on a.Plan_ID=b.ID where a.AdState=2 And b.PlanState=2 And a.AdUserName='"&AdUserName&"' And a.Ad_Class=" & Abs(Ad_Class)  &" and a.AdShowType='"&Rs("SetFlag")&"'"
 If Ad_Class=-4 Or Ad_Class=-7 Then  Sql=Sql&" and a.CycState=1"
 If ClickState<>0 Then Sql=Sql&" And a.ClickState=" & ClickState
 Set Rs2=Conn.Execute(Sql)

 If Rs2(0)>0 Then'--���������й��ų���
  Response.write "<li style='width:48%;float:left;'><input type='radio' name='adshowtype' value='"&Rs("SetFlag")&"' id='adshowtype' onclick=""location.href='?Action="&action&"&ad_class="&ad_class&"&clickstate="&clickstate&"&adshowtype="&Rs("SetFlag")&"#adnav'"""
  If adshowtype = Rs("SetFlag") Then Response.write " checked"
  Response.write ">"&Rs("SetDesc")


  Response.write "[��"&Rs2(0)&"�����]"&"</li>"
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
Response.write "<input name='ad_size' type='radio' value='' onclick=""location.href='?Action="&action&"&ad_class="&ad_class&"&clickstate="&clickstate&"&adshowtype="&adshowtype&"&ad_size=#adnav'"""
If ad_size="" Then Response.write " checked"
Response.write ">ȫ���ߴ�"
 Sql="Select count(1) From CFWztg_AD a inner join CFWztg_Plan b on a.Plan_ID=b.ID where a.AdState=2 And b.PlanState=2 And a.AdUserName='"&AdUserName&"'"
 If Ad_Class<>0 Then Sql=Sql&" And a.Ad_Class=" & Abs(Ad_Class)
 If Ad_Class=-4 Or Ad_Class=-7 Then  Sql=Sql&" and a.CycState=1"
 If ClickState<>0 Then Sql=Sql&" And a.ClickState=" & ClickState
 If Abs(Ad_Class)=7 And adshowtype<>"" Then  Sql=Sql&" and a.adshowtype='"&adshowtype&"'"
 Set Rs2=Conn.Execute(Sql)
 
 Response.write "[��"&Rs2(0)&"�����]"&"</li>"
 Rs2.Close
%>
</li>

����
<%
Sql="Select * From CFwztg_AdSize where Direction=1 Order By Direction,Width Desc,Height Desc"

Set Rs = Server.CreateObject("ADODB.Recordset")
Rs.open Sql,Conn,1,1
While Not Rs.Eof

 Sql="Select count(1) From CFWztg_AD a inner join CFWztg_Plan b on a.Plan_ID=b.ID where a.AdState=2 And b.PlanState=2 And a.AdUserName='"&AdUserName&"' and convert(varchar,a.adwidth)+'x'+convert(varchar,a.adheight)='"&Rs("Width")&"x"&Rs("Height")&"'"
 If Ad_Class<>0 Then Sql=Sql&" And a.Ad_Class=" & Abs(Ad_Class)
 If Ad_Class=-4 Or Ad_Class=-7 Then  Sql=Sql&" and a.CycState=1"
 If ClickState<>0 Then Sql=Sql&" And a.ClickState=" & ClickState
 If Abs(Ad_Class)=7 And adshowtype<>"" Then  Sql=Sql&" and a.adshowtype='"&adshowtype&"'"

 Set Rs2=Conn.Execute(Sql)
 If Rs2(0)>0 Then
  Response.write "<input type='radio' name='ad_size' value='"&Rs("Width")&"x"&Rs("Height")&"' id='ad_size' onclick=""location.href='?Action="&action&"&ad_class="&ad_class&"&clickstate="&clickstate&"&adshowtype="&adshowtype&"&ad_size="&Rs("Width")&"x"&Rs("Height")&"#adnav'"""
  If Ad_Size = Rs("Width")&"x"&Rs("Height") Then Response.write " checked"
  Response.write ">" & Rs("Width")&"x"&Rs("Height")
  Response.write "[��"&Rs2(0)&"�����]"
 End If
 Rs2.Close
If I=5 Then Response.write "<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"
Rs.MoveNext
Wend
Rs.Close
%>
<br />����
<%
Sql="Select * From CFwztg_AdSize where Direction=2 Order By Direction,Width Desc,Height Desc"

Set Rs = Server.CreateObject("ADODB.Recordset")
Rs.open Sql,Conn,1,1
While Not Rs.Eof
 Sql="Select count(1) From CFWztg_AD a inner join CFWztg_Plan b on a.Plan_ID=b.ID where a.AdState=2 And b.PlanState=2 And a.AdUserName='"&AdUserName&"' and convert(varchar,a.adwidth)+'x'+convert(varchar,a.adheight)='"&Rs("Width")&"x"&Rs("Height")&"'"
 If Ad_Class<>0 Then Sql=Sql&" And a.Ad_Class=" & Abs(Ad_Class)
 If Ad_Class=-4 Or Ad_Class=-7 Then  Sql=Sql&" and a.CycState=1"
 If ClickState<>0 Then Sql=Sql&" And a.ClickState=" & ClickState
 If Abs(Ad_Class)=7 And adshowtype<>"" Then  Sql=Sql&" and a.adshowtype='"&adshowtype&"'"
 
 Set Rs2=Conn.Execute(Sql)
 If Rs2(0)>0 Then
  Response.write "<input type='radio' name='ad_size' value='"&Rs("Width")&"x"&Rs("Height")&"' id='ad_size' onclick=""location.href='?Action="&action&"&ad_class="&ad_class&"&clickstate="&clickstate&"&adshowtype="&adshowtype&"&ad_size="&Rs("Width")&"x"&Rs("Height")&"#adnav'"""
  If Ad_Size = Rs("Width")&"x"&Rs("Height") Then Response.write " checked"
  Response.write ">" & Rs("Width")&"x"&Rs("Height")
  Response.write "[��"&Rs2(0)&"�����]"
 End If
 Rs2.Close
If I=5 Then Response.write "<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"
Rs.MoveNext
Wend
Rs.Close
%>
<br />����
<%
Sql="Select * From CFwztg_AdSize where Direction=3 Order By Direction,Width Desc,Height Desc"

Set Rs = Server.CreateObject("ADODB.Recordset")
Rs.open Sql,Conn,1,1
While Not Rs.Eof
 Sql="Select count(1) From CFWztg_AD a inner join CFWztg_Plan b on a.Plan_ID=b.ID where a.AdState=2 And b.PlanState=2 And a.AdUserName='"&AdUserName&"' and convert(varchar,a.adwidth)+'x'+convert(varchar,a.adheight)='"&Rs("Width")&"x"&Rs("Height")&"'"
 If Ad_Class<>0 Then Sql=Sql&" And a.Ad_Class=" & Abs(Ad_Class)
 If Ad_Class=-4 Or Ad_Class=-7 Then  Sql=Sql&" and a.CycState=1"
 If ClickState<>0 Then Sql=Sql&" And a.ClickState=" & ClickState
 If Abs(Ad_Class)=7 And adshowtype<>"" Then  Sql=Sql&" and a.adshowtype='"&adshowtype&"'"
 
 Set Rs2=Conn.Execute(Sql)
 If Rs2(0)>0 Then
  Response.write "<input type='radio' name='ad_size' value='"&Rs("Width")&"x"&Rs("Height")&"' id='ad_size' onclick=""location.href='?Action="&action&"&ad_class="&ad_class&"&clickstate="&clickstate&"&adshowtype="&adshowtype&"&ad_size="&Rs("Width")&"x"&Rs("Height")&"#adnav'"""
  If Ad_Size = Rs("Width")&"x"&Rs("Height") Then Response.write " checked"
  Response.write ">" & Rs("Width")&"x"&Rs("Height")
  Response.write "[��"&Rs2(0)&"�����]"
 End If
 Rs2.Close
If I=5 Then Response.write "<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"
Rs.MoveNext
Wend
Rs.Close
%>
<br />����
<%
Sql="Select distinct convert(varchar,a.AdWidth)+'x'+convert(varchar,a.AdHeight) adx From CFWztg_AD a inner join CFWztg_Plan b on a.Plan_ID=b.ID where a.AdState=2 And b.PlanState=2 And a.AdUserName='"&AdUserName&"'"
If Ad_Class<>0 Then Sql=Sql&" And a.Ad_Class=" & Abs(Ad_Class)
If Ad_Class=-4 Or Ad_Class=-7 Then  Sql=Sql&" and a.CycState=1"
If ClickState<>0 Then Sql=Sql&" And a.ClickState=" & ClickState
If Abs(Ad_Class)=7 And adshowtype<>"" Then  Sql=Sql&" and a.adshowtype='"&adshowtype&"'"
Sql=Sql&" and convert(varchar,a.AdWidth)+'x'+convert(varchar,a.AdHeight) not in(Select convert(varchar,c.Width)+'x'+convert(varchar,c.Height) From CFwztg_AdSize c)"
 
Set Rs = Server.CreateObject("ADODB.Recordset")
Rs.open Sql,Conn,1,1
While Not Rs.Eof
 Sql="Select count(1) From CFWztg_AD a inner join CFWztg_Plan b on a.Plan_ID=b.ID where a.AdState=2 And b.PlanState=2 And a.AdUserName='"&AdUserName&"' and convert(varchar,a.adwidth)+'x'+convert(varchar,a.adheight)='"&Rs("adx")&"'"
 If Ad_Class<>0 Then Sql=Sql&" And a.Ad_Class=" & Abs(Ad_Class)
 If Ad_Class=-4 Or Ad_Class=-7 Then  Sql=Sql&" and a.CycState=1"
 If ClickState<>0 Then Sql=Sql&" And a.ClickState=" & ClickState
 If Abs(Ad_Class)=7 And adshowtype<>"" Then  Sql=Sql&" and a.adshowtype='"&adshowtype&"'"
 
 Set Rs2=Conn.Execute(Sql)
 If Rs2(0)>0 Then
  Response.write "<input type='radio' name='ad_size' value='"&Rs("adx")&"' id='ad_size' onclick=""location.href='?Action="&action&"&ad_class="&ad_class&"&clickstate="&clickstate&"&adshowtype="&adshowtype&"&ad_size="&Rs("adx")&"#adnav'"""
  If Ad_Size = Rs("adx") Then Response.write " checked"
  Response.write ">" & Rs("adx")
  Response.write "[��"&Rs2(0)&"�����]"
 End If
 Rs2.Close
If I=5 Then Response.write "<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"
Rs.MoveNext
Wend
Rs.Close
%>

</TD>
</TR>

<%End If%>


</table>

<form name="form_adlist" id="form_adlist" method="post" action="">
<table class="tb_1">
  <tr class="tr_1">
    <td><input name="chkall" type="checkbox" id="chkall" onclick="selectcheckbox(this.form)" value="check"></td>
    <td><a href="<%=PageUrl%>&Px=ID">���</a></td>
    <td><a href="<%=PageUrl%>&Px=Plan_ID">�����ƻ�</a></td>
    <td><a href="<%=PageUrl%>&Px=Ad_Class">�������</a></td>
    <td><a href="<%=PageUrl%>&Px=Unit_Cent_First">����</a></td>
    <td><a href="<%=PageUrl%>&Px=OverClick_Cent">���</a></td>
    <td><a href="<%=PageUrl%>&Px=AdListShowState">�б�</a></td>
    <td><a href="<%=PageUrl%>&Px=Weight">Ȩ��</a></td>
    <td><a href="<%=PageUrl%>&Px=CycState">��ѭ</a></td>
    <td><a href="<%=PageUrl%>&Px=ClickState">�Ʒ�ģʽ</a></td>
    <td>����</td>
  </tr>
 
  <%
Sql = "Select a.* From CFWztg_AD a inner join CFWztg_Plan b on a.Plan_ID=b.ID where a.AdState=2 And b.PlanState=2 And a.AdUserName='"&AdUserName&"'"

If ClickState<>0 Then Sql=Sql&" And a.ClickState=" & ClickState

if AdShowType<>"" Then Sql = Sql & " And a.adshowtype='"&adshowtype&"'"

If Ad_Size<>"" Then Sql = Sql & " and convert(varchar,a.adwidth)+'x'+convert(varchar,a.adheight)='"&AdWidth&"x"&AdHeight&"'"

If Ad_Class = 0 Then
  Sql = Sql & " Order By a."&Px&" Desc"
Else
 If Ad_Class>0 Then
  Sql = Sql & " And a.Ad_Class="&Ad_Class&" Order By a."&Px&" Desc"
 Else
  Sql = Sql & " And a.Ad_Class="&Abs(Ad_Class)&" And a.CycState>0 Order By a."&Px&" Desc"
 End If 
End If




Set Rs = Server.CreateObject("ADODB.Recordset")
Rs.open Sql,Conn,1,1

If Not Rs.eof Then
 Page=CLng(ChkStr(Request("Page"),2)):If Page=0 Then Page=1 
 Rs.pagesize = 20
 TotalRs=Rs.RecordCount
 TotalPage=Rs.PageCount
 MyPageSize=Rs.PageSize
 FixedSize=Rs.PageSize
 Rs.AbsolutePage=Page
End If



While Not Rs.Eof And MyPageSize>0
%>
  <tr class="tr_2">
      <td> 
<%
Response.write "<input name='ID_Sel' type='checkbox' id='ID_Sel' value='"&rs("ID")&"'>"
%>
        </td>
        
    <td><%=Rs("AdName")&"["&Rs("ID")&"]"%></td>
    <td><%=Rs("Plan_ID")%></td>
    <td>
<%
Response.write GetAdClassName(Rs("Ad_Class"))
GGXG = ""
If Rs("Ad_Class")=7 Then
 Sql="Select * From CFWztg_SetContent Where SetBClassFlag='AdminTemplet' And SetSClassFlag='AdminTemplet_AdCode' And SetFlag='"&Rs("AdShowType")&"'"
 Set Rs2=Conn.Execute(Sql)
 If Rs2.Eof Then
  Response.write "<br>���Ч��δѡ��"
 Else
  GGXG = Rs2("SetDesc")
  Response.write "<br>"&GGXG  
 End If
ElseIf Rs("Ad_Class")=11 Then
 Sql="Select * From CFWztg_SetContent Where SetBClassFlag='AdminTemplet' And SetSClassFlag='AdminTemplet_MixCode' And SetFlag='"&Rs("AdShowType")&"'"
 Set Rs2=Conn.Execute(Sql)
 If Rs2.Eof Then
  Response.write "<br>���Ч��δѡ��"
 Else
  GGXG = Rs2("SetDesc")
  Response.write "<br>"&GGXG  
 End If
End If
%>
</td>
<td><%=GetTurnCent(Rs("Unit_Cent_First"))%>Ԫ</td>
<td><%=GetTurnCent(Rs("OverClick_Cent"))%>Ԫ</td>
<td>
<%
If Rs("AdListShowState")=1 Then
 Response.Write Rs("ListID")
Else
 Response.Write "����ʾ"
End if
%>
</td>
<td>
<%=Rs("Weight")%>
</td>

<td>
<%
If Rs("CycState")=0 Then
 Response.Write "��"
Else
 Response.Write "��"
End if
%>
</td>

<td>
<%
If Rs("ClickState")=1 Then
 If Rs("Ad_Class")=8 Or Rs("Ad_Class")=9 Then
  Response.Write "��������"
 ElseIf Rs("Ad_Class")=7 Then
  If Instr(GGXG,"����")>0 Then
   Response.Write "��������"
  Else
   Response.Write "�������(CPC)"
  End If
 ElseIf Rs("Ad_Class")=1 Then
   Response.Write "����򵯳�����"
 Else
  Response.Write "�������(CPC)"
 End If
ElseIf Rs("ClickState")=2 Then
 Response.Write "��ʾ����(CPV)"
ElseIf Rs("ClickState")=3 Then
 Response.Write "ע�����(CPA)"
ElseIf Rs("ClickState")=4 Then
 Response.Write "��Ʒ����(CPS)"
End If

If Rs("ClickSeState")=1 Then
  Response.Write "<br>[��Ҫ�Ʒ�:CPC]"
ElseIf Rs("ClickSeState")=2 Then
 Response.Write "<br>[��Ҫ�Ʒ�:CPV]"
End If
%>
</td>

<td>
<a href="?Action=admodify&Ad_ID=<%=Rs("ID")%>" class="btn_edit"><i class="mdi mdi-pencil"></i>�޸�</a>

<a href="javascript:;" onclick="$(function () { confirm('ȷ��Ҫ��ͣ��������?', '', function (isConfirm) {if (isConfirm) {gotoUrl('../../AdUser.aspx?Action=adstop&ID=<%=Rs("ID")%>')}}, {confirmButtonText: 'ȷ��', cancelButtonText: 'ȡ��', width: 400});});" class="btn_del"><i class="mdi mdi-stop"></i> ��ͣ</a>

<a href="javascript:;" onclick="$(function () { confirm('ȷ��Ҫɾ����������?', '', function (isConfirm) {if (isConfirm) {gotoUrl('../../AdUser.aspx?Action=addel&ID=<%=Rs("ID")%>')}}, {confirmButtonText: 'ȷ��', cancelButtonText: 'ȡ��', width: 400});});" class="btn_del"><i class="mdi mdi-window-close"></i> ɾ��</a>

<a href="../../cf.aspx?Action=adview&ID=<%=Rs("ID")%>" target="_blank" class="btn_add"><i class="mdi mdi-eye"></i>Ԥ��</a>
</td>

</tr>
<%
MyPageSize=MyPageSize-1
Rs.MoveNext
Wend
Rs.Close
%>

</table>
<a href="javascript:;" onclick="$(function () { confirm('ȷ��Ҫ��ͣѡ�����Щ�����?', '', function (isConfirm) {if (isConfirm) {$('#form_adlist').attr('action','../../AdUser.aspx?Action=adselstop');document.getElementById('form_adlist').submit();}}, {confirmButtonText: 'ȷ��', cancelButtonText: 'ȡ��', width: 400});});" class="btn btn-xs btn-danger"><i class="mdi mdi-stop"></i>��ͣѡ��</a>

<a href="javascript:;" onclick="$(function () { confirm('ȷ��Ҫɾ��ѡ�����Щ�����?', '', function (isConfirm) {if (isConfirm) {$('#form_adlist').attr('action','../../AdUser.aspx?Action=adseldel');document.getElementById('form_adlist').submit();}}, {confirmButtonText: 'ȷ��', cancelButtonText: 'ȡ��', width: 400});});" class="btn btn-xs btn-danger"><i class="mdi mdi-window-close"></i>ɾ��ѡ��</a>


<%
Call ShowPage(TotalRs,TotalPage,Page,PageUrl,Px)
%>
</form>
