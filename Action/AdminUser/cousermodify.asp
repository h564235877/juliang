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
<%
CoUserName=Chkstr(Request("CoUserName"),1)
Set Rs = Server.CreateObject("ADODB.Recordset")
Sql="Select * From CFWztg_User where UserName='"&CoUserName&"' and UserType=4"


Rs.open Sql,Conn,1,1
If Rs.Eof Then
 Response.write "记录不存在"
 Response.End
End If
%>

<a href="<%=ChkStr(Request.ServerVariables("Http_Referer"),1)%>" class="actionBtn"><i class="mdi mdi-keyboard-return"></i>返回列表</a>

<table class="tb_1">
  <tr class="tr_1"> 
    <td colspan="2">修改商务信息

    </td>
  </tr>
  <form name="form4" method="post" action="../../AdminUser.aspx?Action=cousermodifysave&CoUserName=<%=CoUserName%>&RefUrl=<%=Server.URLEncode(Request.ServerVariables("Http_Referer"))%>">
    <tr> 
      <td style="width:20%" class="td_r">商务名：</td>
      <td><%=Rs("UserName")%></td>
    </tr>
    <tr> 
      <td class="td_r">商务呢称：</td>
      <td><input name="UserNick" type="text" id="UserNick" value="<%=Rs("UserNick")%>"></td>
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
      <td><%=Rs("LastLoginIp")%> </td>
    </tr>
    <tr> 
      <td class="td_r">Email：</td>
      <td><%=Rs("EMail")%></td>
    </tr>
    <tr> 
      <td class="td_r">QQ：</td>
      <td><input name="QQ" type="text" id="QQ" value="<%=Rs("QQ")%>"></td>
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
%>      
      </td>
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
      <td colspan="2">修改用户状态</td>
    </tr>
    <tr> 
      <td class="td_r">用户状态：</td>
      <td>
<select name="UserState" id="UserState">
<option value="0"<%If Rs("UserState")=0 Then response.write " selected"%>>无效</option>
<option value="1"<%If Rs("UserState")=1 Then response.write " selected"%>>有效</option>
<option value="2"<%If Rs("UserState")=2 Then response.write " selected"%>>邮件审核中</option>
<option value="3"<%If Rs("UserState")=3 Then response.write " selected"%>>管理员审核中</option>
</select>
		</td>
    </tr>
    
    <tr class="tr_1"> 
      <td colspan="2">修改回扣率</td>
    </tr> 
	<tr> 
      <td class="td_r">提成率：</td>
      <td><input name="UserTcRate" type="text" id="UserTcRate" value="<%=Rs("UserTcRate")%>">
        %(0-100之间，0为不得回扣，100为得和广告主相同收入)</td>
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
      <td><textarea name="AdminDesc" cols="60" rows="5" id="AdminDesc"><%=Rs("AdminDesc")%></textarea></td>
    </tr>

    <tr id="a_1"> 
      <td class="td_r">用户总收入：</td>
      <td><%=GetTurnCent(Rs("Total_Cent"))%>元</td>
    </tr>
    <tr id="a_2"> 
      <td class="td_r">剩余没有结算：</td>
      <td><%=GetTurnCent(Rs("Spare_Cent"))%>元</td>
    </tr>
    
    <tr class="tr_1"> 
      <td colspan="2">加钱或扣钱</td>
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
      <td><textarea name="Gbook" cols="60" rows="5"></textarea></td>
    </tr>
    <tr> 
      <td>&nbsp;</td>
      <td>
	  <input type="submit" name="submit" value="修改" class="btn btn-sm btn-primary">

	  </td>
    </tr>
  </form>
  

</table>