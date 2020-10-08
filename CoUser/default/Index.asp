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


MenuAllAction1 = "main=后台首页"
MenuAllAction2 = "lowview=名下广告主"
MenuAllAction3 = "daytj=每天统计|-|daytjdetail=每天详细统计"
MenuAllAction4 = "spendlist=佣金结算列表|-|spendadd=佣金结算新增|-|spareout=佣金转广告主"
MenuAllAction5 = "pwdmodify=修改密码|-|pwdanswermodify=修改密码保护|-|userpaymodify=修改汇款方式|-|datamodify=修改资料"
MenuAllAction6 = "sysinfolist=系统公告|-|sysinfoshow=系统公告显示"
MenuAllAction7 = "gbooklist=问题咨询|-|gbookadd=问题咨询新增"

If Instr(MenuAllAction1,"|-|" & Action & "=")>0 Then
	 MenuName= GetStr(MenuAllAction1,Action)
	 
ElseIf Instr(MenuAllAction2,"|-|" & Action & "=")>0 Then
	MenuName= GetStr(MenuAllAction2,Action)
	
ElseIf Instr(MenuAllAction3,"|-|" & Action & "=")>0 Then
	MenuName = "数据报表-" & GetStr(MenuAllAction3,Action)
	
ElseIf Instr(MenuAllAction4,"|-|" & Action & "=")>0 Then
	MenuName= GetStr(MenuAllAction4,Action)
	
ElseIf Instr(MenuAllAction5,"|-|" & Action & "=")>0 Then
	MenuName = "安全中心-" & GetStr(MenuAllAction5,Action)

ElseIf Instr(MenuAllAction6,"|-|" & Action & "=")>0 Then
	 MenuName = GetStr(MenuAllAction6,Action)
	 
ElseIf Instr(MenuAllAction7,"|-|" & Action & "=")>0 Then
	 MenuName = GetStr(MenuAllAction7,Action)

End If
%>
<!--#Include File="../../include/SeUser_Do.asp"-->

<!DOCTYPE html>
<html lang="zh">
<head>
<meta charset="gbk">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />
<title>商务后台_<%=SysTitle%></title>
<link rel="icon" href="../../images/favicon.ico" type="image/ico">
<meta name="keywords" content="商务后台_<%=SysTitle%>">
<meta name="description" content="商务后台_<%=SysTitle%>">
<link href="../../css/bootstrap.min.css" rel="stylesheet">
<link href="../../css/materialdesignicons.min.css" rel="stylesheet">
<link href="../../css/style.min.css" rel="stylesheet">
<link href="../../css/my.css" rel="stylesheet">
<link href="../../css/BeAlert.css" rel="stylesheet">
<script src="../../js/jquery.min.js"></script>
<script src="../../js/jquery.cookie.min.js"></script>
<script src="../../js/global.js"></script>
<script src="../../js/BeAlert.js"></script>
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
            <li class="nav-item<%If Instr(MenuAllAction2,"|-|" & Action & "=")>0 Then Response.write " active"%>"> <a href="?Action=lowview"><i class="mdi mdi-account"></i> 名下广告主</a> </li>
			<li class="nav-item<%If Instr(MenuAllAction3,"|-|" & Action & "=")>0 Then Response.write " active"%>"> <a href="?Action=daytj"><i class="mdi mdi-google-analytics"></i> 数据报表</a> </li>
<%
Sql = "Select Count(1) From CFWztg_Spend Where UserName='"&CoUserName&"' And SpendType=0 And SpendState=1"
Set Rs2=Conn.Execute(Sql)
SpendNoReplyNum=Rs2(0)
Rs2.Close
%>
			<li class="nav-item<%If Instr(MenuAllAction4,"|-|" & Action & "=")>0 Then Response.write " active"%>"> <a href="?Action=spendlist"><i class="mdi mdi-currency-cny"></i> 佣金结算<%If SpendNoReplyNum>0 Then Response.write "<span class='badge'>"&SpendNoReplyNum&"</span>"%></a> </li>
			 
            <li class="nav-item nav-item-has-subnav<%If Instr(MenuAllAction5,"|-|" & Action & "=")>0 Then Response.write " active open"%>">
              <a href="javascript:void(0)"><i class="mdi mdi-security"></i> 安全中心</a>
              <ul class="nav nav-subnav">
                <li<%If Action="pwdmodify" Then Response.write " class='active'"%>> <a href="?Action=pwdmodify">修改密码</a> </li>
                <li<%If Action="pwdanswermodify" Then Response.write " class='active'"%>> <a href="?Action=pwdanswermodify">修改密码保护</a> </li>
                <li<%If Action="userpaymodify" Then Response.write " class='active'"%>> <a href="?Action=userpaymodify">修改汇款方式</a> </li>
                <li<%If Action="datamodify" Then Response.write " class='active'"%>> <a href="?Action=datamodify">修改资料</a> </li>
              </ul>
            </li>
            
			<li class="nav-item<%If Instr(MenuAllAction6,"|-|" & Action & "=")>0 Then Response.write " active"%>"> <a href="?Action=sysinfolist"><i class="mdi mdi-volume-high"></i> 系统公告</a> </li>
<%
Sql="Select Count(1) From CFWztg_Gbook where UserName='"&CoUserName&"' And IsRead_Admin=0"
Set Rs2=Conn.Execute(Sql)
GookNoReplyNum=Rs2(0)
Rs2.Close
%>
			<li class="nav-item<%If Instr(MenuAllAction7,"|-|" & Action & "=")>0 Then Response.write " active"%>"> <a href="?Action=gbooklist"><i class="mdi mdi-content-paste"></i> 问题咨询<%If GookNoReplyNum>0 Then Response.write "<span class='badge'>"&GookNoReplyNum&"</span>"%></a> </li>
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
                <img class="img-avatar img-avatar-48 m-r-10" src="images/users/avatar.jpg" alt="<%=CoUserName%>" />
                <span><%=CoUserName%> <span class="caret"></span></span>
              </a>
              <ul class="dropdown-menu dropdown-menu-right">
                <li> <a href="?Action=datamodify"><i class="mdi mdi-account"></i>个人信息</a> </li>
                <li> <a href="?Action=pwdmodify"><i class="mdi mdi-lock-outline"></i>修改密码</a> </li>
                <li> <a href="?Action=gbookadd"><i class="mdi mdi-content-paste"></i>提交留言</a></li>
                <li class="divider"></li>
                <li> <a href="?Action=couserlogout"><i class="mdi mdi-logout-variant"></i>退出登录</a> </li>
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
      
     <!--#Include File="CoUser_Select.asp"-->
      
    </main>
    <!--End 页面主要内容-->
  </div>
</div>


<script type="text/javascript" src="../../js/bootstrap.min.js"></script>
<script type="text/javascript" src="../../js/perfect-scrollbar.min.js"></script>
<script type="text/javascript" src="../../js/main.min.js"></script>


<%If Action="main" Then%>

<%
Sql="select c.adddate,sum(c.CoUser_Income_Cent) CoUser_Income_Cent from (select top 1000 min(a.adddate) adddate,a.ad_id,max(adusername) adusername,sum(a.CoUser_Income_Cent) CoUser_Income_Cent from CFWztg_AD_Counter_Day a inner join CFWztg_AD b on a.ad_id=b.id group by a.ad_id) c  inner join CFWztg_User d on c.adusername=d.username and d.upusername='"&CoUserName&"' group by c.adddate order by c.adddate"
Set Rs2=Conn.Execute(Sql)
While Not Rs2.Eof
 ChartDate = ChartDate & "'" & Rs2("AddDate") & "',"
 ChartData = ChartData & FormatNumber(Cdbl(Rs2("CoUser_Income_Cent")),2,-1,0,0) & ","
Rs2.MoveNext
Wend
ChartDate=StrReverse(Mid(StrReverse(ChartDate), 2))
ChartData=StrReverse(Mid(StrReverse(ChartData), 2))


Sql="select c.adddate,sum(c.Display_Counter) Display_Counter from (select top 1000 min(a.adddate) adddate,a.ad_id,max(adusername) adusername,sum(a.Display_Counter) Display_Counter from CFWztg_AD_Counter_Day a inner join CFWztg_AD b on a.ad_id=b.id group by a.ad_id) c  inner join CFWztg_User d on c.adusername=d.username and d.upusername='"&CoUserName&"' group by c.adddate order by c.adddate"
Set Rs2=Conn.Execute(Sql)
While Not Rs2.Eof
 ChartDate2 = ChartDate2 & "'" & Rs2("AddDate") & "',"
 ChartData2 = ChartData2 & Rs2("Display_Counter") & ","
Rs2.MoveNext
Wend
ChartDate2=StrReverse(Mid(StrReverse(ChartDate2), 2))
ChartData2=StrReverse(Mid(StrReverse(ChartData2), 2))
%>
<!--图表插件-->
<script type="text/javascript" src="../../js/Chart.js"></script>
<script type="text/javascript">
$(document).ready(function(e) {
    var $dashChartBarsCnt  = jQuery( '.js-chartjs-bars' )[0].getContext( '2d' ),
        $dashChartLinesCnt = jQuery( '.js-chartjs-lines' )[0].getContext( '2d' );
    
    var $dashChartBarsData = {
		labels: [<%=ChartDate%>],
		datasets: [
			{
				label: '最近收入',
                borderWidth: 1,
                borderColor: 'rgba(0,0,0,0)',
				backgroundColor: 'rgba(51,202,185,0.5)',
                hoverBackgroundColor: "rgba(51,202,185,0.7)",
                hoverBorderColor: "rgba(0,0,0,0)",
				data: [<%=ChartData%>]
			}
		]
	};
    var $dashChartLinesData = {
		labels: [<%=ChartDate2%>],
		datasets: [
			{
				label: '最近PV',
				data: [<%=ChartData2%>],
				borderColor: '#358ed7',
				backgroundColor: 'rgba(53, 142, 215, 0.175)',
                borderWidth: 1,
                fill: false,
                lineTension: 0.5
			}
		]
	};
    
    new Chart($dashChartBarsCnt, {
        type: 'bar',
        data: $dashChartBarsData
    });
    
    var myLineChart = new Chart($dashChartLinesCnt, {
        type: 'line',
        data: $dashChartLinesData,
    });
});
</script>
<%End If%>


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
