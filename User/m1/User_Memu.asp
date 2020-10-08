<%
'乘风广告联盟系统 Sql版
'作者QQ：178575
'作者EMail：yliangcf@163.com
'作者网站：http://www.qqcf.com
'详细简介：http://www.qqcf.com/cfwztg.htm
'上面有程序在线演示，安装演示，使用疑难解答，最新版本下载等内容
'因为这些内容可能时常更新，就没有放在程序里，请自己上网站查看
%>

<DIV id=sidebar>
<DIV class=head>
<H1></H1>
<DIV>由广告联盟提供的广告服务</DIV></DIV>
<UL style="POSITION: relative">
  <span id=main_menu0></span>
  <LI id=main_menu1><A href="?Action=main"><SPAN class="icon donateicon">我的首页</SPAN></A> </LI>
  <LI id=main_menu2><A href="?Action=adlist"><SPAN class="icon gatheringicon">获取广告</SPAN></A> </LI>
  <LI id=main_menu3><A href="?Action=iplist"><SPAN class="icon wegicon">广告IP</SPAN></A> </LI>
  <LI id=main_menu4><A href="?Action=daytj"><SPAN class="icon txicon">数据报表</SPAN></A> </LI>
  <LI id=main_menu5><A href="?Action=lowview"><SPAN class="icon renticon">CPA和CPS</SPAN></A> </LI>
  <LI id=main_menu6><A href="?Action=usersiteadd"><SPAN class="icon gameicon">新增网站</SPAN></A> </LI>
  <LI id=main_menu7><A href="?Action=usersitelist"><SPAN class="icon crediticon">网站列表</SPAN></A> </LI>
  <LI id=main_menu8><A href="?Action=spendlist"><SPAN class="icon cashgifticon">佣金结算</SPAN></A> </LI>
  <LI id=main_menu9><A href="?Action=pwdmodify"><SPAN class="icon lotteryicon">安全中心</SPAN></A> </LI>
  <LI id=main_menu10><A href="?Action=sysinfolist"><SPAN class="icon mobileicon">系统公告</SPAN></A> </LI>
  <LI id=main_menu11><A href="?Action=gbooklist"><SPAN class="icon insuranceicon">问题咨询</SPAN></A> </LI>
</UL></DIV>

<SCRIPT language=javascript type=text/javascript> 
function current(Div){
var objDiv = document.getElementById(Div);
objDiv.className="current";
}
</SCRIPT>

<SCRIPT language=javascript type=text/javascript>

current("<%=MenuCss%>");

</SCRIPT>