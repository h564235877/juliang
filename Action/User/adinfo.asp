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
ID=CLng(ChkStr(Request("ID"),2))

'--是查看时，不是在列表include时
If ID>0 Then
 Sql="Select * From CFWztg_Ad Where ID="&ID
 Set Rs = Server.CreateObject("ADODB.Recordset")
 Rs.open Sql,Conn,1,1
End If
%>

<table class="tb_1">
<tr>
<td class="td_r">广告编号：<a name="ad<%=Rs("ID")%>"></a></td>
<td>
<%=Rs("ID")%>
<%If Ad_Class=1 Or Ad_Class=2 Or Ad_Class=3 Or Ad_Class=4 Or Ad_Class=7 Then%> 
<a href='?Action=adcodeget&Ad_Class=<%=Ad_Class%>&ID=<%=Rs("ID")%>&ClickState=<%=ClickState%>' class="btn btn-primary" style="vertical-align:middle"><span>获取此广告代码并预览广告</span></a>
<%End If%>
</td>
<td class="td_r">广告主：</td>
<td colspan="3"><%=Rs("AdUserName")%>

</td>
</tr>


<tr>
<td class="td_r">广告名称：</td>
<td><%=Rs("AdName")%></td>
<td class="td_r">所属行业：</td>
<td colspan="3">
<%
Sql="Select SiteClassName From CFWztg_SiteClass Where ID="&Rs("SiteClassID")
Set Rs2=Conn.Execute(Sql)
Response.write Rs2("SiteClassName")
Rs2.Close
%>
</td>
</tr>

<%If Rs("Ad_Class")<>1 or Rs("AdShowType")<>"" Then%>
<tr>

<%If Rs("Ad_Class")<>1 Then%>
<td class="td_r">广告尺寸：</td>
<td><%=Rs("adwidth")&"x"&Rs("adheight")%></td>
<%
Else
 Response.write "<td class='td_r'>&nbsp;</td><td>&nbsp;</td>"
End If
%>

<%If Rs("AdShowType")<>"" Then%>
<td class="td_r">富媒体广告效果：</td>
<td colspan="3">
<%
 GGXG = ""
 Sql="Select SetDesc From CFWztg_SetContent Where SetFlag='"&Rs("AdShowType")&"'"
 Set Rs2=Conn.Execute(Sql)
 GGXG = Rs2("SetDesc")
 Response.write GGXG
 Rs2.Close
%>
</td>
<%
Else
 Response.write "<td class='td_r'>&nbsp;</td><td>&nbsp;</td>"
End If
%>

</tr>
<%End If%>


<tr>
<td style="width:15%;" class="td_r">
首要计费模式:
</td>
<td style="width:35%;">
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

%>
</td>

<td style="width:15%;" class="td_r">次要计费模式：</td>
<td style="width:35%;">
<%
If Rs("ClickSeState")=0 Then
  Response.Write "关闭"
ElseIf Rs("ClickSeState")=1 Then
  Response.Write "同时支持CPC计费，"
ElseIf Rs("ClickSeState")=2 Then
 Response.Write "同时支持CPV计费，"
End If

If Rs("ClickSeState")>0 Then Response.write "为基础单价的 "&GetTurnCent(Rs("clicksemul"))&" 倍"
%>
</td>

</tr>
<tr>
<td style="width:15%;" class="td_r">
单价:
</td>
<td style="width:35%;">
<%
If Rs("VipLevelOpen")=0 Then
 Response.write GetTurnCent(CDBL(Rs("Unit_Cent"))*Rs("AllowClickTotal")*1000) & "元/千次"
Else
 Response.write "基础单价:"&GetTurnCent(CDBL(Rs("Unit_Cent"))*Rs("AllowClickTotal")*1000) & "元/千次,"
 
 If Rs("VipLevelOpen")=1 Then
  Response.write "此广告根据您上一天投放此广告的成绩不同而单价不同"
  Sql = "Select Top 1 Display_Counter,Click_Counter,Reg_Counter From CFWztg_AD_Counter_Day Where UserName='" & UserName & "' And Ad_ID=" & Rs("ID") & " And DateDiff(d,getdate(),AddDate)<>0 Order By AddDate Desc"
  Set Rs2=Conn.Execute(Sql)
  If Not Rs2.Eof Then
   UserLastDayShowTotal = Rs2("Display_Counter")
   UserLastDayClickTotal = Rs2("Click_Counter")
   UserLastDayRegTotal = Rs2("Reg_Counter")
  Else
   UserLastDayShowTotal = 0
   UserLastDayClickTotal = 0
   UserLastDayRegTotal = 0
  End If

  If Rs("ClickState")=1 Then
   CurrTotal = UserLastDayClickTotal
  ElseIf Rs("ClickState")=2 Then
   CurrTotal = UserLastDayShowTotal
  ElseIf Rs("ClickState")=3 Then
   CurrTotal = UserLastDayRegTotal
  End If
 End If
 
 If Rs("VipLevelOpen")=2 Then 
  Response.write "此广告根据您投放所有广告总量的成绩不同而单价不同"
  If Rs("ClickState")=1 Then
   CurrTotal = UserClickTotal
  ElseIf Rs("ClickState")=2 Then
   CurrTotal = UserShowTotal
  ElseIf Rs("ClickState")=3 Then
   CurrTotal = UserRegTotal
  End If
 End If
 
 
 If Rs("VipLevelOpen")=3 Then 
  Response.write "此广告根据您的用户等级不同而单价不同"
  Sql = "Select UserLevel From CFWztg_User Where UserName='" & UserName & "'"
  Set Rs2=Conn.Execute(Sql)
  CurrTotal = Rs2("UserLevel")
  
  Rs2.Close
  
  Response.write "<br>目前您的用户等级："& CurrTotal &"，正处于"
 Else
  Response.write "<br>目前您的量："& CurrTotal &"，正处于"
 End If
 


 If CurrTotal <= Rs("VipLevel1_Num") Then
  Response.write "<b>第1等级</b>，是基础价的<b>" & GetTurnCent(Rs("VipLevel1_Mul")) & "</b>倍"
 ElseIf CurrTotal <= Rs("VipLevel2_Num") Then
  Response.write "<b>第2等级</b>，是基础价的<b>" & GetTurnCent(Rs("VipLevel2_Mul")) & "</b>倍"
 ElseIf CurrTotal <= Rs("VipLevel3_Num") Then
  Response.write "<b>第3等级</b>，是基础价的<b>" & GetTurnCent(Rs("VipLevel3_Mul")) & "</b>倍"
 ElseIf CurrTotal <= Rs("VipLevel4_Num") Then
  Response.write "<b>第4等级</b>，是基础价的<b>" & GetTurnCent(Rs("VipLevel4_Mul")) & "</b>倍"
 ElseIf CurrTotal <= Rs("VipLevel5_Num") Then
  Response.write "<b>第5等级</b>，是基础价的<b>" & GetTurnCent(Rs("VipLevel5_Mul")) & "</b>倍"
 Else
  Response.write "<b>第6等级</b>,是基础价的<b>" & GetTurnCent(Rs("VipLevel6_Mul")) & "</b>倍"
 End If

 
 Response.write "<br>第1等级：" & Rs("VipLevel1_Num") & " 以内，单价：" & GetTurnCent(Rs("VipLevel1_Mul")) & " 倍"
 Response.write "<br>第2等级：" & Rs("VipLevel2_Num") & " 以内，单价：" & GetTurnCent(Rs("VipLevel2_Mul")) & " 倍"
 Response.write "<br>第3等级：" & Rs("VipLevel3_Num") & " 以内，单价：" & GetTurnCent(Rs("VipLevel3_Mul")) & " 倍"
 Response.write "<br>第4等级：" & Rs("VipLevel4_Num") & " 以内，单价：" & GetTurnCent(Rs("VipLevel4_Mul")) & " 倍"
 Response.write "<br>第5等级：" & Rs("VipLevel5_Num") & " 以内，单价：" & GetTurnCent(Rs("VipLevel5_Mul")) & " 倍"
 Response.write "<br>第6等级：" & Rs("VipLevel5_Num") & " 以上，单价：" & GetTurnCent(Rs("VipLevel6_Mul")) & " 倍"
  
 '--CPS价格提示
 If Rs("ClickState")=4 Then
  Response.write "<br>商品获利(CPS)的这里价格是指实现CPS前的每个注册CPA的价格，CPS本身是通过返回商品订单按比例提成的，请在菜单里的[<a href='?Action=orderview'>CPS订单数据</a>]里查看"
 End If
End If
%>
</td>

<td style="width:15%;" class="td_r">移动设备单价：</td>
<td style="width:35%;">
<%
Response.write "为基础或等级单价的 "&GetTurnCent(Rs("Moblie_Mul"))&" 倍"
%>
</td>

</tr>


<tr>
  <td class="td_r">允许投放的设备：</td>
  <td>
<%
If Rs("sitetypeset")=0 Then
 Response.write "全部设备"
Else
 If Instr(Rs("sitetype"),"pc")>0 Then Response.Write "桌面电脑 "
 If Instr(Rs("sitetype"),"ios")>0 Then Response.Write "苹果IOS "
 If Instr(Rs("sitetype"),"android")>0 Then Response.Write "Android "
 If Instr(Rs("sitetype"),"微软WP")>0 Then Response.Write "微软WP "
 If Instr(Rs("sitetype"),"微信")>0 Then Response.Write "微信 "
End If
%>  
</td>
  <td class="td_r">允许的站点类型：</td>
  <td><%		
If Rs("PutSiteClassID")="" Then
 Response.write "全部"
Else
 Response.write Rs("PutSiteClassID")
End If
%></td>
</tr>


<tr>
<td class="td_r">发布范围：</td>
<td>
<%
If Ad_Class=1 Or Ad_Class=2 Then
 If Rs("PutRange")=1 Then
  Response.Write "发布在任何地方让别人点击即可获利，如网站，论坛，QQ"
 ElseIf Rs("PutRange")=2 Then
  Response.Write "在任何网页让别人点击即可获利，如网站，论坛，但发在QQ上无效)"
 ElseIf Rs("PutRange")=3 Then
  Response.Write "广告只能发布在规定网站上才有效，<a href='?Action=putsiteview&ID="&Rs("ID")&"'>查看规定网站列表</a>"
 ElseIf Rs("PutRange")=4 Then
  Response.Write "广告只能发布在自己审核的通过后网站上才有效)"
 ElseIf Rs("PutRange")=5 Then
  Response.Write "只允许指定会员申请，<a href='?Action=putuserview&ID="&Rs("ID")&"'>查看可以投放的会员名称</a>"
 End If
Else
 If Rs("PutRange_2")=1 Then
  Response.Write"只能是有网站的站长可申请"
 ElseIf Rs("PutRange_2")=2 Then
  Response.Write"只能是有网站的站长可申请，且只能发布在站长申请审核后被审核成功的网站上"
 ElseIf Rs("PutRange_2")=3 Then
  Response.Write "广告只能发布在规定网站上才有效，<a href='?Action=putsiteview&ID="&Rs("ID")&"'>查看规定网站列表</a>"
 ElseIf Rs("PutRange_2")=4 Then
  Response.Write "只允许指定会员申请，<a href='?Action=putuserview&ID="&Rs("ID")&"'>查看可以投放的会员名称</a>"
 End If
End If
%>
</td>


<td class="td_r">点击需确认的次数：</td>
<td>
<%
If Rs("AdAffirmTotal")=0 Then
 Response.write "不需确认"
Else
 Response.write Rs("AdAffirmTotal")&"次"
End If
%></td>
</tr>



<%If Rs("AdDesc")<>"" Then%>
<tr>
<td class="td_r">广告说明：</td>
<td colspan="3">
<%
Response.write  Rs("AdDesc")
%>
</td>
</tr>
<%End If%>


</table>