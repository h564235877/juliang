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
If Session("CFWztgUser")="" Then
 Response.Cookies("CFWztgUserCookie")=""
 Response.Cookies("CFWztgUserCookie").Expires=Dateadd("n",-1440,Now())
 Call AlertUrl("会话已过期，请重新登陆!","../../")
Else
 UserName=Session("CFWztgUser")
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

If RsSet("AdZlDomain")="" Then
 AdPath_2 = RootPath
Else
 AdPath_2 = RsSet("AdZlDomain")
End If

Action=ChkStr(Request("Action"),1)
If Action="" Then Action="main"

MenuAllAction1 = "|-|main=后台首页"
MenuAllAction2 = "|-|adlist=获取广告|-|adcodeget=获取广告代码"
MenuAllAction3 = "|-|daytj=每天统计|-|daytjdetail=每天详细统计|-|hourtj=每小时统计|-|iplist=有效点击IP|-|invalidiplist=无效点击IP|-|showlist=最近显示|-|searchkeywordtj=关键字|-|lylist=点击来源|-|ipareatj=IP地区|-|webwidthtj=网页宽度|-|othertj=其它"
MenuAllAction4 = "|-|lowview=CPA列表|-|lowdaytj=CPA统计|-|orderview=CPS订单|-|orderdaytj=CPS统计[按导入时间]|-|orderdaytjgoodstime=CPS统计[按购买时间]|-|lowuniondaytj=下级联盟|-|lowunionincometj=|-|lowuniondatarecview=下级联盟CPC、CPV和CPA收入按天导出|-|lowunioncpsrecview=下级联盟CPS收入按订单导出|-|lowuniondayrecview=下级联盟CPC、CPV和CPA数据按天导出|-|agentaddaytj=代理广告数据统计"
MenuAllAction5 = "|-|usersiteadd=新增网站"
MenuAllAction6 = "|-|usersitelist=网站列表"
MenuAllAction7 = "|-|spendlist=佣金结算列表|-|spendadd=佣金结算新增|-|spareout=佣金转广告主"
MenuAllAction8 = "|-|pwdmodify=修改密码|-|pwdanswermodify=修改密码保护|-|userpaymodify=修改汇款方式|-|datamodify=修改资料|-|aduserbindmodify=广告主绑定修改"
MenuAllAction9 = "|-|sysinfolist=系统公告|-|sysinfoshow=系统公告显示"
MenuAllAction10 = "|-|gbooklist=问题咨询|-|gbookadd=问题咨询新增"


If Instr(MenuAllAction1,"|-|" & Action & "=")>0 Then
	 MenuName= GetStr(MenuAllAction1,Action)
	 
ElseIf Instr(MenuAllAction2,"|-|" & Action & "=")>0 Then
	If Request("Ad_Class")<>"" Then Ad_Class=CInt(ChkStr(Request("Ad_Class"),2)) Else Ad_Class = RsSet("AdListDefaultClass")

	MenuName= GetStr(MenuAllAction2,Action) & "-"
	 
	If Ad_Class=1 Then
	 MenuName = MenuName & "直链文字"
	ElseIf Ad_Class=2 Then
	 MenuName = MenuName & "直链图片"
	ElseIf Ad_Class=3 Then
	 MenuName = MenuName & "普通文字"
	ElseIf Ad_Class=4 Then
	 MenuName = MenuName & "普通图片"
	ElseIf Ad_Class=5 Then
	 MenuName = MenuName & "混合文字"
	ElseIf Ad_Class=6 Then
	 MenuName = MenuName & "混合图片"
	ElseIf Ad_Class=7 Then
	 MenuName = MenuName & "富媒体"
	ElseIf Ad_Class=8 Then
	 MenuName = MenuName & "强弹"
	ElseIf Ad_Class=9 Then
	 MenuName = MenuName & "退弹"
	ElseIf Ad_Class=10 Then
	 MenuName = MenuName & "混合标签云"
	ElseIf Ad_Class=11 Then
	 MenuName = MenuName & "混合富媒体"
	ElseIf Ad_Class=12 Then
	 MenuName = MenuName & "软件下载安装"
	ElseIf Ad_Class=0 Then
	 MenuName = MenuName & "代理广告"
	ElseIf Ad_Class=-1 Then
	 MenuName = MenuName & "轮循直链"
	ElseIf Ad_Class=-4 Then
	 MenuName = MenuName & "轮循图片"
	ElseIf Ad_Class=-7 Then
	 MenuName = MenuName & "轮循富媒体"
	End If
ElseIf Instr(MenuAllAction3,"|-|" & Action & "=")>0 Then
	MenuName = "数据报表-" & GetStr(MenuAllAction3,Action)
	
ElseIf Instr(MenuAllAction4,"|-|" & Action & "=")>0 Then
	MenuName = "效果统计-" & GetStr(MenuAllAction4,Action)

ElseIf Instr(MenuAllAction5,"|-|" & Action & "=")>0 Then
	 MenuName = GetStr(MenuAllAction5,Action)
	 
ElseIf Instr(MenuAllAction6,"|-|" & Action & "=")>0 Then
	 MenuName = GetStr(MenuAllAction6,Action)
	 
ElseIf Instr(MenuAllAction7,"|-|" & Action & "=")>0 Then
	 MenuName = GetStr(MenuAllAction7,Action)
	 
ElseIf Instr(MenuAllAction8,"|-|" & Action & "=")>0 Then
	 MenuName = "安全中心-" & GetStr(MenuAllAction8,Action)

ElseIf Instr(MenuAllAction9,"|-|" & Action & "=")>0 Then
	 MenuName = GetStr(MenuAllAction9,Action)
	 
ElseIf Instr(MenuAllAction10,"|-|" & Action & "=")>0 Then
	 MenuName = GetStr(MenuAllAction10,Action)
	 
End If
%>
<!--#Include File="../../include/User_Do.asp"-->
<!DOCTYPE html>
<html lang="zh">
<head>
<meta charset="gbk">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />
<title>网站主后台_<%=SysTitle%></title>
<link rel="icon" href="../../images/favicon.ico" type="image/ico">
<meta name="keywords" content="网站主后台_<%=SysTitle%>">
<meta name="description" content="网站主后台_<%=SysTitle%>">
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
            <li class="nav-item nav-item-has-subnav<%If Instr(MenuAllAction2,"|-|" & Action & "=")>0 Then Response.write " active open"%>">
              <a href="javascript:void(0)"><i class="mdi mdi-stackoverflow"></i> 获取广告</a>
              <ul class="nav nav-subnav">
<%
Sql="SELECT "
Sql=Sql&"(SELECT Count(1) FROM CFWztg_AD a inner join CFWztg_Plan b on a.plan_id=b.id Where b.PlanState=2 and a.AdState=2 And a.AdListShowState=1) adclass_0,"
Sql=Sql&"(SELECT Count(1) FROM CFWztg_AD a inner join CFWztg_Plan b on a.plan_id=b.id Where b.PlanState=2 and a.Ad_Class=1 And a.AdState=2 And a.AdListShowState=1) adclass_1,"
Sql=Sql&"(SELECT Count(1) FROM CFWztg_AD a inner join CFWztg_Plan b on a.plan_id=b.id Where b.PlanState=2 and a.Ad_Class=2 And a.AdState=2 And a.AdListShowState=1) adclass_2,"
Sql=Sql&"(SELECT Count(1) FROM CFWztg_AD a inner join CFWztg_Plan b on a.plan_id=b.id Where b.PlanState=2 and a.Ad_Class=3 And a.AdState=2 And a.AdListShowState=1) adclass_3,"
Sql=Sql&"(SELECT Count(1) FROM CFWztg_AD a inner join CFWztg_Plan b on a.plan_id=b.id Where b.PlanState=2 and a.Ad_Class=4 And a.AdState=2 And a.AdListShowState=1) adclass_4,"
Sql=Sql&"(SELECT Count(1) FROM CFWztg_AD a inner join CFWztg_Plan b on a.plan_id=b.id Where b.PlanState=2 and a.Ad_Class=5 And a.AdState=2 And a.AdListShowState=1) adclass_5,"
Sql=Sql&"(SELECT Count(1) FROM CFWztg_AD a inner join CFWztg_Plan b on a.plan_id=b.id Where b.PlanState=2 and a.Ad_Class=6 And a.AdState=2 And a.AdListShowState=1) adclass_6,"
Sql=Sql&"(SELECT Count(1) FROM CFWztg_AD a inner join CFWztg_Plan b on a.plan_id=b.id Where b.PlanState=2 and a.Ad_Class=7 And a.AdState=2 And a.AdListShowState=1) adclass_7,"
Sql=Sql&"(SELECT Count(1) FROM CFWztg_AD a inner join CFWztg_Plan b on a.plan_id=b.id Where b.PlanState=2 and a.Ad_Class=8 And a.AdState=2 And a.AdListShowState=1) adclass_8,"
Sql=Sql&"(SELECT Count(1) FROM CFWztg_AD a inner join CFWztg_Plan b on a.plan_id=b.id Where b.PlanState=2 and a.Ad_Class=9 And a.AdState=2 And a.AdListShowState=1) adclass_9,"
Sql=Sql&"(SELECT Count(1) FROM CFWztg_AD a inner join CFWztg_Plan b on a.plan_id=b.id Where b.PlanState=2 and a.Ad_Class=10 And a.AdState=2 And a.AdListShowState=1) adclass_10,"
Sql=Sql&"(SELECT Count(1) FROM CFWztg_AD a inner join CFWztg_Plan b on a.plan_id=b.id Where b.PlanState=2 and a.Ad_Class=11 And a.AdState=2 And a.AdListShowState=1) adclass_11,"
Sql=Sql&"(SELECT Count(1) FROM CFWztg_AD a inner join CFWztg_Plan b on a.plan_id=b.id Where b.PlanState=2 and a.Ad_Class=12 And a.AdState=2 And a.AdListShowState=1) adclass_12,"
Sql=Sql&"(SELECT Count(1) FROM CFWztg_AgentAd Where 1=1) adclass_f0,"
Sql=Sql&"(SELECT Count(1) FROM CFWztg_AD a inner join CFWztg_Plan b on a.plan_id=b.id Where b.PlanState=2 and a.Ad_Class=1 And a.AdState=2 And a.CycState>0) adclass_f1,"
Sql=Sql&"(SELECT Count(1) FROM CFWztg_AD a inner join CFWztg_Plan b on a.plan_id=b.id Where b.PlanState=2 and a.Ad_Class=4 And a.AdState=2 And a.CycState>0) adclass_f4,"
Sql=Sql&"(SELECT Count(1) FROM CFWztg_AD a inner join CFWztg_Plan b on a.plan_id=b.id Where b.PlanState=2 and a.Ad_Class=7 And a.AdState=2 And a.CycState>0) adclass_f7"


Set Rs=Conn.Execute(Sql)
%>
<%If InStr(RsSet("AdListOpenClass"),",-7,")>0 And Rs("AdClass_f7")>0 Then%>
<li<%If Ad_Class=-7 Then Response.write " class='active'"%>><a href="?Action=adlist&Ad_Class=-7"><SPAN>轮循富媒体[<%=Rs("AdClass_f7")%>]</SPAN></a></li>
<%End If%>

<%If InStr(RsSet("AdListOpenClass"),",-1,")>0 And Rs("AdClass_f1")>0 Then%>
<li<%If Ad_Class=-1 Then Response.write " class='active'"%>><a href="?Action=adlist&Ad_Class=-1"><SPAN>轮循直链[<%=Rs("AdClass_f1")%>]</SPAN></a></li>
<%End If%>

<%If InStr(RsSet("AdListOpenClass"),",-4,")>0 And Rs("AdClass_f4")>0 Then%>
<li<%If Ad_Class=-4 Then Response.write " class='active'"%>><a href="?Action=adlist&Ad_Class=-4"><SPAN>轮循普通图片[<%=Rs("AdClass_f4")%>]</SPAN></a></li>
<%End If%>

<%If InStr(RsSet("AdListOpenClass"),",8,")>0 And Rs("AdClass_8")>0 Then%>
<li<%If Ad_Class=8 Then Response.write " class='active'"%>><a href="?Action=adlist&Ad_Class=8"><SPAN>轮循强弹[<%=Rs("AdClass_8")%>]</SPAN></a></li>
<%End If%>

<%If InStr(RsSet("AdListOpenClass"),",9,")>0 And Rs("AdClass_9")>0 Then%>
<li<%If Ad_Class=9 Then Response.write " class='active'"%>><a href="?Action=adlist&Ad_Class=9"><SPAN>轮循退弹[<%=Rs("AdClass_9")%>]</SPAN></a></li>
<%End If%>

<%If InStr(RsSet("AdListOpenClass"),",11,")>0 And Rs("AdClass_11")>0 Then%>
<li<%If Ad_Class=11 Then Response.write " class='active'"%>><a href="?Action=adlist&Ad_Class=11"><SPAN>混合富媒体[<%=Rs("AdClass_11")%>]</SPAN></a></li>
<%End If%>

<%If InStr(RsSet("AdListOpenClass"),",5,")>0 And Rs("AdClass_5")>0 Then%>
<li<%If Ad_Class=5 Then Response.write " class='active'"%>><a href="?Action=adlist&Ad_Class=5"><SPAN>混合文字[<%=Rs("AdClass_5")%>]</SPAN></a></li>
<%End If%>

<%If InStr(RsSet("AdListOpenClass"),",6,")>0 And Rs("AdClass_6")>0 Then%>
<li<%If Ad_Class=6 Then Response.write " class='active'"%>><a href="?Action=adlist&Ad_Class=6"><SPAN>混合图片[<%=Rs("AdClass_6")%>]</SPAN></a></li>
<%End If%>

<%If InStr(RsSet("AdListOpenClass"),",10,")>0 And Rs("AdClass_10")>0 Then%>
<li<%If Ad_Class=10 Then Response.write " class='active'"%>><a href="?Action=adlist&Ad_Class=10"><SPAN>混合标签云[<%=Rs("AdClass_10")%>]</SPAN></a></li>
<%End If%>

<%If InStr(RsSet("AdListOpenClass"),",1,")>0 And Rs("AdClass_1")>0 Then%>
<li<%If Ad_Class=1 Then Response.write " class='active'"%>><a href="?Action=adlist&Ad_Class=1"><span>直链广告[<%=Rs("AdClass_1")%>]</span></a></li>
<%End If%>

<%If InStr(RsSet("AdListOpenClass"),",2,")>0 And Rs("AdClass_2")>0 Then%>
<li<%If Ad_Class=2 Then Response.write " class='active'"%>><a href="?Action=adlist&Ad_Class=2"><SPAN>直图广告[<%=Rs("AdClass_2")%>]</SPAN></a></li>
<%End If%>

<%If InStr(RsSet("AdListOpenClass"),",3,")>0 And Rs("AdClass_3")>0 Then%>
<li<%If Ad_Class=3 Then Response.write " class='active'"%>><a href="?Action=adlist&Ad_Class=3"><SPAN>普通文字[<%=Rs("AdClass_3")%>]</SPAN></a></li>
<%End If%>

<%If InStr(RsSet("AdListOpenClass"),",4,")>0 And Rs("AdClass_4")>0 Then%>
<li<%If Ad_Class=4 Then Response.write " class='active'"%>><a href="?Action=adlist&Ad_Class=4"><SPAN>普通图片[<%=Rs("AdClass_4")%>]</SPAN></a></li>
<%End If%>

<%If InStr(RsSet("AdListOpenClass"),",7,")>0 And Rs("AdClass_7")>0 Then%>
<li<%If Ad_Class=7 Then Response.write " class='active'"%>><a href="?Action=adlist&Ad_Class=7"><SPAN>富媒体[<%=Rs("AdClass_7")%>]</SPAN></a></li>
<%End If%>

<%If InStr(RsSet("AdListOpenClass"),",0,")>0 And Rs("AdClass_f0")>0 Then%>
<li<%If Ad_Class=0 Then Response.write " class='active'"%>><a href="?Action=adlist&Ad_Class=0"><SPAN>代理广告[<%=Rs("AdClass_f0")%>]</SPAN></a></li>
<%End If%>

<%If InStr(RsSet("AdListOpenClass"),",12,")>0 And Rs("AdClass_12")>0 Then%>
<li<%If Ad_Class=12 Then Response.write " class='active'"%>><a href="?Action=adlist&Ad_Class=12"><SPAN>软件下载安装[<%=Rs("AdClass_12")%>]</SPAN></a></li>
<%End If%>

              </ul>
            </li>
            <li class="nav-item nav-item-has-subnav<%If Instr(MenuAllAction3,"|-|" & Action & "=")>0 Then Response.write " active open"%>">
              <a href="javascript:void(0)"><i class="mdi mdi-google-analytics"></i> 数据报表</a>
              <ul class="nav nav-subnav">
<%If InStr(RsSet("UserOpenShow"),",daytj,")>0 Then%><li<%If Action="daytj" or Action="daytjdetail" Then Response.write " class='active'"%>> <a href="?Action=daytj">每天统计</a> </li><%End If%>
<%If InStr(RsSet("UserOpenShow"),",hourtj,")>0 Then%><li<%If Action="hourtj" Then Response.write " class='active'"%>> <a href="?Action=hourtj">每小时统计</a> </li><%End If%>
<%If InStr(RsSet("UserOpenShow"),",iplist,")>0 Then%><li<%If Action="iplist" Then Response.write " class='active'"%>> <a href="?Action=iplist">有效点击IP</a> </li><%End If%>
<%If InStr(RsSet("UserOpenShow"),",invalidiplist,")>0 Then%><li<%If Action="invalidiplist" Then Response.write " class='active'"%>> <a href="?Action=invalidiplist">无效点击IP</a> </li><%End If%>
<%If InStr(RsSet("UserOpenShow"),",showlist,")>0 Then%><li<%If Action="showlist" Then Response.write " class='active'"%>> <a href="?Action=showlist">最近显示</a> </li><%End If%>
<%If InStr(RsSet("UserOpenShow"),",searchkeywordtj,")>0 Then%><li<%If Action="searchkeywordtj" Then Response.write " class='active'"%>> <a href="?Action=searchkeywordtj">关键字</a> </li><%End If%>
<%If InStr(RsSet("UserOpenShow"),",lylist,")>0 Then%><li<%If Action="lylist" Then Response.write " class='active'"%>> <a href="?Action=lylist">点击来源</a> </li><%End If%>
<%If InStr(RsSet("UserOpenShow"),",ipareatj,")>0 Then%><li<%If Action="ipareatj" Then Response.write " class='active'"%>> <a href="?Action=ipareatj">IP地区</a> </li><%End If%>
<%If InStr(RsSet("UserOpenShow"),",webwidthtj,")>0 Then%><li<%If Action="webwidthtj" Then Response.write " class='active'"%>> <a href="?Action=webwidthtj">网页宽度</a> </li><%End If%>
<%If InStr(RsSet("UserOpenShow"),",othertj,")>0 Then%><li<%If Action="othertj" Then Response.write " class='active'"%>> <a href="?Action=othertj">其它</a> </li><%End If%>
              </ul>
            </li>
            <li class="nav-item nav-item-has-subnav<%If Instr(MenuAllAction4,"|-|" & Action & "=")>0 Then Response.write " active open"%>">
              <a href="javascript:void(0)"><i class="mdi mdi-human-greeting"></i> CPA和CPS</a>
              <ul class="nav nav-subnav">
<%If InStr(RsSet("UserOpenShow"),",lowview,")>0 Then%><li<%If Action="lowview" Then Response.write " class='active'"%>> <a href="?Action=lowview">CPA列表</a> </li><%End If%>
<%If InStr(RsSet("UserOpenShow"),",lowdaytj,")>0 Then%><li<%If Action="lowdaytj" Then Response.write " class='active'"%>> <a href="?Action=lowdaytj">CPA统计</a> </li><%End If%>
<%If InStr(RsSet("UserOpenShow"),",orderview,")>0 Then%><li<%If Action="orderview" Then Response.write " class='active'"%>> <a href="?Action=orderview">CPS订单</a> </li><%End If%>
<%If InStr(RsSet("UserOpenShow"),",orderdaytj,")>0 Then%><li<%If Action="orderdaytj" Then Response.write " class='active'"%>> <a href="?Action=orderdaytj">CPS统计[按导入时间]</a> </li><%End If%>
<%If InStr(RsSet("UserOpenShow"),",orderdaytjgoodstime,")>0 Then%><li<%If Action="orderdaytjgoodstime" Then Response.write " class='active'"%>> <a href="?Action=orderdaytjgoodstime">CPS统计[按购买时间]</a> </li><%End If%>
<%If InStr(RsSet("UserOpenShow"),",lowuniondaytj,")>0 Then%><li<%If Action="lowuniondaytj" Then Response.write " class='active'"%>> <a href="?Action=lowuniondaytj">下级联盟</a> </li><%End If%>
<%If InStr(RsSet("UserOpenShow"),",lowuniondatarecview,")>0 Then%><li<%If Action="lowuniondatarecview" Or Action="lowuniondayrecview" Or Action="lowunioncpsrecview" Then Response.write " class='active'"%>> <a href="?Action=lowuniondatarecview">下级联盟数据导出</a> </li><%End If%>
<%If InStr(RsSet("UserOpenShow"),",agentaddaytj,")>0 Then%><li<%If Action="agentaddaytj" Then Response.write " class='active'"%>> <a href="?Action=agentaddaytj">代理广告数据统计</a> </li><%End If%>
              </ul>
            </li>
			
            <li class="nav-item<%If Instr(MenuAllAction5,"|-|" & Action & "=")>0 Then Response.write " active"%>"> <a href="?Action=usersiteadd"><i class="mdi mdi-web"></i> 新增网站</a> </li>
			<li class="nav-item<%If Instr(MenuAllAction6,"|-|" & Action & "=")>0 Then Response.write " active"%>"> <a href="?Action=usersitelist"><i class="mdi mdi-image-filter-none"></i> 网站列表</a> </li>
<%
Sql = "Select Count(1) From CFWztg_Spend Where UserName='"&UserName&"' And SpendType=0 And SpendState=1"
Set Rs2=Conn.Execute(Sql)
SpendNoReplyNum=Rs2(0)
Rs2.Close
%>
			<li class="nav-item<%If Instr(MenuAllAction7,"|-|" & Action & "=")>0 Then Response.write " active"%>"> <a href="?Action=spendlist"><i class="mdi mdi-currency-cny"></i> 佣金结算<%If SpendNoReplyNum>0 Then Response.write "<span class='badge'>"&SpendNoReplyNum&"</span>"%></a> </li>
			 
            <li class="nav-item nav-item-has-subnav<%If Instr(MenuAllAction8,"|-|" & Action & "=")>0 Then Response.write " active open"%>">
              <a href="javascript:void(0)"><i class="mdi mdi-security"></i> 安全中心</a>
              <ul class="nav nav-subnav">
                <li<%If Action="pwdmodify" Then Response.write " class='active'"%>> <a href="?Action=pwdmodify">修改密码</a> </li>
                <li<%If Action="pwdanswermodify" Then Response.write " class='active'"%>> <a href="?Action=pwdanswermodify">修改密码保护</a> </li>
                <li<%If Action="userpaymodify" Then Response.write " class='active'"%>> <a href="?Action=userpaymodify">修改汇款方式</a> </li>
                <li<%If Action="datamodify" Then Response.write " class='active'"%>> <a href="?Action=datamodify">修改资料</a> </li>
                <li<%If Action="aduserbindmodify" Then Response.write " class='active'"%>> <a href="?Action=aduserbindmodify">修改广告主绑定</a> </li>
              </ul>
            </li>
            
			<li class="nav-item<%If Instr(MenuAllAction9,"|-|" & Action & "=")>0 Then Response.write " active"%>"> <a href="?Action=sysinfolist"><i class="mdi mdi-volume-high"></i> 系统公告</a> </li>
<%
Sql="Select Count(1) From CFWztg_Gbook where UserName='"&UserName&"' And IsRead_Admin=0"
Set Rs2=Conn.Execute(Sql)
GookNoReplyNum=Rs2(0)
Rs2.Close
%>
			<li class="nav-item<%If Instr(MenuAllAction10,"|-|" & Action & "=")>0 Then Response.write " active"%>"> <a href="?Action=gbooklist"><i class="mdi mdi-content-paste"></i> 问题咨询<%If GookNoReplyNum>0 Then Response.write "<span class='badge'>"&GookNoReplyNum&"</span>"%></a> </li>
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
                <img class="img-avatar img-avatar-48 m-r-10" src="images/users/avatar.jpg" alt="<%=UserName%>" />
                <span><%=UserName%> <span class="caret"></span></span>
              </a>
              <ul class="dropdown-menu dropdown-menu-right">
                <li> <a href="?Action=datamodify"><i class="mdi mdi-account"></i>个人信息</a> </li>
                <li> <a href="?Action=pwdmodify"><i class="mdi mdi-lock-outline"></i>修改密码</a> </li>
                <li> <a href="?Action=gbookadd"><i class="mdi mdi-content-paste"></i>提交留言</a></li>
                <li class="divider"></li>
                <li> <a href="?Action=userlogout"><i class="mdi mdi-logout-variant"></i>退出登录</a> </li>
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
      
     <!--#Include File="User_Select.asp"-->
      
    </main>
    <!--End 页面主要内容-->
  </div>
</div>


<script type="text/javascript" src="../../js/bootstrap.min.js"></script>
<script type="text/javascript" src="../../js/perfect-scrollbar.min.js"></script>
<script type="text/javascript" src="../../js/main.min.js"></script>


<%If Action="main" Then%>

<%
Sql="Select top 7 AddDate,Sum(User_Income_Cent) As User_Income_Cent From CFWztg_AD_Counter_Day Where UserName='"&UserName&"'  Group By AddDate Order By AddDate"
Set Rs2=Conn.Execute(Sql)
While Not Rs2.Eof
 ChartDate = ChartDate & "'" & Rs2("AddDate") & "',"
 ChartData = ChartData & FormatNumber(Cdbl(Rs2("User_Income_Cent")),2,-1,0,0) & ","
Rs2.MoveNext
Wend
ChartDate=StrReverse(Mid(StrReverse(ChartDate), 2))
ChartData=StrReverse(Mid(StrReverse(ChartData), 2))


Sql="Select top 15 AddDate,Sum(Display_Counter) As Display_Counter From CFWztg_AD_Counter_Day Where UserName='"&UserName&"'  Group By AddDate Order By AddDate"
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
