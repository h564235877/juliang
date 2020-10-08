<%
'乘风广告联盟系统 Sql版
'作者QQ：178575
'作者EMail：yliangcf@163.com
'作者网站：http://www.qqcf.com
'详细简介：http://www.qqcf.com/cfwztg.htm
'上面有程序在线演示，安装演示，使用疑难解答，最新版本下载等内容
'因为这些内容可能时常更新，就没有放在程序里，请自己上网站查看
%>
<%If Action="main" Then%>
<!--#include file="../../Action/SeUser/main.asp"-->
<%End If%>

<%If Action="lowview" Then%>
<!--#include file="../../Action/SeUser/lowview.asp"-->
<%end if%>

<%If Action="daytj" Then%>
<!--#include file="../../Action/SeUser/daytj.asp"-->
<%end if%>

<%If Action="daytjdetail" Then%>
<!--#include file="../../Action/SeUser/daytjdetail.asp"-->
<%end if%>

<%If Action="spendlist" Then%>
<!--#include file="../../Action/SeUser/spendlist.asp"-->
<%End If%>

<%If Action="spendadd" Then%>
<!--#include file="../../Action/SeUser/spendadd.asp"-->
<%End If%> 


<%If Action="pwdmodify" Then%>
<!--#include file="../../Action/SeUser/pwdmodify.asp"-->
<%End if%>

<%If Action="pwdanswermodify" Then%>
<!--#include file="../../Action/SeUser/pwdanswermodify.asp"-->
<%End if%>
		
<%If Action="userpaymodify" then%>
<!--#include file="../../Action/SeUser/userpaymodify.asp"-->
<%End If%>

<%If Action="datamodify" Then%>
<!--#include file="../../Action/SeUser/datamodify.asp"-->
<%End If%>

<%If Action="bindusermodify" Then%>
<!--#include file="../../Action/SeUser/bindusermodify.asp"-->
<%End If%>


<%If Action="sysinfolist" Then%>
<!--#include file="../../Action/SeUser/sysinfolist.asp"-->
<%End If%>

<%If Action="sysinfoshow" Then%>
 <!--#include file="../../Action/SeUser/sysinfoshow.asp"-->
<%End If%>
	
<%If Action="gbooklist" Then%> 
 <!--#include file="../../Action/SeUser/gbooklist.asp"-->
<%End IF%>

<%If Action="gbookadd" Then%> 
 <!--#include file="../../Action/SeUser/gbookadd.asp"-->
<%End IF%>
