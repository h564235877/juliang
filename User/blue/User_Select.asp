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
<!--#include file="../../Action/User_Blue/main.asp"-->
<%End If%>


<%If Action="clickflaglist" Then%>
<!--#include file="../../Action/User/clickflaglist.asp"-->
<%End If%>


<%If Action="daytj" Or Action="hourtj" Or Action="iplist" Or Action="invalidiplist" Or Action="showlist" Or Action="searchkeywordtj" Or Action="lylist" Or Action="ipareatj" Or Action="webwidthtj" Or Action="othertj" Then%>

<ul class="tab">
<%If InStr(RsSet("UserOpenShow"),",daytj,")>0 Then%>
<li><a href="?Action=daytj"<%If Action="daytj" Then Response.write " class='selected'"%>><span>每天统计</span></a></li>
<%
Else
 If Action="daytj" Then AlertRef("禁止查看此统计")
End If%>

<%If InStr(RsSet("UserOpenShow"),",hourtj,")>0 Then%>
<li><a href="?Action=hourtj"<%If Action="hourtj" Then Response.write " class='selected'"%>><span>每小时统计</span></a></li>
<%
Else
 If Action="hourtj" Then AlertRef("禁止查看此统计")
End If%>

<%If InStr(RsSet("UserOpenShow"),",iplist,")>0 Then%>
<li><a href="?Action=iplist"<%If Action="iplist" Then Response.write " class='selected'"%>><span>有效点击IP</span></a></li>
<%
Else
 If Action="iplist" Then AlertRef("禁止查看此统计")
End If%>

<%If InStr(RsSet("UserOpenShow"),",invalidiplist,")>0 Then%>
<li><a href="?Action=invalidiplist"<%If Action="invalidiplist" Then Response.write " class='selected'"%>><span>无效点击IP</span></a></li>
<%
Else
 If Action="invalidiplist" Then AlertRef("禁止查看此统计")
End If%>

<%If InStr(RsSet("UserOpenShow"),",showlist,")>0 Then%>
<li><a href="?Action=showlist"<%If Action="showlist" Then Response.write " class='selected'"%>><span>最近显示</span></a></li>
<%
Else
 If Action="showlist" Then AlertRef("禁止查看此统计")
End If%>

<%If InStr(RsSet("UserOpenShow"),",searchkeywordtj,")>0 Then%>
<li><a href="?Action=searchkeywordtj"<%If Action="searchkeywordtj" Then Response.write " class='selected'"%>><span>关键字</span></a></li>
<%
Else
 If Action="searchkeywordtj" Then AlertRef("禁止查看此统计")
End If%>

<%If InStr(RsSet("UserOpenShow"),",lylist,")>0 Then%>
<li><a href="?Action=lylist"<%If Action="lylist" Then Response.write " class='selected'"%>><span>点击来源</span></a></li>
<%
Else
 If Action="lylist" Then AlertRef("禁止查看此统计")
End If%>

<%If InStr(RsSet("UserOpenShow"),",ipareatj,")>0 Then%>
<li><a href="?Action=ipareatj"<%If Action="ipareatj" Then Response.write " class='selected'"%>><span>IP地区</span></a></li>
<%
Else
 If Action="ipareatj" Then AlertRef("禁止查看此统计")
End If%>

<%If InStr(RsSet("UserOpenShow"),",webwidthtj,")>0 Then%>
<li><a href="?Action=webwidthtj"<%If Action="webwidthtj" Then Response.write " class='selected'"%>><span>网页宽度</span></a></li>
<%
Else
 If Action="webwidthtj" Then AlertRef("禁止查看此统计")
End If%>

<%If InStr(RsSet("UserOpenShow"),",othertj,")>0 Then%>
<li><a href="?Action=othertj"<%If Action="othertj" Then Response.write " class='selected'"%>><span>其它</span></a></li>
<%
Else
 If Action="othertj" Then AlertRef("禁止查看此统计")
End If%>

</ul>

<%End If%>


<%If Action="daytj" Then%>
<!--#include file="../../Action/User/daytj.asp"-->
<%end if%>

<%If Action="hourtj" Then%>
<!--#include file="../../Action/User/hourtj.asp"-->
<%End If%>

<%If Action="iplist" Then%>
<!--#include file="../../Action/User/iplist.asp"-->
<%End If%>

<%If Action="invalidiplist" Then%>
<!--#include file="../../Action/User/invalidiplist.asp"-->
<%End If%>

<%If Action="showlist" Then%>
<!--#include file="../../Action/User/showlist.asp"-->
<%end if%>

<%If Action="daytjdetail" Then%>
<!--#include file="../../Action/User/daytjdetail.asp"-->
<%end if%>

<%If Action="searchkeywordtj" Then%>
<!--#include file="../../Action/User/searchkeywordtj.asp"-->
<%End If%>

<%If Action="lylist" Then%>
<!--#include file="../../Action/User/lylist.asp"-->
<%End If%>


<%If Action="ipareatj" Then%>
<!--#include file="../../Action/User/ipareatj.asp"-->
<%End If%>


<%If Action="webwidthtj" Then%>
<!--#include file="../../Action/User/webwidthtj.asp"-->
<%End If%>

<%If Action="othertj" Then%>
<!--#include file="../../Action/User/othertj.asp"-->
<%End If%>


<%If Action="lowview" Or Action="lowdaytj" Or Action="orderview" Or Action="orderdaytj" Or Action="orderlowout" Or Action="orderdaytjgoodstime" Or Action="lowuniondaytj" Or Action="lowunionincometj" Or Action="lowuniondatarecview" Or Action="lowunioncpsrecview" Or Action="lowuniondayrecview" Or Action="agentaddaytj" Then%>

<ul class="tab">
<%If InStr(RsSet("UserOpenShow"),",lowview,")>0 Then%>
<li><a href="?Action=lowview"<%If Action="lowview" Then Response.write " class='selected'"%>><span>CPA列表</span></a></li>
<%
Else
 If Action="lowview" Then AlertRef("禁止查看此统计")
End If%>

<%If InStr(RsSet("UserOpenShow"),",lowdaytj,")>0 Then%>
<li><a href="?Action=lowdaytj"<%If Action="lowdaytj" Then Response.write " class='selected'"%>><span>CPA统计</span></a></li>
<%
Else
 If Action="lowdaytj" Then AlertRef("禁止查看此统计")
End If%>

<%If InStr(RsSet("UserOpenShow"),",orderview,")>0 Then%>
<li><a href="?Action=orderview"<%If Action="orderview" Then Response.write " class='selected'"%>><span>CPS订单</span></a></li>
<%
Else
 If Action="orderview" Then AlertRef("禁止查看此统计")
End If%>

<%If InStr(RsSet("UserOpenShow"),",orderdaytj,")>0 Then%>
<li><a href="?Action=orderdaytj"<%If Action="orderdaytj" Or Action="orderlowout" Then Response.write " class='selected'"%>><span>CPS统计[按导入时间]</span></a></li>
<%
Else
 If Action="orderdaytj" Then AlertRef("禁止查看此统计")
End If%>

<%If InStr(RsSet("UserOpenShow"),",orderdaytjgoodstime,")>0 Then%>
<li><a href="?Action=orderdaytjgoodstime"<%If Action="orderdaytjgoodstime" Then Response.write " class='selected'"%>><span>CPS统计[按购买时间]</span></a></li>
<%
Else
 If Action="orderdaytjgoodstime" Then AlertRef("禁止查看此统计")
End If%>

<%If InStr(RsSet("UserOpenShow"),",lowuniondaytj,")>0 Then%>
<li><a href="?Action=lowuniondaytj"<%If Action="lowuniondaytj" Or Action="lowunionincometj" Then Response.write " class='selected'"%>><span>下级联盟</span></a></li>
<%
Else
 If Action="lowuniondaytj" Then AlertRef("禁止查看此统计")
End If%>

<%If InStr(RsSet("UserOpenShow"),",lowuniondatarecview,")>0 Then%>
<li><a href="?Action=lowuniondatarecview"<%If Action="lowuniondatarecview" Or Action="lowunioncpsrecview" Or Action="lowuniondayrecview" Then Response.write " class='selected'"%>><span>下级联盟数据导出</span></a></li>
<%
Else
 If Action="lowuniondatarecview" Then AlertRef("禁止查看此统计")
End If%>

<%If InStr(RsSet("UserOpenShow"),",agentaddaytj,")>0 Then%>
<li><a href="?Action=agentaddaytj"<%If Action="agentaddaytj" Then Response.write " class='selected'"%>><span>代理广告数据统计</span></a></li>
<%
Else
 If Action="agentaddaytj" Then AlertRef("禁止查看此统计")
End If%>

</ul>


<%End If%>

<%If Action="lowview" Then%>
<!--#include file="../../Action/User/lowview.asp"-->
<%end if%>

<%If Action="lowdaytj" Then%>
<!--#include file="../../Action/User/lowdaytj.asp"-->
<%end if%>

<%If Action="orderview" Then%>
<!--#include file="../../Action/User/orderview.asp"-->
<%end if%>

<%If Action="orderdaytj" Then%>
<!--#include file="../../Action/User/orderdaytj.asp"-->
<%end if%>

<%If Action="orderlowout" Then%>
<!--#include file="../../Action/User/orderlowout.asp"-->
<%End IF%>

<%If Action="orderdaytjgoodstime" Then%>
<!--#include file="../../Action/User/orderdaytjgoodstime.asp"-->
<%end if%>

<%If Action="lowuniondaytj" Then%>
<!--#include file="../../Action/User/lowuniondaytj.asp"-->
<%end if%>

<%If Action="lowunionincometj" Then%>
<!--#include file="../../Action/User/lowunionincometj.asp"-->
<%end if%>

<%If Action="lowuniondatarecview" Or Action="lowunioncpsrecview" Or Action="lowuniondayrecview" Then%>

<div class="tabs_header">
<ul class="tabs">
<li<%If Action="lowuniondatarecview" Then Response.write " class='active'"%>><a href="?Action=lowuniondatarecview"><span>下级联盟CPC、CPV和CPA收入按天导出</span></a></li>
<li<%If Action="lowuniondayrecview" Then Response.write " class='active'"%>><a href="?Action=lowuniondayrecview"><span>下级联盟CPC、CPV和CPA数据按天导出</span></a></li>
<li<%If Action="lowunioncpsrecview" Then Response.write " class='active'"%>><a href="?Action=lowunioncpsrecview"><span>下级联盟CPS收入按订单导出</span></a></li>
</ul>
</div>

<%End If%>

<%If Action="lowuniondatarecview" Then%>
<!--#include file="../../Action/User/lowuniondatarecview.asp"-->
<%end if%>

<%If Action="lowunioncpsrecview" Then%>
<!--#include file="../../Action/User/lowunioncpsrecview.asp"-->
<%end if%>

<%If Action="lowuniondayrecview" Then%>
<!--#include file="../../Action/User/lowuniondayrecview.asp"-->
<%end if%>

<%If Action="agentaddaytj" Then%>
<!--#include file="../../Action/User/agentaddaytj.asp"-->
<%end if%>

<%If Action="spendlist" Then%>
<!--#include file="../../Action/User/spendlist.asp"-->
<%End If%>

<%If Action="spendadd" Then%>
<!--#include file="../../Action/User/spendadd.asp"-->
<%End If%> 


<%If Action="spareout" Then%>
<!--#include file="../../Action/User/spareout.asp"-->
<%End If%>

<%If Action="adlist" Then%>
<!--#include file="../../Action/User/adlist.asp"-->
<%End If%>

<%If Action="adcodeget" Then%>
<!--#include file="../../Action/User/adcodeget.asp"-->
<%End If%>

<%If Action="adinfo" Then%> 
<!--#include file="../../Action/User/adinfo.asp"-->
<%End IF%>

<%If Action="putsiteview" Then%>
<!--#include file="../../Action/User/putsiteview.asp"-->
<%End If%>

<%If Action="putuserview" Then%>
<!--#include file="../../Action/User/putuserview.asp"-->
<%End If%>

<%If Action="usersitelist" Then%>
<!--#include file="../../Action/User/usersitelist.asp"-->
<%End If%>

<%If Action="usersiteadd" Then%>
<!--#include file="../../Action/User/usersiteadd.asp"-->
<%End IF%>


<%If Action="pwdmodify" Or Action="pwdanswermodify" Or Action="userpaymodify" Or Action="datamodify" Or Action="aduserbindmodify" Then%>
<ul class="tab">
<li><a href="?Action=pwdmodify"<%If Action="pwdmodify" Then Response.write " class='selected'"%>><span>修改密码</span></a></li>
<li><a href="?Action=pwdanswermodify"<%If Action="pwdanswermodify" Then Response.write " class='selected'"%>><span>修改密码保护</span></a></li>
<li><a href="?Action=userpaymodify"<%If Action="userpaymodify" Then Response.write " class='selected'"%>><span>修改汇款方式</span></a></li>
<li><a href="?Action=datamodify"<%If Action="datamodify" Then Response.write " class='selected'"%>><span>修改资料</span></a></li>
<li><a href="?Action=aduserbindmodify"<%If Action="aduserbindmodify" Then Response.write " class='selected'"%>><span>广告主绑定修改</span></a></li>
</ul>

<%End If%>

<%If Action="pwdmodify" Then%>
<!--#include file="../../Action/User/pwdmodify.asp"-->
<%End if%>

<%If Action="pwdanswermodify" Then%>
<!--#include file="../../Action/User/pwdanswermodify.asp"-->
<%End if%>
		
<%If Action="userpaymodify" then%>
<!--#include file="../../Action/User/userpaymodify.asp"-->
<%End If%>

<%If Action="datamodify" Then%>
<!--#include file="../../Action/User/datamodify.asp"-->
<%End If%>


<%If Action="aduserbindmodify" Then%>
<!--#include file="../../Action/User/aduserbindmodify.asp"-->
<%End If%>	


<%If Action="sysinfolist" Then%>
<!--#include file="../../Action/User/sysinfolist.asp"-->
<%End If%>

<%If Action="sysinfoshow" Then%>
 <!--#include file="../../Action/User/sysinfoshow.asp"-->
<%End If%>
	
<%If Action="gbooklist" Then%> 
 <!--#include file="../../Action/User/gbooklist.asp"-->
<%End IF%>

<%If Action="gbookadd" Then%> 
 <!--#include file="../../Action/User/gbookadd.asp"-->
<%End IF%>
