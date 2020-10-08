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
AdUserName=ChkStr(Request("AdUserName"),1)

Set Rs = Server.CreateObject("ADODB.Recordset")
Sql="Select * From CFWztg_User where UserName='"&AdUserName&"' and UserType=2"
Rs.open Sql,Conn,1,1
If Rs.Eof Then
 Response.write "记录不存在"
 Response.End
End If
%>

<a href="<%=ChkStr(Request.ServerVariables("Http_Referer"),1)%>" class="actionBtn"><i class="mdi mdi-keyboard-return"></i>返回列表</a>

<form name="form4" method="post" action="../../AdminUser.aspx?Action=adusermodifysave&AdUserName=<%=AdUserName%>&RefUrl=<%=Server.URLEncode(Request.ServerVariables("Http_Referer"))%>">

<table class="tb_1">
<tr class="tr_1"> 
<td colspan="2">修改广告主信息</td>
</tr>

<tr> 
<td width="260" class="td_r">用户名：</td>
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
<td class="td_r">帐号状态：</td>
<td><select name="UserState" id="UserState">
<option value="0"<%If Rs("UserState")=0 Then response.write" selected"%>>无效</option>
<option value="1"<%If Rs("UserState")=1 Then response.write" selected"%>>有效</option>
<option value="2"<%If Rs("UserState")=2 Then response.write" selected"%>>邮件审核中</option>
<option value="3"<%If Rs("UserState")=3 Then response.write" selected"%>>管理员审核中</option>
</select></td>
</tr>
<tr> 
<td class="td_r">注册时间：</td>
<td><%=Rs("AddTime")%></td>
</tr>

<tr class="tr_1"> 
<td colspan="2">所属商务</td>
</tr> 
<tr> 
<td class="td_r">修改商务名下:</td>
<td>
<%
Sql="Select * From CFWztg_User where UserType=4 And UserState=1"
Set Rs2=Conn.Execute(Sql)
If Not Rs2.Eof Then
Response.write "<select name='upusername' id='upusername'>"
Response.write "<option selected value=''>不选择任何商务</option>"
While Not Rs2.Eof
 Response.write "<option value='"&Rs2("UserName")&"'"
 If Rs2("UserName")=Rs("UpUserName") Then Response.write " selected"
 Response.write ">商务名:"&Rs2("UserName")&",呢称:"&Rs2("UserNick")&",真实姓名:"&Rs2("Pay_RealName")&"</option>"
Rs2.MoveNext
Wend
Response.write "</select>"
Rs2.Close
Else
 Response.write "暂时没有有效商务选择"
End If
%>
</td>
</tr>

<tr class="tr_1"> 
<td colspan="2">修改密码和密保</td>
</tr>
<tr>
<td class="td_r">修改为新密码：</td>
<td><input name="Pwd_New" type="text" id="Pwd_New">(留空则原密码不会被修改)</td>
</tr>
<tr> 
<td class="td_r">修改为新密码找回答案：</td>
<td><input name="PwdAnswer_New" type="text" id="PwdAnswer_New">(留空则原密码找回答案不会被修改)</td>
</tr>
    
<tr class="tr_1"> 
<td colspan="2">修改分成</td>
</tr>   
<tr>
<td class="td_r">CPS导入订单时网站主分得的利润比例：</td>
<td><input name="UserCpsGainRate" type="text" id="UserCpsGainRate" value="<%=Rs("UserCpsGainRate")%>">%(默认值100，针对下线的订单提成，数值填写0-100之间)</td>
</tr>

<tr>
<td class="td_r">CPS导入订单时网站主分得的利润比例：</td>
<td><input name="UserCpsGainRate_2" type="text" id="UserCpsGainRate_2" value="<%=Rs("UserCpsGainRate_2")%>">%(默认值100，针对自己的订单提成，数值填写0-100之间)</td>
</tr>

<tr class="tr_1"> 
<td colspan="2">修改扣点率</td>
</tr>   
<tr>
<td class="td_r">CPS扣点率：</td>
<td><input name="UserCpsDeDuctRate" type="text" id="UserCpsDeDuctRate" value="<%=Rs("UserCpsDeDuctRate")%>">%(默认值0，扣除用户的，数值填写0-100之间，0为不扣，100扣全部)</td>
</tr>

<tr>
<td class="td_r">CPS的在多少天数有效：</td>
<td><input name="UserCpsEffectDay" type="text" id="UserCpsEffectDay" value="<%=Rs("UserCpsEffectDay")%>">(默认值无限制天数，-1表示不限制在所有天数有效，其它天数填写正数)</td>
</tr>
	
<tr class="tr_1"> 
<td colspan="2">修改其它</td>
</tr>   
<tr> 
<td class="td_r">点击类广告需确认时是否进行参数验证：</td>
<td>
<input type="radio" name="AdAfiirmCheckOpen" value="1"<%If Rs("AdAfiirmCheckOpen")=1 Then Response.write " checked"%>>是 
<input type="radio" name="AdAfiirmCheckOpen" value="0"<%If Rs("AdAfiirmCheckOpen")=0 Then Response.write " checked"%>>否　*默认为否
</td>
</tr>
	
<tr class="tr_1"> 
<td colspan="2">修改管理员备注</td>
</tr>
<tr> 
<td class="td_r">管理员备注：</td>
<td><textarea name="AdminDesc" cols="60" rows="5" id="AdminDesc"><%=Rs("AdminDesc")%></textarea></td>
</tr>

<tr> 
<td></td>
<td><input type="submit" name="Submit5" value="修改" class="btn btn-primary"></td>
</tr>
</table>
</form>