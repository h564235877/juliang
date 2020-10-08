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
<td><span class="title">已经通过审核的广告<a name="adnav" id="adnav"></a></span></td>
</tr>
</table>

<table class="tb_1">
<tr class="tr_1"> 
<td colspan="2">搜索(从上到下选择)</td>
</tr>
<TR>
<TD class="td_r" style="width:9%">选择广告类型：</TD>
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
If Ad_Class=0 Then Response.write " checked"%>>全部广告类型
<%
 Response.write "[共"&Rs("adclass_0")&"个广告]"&"</li>"
%>
</li>

<li style="width:100%;clear:both;"></li>

<li style="width:175px;float:left;">
<input name="ad_class" type="radio" value="-7"
<%
Response.write " onclick=""location.href='?Action="&action&"&Ad_Class=-7#adnav'"""
If Ad_Class=-7 Then Response.write " checked"%>>轮循富媒体
<%
 Response.write "[共"&Rs("AdClass_f7")&"个广告]"&"</li>"
%>
</li>

<li style="width:175px;float:left;">
<input name="ad_class" type="radio" value="-1"
<%
Response.write " onclick=""location.href='?Action="&action&"&Ad_Class=-1#adnav'"""
If Ad_Class=-1 Then Response.write " checked"%>>轮循直链
<%
 Response.write "[共"&Rs("AdClass_f1")&"个广告]"&"</li>"
%>
</li>

<li style="width:175px;float:left;">
<input name="ad_class" type="radio" value="-4"
<%
Response.write " onclick=""location.href='?Action="&action&"&Ad_Class=-4#adnav'"""
If Ad_Class=-4 Then Response.write " checked"%>>轮循图片
<%
 Response.write "[共"&Rs("AdClass_f4")&"个广告]"&"</li>"
%>
</li>

<li style="width:175px;float:left;">
<input name="ad_class" type="radio" value="8"
<%
Response.write " onclick=""location.href='?Action="&action&"&Ad_Class=8#adnav'"""
If Ad_Class=8 Then Response.write " checked"%>>轮循强弹
<%
 Response.write "[共"&Rs("AdClass_8")&"个广告]"&"</li>"
%>
</li>


<li style="width:175px;float:left;">
<input name="ad_class" type="radio" value="9"
<%
Response.write " onclick=""location.href='?Action="&action&"&Ad_Class=9#adnav'"""
If Ad_Class=9 Then Response.write " checked"%>>轮循强退
<%
 Response.write "[共"&Rs("AdClass_9")&"个广告]"&"</li>"
%>
</li>

<li style="clear:both;"></li>

<li style="width:175px;float:left;">
<input name="ad_class" type="radio" value="11"
<%
Response.write " onclick=""location.href='?Action="&action&"&Ad_Class=11#adnav'"""
If Ad_Class=11 Then Response.write " checked"%>>混合富媒体
<%
 Response.write "[共"&Rs("AdClass_11")&"个广告]"&"</li>"
%>
</li>

<li style="width:175px;float:left;">
<input name="ad_class" type="radio" value="5"
<%
Response.write " onclick=""location.href='?Action="&action&"&Ad_Class=5#adnav'"""
If Ad_Class=5 Then Response.write " checked"%>>混合文字
<%
 Response.write "[共"&Rs("AdClass_5")&"个广告]"&"</li>"
%>
</li>

<li style="width:175px;float:left;">
<input name="ad_class" type="radio" value="6"
<%
Response.write " onclick=""location.href='?Action="&action&"&Ad_Class=6#adnav'"""
If Ad_Class=6 Then Response.write " checked"%>>混合图片
<%
 Response.write "[共"&Rs("AdClass_6")&"个广告]"&"</li>"
%>
</li>

<li style="width:175px;float:left;">
<input name="ad_class" type="radio" value="10"
<%
Response.write " onclick=""location.href='?Action="&action&"&Ad_Class=10#adnav'"""
If Ad_Class=10 Then Response.write " checked"%>>混合标签云
<%
 Response.write "[共"&Rs("AdClass_10")&"个广告]"&"</li>"
%>
</li>

<li style="clear:both;"></li>

<li style="width:175px;float:left;">
<input name="ad_class" type="radio" value="1"
<%
Response.write " onclick=""location.href='?Action="&action&"&Ad_Class=1#adnav'"""
If Ad_Class=1 Then Response.write " checked"%>>直链广告
<%
 Response.write "[共"&Rs("AdClass_1")&"个广告]"&"</li>"
%>
</li>

<li style="width:175px;float:left;">
<input name="ad_class" type="radio" value="2"
<%
Response.write " onclick=""location.href='?Action="&action&"&Ad_Class=2#adnav'"""
If Ad_Class=2 Then Response.write " checked"%>>直图广告
<%
 Response.write "[共"&Rs("AdClass_2")&"个广告]"&"</li>"
%>
</li>

<li style="width:175px;float:left;">
<input name="ad_class" type="radio" value="3"
<%
Response.write " onclick=""location.href='?Action="&action&"&Ad_Class=3#adnav'"""
If Ad_Class=3 Then Response.write " checked"%>>普通文字
<%
 Response.write "[共"&Rs("AdClass_3")&"个广告]"&"</li>"
%>
</li>

<li style="width:175px;float:left;">
<input name="ad_class" type="radio" value="4"
<%
Response.write " onclick=""location.href='?Action="&action&"&Ad_Class=4#adnav'"""
If Ad_Class=4 Then Response.write " checked"%>>普通图片
<%
 Response.write "[共"&Rs("AdClass_4")&"个广告]"&"</li>"
%>
</li>

<li style="width:175px;float:left;">
<input name="ad_class" type="radio" value="7"
<%
Response.write " onclick=""location.href='?Action="&action&"&Ad_Class=7#adnav'"""
If Ad_Class=7 Then Response.write " checked"%>>富媒体
<%
 Response.write "[共"&Rs("AdClass_7")&"个广告]"&"</li>"
%>
</li>

<li style="width:175px;float:left;">
<input name="ad_class" type="radio" value="12"
<%
Response.write " onclick=""location.href='?Action="&action&"&Ad_Class=12#adnav'"""
If Ad_Class=12 Then Response.write " checked"%>>软件下载安装
<%
 Response.write "[共"&Rs("AdClass_12")&"个广告]"&"</li>"
%>
</li>
</td>
</tr>

  <TR>
    <TD class="td_r">选择计费方式：</TD>
    <TD>
<input name="clickstate" type="radio" value="0"
<%
Response.write " onclick=""location.href='?Action="&action&"&ad_class="&ad_class&"&clickstate=0#adnav'"""
If clickstate=0 Then Response.write " checked"%>>全部计费
<%
 Sql="Select count(1) From CFWztg_AD a inner join CFWztg_Plan b on a.Plan_ID=b.ID where a.AdState=2 And b.PlanState=2 And a.AdUserName='"&AdUserName&"'"
 If Ad_Class<>0 Then  Sql=Sql&" And a.Ad_Class=" & Abs(Ad_Class)
 If Ad_Class=-4 Or Ad_Class=-7 Then  Sql=Sql&" and a.CycState=1"
 Set Rs=Conn.Execute(Sql)
 Response.write "[共"&Rs(0)&"个广告]"&"</li>"
 Rs.Close
%>

<input name="clickstate" type="radio" value="1"
<%
Response.write " onclick=""location.href='?Action="&action&"&ad_class="&ad_class&"&clickstate=1#adnav'"""
If clickstate=1 Then Response.write " checked"%>>点击计费(CPC)
<%
 Sql="Select count(1) From CFWztg_AD a inner join CFWztg_Plan b on a.Plan_ID=b.ID where a.AdState=2 And b.PlanState=2 And a.AdUserName='"&AdUserName&"' And a.ClickState=1"
 If Ad_Class<>0 Then  Sql=Sql&" And a.Ad_Class=" & Abs(Ad_Class)
 If Ad_Class=-4 Or Ad_Class=-7 Then  Sql=Sql&" and a.CycState=1"
 Set Rs=Conn.Execute(Sql)
 Response.write "[共"&Rs(0)&"个广告]"&"</li>"
 Rs.Close
%>

<%If Ad_Class=0 Or Ad_Class=3 Or Abs(Ad_Class)=4 Or Ad_Class=5 Or Ad_Class=6 Or Abs(Ad_Class)=7 Or Ad_Class=8 Or Ad_Class=9 Or Ad_Class=10 Or Ad_Class=11 Then%>
<input name="clickstate" type="radio" value="2"<%
Response.write " onclick=""location.href='?Action="&action&"&ad_class="&ad_class&"&clickstate=2#adnav'"""
If clickstate=2 Then Response.write " checked"%>>显示计费(CPV)
<%
 Sql="Select count(1) From CFWztg_AD a inner join CFWztg_Plan b on a.Plan_ID=b.ID where a.AdState=2 And b.PlanState=2 And a.AdUserName='"&AdUserName&"' And a.ClickState=2"
 If Ad_Class<>0 Then  Sql=Sql&" And a.Ad_Class=" & Abs(Ad_Class)
 If Ad_Class=-4 Or Ad_Class=-7 Then  Sql=Sql&" and a.CycState=1"
 Set Rs=Conn.Execute(Sql)
 Response.write "[共"&Rs(0)&"个广告]"&"</li>"
 Rs.Close
%>
<%End If%>

<input name="clickstate" type="radio" value="3"<%
Response.write " onclick=""location.href='?Action="&action&"&ad_class="&ad_class&"&clickstate=3#adnav'"""
If clickstate=3 Then Response.write " checked"%>>注册计费(CPA)
<%
 Sql="Select count(1) From CFWztg_AD a inner join CFWztg_Plan b on a.Plan_ID=b.ID where a.AdState=2 And b.PlanState=2 And a.AdUserName='"&AdUserName&"' And a.ClickState=3"
 If Ad_Class<>0 Then  Sql=Sql&" And a.Ad_Class=" & Abs(Ad_Class)
 If Ad_Class=-4 Or Ad_Class=-7 Then  Sql=Sql&" and a.CycState=1"
 Set Rs=Conn.Execute(Sql)
 Response.write "[共"&Rs(0)&"个广告]"&"</li>"
 Rs.Close
%>

<input name="clickstate" type="radio" value="4"<%
Response.write " onclick=""location.href='?Action="&action&"&ad_class="&ad_class&"&clickstate=4#adnav'"""
If clickstate=4 Then Response.write " checked"%>>订单计费(CPS)
<%
 Sql="Select count(1) From CFWztg_AD a inner join CFWztg_Plan b on a.Plan_ID=b.ID where a.AdState=2 And b.PlanState=2 And a.AdUserName='"&AdUserName&"' And a.ClickState=4"
 If Ad_Class<>0 Then  Sql=Sql&" And a.Ad_Class=" & Abs(Ad_Class)
 If Ad_Class=-4 Or Ad_Class=-7 Then  Sql=Sql&" and a.CycState=1"
 Set Rs=Conn.Execute(Sql)
 Response.write "[共"&Rs(0)&"个广告]"&"</li>"
 Rs.Close
%>
</TD>
  </TR>
 

<%If Abs(Ad_Class)=7 Then%>
<TR>
<TD class="td_r">选择富媒体效果：</TD>
<TD>

<div style="width:548px;">
<ul>
<li style="100%;">
<%
Response.write "<input name='adshowtype' type='radio' value='' onclick=""location.href='?Action="&action&"&ad_class="&ad_class&"&clickstate="&clickstate&"&adshowtype=#adnav'"""
If adshowtype="" Then Response.write " checked"
Response.write ">全部效果"
 Sql="Select count(1) From CFWztg_AD a inner join CFWztg_Plan b on a.Plan_ID=b.ID where a.AdState=2 And b.PlanState=2 And a.AdUserName='"&AdUserName&"' And a.Ad_Class=" & Abs(Ad_Class)
 If Ad_Class=-4 Or Ad_Class=-7 Then  Sql=Sql&" and a.CycState=1"
 If ClickState<>0 Then Sql=Sql&" And a.ClickState=" & ClickState
 Set Rs2=Conn.Execute(Sql)
 
 Response.write "[共"&Rs2(0)&"个广告]"&"</li>"
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

 If Rs2(0)>0 Then'--此类型下有广告才出现
  Response.write "<li style='width:48%;float:left;'><input type='radio' name='adshowtype' value='"&Rs("SetFlag")&"' id='adshowtype' onclick=""location.href='?Action="&action&"&ad_class="&ad_class&"&clickstate="&clickstate&"&adshowtype="&Rs("SetFlag")&"#adnav'"""
  If adshowtype = Rs("SetFlag") Then Response.write " checked"
  Response.write ">"&Rs("SetDesc")


  Response.write "[共"&Rs2(0)&"个广告]"&"</li>"
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
<TD class="td_r">选择混合富媒体效果：</TD>
<TD>

<div style="width:680px;">
<ul>
<li style="100%;">
<%
Response.write "<input name='adshowtype' type='radio' value='' onclick=""location.href='?Action="&action&"&ad_class="&ad_class&"&clickstate="&clickstate&"&adshowtype=#adnav'"""
If adshowtype="" Then Response.write " checked"
Response.write ">全部效果"
 Sql="Select count(1) From CFWztg_AD a inner join CFWztg_Plan b on a.Plan_ID=b.ID where a.AdState=2 And b.PlanState=2 And a.AdUserName='"&AdUserName&"' And a.Ad_Class=" & Abs(Ad_Class)
 If Ad_Class=-4 Or Ad_Class=-7 Then  Sql=Sql&" and a.CycState=1"
 If ClickState<>0 Then Sql=Sql&" And a.ClickState=" & ClickState
 Set Rs2=Conn.Execute(Sql)
 
 Response.write "[共"&Rs2(0)&"个广告]"&"</li>"
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

 If Rs2(0)>0 Then'--此类型下有广告才出现
  Response.write "<li style='width:48%;float:left;'><input type='radio' name='adshowtype' value='"&Rs("SetFlag")&"' id='adshowtype' onclick=""location.href='?Action="&action&"&ad_class="&ad_class&"&clickstate="&clickstate&"&adshowtype="&Rs("SetFlag")&"#adnav'"""
  If adshowtype = Rs("SetFlag") Then Response.write " checked"
  Response.write ">"&Rs("SetDesc")


  Response.write "[共"&Rs2(0)&"个广告]"&"</li>"
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
<TD class="td_r">选择广告尺寸：</TD>
<TD>
<li style="100%;">
<%
Response.write "<input name='ad_size' type='radio' value='' onclick=""location.href='?Action="&action&"&ad_class="&ad_class&"&clickstate="&clickstate&"&adshowtype="&adshowtype&"&ad_size=#adnav'"""
If ad_size="" Then Response.write " checked"
Response.write ">全部尺寸"
 Sql="Select count(1) From CFWztg_AD a inner join CFWztg_Plan b on a.Plan_ID=b.ID where a.AdState=2 And b.PlanState=2 And a.AdUserName='"&AdUserName&"'"
 If Ad_Class<>0 Then Sql=Sql&" And a.Ad_Class=" & Abs(Ad_Class)
 If Ad_Class=-4 Or Ad_Class=-7 Then  Sql=Sql&" and a.CycState=1"
 If ClickState<>0 Then Sql=Sql&" And a.ClickState=" & ClickState
 If Abs(Ad_Class)=7 And adshowtype<>"" Then  Sql=Sql&" and a.adshowtype='"&adshowtype&"'"
 Set Rs2=Conn.Execute(Sql)
 
 Response.write "[共"&Rs2(0)&"个广告]"&"</li>"
 Rs2.Close
%>
</li>

横向
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
  Response.write "[共"&Rs2(0)&"个广告]"
 End If
 Rs2.Close
If I=5 Then Response.write "<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"
Rs.MoveNext
Wend
Rs.Close
%>
<br />纵向
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
  Response.write "[共"&Rs2(0)&"个广告]"
 End If
 Rs2.Close
If I=5 Then Response.write "<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"
Rs.MoveNext
Wend
Rs.Close
%>
<br />方形
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
  Response.write "[共"&Rs2(0)&"个广告]"
 End If
 Rs2.Close
If I=5 Then Response.write "<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"
Rs.MoveNext
Wend
Rs.Close
%>
<br />其它
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
  Response.write "[共"&Rs2(0)&"个广告]"
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
    <td><a href="<%=PageUrl%>&Px=ID">广告</a></td>
    <td><a href="<%=PageUrl%>&Px=Plan_ID">所属计划</a></td>
    <td><a href="<%=PageUrl%>&Px=Ad_Class">广告类型</a></td>
    <td><a href="<%=PageUrl%>&Px=Unit_Cent_First">单价</a></td>
    <td><a href="<%=PageUrl%>&Px=OverClick_Cent">完成</a></td>
    <td><a href="<%=PageUrl%>&Px=AdListShowState">列表</a></td>
    <td><a href="<%=PageUrl%>&Px=Weight">权重</a></td>
    <td><a href="<%=PageUrl%>&Px=CycState">轮循</a></td>
    <td><a href="<%=PageUrl%>&Px=ClickState">计费模式</a></td>
    <td>操作</td>
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
  Response.write "<br>广告效果未选择"
 Else
  GGXG = Rs2("SetDesc")
  Response.write "<br>"&GGXG  
 End If
ElseIf Rs("Ad_Class")=11 Then
 Sql="Select * From CFWztg_SetContent Where SetBClassFlag='AdminTemplet' And SetSClassFlag='AdminTemplet_MixCode' And SetFlag='"&Rs("AdShowType")&"'"
 Set Rs2=Conn.Execute(Sql)
 If Rs2.Eof Then
  Response.write "<br>广告效果未选择"
 Else
  GGXG = Rs2("SetDesc")
  Response.write "<br>"&GGXG  
 End If
End If
%>
</td>
<td><%=GetTurnCent(Rs("Unit_Cent_First"))%>元</td>
<td><%=GetTurnCent(Rs("OverClick_Cent"))%>元</td>
<td>
<%
If Rs("AdListShowState")=1 Then
 Response.Write Rs("ListID")
Else
 Response.Write "不显示"
End if
%>
</td>
<td>
<%=Rs("Weight")%>
</td>

<td>
<%
If Rs("CycState")=0 Then
 Response.Write "否"
Else
 Response.Write "是"
End if
%>
</td>

<td>
<%
If Rs("ClickState")=1 Then
 If Rs("Ad_Class")=8 Or Rs("Ad_Class")=9 Then
  Response.Write "弹出获利"
 ElseIf Rs("Ad_Class")=7 Then
  If Instr(GGXG,"弹出")>0 Then
   Response.Write "弹出获利"
  Else
   Response.Write "点击获利(CPC)"
  End If
 ElseIf Rs("Ad_Class")=1 Then
   Response.Write "点击或弹出获利"
 Else
  Response.Write "点击获利(CPC)"
 End If
ElseIf Rs("ClickState")=2 Then
 Response.Write "显示获利(CPV)"
ElseIf Rs("ClickState")=3 Then
 Response.Write "注册获利(CPA)"
ElseIf Rs("ClickState")=4 Then
 Response.Write "商品获利(CPS)"
End If

If Rs("ClickSeState")=1 Then
  Response.Write "<br>[次要计费:CPC]"
ElseIf Rs("ClickSeState")=2 Then
 Response.Write "<br>[次要计费:CPV]"
End If
%>
</td>

<td>
<a href="?Action=admodify&Ad_ID=<%=Rs("ID")%>" class="btn_edit"><i class="mdi mdi-pencil"></i>修改</a>

<a href="javascript:;" onclick="$(function () { confirm('确定要暂停这个广告吗?', '', function (isConfirm) {if (isConfirm) {gotoUrl('../../AdUser.aspx?Action=adstop&ID=<%=Rs("ID")%>')}}, {confirmButtonText: '确定', cancelButtonText: '取消', width: 400});});" class="btn_del"><i class="mdi mdi-stop"></i> 暂停</a>

<a href="javascript:;" onclick="$(function () { confirm('确定要删除这个广告吗?', '', function (isConfirm) {if (isConfirm) {gotoUrl('../../AdUser.aspx?Action=addel&ID=<%=Rs("ID")%>')}}, {confirmButtonText: '确定', cancelButtonText: '取消', width: 400});});" class="btn_del"><i class="mdi mdi-window-close"></i> 删除</a>

<a href="../../cf.aspx?Action=adview&ID=<%=Rs("ID")%>" target="_blank" class="btn_add"><i class="mdi mdi-eye"></i>预览</a>
</td>

</tr>
<%
MyPageSize=MyPageSize-1
Rs.MoveNext
Wend
Rs.Close
%>

</table>
<a href="javascript:;" onclick="$(function () { confirm('确定要暂停选择的这些广告吗?', '', function (isConfirm) {if (isConfirm) {$('#form_adlist').attr('action','../../AdUser.aspx?Action=adselstop');document.getElementById('form_adlist').submit();}}, {confirmButtonText: '确定', cancelButtonText: '取消', width: 400});});" class="btn btn-xs btn-danger"><i class="mdi mdi-stop"></i>暂停选择</a>

<a href="javascript:;" onclick="$(function () { confirm('确定要删除选择的这些广告吗?', '', function (isConfirm) {if (isConfirm) {$('#form_adlist').attr('action','../../AdUser.aspx?Action=adseldel');document.getElementById('form_adlist').submit();}}, {confirmButtonText: '确定', cancelButtonText: '取消', width: 400});});" class="btn btn-xs btn-danger"><i class="mdi mdi-window-close"></i>删除选择</a>


<%
Call ShowPage(TotalRs,TotalPage,Page,PageUrl,Px)
%>
</form>
