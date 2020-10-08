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
Sql="Select AdUserName,PayMoney From CFWztg_AdUser_OnlinePay Where PayOk=0 And OrderCode='"&OrderCode&"'"
Set Rs= Conn.Execute(Sql)
If Rs.Eof Then
 Rs.Close
 Response.write "定单不存在或已经充值过"
 Response.End
Else
 AdUserName=Rs("AdUserName")
 PayMoney=Rs("PayMoney")
 Rs.Close
End If

Sql="Update CFWztg_AdUser_OnlinePay Set PayOk=1 Where OrderCode='"&OrderCode&"'"
Sql=Sql&";Update CFWztg_User Set Total_Cent=Total_Cent+" & PayMoney & ",Spare_Cent=Spare_Cent+" & PayMoney &" Where UserName='" & AdUserName & "'" 
Conn.Execute Sql
%>