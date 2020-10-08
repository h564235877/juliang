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
<!--#include file="../../Action/AdminUser/main.asp"-->
<%End If%>

<%If Instr(MenuAllAction2,"|-|" & Action & "=")>0 Then%>
<ul class="tab">
<li><a href="?Action=userlist"<%If Action="userlist" Or Action="useradd" Or Action="usermodify" Then Response.write " class='selected'"%>><span>网站主列表</span></a></li>
<li><a href="?Action=userspendlist"<%If Action="userspendlist" Or Action="userspendmodify" Then Response.write " class='selected'"%>><span>用户结算</span></a></li>
<li><a href="?Action=userdeductlist"<%If Action="userdeductlist" Then Response.write " class='selected'"%>><span>用户扣款列表</span></a></li>
<li><a href="?Action=usersitelist"<%If Action="usersitelist" Or Action="usersitemodify" Then Response.write " class='selected'"%>><span>网站主网站审核</span></a></li>

<li><a href="?Action=seuserlist"<%If Action="seuserlist" Or Action="seuseradd" Or Action="seusermodify" Or Action="seuserlowmove" Then Response.write " class='selected'"%>><span>客服列表</span></a></li>
<li><a href="?Action=seuserscore"<%If Action="seuserscore" Or Action="seuserscoredetail" Then Response.write " class='selected'"%>><span>客服业绩</span></a></li>

<li><a href="?Action=couserlist"<%If Action="couserlist" Or Action="couseradd" Or Action="cousermodify" Or Action="couserlowmove" Then Response.write " class='selected'"%>><span>商务列表</span></a></li>
<li><a href="?Action=couserscore"<%If Action="couserscore" Or Action="couserscoredetail" Then Response.write " class='selected'"%>><span>商务业绩</span></a></li>
</ul>
<%End If%>

<%If Action="userlist" Then%>
<!--#include file="../../Action/AdminUser/userlist.asp"-->
<%End If%>

<%If Action="useradd" Then%>
<!--#include file="../../Action/AdminUser/useradd.asp"-->
<%End If%>

<%If Action="usermodify" Then%>
<!--#include file="../../Action/AdminUser/usermodify.asp"-->
<%End If%>

<%If Action="userspendlist" Then%>
<!--#include file="../../Action/AdminUser/userspendlist.asp"-->
<%End If%>

<%If Action="userspendmodify" Then%>
<!--#include file="../../Action/AdminUser/userspendmodify.asp"-->
<%End If%>

<%If Action="usersitelist" Then%>
<!--#include file="../../Action/AdminUser/usersitelist.asp"-->
<%End If%>

<%If Action="usersitemodify" Then%>
<!--#include file="../../Action/AdminUser/usersitemodify.asp"-->
<%End IF%>

<%If Action="userdeductlist" Then%>
<!--#include file="../../Action/AdminUser/userdeductlist.asp"-->
<%End If%>

<%If Action="seuserlist" Then%>
<!--#include file="../../Action/AdminUser/seuserlist.asp"-->
<%End If%>

<%If Action="seuseradd" Then%>
<!--#include file="../../Action/AdminUser/seuseradd.asp"-->
<%End If%>

<%If Action="seusermodify" Then%>
<!--#include file="../../Action/AdminUser/seusermodify.asp"-->
<%End If%>

<%If Action="seuserlowmove" Then%>
<!--#include file="../../Action/AdminUser/seuserlowmove.asp"-->
<%End If%>

<%If Action="seuserscore" Then%>
<!--#include file="../../Action/AdminUser/seuserscore.asp"-->
<%End If%>

<%If Action="seuserscoredetail" Then%>
<!--#include file="../../Action/AdminUser/seuserscoredetail.asp"-->
<%End If%>

<%If Action="couserlist" Then%>
<!--#include file="../../Action/AdminUser/couserlist.asp"-->
<%End If%>

<%If Action="couseradd" Then%>
<!--#include file="../../Action/AdminUser/couseradd.asp"-->
<%End If%>

<%If Action="cousermodify" Then%>
<!--#include file="../../Action/AdminUser/cousermodify.asp"-->
<%End If%>

<%If Action="couserlowmove" Then%>
<!--#include file="../../Action/AdminUser/couserlowmove.asp"-->
<%End If%>

<%If Action="couserscore" Then%>
<!--#include file="../../Action/AdminUser/couserscore.asp"-->
<%End If%>

<%If Action="couserscoredetail" Then%>
<!--#include file="../../Action/AdminUser/couserscoredetail.asp"-->
<%End If%>

<%If Instr(MenuAllAction3,"|-|" & Action & "=")>0 Then%>

<ul class="tab">
<li><a href="?Action=aduserlist"<%If Action="aduserlist" Or Action="aduseradd" Or Action="adusermodify" Then Response.write " class='selected'"%>><span>广告主列表</span></a></li>
<li><a href="?Action=aduserenoughlist"<%If Action="aduserenoughlist" Or Action="aduserenoughadd" Then Response.write " class='selected'"%>><span>广告主充值管理</span></a></li>
<li><a href="?Action=imglist"<%If Action="imglist" Then Response.write " class='selected'"%>><span>广告主上传管理</span></a></li>
<li><a href="?Action=lowlist"<%If Action="lowlist" Or Action="lowdaytj" Then Response.write " class='selected'"%>><span>CPA注册列表</span></a></li>
<li><a href="?Action=orderlist"<%If Action="orderlist" Or Action="orderdaytj" Or Action="orderdaytjgoodstime" Then Response.write " class='selected'"%>><span>CPS订单列表</span></a></li>
</ul>

<%End If%>

<%If Action="aduserlist" Then%>
<!--#include file="../../Action/AdminUser/aduserlist.asp"-->
<%End If%>

<%If Action="aduseradd" Then%>
<!--#include file="../../Action/AdminUser/aduseradd.asp"-->
<%End If%>

<%If Action="adusermodify" Then%>
<!--#include file="../../Action/AdminUser/adusermodify.asp"-->
<%End If%>

<%If Action="aduserenoughlist" Then%>
<!--#include file="../../Action/AdminUser/aduserenoughlist.asp"-->
<%End If%>

<%If Action="aduserenoughadd" Then%>
<!--#include file="../../Action/AdminUser/aduserenoughadd.asp"-->
<%End If%>

<%If Action="imglist" Then%>
<!--#include file="../../Action/AdminUser/imglist.asp"-->
<%End If%>

<%If Action="lowlist" Or Action="lowdaytj" Then%>
<div class="tabs_header">
<ul class="tabs">
<li <%If Action="lowlist" Then Response.write " class='active'"%>><a href="?Action=lowlist"><span>用户注册数据</span></a></li>
<li <%If Action="lowdaytj" Then Response.write " class='active'"%>><a href="?Action=lowdaytj"><span>用户每日统计</span></a></li>
</ul>
</div>

<%End If%>

<%If Action="lowlist" Then%>
<!--#include file="../../Action/AdminUser/lowlist.asp"-->
<%end if%>

<%If Action="lowdaytj" Then%>
<!--#include file="../../Action/AdminUser/lowdaytj.asp"-->
<%end if%>

<%If Action="orderlist" Or Action="orderdaytj" Or Action="orderdaytjgoodstime" Then%>

<div class="tabs_header">
<ul class="tabs">
<li <%If Action="orderlist" Then Response.write " class='active'"%>><a href="?Action=orderlist"><span>订单数据</span></a></li>
<li <%If Action="orderdaytj" Then Response.write " class='active'"%>><a href="?Action=orderdaytj"><span>订单每日统计</span></a></li>
<li <%If Action="orderdaytjgoodstime" Then Response.write " class='active'"%>><a href="?Action=orderdaytjgoodstime"><span>订单每日统计[按商品购买时间]</span></a></li>
</ul>
</div>

<%End If%>

<%If Action="orderlist" Then%>
<!--#include file="../../Action/AdminUser/orderlist.asp"-->
<%End If%>

<%If Action="orderdaytj" Then%>
<!--#include file="../../Action/AdminUser/orderdaytj.asp"-->
<%End If%>

<%If Action="orderdaytjgoodstime" Then%>
<!--#include file="../../Action/AdminUser/orderdaytjgoodstime.asp"-->
<%end if%>

<%If Instr(MenuAllAction4,"|-|" & Action & "=")>0 Then%>

<ul class="tab">
<li><a href="?Action=planlist" <%If Action="planlist" Or Action="planadd" Or Action="planmodify" Or Action="planchase" Or Action="planview" Then Response.write " class='selected'"%>><span>广告计划列表</span></a></li>
<li><a href="?Action=aduserexpendlist"<%If Action="aduserexpendlist" Or Action="aduserexpendmodify" Then Response.write " class='selected'"%>><span>广告审核列表</span></a></li>
<li><a href="?Action=passadlist"<%If Action="passadlist" Or Action="adadd" Or Action="admodify" Then Response.write " class='selected'"%>><span>已经审核在运行的广告</span></a></li>
<li><a href="?Action=pauseadlist"<%If Action="pauseadlist" Then Response.write " class='selected'"%>><span>暂停中的广告</span></a></li>
<li><a href="?Action=refuadlist"<%If Action="refuadlist" Or Action="aduserenoughadd" Then Response.write " class='selected'"%>><span>拒绝审核的广告</span></a></li>
<li><a href="?Action=overadlist"<%If Action="overadlist" Then Response.write " class='selected'"%>><span>已经完成的广告</span></a></li>
<li><a href="?Action=adcheck"<%If Action="adcheck" Or Action="adcheckmodify" Then Response.write " class='selected'"%>><span>广告主修改广告审核</span></a></li>
</ul>


<%End If%>

<%If Action="planlist" then%>
<!--#include file="../../Action/AdminUser/planlist.asp"-->
<%End If%>

<%If Action="planadd" then%>
<!--#include file="../../Action/AdminUser/planadd.asp"-->
<%End If%>

<%If Action="planmodify" then%>
<!--#include file="../../Action/AdminUser/planmodify.asp"-->
<%End If%>

<%If Action="planchase" then%>
<!--#include file="../../Action/AdminUser/planchase.asp"-->
<%End If%>

<%If Action="planview" Then%>
<!--#include file="../../Action/AdminUser/planview.asp"-->
<%End If%>

<%If Action="aduserexpendlist" then%>
<!--#include file="../../Action/AdminUser/aduserexpendlist.asp"-->
<%End If%>

<%If Action="adadd" then%>
<!--#include file="../../Action/AdminUser/adadd.asp"-->
<%End If%>

<%If Action="aduserexpendmodify" Then%>
<!--#include file="../../Action/AdminUser/aduserexpendmodify.asp"-->
<%End If%>

<%If Action="passadlist" Then%>
<!--#include file="../../Action/AdminUser/passadlist.asp"-->
<%End If%>

<%If Action="pauseadlist" Then%>
<!--#include file="../../Action/AdminUser/pauseadlist.asp"-->
<%End If%>

<%If Action="refuadlist" Then%>
<!--#include file="../../Action/AdminUser/refuadlist.asp"-->
<%End If%>
		
<%If Action="overadlist" Then%>
<!--#include file="../../Action/AdminUser/overadlist.asp"-->
<%End If%>

<%If Action="admodify" Then%>
<!--#include file="../../Action/AdminUser/admodify.asp"-->
<%End If%>

<%If Action="adcheck" Then%>
<!--#include file="../../Action/AdminUser/adcheck.asp"-->
<%End If%>

<%If Action="adcheckmodify" Then%>
<!--#include file="../../Action/AdminUser/adcheckmodify.asp"-->
<%End IF%>



<%If Instr(MenuAllAction5,"|-|" & Action & "=")>0 Then%>
<ul class="tab">
<li><a href="?Action=daytj"<%If Action="daytj" Or Action="daytjdetail" Then Response.write " class='selected'"%>><span>日统计</span></a></li>
<li><a href="?Action=hourtj"<%If Action="hourtj" Then Response.write " class='selected'"%>><span>小时统计</span></a></li>
<li><a href="?Action=userdatadaytj"<%If Action="userdatadaytj" Then Response.write " class='selected'"%>><span>排行</span></a></li>
<li><a href="?Action=iplist"<%If Action="iplist" Then Response.write " class='selected'"%>><span>有效点击</span></a></li>
<li><a href="?Action=clickflaglist"<%If Action="clickflaglist" or Action="clickflagdetail" Then Response.write " class='selected'"%>><span>无效点击统计</span></a></li>
<li><a href="?Action=invalidiplist"<%If Action="invalidiplist" Then Response.write " class='selected'"%>><span>无效点击</span></a></li>
<li><a href="?Action=showlist"<%If Action="showlist" Then Response.write " class='selected'"%>><span>最近显示</span></a></li>
<li><a href="?Action=clienttj"<%If Action="clienttj" Then Response.write " class='selected'"%>><span>客户端</span></a></li>
<li><a href="?Action=lylist"<%If Action="lylist" Then Response.write " class='selected'"%>><span>来源</span></a></li>
<li><a href="?Action=searchkeywordtj"<%If Action="searchkeywordtj" Then Response.write " class='selected'"%>><span>关键字</span></a></li>
<li><a href="?Action=inputdata"<%If Action="inputdata" Or Action="inputdataconfirm" Or Action="inputdatasave" Then Response.write " class='selected'"%>><span>导量</span></a></li>
<li><a href="?Action=othertj"<%If Action="othertj" or Action="lowuniondaytjbyusername" or Action="lowuniondaytjbyuserid" Then Response.write " class='selected'"%>><span>其它</span></a></li>
</ul>
<%End If%>

<%If Action="clienttj" Then%>
<!--#include file="../../Action/AdminUser/clienttj.asp"-->
<%End If%>

<%If Action="showlist" Then%>
<!--#include file="../../Action/AdminUser/showlist.asp"-->
<%End If%>

<%If Action="iplist" Then%>
<!--#include file="../../Action/AdminUser/iplist.asp"-->
<%End If%>

<%If Action="invalidiplist" Then%>
<!--#include file="../../Action/AdminUser/invalidiplist.asp"-->
<%End If%>

<%If Action="searchkeywordtj" Then%>
<!--#include file="../../Action/AdminUser/searchkeywordtj.asp"-->
<%End If%>


<%If Action="clickflaglist" Then%>
<!--#include file="../../Action/AdminUser/clickflaglist.asp"-->
<%End If%>

<%If Action="clickflagdetail" Then%>
<!--#include file="../../Action/AdminUser/clickflagdetail.asp"-->
<%End If%>

<%If Action="daytj" Then%>
<!--#include file="../../Action/AdminUser/daytj.asp"-->
<%End If%>

<%If Action="daytjdetail" Then%>
<!--#include file="../../Action/AdminUser/daytjdetail.asp"-->
<%End IF%>

<%If Action="hourtj" Then%>
<!--#include file="../../Action/AdminUser/hourtj.asp"-->
<%End If%>

<%If Action="userdatadaytj" Then%>
<!--#include file="../../Action/AdminUser/userdatadaytj.asp"-->
<%End If%>

<%If Action="lylist" Then%>
<!--#include file="../../Action/AdminUser/lylist.asp"-->
<%End IF%>

<%If Action="othertj" Then%>
<!--#include file="../../Action/AdminUser/othertj.asp"-->
<%End IF%>

<%If Action="lowuniondaytjbyusername" Then%>
<!--#include file="../../Action/AdminUser/lowuniondaytjbyusername.asp"-->
<%End IF%>

<%If Action="lowuniondaytjbyuserid" Then%>
<!--#include file="../../Action/AdminUser/lowuniondaytjbyuserid.asp"-->
<%End IF%>

<%If Action="inputdata" Or Action="inputdataconfirm" Or Action="inputdatasave" Then%>
<!--#include file="../../Action/AdminUser/inputdata.asp"-->
<%End IF%>

<%If Instr(MenuAllAction6,"|-|" & Action & "=")>0 Then%>
<div>
<ul class="tab">
<li><a href="?Action=sysmodify"<%If Action="sysmodify" Then Response.write " class='selected'"%>><span>系统设置</span></a></li>
<li><a href="?Action=ipblacklist"<%If Action="ipblacklist" Or Action="ipblacklistadd" Or Action="ipblacklistmoreadd" Or Action="ipblacklistmodify" Then Response.write " class='selected'"%>><span>IP黑名单</span></a></li>
<li><a href="?Action=siteclasslist"<%If Action="siteclasslist" Or Action="siteclassadd" Or Action="siteclassmodify" Then Response.write " class='selected'"%>><span>网站分类设置</span></a></li>
<li><a href="?Action=adsizelist"<%If Action="adsizelist" Or Action="adsizeadd" Or Action="adsizemodify" Then Response.write " class='selected'"%>><span>广告尺寸管理</span></a></li>
<li><a href="?Action=setbclasslist"<%If Action="setbclasslist" Or Action="setbclassadd" Or Action="setbclassmodify" Or Action="setsclasslist" Or Action="setsclassadd" Or Action="setsclassmodify" Or Action="setcontentlist" Or Action="setcontentadd" Or Action="setcontentmodify" Then Response.write " class='selected'"%>><span>设置配置</span></a></li>
<li><a href="?Action=testset"<%If Action="testset" Then Response.write " class='selected'"%>><span>删除本机IP和缓存</span></a></li>
<li><a href="?Action=sysrecset"<%If Action="sysrecset" Then Response.write " class='selected'"%>><span>整合接口设置</span></a></li>
<li><a href="?Action=agentadmodify"<%If Action="agentadmodify" Then Response.write " class='selected'"%>><span>代理广告设置</span></a></li>
</ul>
</div>
<%End If%>

<%If Action="sysmodify" Then%>
<!--#include file="../../Action/AdminUser/sysmodify.asp"-->
<%End If%>

<%If Action="ipblacklist" Then%>
<!--#include file="../../Action/AdminUser/ipblacklist.asp"-->
<%End If%>

<%If Action="ipblacklistadd" Then%>
<!--#include file="../../Action/AdminUser/ipblacklistadd.asp"-->
<%End If%>

<%If Action="ipblacklistmoreadd" Then%>
<!--#include file="../../Action/AdminUser/ipblacklistmoreadd.asp"-->
<%End If%>

<%If Action="ipblacklistmodify" Then%>
<!--#include file="../../Action/AdminUser/ipblacklistmodify.asp"-->
<%End If%>

<%If Action="setbclasslist" Then%>
<!--#include file="../../Action/AdminUser/setbclasslist.asp"-->
<%End If%>

<%if Action="setbclassadd" then%>
<!--#include file="../../Action/AdminUser/setbclassadd.asp"-->
<%end if%>

<%if Action="setbclassmodify" then%>
<!--#include file="../../Action/AdminUser/setbclassmodify.asp"-->
<%end if%>
   
<%If Action="setsclasslist" Then%>
<!--#include file="../../Action/AdminUser/setsclasslist.asp"-->
<%End If%>
  
<%if Action="setsclassadd" then%>
<!--#include file="../../Action/AdminUser/setsclassadd.asp"-->
<%end if%>

<%if Action="setsclassmodify" then%>
<!--#include file="../../Action/AdminUser/setsclassmodify.asp"-->
<%end if%>
  
<%if Action="setcontentlist" then%>
<!--#include file="../../Action/AdminUser/setcontentlist.asp"-->
<%end if%>

<%If Action="setcontentadd" Then%>
<!--#include file="../../Action/AdminUser/setcontentadd.asp"-->
<%End If%>

<%If Action="setcontentmodify" Then%>
<!--#include file="../../Action/AdminUser/setcontentmodify.asp"-->
<%End If%>

<%If Action="sysrecset" Then%>
<!--#include file="../../Action/AdminUser/sysrecset.asp"-->
<%End If%>

<%If Action="agentadmodify" Then%>
<!--#include file="../../Action/AdminUser/agentadmodify.asp"-->
<%End If%>

<%If Action="siteclasslist" Then%>
<!--#include file="../../Action/AdminUser/siteclasslist.asp"-->
<%End If%>

<%If Action="siteclassadd" Then%>  
<!--#include file="../../Action/AdminUser/siteclassadd.asp"-->
<%End If%>

<%If Action="siteclassmodify" Then%>  
<!--#include file="../../Action/AdminUser/siteclassmodify.asp"-->
<%End If%>

<%If Action="adsizelist" Then%>
<!--#include file="../../Action/AdminUser/adsizelist.asp"-->
<%End If%>

<%If Action="adsizeadd" Then%>  
<!--#include file="../../Action/AdminUser/adsizeadd.asp"-->
<%End If%>

<%If Action="adsizemodify" Then%>  
<!--#include file="../../Action/AdminUser/adsizemodify.asp"-->
<%End If%>

<%If Action="testset" Then%> 
<!--#include file="../../Action/AdminUser/testset.asp"-->
<%End if%>

<%If Action="pwdmodify" Then%>
<!--#include file="../../Action/AdminUser/pwdmodify.asp"-->
<%End If%>

<%If Action="adminuserlist" Then%>
<!--#include file="../../Action/AdminUser/adminuserlist.asp"-->
<%End If%>

<%If Action="adminuseradd" Then%>
<!--#include file="../../Action/AdminUser/adminuseradd.asp"-->
<%End IF%>

<%If Action="adminusermodify" Then%>
<!--#include file="../../Action/AdminUser/adminusermodify.asp"-->
<%End IF%>

<%If Instr(MenuAllAction8,"|-|" & Action & "=")>0 Then%>

<ul class="tab">
<li><a href="?Action=infolist"<%If Action="infolist" Or Action="infoadd" Or Action="infomodify" Then Response.write " class='selected'"%>><span>公告和帮助列表</span></a></li>
<li><a href="?Action=infoclasslist"<%If Action="infoclasslist" Or Action="infoclassadd" Or Action="infoclassmodify" Then Response.write " class='selected'"%>><span>公告和帮助分类</span></a></li>
</ul>

<%End If%>

<%If Action="infolist" Then%>
<!--#include file="../../Action/AdminUser/infolist.asp"-->
<%End If%>

<%If Action="infoadd" Then%>
<!--#include file="../../Action/AdminUser/infoadd.asp"-->
<%End IF%>

<%If Action="infomodify" Then%>
<!--#include file="../../Action/AdminUser/infomodify.asp"-->
<%End IF%>

<%If Action="infoclasslist" Then%>
<!--#include file="../../Action/AdminUser/infoclasslist.asp"-->
<%End If%>

<%If Action="infoclassadd" Then%>
<!--#include file="../../Action/AdminUser/infoclassadd.asp"-->
<%End IF%>

<%If Action="infoclassmodify" Then%>
<!--#include file="../../Action/AdminUser/infoclassmodify.asp"-->
<%End IF%>

<%If Action="gbooklist" Then%>
<!--#include file="../../Action/AdminUser/gbooklist.asp"-->
<%End If%>

<%If Action="gbookadd" Then%>
<!--#include file="../../Action/AdminUser/gbookadd.asp"-->
<%End IF%>

<%If Action="gbookreply" Then%>
<!--#include file="../../Action/AdminUser/gbookreply.asp"-->
<%End IF%>

<%If Action="emailsend" Then%>
<!--#include file="../../Action/AdminUser/emailsend.asp"-->
<%End IF%>

<%If Action="templatelist" Then%>         
<!--#include file="../../Action/AdminUser/templatelist.asp"-->
<%End If%>

<%If Action="dbdo" Then%>         
<!--#include file="../../Action/AdminUser/dbdo.asp"-->
<%End If%>
  
<%If Action="licencodemodify" Then%>
<!--#include file="../../Action/AdminUser/licencodemodify.asp"-->
<%End If%>
