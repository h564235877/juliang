<%
'乘风广告联盟系统 Sql版
'作者QQ：178575
'作者EMail：yliangcf@163.com
'作者网站：http://www.qqcf.com
'详细简介：http://www.qqcf.com/cfwztg.htm
'上面有程序在线演示，安装演示，使用疑难解答，最新版本下载等内容
'因为这些内容可能时常更新，就没有放在程序里，请自己上网站查看
%>

<table class="tb_2">
<tr>
<td><span class="title">拒绝通过审核的广告</span></td>
</tr>
</table>

<form name="form_adlist" id="form_adlist" method="post" action="">
<table class="tb_1">
<tr class="tr_1">
<td><input name="chkall" type="checkbox" id="chkall" onclick="selectcheckbox(this.form)" value="check"></td>
<td>广告</td>
<td>广告主</td>
<td>广告类型</td>
<td>单价</td>
<td>完成投放</td>
<td>扣点率</td>
<td>列表显示</td>
<td>轮循组</td>
<td>计费模式</td>
<td>操作</td>
</tr>
<%
PageUrl = "?Action="&Action

Sql="Select * From CFWztg_AD where AdState=3 Order By ID Desc"

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
<td> 
<%
Response.write "<input name='ID_Sel' type='checkbox' id='ID_Sel' value='"&rs("ID")&"'>"
%>
</td>
<td><%=Rs("AdName")&"["&Rs("ID")&"]"%></td>
<td><%=Rs("AdUserName")%></td>
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
<td><%=GetTurnCent(Rs("Unit_Cent"))%>元</td>
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
%>
</td>
<td>
<a href="?Action=admodify&ID=<%=Rs("ID")%>" class="btn_edit"><i class="mdi mdi-pencil"></i>修改</a>

<a href="javascript:;" onclick="$(function () { confirm('你确定要删除吗?', '', function (isConfirm) {if (isConfirm) {gotoUrl('../../AdminUser.aspx?Action=addel&ID=<%=Rs("ID")%>')}}, {confirmButtonText: '确定', cancelButtonText: '取消', width: 400});});" class="btn_del"><i class="mdi mdi-window-close"></i>删除</a>

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

<a href="javascript:;" onclick="$(function () { confirm('确定要删除选择的这些广告吗?', '', function (isConfirm) {if (isConfirm) {$('#form_adlist').attr('action','../../AdminUser.aspx?Action=adseldel');$('#form_adlist').submit();}}, {confirmButtonText: '确定', cancelButtonText: '取消', width: 400});});" class="btn btn-xs btn-danger"><i class="mdi mdi-window-close"></i>删除选择</a>

<%
Call ShowPage(TotalRs,TotalPage,Page,PageUrl,Px)
%>
