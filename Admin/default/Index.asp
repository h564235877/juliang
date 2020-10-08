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




MenuAllAction1 = "|-|main=管理首页"
MenuAllAction2 = "|-|userlist=网站主列表|-|useradd=网站主新增|-|usermodify=网站主修改|-|userspendlist=结算列表|-|userspendmodify=用户结算|-|userdeductlist=用户扣款列表|-|usersitelist=网站主网站审核|-|usersitemodify=网站主网站修改|-|seuserlist=客服列表|-|seuseradd=客服新增|-|seusermodify=客服修改|-|seuserlowmove=客服转移|-|seuserscore=客服业绩|-|seuserscoredetail=客服业绩详细|-|couserlist=商务列表|-|couseradd=商务新增|-|cousermodify=商务修改|-|couserlowmove=商务转移|-|couserscore=商务业绩|-|couserscoredetail=商务业绩详细"
MenuAllAction3 = "|-|aduserlist=广告主列表|-|aduseradd=广告主新增|-|adusermodify=广告主修改|-|lowlist=CPA注册列表|-|lowdaytj=CPA用户每日统计|-|orderlist=CPS订单列表|-|orderdaytj=订单每日统计|-|orderdaytjgoodstime=订单每日统计[按商品购买时间]|-|aduserenoughlist=广告主充值管理|-|aduserenoughadd=为广告主充值|-|imglist=广告主上传管理"
MenuAllAction4 = "|-|planlist=广告计划列表|-|planadd=广告计划新增|-|planmodify=广告计划修改|-|planchase=广告计划追加金额|-|planview=广告计划详细|-|aduserexpendlist=广告审核列表|-|aduserexpendmodify=广告审核|-|passadlist=已经审核在运行的广告|-|adadd=广告新增|-|admodify=广告修改|-|pauseadlist=暂停中的广告|-|refuadlist=拒绝审核的广告|-|overadlist=已经完成的广告|-|adcheck=广告主修改广告审核列表|-|adcheckmodify=广告主修改广告审核"
MenuAllAction5 = "|-|clienttj=客户端|-|showlist=最近显示|-|iplist=有效点击|-|invalidiplist=无效点击|-|searchkeywordtj=广告计划详细|-|clickflaglist=广告审核列表|-|clickflagdetail=无效点击统计|-|daytj=每日统计|-|hourtj=小时统计|-|userdatadaytj=用户排行|-|daytjdetail=每日统计详细|-|lylist=来源统计|-|othertj=其它统计|-|lowuniondaytjbyusername=下级联盟按用户名统计|-|lowuniondaytjbyuserid=下级联盟按用户ID统计|-|inputdata=数据导入|-|inputdataconfirm=数据导入确认|-|inputdatasave=数据导入保存"
MenuAllAction6 = "|-|sysmodify=系统设置|-|ipblacklist=IP黑名单列表|-|ipblacklistadd=IP黑名单新增|-|ipblacklistmoreadd=IP黑名单批量新增|-|ipblacklistmodify=IP黑名单修改|-|sysrecset=整合接口设置|-|agentadmodify=代理广告设置|-|setbclasslist=一级设置列表|-|setbclassadd=一级设置新增|-|setbclassmodify=一级设置修改|-|setsclasslist=二级设置列表|-|setsclassadd=二级设置新增|-|setsclassmodify=二级设置修改|-|setcontentlist=三级设置列表|-|setcontentadd=三级设置新增|-|setcontentmodify=三级设置修改|-|siteclasslist=网站分类列表|-|siteclassadd=网站分类新增|-|siteclassmodify=网站分类修改|-|adsizelist=广告尺寸列表|-|adsizeadd=广告尺寸新增|-|adsizemodify=广告尺寸修改|-|testset=删除本机IP和缓存"
MenuAllAction7 = "|-|adminuserlist=管理员列表|-|adminuseradd=管理员新增|-|adminusermodify=管理员修改"
MenuAllAction8 = "|-|infolist=公告和帮助|-|infoadd=公告新增|-|infomodify=公告修改|-|infoclasslist=公告分类|-|infoclassadd=公告分类新增|-|infoclassmodify=公告分类修改"
MenuAllAction9 = "|-|gbooklist=留言列表|-|gbookadd=留言新增|-|gbookmodify=留言修改"
MenuAllAction10 = "|-|templatelist=模板列表"
MenuAllAction11 = "|-|dbdo=数据库操作"
MenuAllAction12 = "|-|licencodemodify=程序注册"

If Instr(MenuAllAction1,"|-|" & Action & "=")>0 Then
	 MenuName= GetStr(MenuAllAction1,Action)
	 
ElseIf Instr(MenuAllAction2,"|-|" & Action & "=")>0 Then
	MenuName= GetStr(MenuAllAction2,Action)
	
ElseIf Instr(MenuAllAction3,"|-|" & Action & "=")>0 Then
	MenuName = GetStr(MenuAllAction3,Action)
	
ElseIf Instr(MenuAllAction4,"|-|" & Action & "=")>0 Then
	MenuName= GetStr(MenuAllAction4,Action)
	
ElseIf Instr(MenuAllAction5,"|-|" & Action & "=")>0 Then
	MenuName = GetStr(MenuAllAction5,Action)

ElseIf Instr(MenuAllAction6,"|-|" & Action & "=")>0 Then
	 MenuName = GetStr(MenuAllAction6,Action)
	 
ElseIf Instr(MenuAllAction7,"|-|" & Action & "=")>0 Then
	 MenuName = GetStr(MenuAllAction7,Action)

ElseIf Instr(MenuAllAction8,"|-|" & Action & "=")>0 Then
	 MenuName = GetStr(MenuAllAction8,Action)
	 
ElseIf Instr(MenuAllAction9,"|-|" & Action & "=")>0 Then
	 MenuName = GetStr(MenuAllAction9,Action)
	 
ElseIf Instr(MenuAllAction10,"|-|" & Action & "=")>0 Then
	 MenuName = GetStr(MenuAllAction10,Action)
	 
ElseIf Instr(MenuAllAction11,"|-|" & Action & "=")>0 Then
	 MenuName = GetStr(MenuAllAction11,Action)
	 
ElseIf Instr(MenuAllAction12,"|-|" & Action & "=")>0 Then
	 MenuName = GetStr(MenuAllAction12,Action)

End If
%>
<!--#Include File="../../include/AdminUser_Do.asp"-->

<!DOCTYPE html>
<html lang="zh">
<head>
<meta charset="gbk">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />
<title>管理员后台_<%=SysTitle%></title>
<link rel="icon" href="../../images/favicon.ico" type="image/ico">
<meta name="keywords" content="管理员后台_<%=SysTitle%>">
<meta name="description" content="管理员后台_<%=SysTitle%>">
<link href="../../css/bootstrap.min.css" rel="stylesheet">
<link href="../../css/materialdesignicons.min.css" rel="stylesheet">
<link href="../../css/style.min.css" rel="stylesheet">
<link href="../../css/my.css" rel="stylesheet">
<link href="../../css/BeAlert.css" rel="stylesheet">
<script src="../../js/jquery.min.js"></script>
<script src="../../js/jquery.cookie.min.js"></script>
<script src="../../js/global.js"></script>
<script src="../../js/BeAlert.js"></script>

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
  
<body>
<div class="lyear-layout-web">
  <div class="lyear-layout-container">
    <!--左侧导航-->
    <aside class="lyear-layout-sidebar">
      
      <!-- logo -->
      <div id="logo" class="sidebar-header">
        <a href="?"><img src="images/logo-sidebar.png" title="" alt="" /></a>
      </div>
      <div class="lyear-layout-sidebar-scroll"> 
        
        <nav class="sidebar-main">
          <ul class="nav nav-drawer">
            <li class="nav-item<%If Instr(MenuAllAction1,"|-|" & Action & "=")>0 Then Response.write " active"%>"> <a href="?Action=main"><i class="mdi mdi-home"></i> 后台首页</a> </li>
            <li class="nav-item<%If Instr(MenuAllAction2,"|-|" & Action & "=")>0 Then Response.write " active"%>"> <a href="?Action=userlist"><i class="mdi mdi-account"></i> 用户管理</a> </li>
			<li class="nav-item<%If Instr(MenuAllAction3,"|-|" & Action & "=")>0 Then Response.write " active"%>"> <a href="?Action=aduserlist"><i class="mdi mdi-account-box"></i> 广告主管理</a> </li>
			<li class="nav-item<%If Instr(MenuAllAction4,"|-|" & Action & "=")>0 Then Response.write " active"%>"> <a href="?Action=passadlist"><i class="mdi mdi-stackoverflow"></i> 广告管理</a> </li>          
			<li class="nav-item<%If Instr(MenuAllAction5,"|-|" & Action & "=")>0 Then Response.write " active"%>"> <a href="?Action=daytj"><i class="mdi mdi-google-analytics"></i> 广告统计 </a> </li>
			<li class="nav-item<%If Instr(MenuAllAction6,"|-|" & Action & "=")>0 Then Response.write " active"%>"> <a href="?Action=sysmodify"><i class="mdi mdi-settings"></i> 系统设置</a> </li>
			<li class="nav-item<%If Instr(MenuAllAction7,"|-|" & Action & "=")>0 Then Response.write " active"%>"> <a href="?Action=adminuserlist"><i class="mdi mdi-owl"></i> 管理员列表</a> </li>
			<li class="nav-item<%If Instr(MenuAllAction8,"|-|" & Action & "=")>0 Then Response.write " active"%>"> <a href="?Action=infolist"><i class="mdi mdi-volume-high"></i> 公告和帮助</a> </li>
			<li class="nav-item<%If Instr(MenuAllAction9,"|-|" & Action & "=")>0 Then Response.write " active"%>"> <a href="?Action=gbooklist"><i class="mdi mdi-content-paste"></i> 留言管理</a> </li>
			<li class="nav-item<%If Instr(MenuAllAction10,"|-|" & Action & "=")>0 Then Response.write " active"%>"> <a href="?Action=templatelist"><i class="mdi mdi-tshirt-crew"></i> 模板列表</a> </li>
			<li class="nav-item<%If Instr(MenuAllAction11,"|-|" & Action & "=")>0 Then Response.write " active"%>"> <a href="?Action=dbdo"><i class="mdi mdi-database"></i> 数据库管理</a> </li>
			<li class="nav-item<%If Instr(MenuAllAction12,"|-|" & Action & "=")>0 Then Response.write " active"%>"> <a href="?Action=licencodemodify"><i class="mdi mdi-shopping"></i> 程序注册</a> </li>
          </ul>
        </nav>
        
        <div class="sidebar-footer">
          <p class="copyright">Copyright&nbsp;&copy;<%=Year(Now)%>&nbsp;<%=GetTopDomainName(HttpPath(1))%>&nbsp;All Rights Reserved. </p>
        </div>
      </div>
      
    </aside>
    <!--End 左侧导航-->
    
    <!--头部信息-->
    <header class="lyear-layout-header">
      
      <nav class="navbar navbar-default">
        <div class="topbar">
          
          <div class="topbar-left">
            <div class="lyear-aside-toggler">
              <span class="lyear-toggler-bar"></span>
              <span class="lyear-toggler-bar"></span>
              <span class="lyear-toggler-bar"></span>
            </div>
            <span class="navbar-page-title"> <%=MenuName%> </span>
          </div>
          
          <ul class="topbar-right">
            <li class="dropdown dropdown-profile">
              <a href="javascript:void(0)" data-toggle="dropdown">
                <img class="img-avatar img-avatar-48 m-r-10" src="images/users/avatar.jpg" alt="<%=GetStr(Session("CFWztgAdmin"),"AdminUserName")%>" />
                <span><%=GetStr(Session("CFWztgAdmin"),"AdminUserName")%> <span class="caret"></span></span>
              </a>
              <ul class="dropdown-menu dropdown-menu-right">
                <li> <a href="javascript:;" onclick="$(function () { confirm('单个站点一般不需要清理，多个站点可以同步清理，确定吗?', '', function (isConfirm) {if (isConfirm) {gotoUrl('../../AdminUser.aspx?Action=allserversynccache')}}, {confirmButtonText: '确定', cancelButtonText: '取消', width: 400});});"><i class="mdi mdi-cached"></i>清理缓存</a> </li>
                <li> <a href="?Action=pwdmodify"><i class="mdi mdi-lock-outline"></i>修改密码</a> </li>
				<li> <a href="../../" target="_blank"><i class="mdi mdi-home"></i>联盟首页</a> </li>
                <li class="divider"></li>
                <li> <a href="?Action=adminuserlogout"><i class="mdi mdi-logout-variant"></i>退出登录</a> </li>
              </ul>
            </li>
            <!--切换主题配色-->
		    <li class="dropdown dropdown-skin">
			  <span data-toggle="dropdown" class="icon-palette"><i class="mdi mdi-palette"></i></span>
			  <ul class="dropdown-menu dropdown-menu-right" data-stopPropagation="true">
                <li class="drop-title"><p>主题</p></li>
                <li class="drop-skin-li clearfix">
                  <span class="inverse">
                    <input type="radio" name="site_theme" value="default" id="site_theme_1" checked>
                    <label for="site_theme_1"></label>
                  </span>
                  <span>
                    <input type="radio" name="site_theme" value="dark" id="site_theme_2">
                    <label for="site_theme_2"></label>
                  </span>
                  <span>
                    <input type="radio" name="site_theme" value="translucent" id="site_theme_3">
                    <label for="site_theme_3"></label>
                  </span>
                </li>
			    <li class="drop-title"><p>LOGO</p></li>
				<li class="drop-skin-li clearfix">
                  <span class="inverse">
                    <input type="radio" name="logo_bg" value="default" id="logo_bg_1" checked>
                    <label for="logo_bg_1"></label>
                  </span>
                  <span>
                    <input type="radio" name="logo_bg" value="color_2" id="logo_bg_2">
                    <label for="logo_bg_2"></label>
                  </span>
                  <span>
                    <input type="radio" name="logo_bg" value="color_3" id="logo_bg_3">
                    <label for="logo_bg_3"></label>
                  </span>
                  <span>
                    <input type="radio" name="logo_bg" value="color_4" id="logo_bg_4">
                    <label for="logo_bg_4"></label>
                  </span>
                  <span>
                    <input type="radio" name="logo_bg" value="color_5" id="logo_bg_5">
                    <label for="logo_bg_5"></label>
                  </span>
                  <span>
                    <input type="radio" name="logo_bg" value="color_6" id="logo_bg_6">
                    <label for="logo_bg_6"></label>
                  </span>
                  <span>
                    <input type="radio" name="logo_bg" value="color_7" id="logo_bg_7">
                    <label for="logo_bg_7"></label>
                  </span>
                  <span>
                    <input type="radio" name="logo_bg" value="color_8" id="logo_bg_8">
                    <label for="logo_bg_8"></label>
                  </span>
				</li>
				<li class="drop-title"><p>头部</p></li>
				<li class="drop-skin-li clearfix">
                  <span class="inverse">
                    <input type="radio" name="header_bg" value="default" id="header_bg_1" checked>
                    <label for="header_bg_1"></label>                      
                  </span>                                                    
                  <span>                                                     
                    <input type="radio" name="header_bg" value="color_2" id="header_bg_2">
                    <label for="header_bg_2"></label>                      
                  </span>                                                    
                  <span>                                                     
                    <input type="radio" name="header_bg" value="color_3" id="header_bg_3">
                    <label for="header_bg_3"></label>
                  </span>
                  <span>
                    <input type="radio" name="header_bg" value="color_4" id="header_bg_4">
                    <label for="header_bg_4"></label>                      
                  </span>                                                    
                  <span>                                                     
                    <input type="radio" name="header_bg" value="color_5" id="header_bg_5">
                    <label for="header_bg_5"></label>                      
                  </span>                                                    
                  <span>                                                     
                    <input type="radio" name="header_bg" value="color_6" id="header_bg_6">
                    <label for="header_bg_6"></label>                      
                  </span>                                                    
                  <span>                                                     
                    <input type="radio" name="header_bg" value="color_7" id="header_bg_7">
                    <label for="header_bg_7"></label>
                  </span>
                  <span>
                    <input type="radio" name="header_bg" value="color_8" id="header_bg_8">
                    <label for="header_bg_8"></label>
                  </span>
				</li>
				<li class="drop-title"><p>侧边栏</p></li>
				<li class="drop-skin-li clearfix">
                  <span class="inverse">
                    <input type="radio" name="sidebar_bg" value="default" id="sidebar_bg_1" checked>
                    <label for="sidebar_bg_1"></label>
                  </span>
                  <span>
                    <input type="radio" name="sidebar_bg" value="color_2" id="sidebar_bg_2">
                    <label for="sidebar_bg_2"></label>
                  </span>
                  <span>
                    <input type="radio" name="sidebar_bg" value="color_3" id="sidebar_bg_3">
                    <label for="sidebar_bg_3"></label>
                  </span>
                  <span>
                    <input type="radio" name="sidebar_bg" value="color_4" id="sidebar_bg_4">
                    <label for="sidebar_bg_4"></label>
                  </span>
                  <span>
                    <input type="radio" name="sidebar_bg" value="color_5" id="sidebar_bg_5">
                    <label for="sidebar_bg_5"></label>
                  </span>
                  <span>
                    <input type="radio" name="sidebar_bg" value="color_6" id="sidebar_bg_6">
                    <label for="sidebar_bg_6"></label>
                  </span>
                  <span>
                    <input type="radio" name="sidebar_bg" value="color_7" id="sidebar_bg_7">
                    <label for="sidebar_bg_7"></label>
                  </span>
                  <span>
                    <input type="radio" name="sidebar_bg" value="color_8" id="sidebar_bg_8">
                    <label for="sidebar_bg_8"></label>
                  </span>
				</li>
			  </ul>
			</li>
            <!--切换主题配色-->
          </ul>
          
        </div>
      </nav>
      
    </header>
    <!--End 头部信息-->
    
    <!--页面主要内容-->
    <main class="lyear-layout-content">
      
     <!--#Include File="AdminUser_Select.asp"-->
      
    </main>
    <!--End 页面主要内容-->
  </div>
</div>


<script type="text/javascript" src="../../js/bootstrap.min.js"></script>
<script type="text/javascript" src="../../js/perfect-scrollbar.min.js"></script>
<script type="text/javascript" src="../../js/main.min.js"></script>


<script>
//主题配色及保存
var the_logo_bg    = $.cookie('the_logo_bg'),
	    the_header_bg  = $.cookie('the_header_bg'),
	    the_sidebar_bg = $.cookie('the_sidebar_bg'),
	    the_site_theme = $.cookie('the_site_theme');
	
	if (the_logo_bg) $('body').attr('data-logobg', the_logo_bg);
	if (the_header_bg) $('body').attr('data-headerbg', the_header_bg);
	if (the_sidebar_bg) $('body').attr('data-sidebarbg', the_sidebar_bg);
	if (the_site_theme) $('body').attr('data-theme', the_site_theme);
	
	// 处理主题配色下拉选中
    $(".dropdown-skin :radio").each(function(){
        var $this = $(this),
            radioName = $this.attr('name');
        switch (radioName) {
            case 'site_theme':
                $this.val() == the_site_theme && $this.prop("checked", true);
                break;
            case 'logo_bg':
                $this.val() == the_logo_bg && $this.prop("checked", true);
                break;
            case 'header_bg':
                $this.val() == the_header_bg && $this.prop("checked", true);
                break;
            case 'sidebar_bg':
                $this.val() == the_sidebar_bg && $this.prop("checked", true);
        }
    });
	
	// 设置主题配色
	setTheme = function(input_name, data_name) {
	    $("input[name='"+input_name+"']").click(function(){
	        $('body').attr(data_name, $(this).val());
	        $.cookie('the_'+input_name, $(this).val());
	    });
	}
	setTheme('site_theme', 'data-theme');
	setTheme('logo_bg', 'data-logobg');
	setTheme('header_bg', 'data-headerbg');
	setTheme('sidebar_bg', 'data-sidebarbg');
</script>
</body>
</html>
