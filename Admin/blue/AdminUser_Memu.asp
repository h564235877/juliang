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
<DIV>为您提供优质服务</DIV>
</DIV>


<UL>
  <span id=main_menu0></span>
  <LI id=main_menu1><i class="system"></i><A href="?Action=main"><SPAN class="icon icon1">管理首页</SPAN></A></LI>
  <LI id=main_menu2><A href="?Action=userlist"><SPAN class="icon icon2">用户管理</SPAN></A></LI>
  <LI id=main_menu3><A href="?Action=aduserlist"><SPAN class="icon icon3">广告主管理</SPAN></A></LI>
  <LI id=main_menu4><A href="?Action=passadlist"><SPAN class="icon icon4">广告管理</SPAN></A></LI>
  <LI id=main_menu5><A href="?Action=daytj"><SPAN class="icon icon5">广告统计 </SPAN></A></LI>
  <LI id=main_menu6><A href="?Action=sysmodify"><SPAN class="icon icon6">系统设置</SPAN></A></LI>
  <LI id=main_menu8><A href="?Action=adminuserlist"><SPAN class="icon icon7">管理员列表</SPAN></A></LI>
  <LI id=main_menu9><A href="?Action=infolist"><SPAN class="icon icon8">公告和帮助</SPAN></A></LI>
  <LI id=main_menu10><A href="?Action=gbooklist"><SPAN class="icon icon9">留言管理</SPAN></A></LI>
  <LI id=main_menu12><A href="?Action=templatelist"><SPAN class="icon icon10">模板列表</SPAN></A></LI>
  <LI id=main_menu13><A href="?Action=dbdo"><SPAN class="icon icon1">数据库管理</SPAN></A></LI>
  <LI id=main_menu14><A href="?Action=licencodemodify"><SPAN class="icon icon11">程序注册</SPAN></A></LI>
</UL>


</DIV>


<SCRIPT language=javascript type=text/javascript> 
function current(Div){
var objDiv = document.getElementById(Div);
objDiv.className="current";
}

current("<%=MenuCss%>");
</SCRIPT>

