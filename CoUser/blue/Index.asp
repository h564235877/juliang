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
Response.Expires= -1
Response.AddHeader "pragma","no-cache"
Response.AddHeader "cache-control","no-store"
%>
<!--#Include File="../../Conn.asp"-->
<!--#Include File="../../include/MyFunction.asp"-->
<!--#Include File="../../include/Md5.asp"-->
<!--#Include File="../../include/GetCookie.asp"-->
<%
If Session("CFWztgCoUser")="" Then
 Response.Cookies("CFWztgCoUserCookie")=""
 Response.Cookies("CFWztgCoUserCookie").Expires=Dateadd("n",-1440,Now())
 Call AlertUrl("会话已过期，请重新登陆!","../../")
Else
 CoUserName=Session("CFWztgCoUser")
End If
%>
<%
RootPath = HttpPath(2)
RootPath = Mid(RootPath,1,InStrRev(RootPath,"/")-1)
RootPath = Mid(RootPath,1,InStrRev(RootPath,"/")-1)
RootPath = Mid(RootPath,1,InStrRev(RootPath,"/"))


If RsSet("AdScriptShowDomain")="" Then
 AdPath = RootPath
Else
 AdPath = RsSet("AdScriptShowDomain")
End If

If RsSet("AdZlDomain")="" Then
 AdPath_2 = RootPath
Else
 AdPath_2 = RsSet("AdZlDomain")
End If

Action=ChkStr(Request("Action"),1)
If Action="" Then Action="main"

If Action="main" Then
 MenuCss = "main_menu1"
ElseIf Action="lowview" Then
 MenuCss = "main_menu2"
 MenuName = "名下广告主"
ElseIf Action="daytj" Or Action="daytjdetail" Then
 MenuCss = "main_menu4"
 MenuName = "数据报表"
ElseIf Action="spendlist" Or Action="spendadd" Or Action="spareout" Then
 MenuCss = "main_menu8"
 MenuName = "佣金结算"
ElseIf Action="pwdmodify" Or Action="pwdanswermodify" Or Action="userpaymodify" Or Action="datamodify" Or Action="aduserbindmodify" Then
 MenuCss = "main_menu9"
 MenuName = "安全中心"
ElseIf Action="sysinfolist" Or Action="sysinfoshow" Then
 MenuCss = "main_menu10"
 MenuName = "系统公告"
ElseIf Action="gbooklist" Or Action="gbookadd" Then
 MenuCss = "main_menu11"
 MenuName = "问题咨询"
Else
 MenuCss = "main_menu0"
 MenuName = ""
End If
%>
<!--#Include File="../../include/CoUser_Do.asp"-->

<!DOCTYPE HTML>
<HTML>
<HEAD>
<TITLE>商务后台_<%=SysTitle%></TITLE>
<META content="text/html; charset=gbk" http-equiv=Content-Type>
<META name=description content="">
<META name=keywords content="">
<link href="../../css/sys.css" rel="stylesheet">
<link href="../../css/BeAlert.css" rel="stylesheet">
<link href="images/style.css" rel="stylesheet">
<script src="../../js/jquery.min.js"></script>
<script src="../../js/global.js"></script>
<script src="../../js/BeAlert.js"></script>
<script src="../../js/BeAlert.js"></script>

<style type="text/css">
#container {WIDTH: 100%;}
#container_left {WIDTH:120px;background:#f1fbfd;float:left;position:absolute; top:0;left:0;}
#container_right {margin-left:118px;float:right;margin-right:0px;}

.banner {
BACKGROUND: url(images/banner-<%=MenuCss%>.jpg) no-repeat right center; 
}
</style>
</head>

<BODY>
<DIV id=container>

<DIV id=container_left>
<!--#Include File="CoUser_Memu.asp"-->
</DIV>


<DIV id=container_right>

<div id="dcHead">
 <div id="head">
  <div class="box">
   <ul class="siteName">
    <%=SysTitle%>
   </ul>
   <ul class="nav">	
	<LI><A href="../../?f=index" target=_blank>联盟首页</A></LI>
	<LI><A href="../../?f=help" target=_blank>帮助中心</A></LI>
	<LI><A href="../../?f=contact" target=_blank>联系我们</A></LI>
	<LI><A href="?Action=gbookadd">提点建议</A></LI>	
	<LI><A href="?Action=pwdmodify">修改密码</A></LI>	
    <li><a href="?Action=datamodify">您好，<%=CoUserName%></a></li>
    <li><A href="?Action=couserlogout">退出</A></li>
   </ul>
  </div>
 </div>
</div>



<%If Action="main" Then%>
<DIV id=banner1 class=banner>
<DIV class=title><B>诚信 互利 发展</B> 
<P 
style="PADDING-LEFT: 60px; COLOR: #ff00ff; FONT-SIZE: 14px; FONT-WEIGHT: bold; PADDING-TOP: 10px">我们承诺：诚信互盈 
及时结算 用心服务</P>
</DIV>
</DIV>
<%Else%>
<DIV id=banner2 class=banner>
<DIV class=title><B><span id="bannertext"><%=MenuName%></span></B></DIV></DIV>
<%End If%>

<DIV id=content>
<!--#Include File="CoUser_Select.asp"-->
<DIV id=foot>
Copyright&nbsp;&copy;<%=Year(Now)%>&nbsp;<%=HttpPath(1)%>&nbsp;All Rights Reserved
</DIV>
</DIV>

</DIV>

</DIV>
<script>  
$(function(){
 var lheight=window.innerHeight||document.documentElement.clientHeight||document.body.clientHeight;;  
 $("#container_left").css("height",lheight+"px");  
});
</script>  

</BODY>
</HTML>
