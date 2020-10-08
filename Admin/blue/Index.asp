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
<!--#Include File="../../Include/MyFunction.asp"-->
<!--#Include File="../../Include/Md5.asp"-->
<!--#Include File="../../Include/GetCookie.asp"-->
<%
If Session("CFWztgAdmin")="" Then
  Response.Cookies("CFWztgAdminCookie")=""
  Response.Cookies("CFWztgAdminCookie").Expires=Dateadd("n",-1440,Now())
  Response.Redirect("../")
End If
%>
<%
RootPath = HttpPath(2)
RootPath = Mid(RootPath,1,InStrRev(RootPath,"/")-1)
RootPath = Mid(RootPath,1,InStrRev(RootPath,"/")-1)
RootPath = Mid(RootPath,1,InStrRev(RootPath,"/"))

If RsSet("AdScriptShowDomain")="" Then
 AdPath = Mid(RootPath,InStr(RootPath,":")+1)'--使用兼容格式
Else
 AdPath = RsSet("AdScriptShowDomain")
End If

Action=ChkStr(Request("Action"),1)
If Action="" Then Action="main"


'普通管理员时验证权限
If GetStr(Session("CFWztgAdmin"),"PowerLevel")="2" And InStr(","&GetStr(Session("CFWztgAdmin"),"PowerHold")&",",","&Action&",")=0 And Action<>"clienttj" Then
 Response.write "没有权限操作，请返回！"
 Response.End
End If


If Action="main" Then
 MenuCss = "main_menu1"
ElseIf Action="userlist" Or Action="useradd" Or Action="usermodify" Or Action="userspendlist" Or Action="userspendmodify" Or Action="userdeductlist" Or Action="usersitelist" Or Action="usersitemodify" Or Action="seuserlist" Or Action="seuseradd" Or Action="seusermodify" Or Action="seuserlowmove" Or Action="seuserscore" Or Action="seuserscoredetail" Or Action="couserlist" Or Action="couseradd" Or Action="cousermodify" Or Action="couserlowmove" Or Action="couserscore" Or Action="couserscoredetail"  Then
 MenuCss = "main_menu2"
 MenuName = "用户管理"
ElseIf Action="aduserlist" Or Action="aduseradd" Or Action="adusermodify" Or Action="lowlist" Or Action="lowdaytj" Or Action="orderlist" Or Action="orderdaytj" Or Action="orderdaytjgoodstime" Or Action="aduserenoughlist" Or Action="aduserenoughadd" Or Action="imglist" Then
 MenuCss = "main_menu3"
 MenuName = "广告主管理"
ElseIf Action="planlist" Or Action="planadd" Or Action="planmodify" Or Action="planchase" Or Action="planview" Or Action="aduserexpendlist" Or Action="aduserexpendmodify" Or Action="passadlist" Or Action="adadd" Or Action="admodify" Or Action="pauseadlist" Or Action="refuadlist" Or Action="overadlist" Or Action="adcheck" Or Action="adcheckmodify" Then
 MenuCss = "main_menu4"
 MenuName = "广告管理"
ElseIf Action="clienttj" Or Action="showlist" Or Action="iplist" Or Action="errckiplist" Or Action="searchkeywordtj" Or Action="clickflaglist" Or Action="clickflagdetail" Or Action="invalidiplist" Or Action="daytj" Or Action="daytjdetail" Or Action="hourtj" Or Action="userdatadaytj" Or Action="lylist" Or Action="othertj" Or Action="lowuniondaytjbyusername" Or Action="lowuniondaytjbyuserid" Or Action="inputdata" Or Action="inputdataconfirm" Or Action="inputdatasave" Then
 MenuCss = "main_menu5"
 MenuName = "数据报表"
ElseIf Action="sysmodify" Or Action="ipblacklist" Or Action="ipblacklistadd" Or Action="ipblacklistmoreadd" Or Action="ipblacklistmodify" Or Action="sysrecset" Or Action="agentadmodify" Or Action="setbclasslist" Or Action="setbclassadd" Or Action="setbclassmodify" Or Action="setsclasslist" Or Action="setsclassadd" Or Action="setsclassmodify" Or Action="setcontentlist" Or Action="setcontentadd" Or Action="setcontentmodify" Or Action="siteclasslist" Or Action="siteclassadd" Or Action="siteclassmodify" Or Action="adsizelist" Or Action="adsizeadd" Or Action="adsizemodify" Or Action="testset" Then
 MenuCss = "main_menu6"
 MenuName = "系统设置"
ElseIf Action="pwdmodify" Then
 MenuCss = "main_menu7"
 MenuName = "修改密码"
ElseIf Action="adminuserlist" Or Action="adminuseradd" Or Action="adminusermodify" Then
 MenuCss = "main_menu8"
 MenuName = "管理员列表"
ElseIf Action="infolist" Or Action="infoadd" Or Action="infomodify" Or Action="infoclasslist" Or Action="infoclassadd" Or Action="infoclassmodify" Then
 MenuCss = "main_menu9"
 MenuName = "公告和帮助管理"
ElseIf Action="gbooklist" Or Action="gbookreply" Then
 MenuCss = "main_menu10"
 MenuName = "留言管理"
ElseIf Action="emailsend" Then
 MenuCss = "main_menu11"
 MenuName = "邮件管理"
ElseIf Action="templatelist" Then
 MenuCss = "main_menu12"
 MenuName = "模板管理"
ElseIf Action="dbdo" Then
 MenuCss = "main_menu13"
 MenuName = "数据库管理"
ElseIf Action="licencodemodify" Then
 MenuCss = "main_menu14"
 MenuName = "程序注册"
Else
 MenuCss = "main_menu0"
 MenuName = ""
End If
%>
<!--#Include File="../../include/AdminUser_Do.asp"-->

<!DOCTYPE HTML>
<html>
<head>
<TITLE>管理员后台_<%=SysTitle%></TITLE>
<META content="text/html; charset=gbk" http-equiv=Content-Type>
<META name=description content="管理员后台_<%=SysTitle%>">
<META name=keywords content="管理员后台_<%=SysTitle%>">
<link href="../../css/sys.css" rel="stylesheet">
<link href="../../css/BeAlert.css" rel="stylesheet">
<link href="images/style.css" rel="stylesheet">
<script src="../../js/jquery.min.js"></script>
<script src="../../js/global.js"></script>
<script src="../../js/BeAlert.js"></script>

<style type="text/css">
#container {WIDTH: 100%;}
#container_left {WIDTH:120px;background:#f1fbfd;float:left;position:absolute; top:0;left:0;height:620px;}
#container_right {margin-left:118px;float:right;margin-right:0px;height:620px;}

.menubox .menuright{float:left;padding-left:1px;}
.menubox .menuright ul li{ float:left;padding: 0px 14.5px; position:relative;}
.menubox .menuright ul li a{text-align:center;position:relative; color:#90989e; font-size:12px;}
.menubox .menuright ul li.userinfo .span1{background: url(images/arrow.png) no-repeat 100% 50%;line-height: 30px;color: #90989e;font-size: 14px;    padding-right: 15px;}
.menubox .menuright ul li.userinfo i{margin-top:8px;float:left;width:14px;height:14px;display: block;background: url(images/daohangbiao.gif) no-repeat 100% 50%;}
.menubox .menuright ul li.userinfo .operating{display: none;position: absolute;width: 1160px;top:30px; z-index:100000;left: -10px;border: 1px solid #e9eced;box-shadow: 0 1px 6px rgba(0,0,0,0.12);border-radius: 4px;background: #fff;padding: 15px 20px;color: #999;}
.menubox .menuright ul li .li1{ width:90px;text-align:right;font-size:15px;}

.operating ul{clear:both;}
.operating ul li{line-height:50px;}
.operating .span2{font-weight:normal;font-size:14px;}

.banner {
BACKGROUND: url(images/banner-<%=MenuCss%>.jpg) no-repeat right center; 
}
</style>

<%If RsSet("CacheServer")<>"" Then%>
<script>
//--https访问时强制以http访问
var tmpTag = "https:" == document.location.protocol ? false : true;
if(!tmpTag){
alert("开启了负载均衡为了同步多个站点信息，管理员后台只能用http访问不能使用https访问，网站主等后台不影响");
var urls=window.location.href;
urls = urls.replace("https", "http");
window.location=urls;
}
</script>
<%End If%>
</head>

<BODY>
<DIV id=container>

<DIV id=container_left>
<!--#Include File="AdminUser_Memu.asp"-->
</DIV>


<DIV id=container_right>

<div id="dcHead">
 <div id="head">
  <div class="box">

   
<div class="menubox">
<div class="menuright">
<ul>
  <li class="userinfo">
	   <i></i><span class="span1">导航</span>
	   <div class="operating" style="display: none;">	   

<ul>
<li class="li1">用户管理：</li>
<li>网站主列表<span class="span2">[<a href="?Action=userlist">列表</a>/<a href="?Action=useradd">新增</a>]</span></li>
<li><a href="?Action=userspendlist">用户结算</a></li>
<li><a href="?Action=userdeductlist">用户扣款列表</a></li>
<li><a href="?Action=usersitelist">网站主网站审核</a></li>
<li>客服列表<span class="span2">[<a href="?Action=seuserlist">列表</a>/<a href="?Action=seuseradd">新增</a>]</span></li>
<li><a href="?Action=seuserscore">客服业绩</a></li>
<li>商务列表<span class="span2">[<a href="?Action=couserlist">列表</a>/<a href="?Action=couseradd">新增</a>]</span></li>
<li><a href="?Action=couserscore">商务业绩</a></li>
</ul>

<ul>
<li class="li1">广告主列表：</li>
<li>广告主列表<span class="span2">[<a href="?Action=aduserlist">列表</a>/<a href="?Action=aduseradd">新增</a>]</span></li>
<li>广告主充值管理<span class="span2">[<a href="?Action=aduserenoughlist">列表</a>/<a href="?Action=aduserenoughadd">充值</a>]</span></li>
<li><a href="?Action=imglist">广告主上传管理</a></li>
<li><a href="?Action=lowlist">CPA注册列表</a></li>
<li><a href="?Action=orderlist">CPS订单列表</a></li>

</ul>

<ul>
<li class="li1">广告管理：</li>
<li>广告计划列表<span class="span2">[<a href="?Action=planlist">列表</a>/<a href="?Action=planadd">发布计划</a>]</span></li>
<li><a href="?Action=aduserexpendlist">广告审核列表</a></li>
<li>已经审核在运行的广告<span class="span2">[<a href="?Action=passadlist">列表</a>/<a href="?Action=adadd">发布广告</a>]</span></li>
<li><a href="?Action=pauseadlist">暂停中的广告</a></li>
<li><a href="?Action=refuadlist">拒绝审核的广告</a></li>
<li><a href="?Action=overadlist">已经完成的广告</a></li>
<li><a href="?Action=adcheck">广告主修改广告审核</a></li>
</ul>

<ul>
<li class="li1">广告统计：</li>
<li><a href="?Action=daytj">每日统计</a></li>
<li><a href="?Action=hourtj">每小时统计</a></li>
<li><a href="?Action=userdatadaytj">用户每日排行</a></li>
<li><a href="?Action=iplist">有效点击记录</a></li>
<li><a href="?Action=clickflaglist">无效点击统计</a></li>
<li><a href="?Action=invalidiplist">无效点击记录</a></li>
<li><a href="?Action=showlist">显示记录</a></li>
<li><a href="?Action=clienttj">客户端信息</a></li>
<li><a href="?Action=lylist">广告来源</a></li>
<li><a href="?Action=searchkeywordtj">关键字统计</a></li>
<li><a href="?Action=inputdata">导量操作</a></li>
<li style="clear:both;margin-left:118px;"><a href="?Action=othertj">其它统计</a></li>
<li><a href="?Action=lowuniondaytjbyusername">隐藏广告量统计(用户名)</a></li>
<li><a href="?Action=lowuniondaytjbyuserid">隐藏广告量统计(用户ID)</a></li>
</ul>

<ul>
<li class="li1">系统设置：</li>
<li><a href="?Action=sysmodify">系统设置</a></li>
<li><a href="?Action=ipblacklist">IP黑名单</a></li>
<li>网站分类设置<span class="span2">[<a href="?Action=siteclasslist">列表</a>/<a href="?Action=siteclassadd">新增</a>]</span></li>
<li>广告尺寸管理<span class="span2">[<a href="?Action=adsizelist">列表</a>/<a href="?Action=adsizeadd">新增</a>]</span></li>
<li><a href="?Action=setbclasslist">设置配置</a></li>
<li><a href="?Action=testset">删除本机IP和缓存</a></li>
<li><a href="?Action=sysrecset">整合接口设置</a></li>
<li><a href="?Action=agentadmodify">代理广告设置</a></li>
</ul>

<ul>
<li class="li1">公告和帮助：</li>
<li>公告和帮助列表<span class="span2">[<a href="?Action=infolist">列表</a>/<a href="?Action=infoadd">新增</a>]</span></li>
<li>公告和帮助分类<span class="span2">[<a href="?Action=infoclasslist">列表</a>/<a href="?Action=infoclassadd">新增</a>]</span></li>
</ul>

<ul>
<li class="li1">模板列表：</li>
<li><a href="?Action=templatelist&TemplateType=index">前台模板</a></li>
<li><a href="?Action=templatelist&TemplateType=user">网站主后台模板</a></li>
<li><a href="?Action=templatelist&TemplateType=aduser">广告主后台模板</a></li>
<li><a href="?Action=templatelist&TemplateType=seuser">客服后台模板</a></li>
<li><a href="?Action=templatelist&TemplateType=couser">商务后台模板</a></li>
<li><a href="?Action=templatelist&TemplateType=adminuser">管理员后台模板</a></li>
<li><a href="?Action=setcontentlist&SetBClassFlag=AdminTemplet&SetSClassFlag=AdminTemplet_SysLabel">前台标签</a></li>
<li><a href="?Action=setcontentlist&SetBClassFlag=AdminTemplet&SetSClassFlag=AdminTemplet_AdCode">轮循富媒体广告模板</a></li>
<li><a href="?Action=setcontentlist&SetBClassFlag=AdminTemplet&SetSClassFlag=AdminTemplet_MixCode">混合富媒体广告模板</a></li>
</ul>



<ul>
<li class="li1">其它：</li>
<li>管理员列表<span class="span2">[<a href="?Action=adminuserlist">列表</a>/<a href="?Action=adminuseradd">新增</a>]</span></li>
<li><a href="?Action=gbooklist">留言管理</a></li>
<li><a href="?Action=dbdo">数据库操作</a></li>
<li><a href="?Action=licencodemodify">程序注册</a></li>
</ul>

	   </div>
	</li>
</ul>
</div>
</div>

 <script>
$(function(){
   $("li.userinfo").hover(function(){
		$(this).find(".operating").show();
	},function(){
		$(this).find(".operating").hide();
	});	
});
</script>
			   
   <ul class="siteName">
    <%=SysTitle%>
   </ul>		   
   
   <ul class="nav">	
	<LI><A href="../../?f=index" target=_blank>联盟首页</A></LI>
	<LI><A href="../../?f=help" target=_blank>帮助中心</A></LI>
	<LI><A href="?Action=pwdmodify">修改密码</A></LI>	
    <li><a href="javascript:;" onclick="$(function () { confirm('单个站点一般不需要清理，多个站点可以同步清理，确定吗?', '', function (isConfirm) {if (isConfirm) {gotoUrl('../../AdminUser.aspx?Action=allserversynccache')}}, {confirmButtonText: '确定', cancelButtonText: '取消', width: 400});});">清理缓存</a></li>
    <li><a href="?Action=adminuserlist">您好，<%=GetStr(Session("CFWztgAdmin"),"AdminUserName")%></a></li>
    <li><A href="?Action=adminuserlogout">退出</A></li>
   </ul>
  </div>
 </div>
</div>





<%If Action="main" Then%>
<DIV id=banner1 class=banner>
<DIV class=title><B>诚信 互利 发展</B> 
</DIV>
</DIV>
<%Else%>
<DIV id=banner2 class=banner>
<DIV class=title><B><span id="bannertext"><%=MenuName%></span></B>
</DIV>
</DIV>
<%End If%>


<DIV id=content>
<!--#Include File="AdminUser_Select.asp"-->
<DIV id=foot>
Copyright&nbsp;&copy;<%=Year(Now)%>&nbsp;<%=HttpPath(1)%>&nbsp;All Rights Reserved
</DIV>
</DIV>

</DIV>

</DIV>


</BODY>
</HTML>
