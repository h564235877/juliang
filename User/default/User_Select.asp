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
<!--#include file="../../Action/User/main.asp"-->
<%End If%>


<%If Action="clickflaglist" Then%>
<!--#include file="../../Action/User/clickflaglist.asp"-->
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
