<%
'乘风广告联盟系统 Sql版
'作者QQ：178575
'作者EMail：yliangcf@163.com
'作者网站：http://www.qqcf.com
'详细简介：http://www.qqcf.com/cfwztg.htm
'上面有程序在线演示，安装演示，使用疑难解答，最新版本下载等内容
'因为这些内容可能时常更新，就没有放在程序里，请自己上网站查看
%>
<script>
$(function(){

function NoticUser_0(){
$("#t_NoticUser").hide();
}

function NoticUser_1(){
$("#t_NoticUser").show();
}

NoticUser_0();

$("#NoticUser_0").click(function(){NoticUser_0();});
$("#NoticUser_1").click(function(){NoticUser_1();});

});

</script> 

<a href="<%=ChkStr(Request.ServerVariables("Http_Referer"),1)%>" class="actionBtn"><i class="mdi mdi-keyboard-return"></i>返回列表</a>
<table class="tb_1">
<tr class="tr_1"> 
<td colspan="2">修改网站主信息
<%
UserName=Chkstr(Request("UserName"),1)
Set Rs = Server.CreateObject("ADODB.Recordset")
Sql="Select * From CFWztg_User where UserName='"&UserName&"' and UserType=1"
Rs.open Sql,Conn,1,1
If Rs.Eof Then
 Response.write "记录不存在"
 Response.End
End If
%>
</td>
</tr>
<form name="form4" method="post" action="../../AdminUser.aspx?Action=usermodifysave&UserName=<%=UserName%>&UserState_Old=<%=Rs("UserState")%>&RefUrl=<%=Server.URLEncode(Request.ServerVariables("Http_Referer"))%>">
<tr> 
<td style="width:20%" class="td_r">网站主：</td>
<td><%=Rs("UserName")%></td>
</tr>
<tr> 
<td class="td_r">登陆次数：</td>
<td><%=Rs("Logintotal")%></td>
</tr>
<tr> 
<td class="td_r">最后登陆时间：</td>
<td><%=Rs("LastLoginTime")%></td>
</tr>
<tr> 
<td class="td_r">最后登陆IP：</td>
<td><%=Rs("LastLoginIp")%></td>
</tr>
<tr> 
<td class="td_r">Email：</td>
<td><%=Rs("EMail")%></td>
</tr>
<tr> 
<td class="td_r">QQ：</td>
<td><%=Rs("QQ")%></td>
</tr>
<tr> 
<td class="td_r">联系电话：</td>
<td><%=Rs("Phone")%></td>
</tr>
<tr> 
<td class="td_r">手机：</td>
<td><%=Rs("Mobile")%></td>
</tr>
<tr> 
<td class="td_r">网站网址：</td>
<td><%If Rs("WebSite")<>"" Then Response.write "<a href="&Rs("WebSite")&" target=_blank>"&Rs("WebSite")&"</a>"%></td>
</tr>

<tr> 
<td class="td_r">注册时间：</td>
<td><%=Rs("AddTime")%></td>
</tr>

<tr class="tr_1"> 
<td colspan="2">用户的汇款方式如下</td>
</tr>
<tr> 
<td class="td_r">真实姓名：</td>
<td><input name="Pay_RealName" type="text" id="Pay_RealName" value="<%=Rs("Pay_RealName")%>"></td>
</tr>
<tr> 
<%if Rs("Pay_Type")="" Then%>
<tr> 
<td  class="td_r"></td>
<td>没有填写汇款方式</td>
</tr>
<%Elseif Rs("Pay_Type")="alipay" Then%>
<tr> 
<td class="td_r">支付宝账号：</td>
<td><%=rs("Pay_Account")%></td>
</tr>
<%Elseif Rs("Pay_Type")="tenpay" Then%>
<tr> 
<td class="td_r">QQ财付通账号：</td>
<td><%=rs("Pay_Account")%></td>
</tr>
<%Else%>
<tr> 
<td class="td_r">开户银行：</td>
<td>
<%
if Rs("Pay_Type")="boc" Then
Response.write "中国银行"
Elseif Rs("Pay_Type")="abc" Then
Response.write "农业银行"
Elseif Rs("Pay_Type")="icbc" Then
Response.write "工商银行"
Elseif Rs("Pay_Type")="ccb" Then
Response.write "建设银行"
Elseif Rs("Pay_Type")="cmb" Then
Response.write "招商银行"
Elseif Rs("Pay_Type")="otherbank" Then
Response.write "其它银行"
End If
%></td>
</tr>
<tr> 
<td class="td_r">银行卡号：</td>
<td><%=rs("Pay_Account")%></td>
</tr>
	
<tr> 
<td class="td_r">开户银行：</td>
<td><%=rs("Pay_BankAddress")%></td>
</tr>
<%End If%>


<tr class="tr_1"> 
<td colspan="2">所属客服</td>
</tr>

<tr> 
<td class="td_r">修改客服名下:</td>

<td>
<%
Sql="Select * From CFWztg_User where UserType=3 And UserState=1"
Set Rs2=Conn.Execute(Sql)
If Not Rs2.Eof Then
Response.write "<select name='upusername' id='upusername'>"
Response.write "<option selected value=''>不选择任何客服</option>"
While Not Rs2.Eof
 Response.write "<option value='"&Rs2("UserName")&"'"
 If Rs2("UserName")=Rs("UpUserName") Then Response.write " selected"
 Response.write ">客服名:"&Rs2("UserName")&",呢称:"&Rs2("UserNick")&",真实姓名:"&Rs2("Pay_RealName")&"</option>"
Rs2.MoveNext
Wend
Response.write "</select>"
Rs2.Close
Else
 Response.write "暂时没有有效客服选择"
End If
%></td>
    </tr>

    
<tr class="tr_1"> 
<td colspan="2">修改以下信息</td>
</tr>
<tr> 
<td class="td_r">用户等级：</td>
<td><select name="UserLevel" id="UserLevel">
<option value="1"<%If Rs("UserLevel")=1 Then response.write " selected"%>>等级1</option>
<option value="2"<%If Rs("UserLevel")=2 Then response.write " selected"%>>等级2</option>
<option value="3"<%If Rs("UserLevel")=3 Then response.write " selected"%>>等级3</option>
<option value="4"<%If Rs("UserLevel")=4 Then response.write " selected"%>>等级4</option>
<option value="5"<%If Rs("UserLevel")=5 Then response.write " selected"%>>等级5</option>
<option value="6"<%If Rs("UserLevel")=6 Then response.write " selected"%>>等级6</option>
</select>(默认是1，可以在广告中等级越高的价格越高)</td>
<tr> 
<td class="td_r">用户分组：</td>
<td><select name="UserTeam" id="UserTeam">
<option value="0"<%If Rs("UserTeam")=0 Then response.write " selected"%>>分组0</option>
<option value="1"<%If Rs("UserTeam")=1 Then response.write " selected"%>>分组1</option>
<option value="2"<%If Rs("UserTeam")=2 Then response.write " selected"%>>分组2</option>
<option value="3"<%If Rs("UserTeam")=3 Then response.write " selected"%>>分组3</option>
<option value="4"<%If Rs("UserTeam")=4 Then response.write " selected"%>>分组4</option>
</select>(默认是1，在广告投放位置和投放隐藏的广告设置有关)</td>
</tr>
<tr>
<td class="td_r">用户状态：</td>
<td>
<select name="UserState" id="UserState">
<option value="0"<%If Rs("UserState")=0 Then response.write " selected"%>>无效</option>
<option value="1"<%If Rs("UserState")=1 Then response.write " selected"%>>有效</option>
<option value="2"<%If Rs("UserState")=2 Then response.write " selected"%>>邮件审核中</option>
<option value="3"<%If Rs("UserState")=3 Then response.write " selected"%>>管理员审核中</option>
</select></td>
</tr>
<td class="td_r">代理权限：</td>
<td><select name="AgentPower" id="AgentPower">
<option value="1"<%If Rs("AgentPower")=1 Then response.write " selected"%>>等待审核</option>
<option value="2"<%If Rs("AgentPower")=2 Then response.write " selected"%>>审核成功</option>
<option value="3"<%If Rs("AgentPower")=3 Then response.write " selected"%>>审核失败</option>		  
</select></td>
</tr>

<tr class="tr_1"> 
<td colspan="2">修改扣点率</td>
</tr>   
<tr> 
<td class="td_r">CPC扣点比率：</td>
<td><input name="CpcDeDuct_Rate" type="text" id="CpcDeDuct_Rate" value="<%=Rs("CpcDeDuct_Rate")%>">
%(0-100之间，0为不扣点，100为扣除全部点数) <br>
注：这里扣的点归管理员所得，比如此用户扣点率为20%，设置这个以后此网站主每点击的获利20%将归管理员所得。</td>
</tr>
<tr> 
<td class="td_r">CPV扣点比率：</td>
<td><input name="CpmDeDuct_Rate" type="text" id="CpmDeDuct_Rate" value="<%=Rs("CpmDeDuct_Rate")%>">
%(0-100之间，0为不扣点，100为扣除全部点数)</td>
</tr>
<tr> 
<td class="td_r">CPA扣点比率：</td>
<td><input name="CpaDeDuct_Rate" type="text" id="CpaDeDuct_Rate" value="<%=Rs("CpaDeDuct_Rate")%>">
%(0-100之间，0为不扣点，100为扣除全部点数)</td>
</tr>
<tr> 
<td class="td_r">CPS扣点比率：</td>
<td><input name="CpsDeDuct_Rate" type="text" id="CpsDeDuct_Rate" value="<%=Rs("CpsDeDuct_Rate")%>">
%(0-100之间，CPS扣点是按订单的数量扣除)。</td>
</tr>

    
<tr class="tr_1"> 
<td colspan="2">修改密码和密保</td>
</tr>
<tr> 
<td class="td_r">修改为新密码：</td>
<td><input name="Pwd_New" type="text" id="Pwd_New">
(留空则原密码不会被修改)</td>
</tr>
<tr> 
<td class="td_r">修改为新密码找回答案：</td>
<td><input name="PwdAnswer_New" type="text" id="PwdAnswer_New">
(留空则原密码找回答案不会被修改)</td>
</tr>

<tr class="tr_1"> 
<td colspan="2">修改管理员备注</td>
</tr>
<tr> 
<td class="td_r">管理员备注：</td>
<td><textarea name="AdminDesc" cols="30" rows="5" id="AdminDesc"><%=Rs("AdminDesc")%></textarea></td>
</tr>


<tr class="tr_1"> 
<td colspan="2">加钱或扣钱</td>
</tr>    
<tr id="a_1"> 
<td class="td_r">用户总收入：</td>
<td><%=GetTurnCent(Rs("Total_Cent"))%>元</td>
</tr>
<tr id="a_2"> 
<td class="td_r">剩余没有结算：</td>
<td><%=GetTurnCent(Rs("Spare_Cent"))%>元</td>
</tr>
<tr id="a_3"> 
<td class="td_r">加或扣多少钱：</td>
<td>
<input name="Deduct_Cent" type="text">
        元(正数则为用户加钱，负数则为用户减钱，留空则不进行扣或加钱操作,这里扣的钱归管理员所得)</td>
</tr>
<tr id="a_4"> 
<td class="td_r">留言通知用户：</td>
<td><input type="radio" name="NoticUser" id="NoticUser_1" value="1">
是 
<input type="radio" name="NoticUser" id="NoticUser_0" value="0" checked>
否</td>
</tr>
<tr id="t_NoticUser"> 
<td class="td_r">留言内容：</td>
<td><textarea name="Gbook" cols="30" rows="5"></textarea></td>
</tr>
<tr class="tr_1"> 
<td colspan="2">转换用户身份</td>
</tr>    
<tr id="a_1"> 
<td class="td_r">用户类型：</td>
<td>
<input type="radio" name="UserType" value="1"<%If Rs("UserType")=1 Then Response.write " checked"%>>网站主
<%If UserName<>"mytest" Then%>
<input type="radio" name="UserType" value="2"<%If Rs("UserType")=2 Then Response.write " checked"%>>广告主
<input type="radio" name="UserType" value="3"<%If Rs("UserType")=3 Then Response.write " checked"%>>客服
<input type="radio" name="UserType" value="4"<%If Rs("UserType")=4 Then Response.write " checked"%>>商务
<%End If%>
（注:慎重修改，修改用户类型原身份后台和功能不能再使用，使用新身份后台和功能，且不能恢复原身份）
</td>
</tr>
<tr> 
<td>&nbsp;</td>
<td>
<input type="submit" name="submit" value="修改" class="btn btn-primary">

</td>
</tr>
</form>


</table>