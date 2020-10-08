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
Px=ChkStr(Request("Px"),1):If Px="" Then  Px="ID"
UserID=ChkStr(Request("UserID"),2)
UserName=ChkStr(Request("UserName"),1)
ComVisit=ChkStr(Request("ComVisit"),2)
SpareState=ChkStr(Request("SpareState"),2)
UserTeam=ChkStr(Request("UserTeam"),2)
UserState=ChkStr(Request("UserState"),2)
AgentPower=ChkStr(Request("AgentPower"),2)
QQ=ChkStr(Request("QQ"),1)



PageUrl = "?Action="&Action&"&UserID="&UserID&"&UserName="&UserName&"&ComVisit="&ComVisit&"&UserState="&UserState&"&SpareState="&SpareState&"&UserTeam="&UserTeam&"&AgentPower="&AgentPower&"&QQ="&QQ

Call PxFilter(Px,"ID,UserName,Total_Cent,Spend_Cent,Spare_Cent,AdShowNum,ComVisit,ComReg,UserState,CpcDeDuct_Rate,CpmDeDuct_Rate,UserTeam,AddTime,LastTime,QQ")
%>

<a href="?Action=useradd" class="actionBtn add"><i class="mdi mdi-plus"></i><span>网站主新增</span></a>

<script>
$(function(){

$("#search2").click(function(){
 
 var searchurl = "?Action=<%=Action%>";
 searchurl += '&UserName=' + $('#UserName2').val(); 
 searchurl += '&UserID=' + $('#UserID2').val(); 

 location.href=searchurl;
});

});
</script>
<table class="tb_2">
<tr>
<td>
用户名<input name="UserName" type="text" id="UserName2" value="<%=UserName%>" style="width:80px;">
用户ID<input name="UserID" type="text" id="UserID2" value="<%=UserID%>" style="width:50px;">
<input type="submit" name="search"  id="search2" value="查询" class="btn btn-sm btn-primary"></td>
</tr>
</table>

<%


Sql="Select Count(1) From CFWztg_User"
Set Rs= Conn.Execute(Sql)
UserTotal=Rs(0)


Sql="Select Top 2000 * From CFWztg_User where UserType=1"

 IF UserID<>"" Then Sql=Sql&" And ID="&UserID
 IF UserName<>"" Then Sql=Sql&" And UserName = '"&UserName&"'"
 IF ComVisit<>"" Then Sql=Sql&" And ComVisit>="&ComVisit
 IF UserTeam<>"" Then Sql=Sql&" And UserTeam="&UserTeam
 IF UserState<>"" Then Sql=Sql&" And UserState="&UserState
 IF SpareState="0" Then Sql=Sql&" And Spare_Cent=0"
 IF SpareState="1" Then Sql=Sql&" And Spare_Cent>0"
 IF AgentPower<>"" Then Sql=Sql&" And AgentPower="&AgentPower
 IF QQ<>"" Then Sql=Sql&" And QQ = '"&QQ&"'"

Sql=Sql&" Order By "&Px&" Desc"


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


<form name="form_userlist" id="form_userlist" method="post" action="../../AdminUser.aspx?Action=userseldel">
<table class="tb_1">
<tr class="tr_1"> 
<td><input name="chkall" type="checkbox" id="chkall" onclick="selectcheckbox(this.form)" value="check"></td>
<td><a href="<%=PageUrl%>&Px=ID">用户ID</a></td>
<td><a href="<%=PageUrl%>&Px=UserName">网站主</a></td>
<td><a href="<%=PageUrl%>&Px=Total_Cent">总收入</a></td>
<td><a href="<%=PageUrl%>&Px=Spare_Cent">未结算</a></td>
<td><a href="<%=PageUrl%>&Px=AdShowNum">显示</a></td>
<td><a href="<%=PageUrl%>&Px=ComVisit">点击</a></td>
<td><a href="<%=PageUrl%>&Px=ComReg">注册</a></td>
<td><a href="<%=PageUrl%>&Px=UserState">状态</a></td>
<td><a href="<%=PageUrl%>&Px=CpcDeDuct_Rate">cpc扣点</a></td>
<td><a href="<%=PageUrl%>&Px=CpmDeDuct_Rate">cpv扣点</a></td>
<td><a href="<%=PageUrl%>&Px=UserTeam">分组</a></td>
<td><a href="<%=PageUrl%>&Px=QQ">QQ号码</a></td>
<td><a href="<%=PageUrl%>&Px=AddTime">注册时间</a></td>
<td><a href="<%=PageUrl%>&Px=LastTime">最后更新</a></td>
<td><a href="javascript:;">操作</a></td>
<tr class="tr_2">

<%
While Not Rs.Eof And MyPageSize>0
%>
<tr class="tr_2"> 
<td> 
<%
If rs("UserName")<>"mytest" Then
Response.write "<input name='UserName_Sel' type='checkbox' id='UserName_Sel' value='"&rs("UserName")&"'>"
End If
%>
</td>
<td><%=Rs("ID")%></td>
<td><%=Rs("UserName")%></td>
<td><%=GetTurnCent(Rs("Total_Cent"))%>元</td>
<td><%=GetTurnCent(Rs("Spare_Cent"))%>元</td>
<td><%=Rs("AdShowNum")%></td>
<td><%=Rs("ComVisit")%></td>
<td><%=Rs("ComReg")%></td>
<td>
         
<%
If Rs("UserState")=0 Then
Response.Write "无效"
ElseIf Rs("UserState")=1 Then
Response.Write "有效"
ElseIf Rs("UserState")=2 Then
Response.Write "邮件审核中"
ElseIf Rs("UserState")=3 Then
Response.Write "管理员审核中"
End If
%>
</td>
<td><%=Rs("CpcDeDuct_Rate")%>%</td>
<td><%=Rs("CpmDeDuct_Rate")%>%</td>
<td><%=Rs("UserTeam")%></td>
<td><a href="http://wpa.qq.com/msgrd?v=3&uin=<%=Rs("QQ")%>&site=qq&menu=yes" target="_blank"><%=Rs("QQ")%></a></td>
<td title="<%=Rs("AddTime")%>"><%=Year(Rs("AddTime"))&"-"&Month(Rs("AddTime"))&"-"&Day(Rs("AddTime"))%></td>
<td title="<%=Rs("LastTime")%>"><%=Year(Rs("LastTime"))&"-"&Month(Rs("LastTime"))&"-"&Day(Rs("LastTime"))%></td>
<td>
<a href="?Action=usermodify&UserName=<%=rs("UserName")%>" class="btn_edit"><i class="mdi mdi-pencil"></i>修改</a>

<%If rs("UserName")<>"mytest" Then%>
<a href="javascript:;" onclick="$(function () { confirm('删除前请确定此用户没有剩余金额，确定要删除吗?', '', function (isConfirm) {if (isConfirm) {gotoUrl('../../AdminUser.aspx?Action=userdel&UserName=<%=Rs("UserName")%>')}}, {confirmButtonText: '确定', cancelButtonText: '取消', width: 400});});" class="btn_del"><i class="mdi mdi-window-close"></i>删除</a>
<%End If%>

<a href="?Action=usergo&UserName=<%=rs("UserName")%>" target="_blank" class="btn_add"><i class="mdi mdi-eye"></i> 查看</a>
</td>

</tr>
<%
Rs.MoveNext
MyPageSize=MyPageSize-1
Wend
Rs.Close
%>
</table>

</form>

<a href="javascript:;" onclick="$(function () { confirm('你确定要删除选择的记录吗?', '', function (isConfirm) {if (isConfirm) {$('#form_userlist').submit();}}, {confirmButtonText: '确定', cancelButtonText: '取消', width: 400});});" class="btn btn-xs btn-danger"><i class="mdi mdi-window-close"></i>删除选择</a>


<%
Call ShowPage(TotalRs,TotalPage,Page,PageUrl,Px)
%>
        
  
<script>
$(function(){

$("#search").click(function(){

 if(isNaN($('#UserID').val())){
  alert('用户ID请输入数字', '', function () {$("#UserID").focus();});
  return false
 }

 if(isNaN($('#ComVisit').val())){
  alert('最少点击数请输入数字', '', function () {$("#ComVisit").focus();});
  return false
 }

 var searchurl ="?Action=<%=Action%>";
 searchurl += '&UserID=' + $('#UserID').val();
 searchurl += '&UserName=' + $('#UserName').val();
 searchurl += '&ComVisit=' + $('#ComVisit').val();
 searchurl += '&SpareState=' + $('#SpareState').val(); 
 searchurl += '&UserTeam=' + $('#UserTeam').val();
 searchurl += '&UserState=' + $('#UserState').val();
 searchurl += '&AgentPower=' + $('#AgentPower').val();
 searchurl += '&QQ=' + $('#QQ').val();

 location.href=searchurl;
});

});

</script> 

<table class="tb_3"><tr class="tr_1"> 
<td colspan="2">查询</td>
</tr>  
<tr>
<td class="td_r" width="90">用户ID：</td>
<td><input name="UserID" type="text" id="UserID" value="<%=UserID%>"></td>
</tr>    
<tr>
<td class="td_r">网站主：</td>
<td><input name="UserName" type="text" id="UserName" value="<%=UserName%>"></td>
</tr>
<tr>
<td class="td_r">最少点击数：</td>
<td><input name="ComVisit" type="text" id="ComVisit" value="<%=ComVisit%>"></td>
</tr>    
<tr>
<td class="td_r">剩余金额：</td>
<td><select name="SpareState" id="SpareState">
<option value=""<%If CStr(SpareState)="" Then Response.write " selected"%>>全部</option>
<option value="1"<%If CStr(SpareState)="1" Then Response.write " selected"%>>大于0</option>
<option value="0"<%If CStr(SpareState)="0" Then Response.write " selected"%>>等于0</option>
</select></td>
</tr>  	
<tr>
<td class="td_r">用户分组：</td>
<td><select name="UserTeam" id="UserTeam">
<option value=""<%If CStr(UserTeam)="" Then Response.write " selected"%>>全部</option>
<option value="1"<%If CStr(UserTeam)="1" Then response.write" selected"%>>分组1</option>
<option value="2"<%If CStr(UserTeam)="2" Then response.write" selected"%>>分组2</option>
<option value="3"<%If CStr(UserTeam)="3" Then response.write" selected"%>>分组3</option>
<option value="4"<%If CStr(UserTeam)="4" Then response.write" selected"%>>分组4</option>
</select></td>
</tr>
<tr>
<td class="td_r">帐号状态：</td>
<td><select name="UserState" id="UserState">
<option value=""<%If CStr(UserState)="" Then Response.write " selected"%>>全部</option>
<option value="0"<%If CStr(UserState)="0" Then Response.write " selected"%>>无效</option>
<option value="1"<%If CStr(UserState)="1" Then Response.write " selected"%>>有效</option>
<option value="2"<%If CStr(UserState)="2" Then Response.write " selected"%>>邮件审核中</option>
<option value="3"<%If CStr(UserState)="3" Then Response.write " selected"%>>管理员审核中</option>
</select></td>
</tr>
 
<tr>
<td class="td_r">代理权限：</td>
<td><select name="AgentPower" id="AgentPower">
<option value=""<%If CStr(AgentPower)="" Then Response.write " selected"%>>全部</option>
<option value="1"<%If CStr(AgentPower)="1" Then Response.write " selected"%>>等待审核</option>
<option value="2"<%If CStr(AgentPower)="2" Then Response.write " selected"%>>审核成功</option>
<option value="3"<%If CStr(AgentPower)="3" Then Response.write " selected"%>>审核失败</option>
</select></td>
</tr>
<tr>
<td class="td_r">QQ号：</td>
<td><input name="QQ" type="text" id="QQ" value="<%=QQ%>"></td>
</tr>

<tr>
<td></td>
<td><input type="submit" name="submit" value="查询" class="btn btn-sm btn-primary" id="search"></td>
</tr>
</table>
