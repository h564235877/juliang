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
<DIV>为您提供优质服务</DIV></DIV>
<UL style="POSITION: relative">
  <span id=main_menu0></span>
  <LI id=main_menu1><A href="?Action=main"><SPAN class="icon icon1">我的首页</SPAN></A></LI>
  <LI id=main_menu2><A href="?Action=planadd"><SPAN class="icon icon2">计划发布</SPAN></A></LI>
  <LI id=main_menu3><A href="?Action=adadd"><SPAN class="icon icon3">广告发布</SPAN></A></LI>
  <LI id=main_menu4><A href="?Action=planlist"><SPAN class="icon icon4">计划管理</SPAN></A></LI>
  <LI id=main_menu5><A href="?Action=passadlist"><SPAN class="icon icon5">广告管理</SPAN></A></LI>
  <LI id=main_menu6><A href="?Action=daytj"><SPAN class="icon icon6">数据报表</SPAN></A></LI>
  <LI id=main_menu7><A href="?Action=lowuserlist"><SPAN class="icon icon7">CPA和CPS</SPAN></A></LI>
  <LI id=main_menu8><A href="?Action=imglist"><SPAN class="icon icon8">上传管理 </SPAN></A></LI>
  <LI id=main_menu9><A href="?Action=enoughlist"><SPAN class="icon icon9">在线充值</SPAN></A></LI>
  <LI id=main_menu10><A href="?Action=expendlist"><SPAN class="icon icon10">消费记录</SPAN></A></LI>
  <LI id=main_menu11><A href="?Action=recsafecodemodify"><SPAN class="icon icon11">接口密钥</SPAN></A></LI>
  <LI id=main_menu12><A href="?Action=reccodeview"><SPAN class="icon icon12">接口代码</SPAN></A></LI>
  <LI id=main_menu13><A href="?Action=upunioncpain"><SPAN class="icon icon13">上级联盟</SPAN></A></LI>
  <LI id=main_menu14><A href="?Action=pwdmodify"><SPAN class="icon icon14">安全中心</SPAN></A></LI>
  <LI id=main_menu15><A href="?Action=sysinfolist"><SPAN class="icon icon15">系统公告</SPAN></A></LI>
  <LI id=main_menu16><A href="?Action=gbooklist"><SPAN class="icon icon16">留言查看</SPAN></A></LI>
</UL>
</DIV>
  
<SCRIPT language=javascript type=text/javascript> 
function current(Div){
var objDiv = document.getElementById(Div);
objDiv.className="current";
}
</SCRIPT>

<SCRIPT language=javascript type=text/javascript>

current("<%=MenuCss%>");

</SCRIPT>