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
Plan_ID=CInt(ChkStr(Request("Plan_ID"),2))
Px = ChkStr(Request("Px"),1):If Px="" Then Px="addtime"
PageUrl = "?Action="&Action&"&Plan_ID="&Plan_ID

Call PxFilter(Px,"ID,AdUserName,Plan_ID,Ad_Class,Unit_Cent_First,OverClick_Cent,AdDeDuct_Rate,AdListShowState,Weight,CycState,ClickState,AddTime")

Sql = "Select a.*,b.planname From CFWztg_AD a inner join CFWztg_Plan b on a.Plan_ID=b.ID where a.AdState=2 And b.PlanState=2 And a.Plan_ID=" & Plan_ID
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

%>

<a href="?Action=planlist" class="actionBtn"><i class="mdi mdi-keyboard-return"></i>返回列表</a>

<table class="tb_2">
<tr>
<td><span class="title">广告计划 <%=Rs("planname")%>[<%=Plan_ID%>] 下的正在运行的广告<a name="adnav" id="adnav"></a></span></td>
</tr>
</table>


<form name="form_adlist" id="form_adlist" method="post" action="">
<table class="tb_1">
<tr class="tr_1">
<td><input name="chkall" type="checkbox" id="chkall" onclick="selectcheckbox(this.form)" value="check"></td>
<td><a href="<%=PageUrl%>&Px=ID">广告</a></td>
<td><a href="<%=PageUrl%>&Px=Ad_Class">广告类型</a></td>
<td><a href="<%=PageUrl%>&Px=Unit_Cent_First">单价</a></td>
<td><a href="<%=PageUrl%>&Px=OverClick_Cent">完成</a></td>
<td><a href="<%=PageUrl%>&Px=AdDeDuct_Rate">扣点率</a></td>
<td><a href="<%=PageUrl%>&Px=AdListShowState">列表</a></td>
<td><a href="<%=PageUrl%>&Px=Weight">权重</a></td>
<td><a href="<%=PageUrl%>&Px=CycState">轮循</a></td>
<td><a href="<%=PageUrl%>&Px=ClickState">计费模式</a></td>
<td>操作</td>
</tr>
 
<%
While Not Rs.Eof And MyPageSize>0
%>
<tr class="tr_2">
<td> 
<%
Response.write "<input name='ID_Sel' type='checkbox' id='ID_Sel' value='"&rs("ID")&"'>"
%>
</td>
<td><%=Rs("AdName")&"["&Rs("ID")&"]"%></td>
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
<td><%=Rs("AdDeDuct_Rate")%>%</td>
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
<a href="?Action=admodify&ID=<%=Rs("ID")%>" class="btn_edit"><i class="mdi mdi-pencil"></i>修改</a>

<a href="javascript:;" onclick="$(function () { confirm('确定要管理员暂停这个广告吗?', '', function (isConfirm) {if (isConfirm) {gotoUrl('../../AdminUser.aspx?Action=adstop&ID=<%=Rs("ID")%>')}}, {confirmButtonText: '确定', cancelButtonText: '取消', width: 400});});" class="btn_del"><i class="mdi mdi-stop"></i>暂停</a>

<a href="javascript:;" onclick="$(function () { confirm('确定要删除这个广告吗?', '', function (isConfirm) {if (isConfirm) {gotoUrl('../../AdminUser.aspx?Action=addel&ID=<%=Rs("ID")%>')}}, {confirmButtonText: '确定', cancelButtonText: '取消', width: 400});});" class="btn_del"><i class="mdi mdi-window-close"></i>删除</a>

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
</form>

<a href="javascript:;" onclick="$(function () { confirm('确定要暂停选择的这些广告吗?', '', function (isConfirm) {if (isConfirm) {$('#form_adlist').attr('action','../../AdminUser.aspx?Action=adselstop');$('#form_adlist').submit();}}, {confirmButtonText: '确定', cancelButtonText: '取消', width: 400});});" class="btn btn-xs btn-danger"><i class="mdi mdi-stop"></i>暂停选择</a>

<a href="javascript:;" onclick="$(function () { confirm('确定要删除选择的这些广告吗?', '', function (isConfirm) {if (isConfirm) {$('#form_adlist').attr('action','../../AdminUser.aspx?Action=adseldel');$('#form_adlist').submit();}}, {confirmButtonText: '确定', cancelButtonText: '取消', width: 400});});" class="btn btn-xs btn-danger"><i class="mdi mdi-window-close"></i>删除选择</a>

<%
Call ShowPage(TotalRs,TotalPage,Page,PageUrl,Px)
%>
