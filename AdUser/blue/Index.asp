<%
'�˷�������ϵͳ Sql��
'����QQ��178575
'����EMail��yliangcf@163.com
'������վ��http://www.qqcf.com
'��ϸ��飺http://www.qqcf.com/cfwztg.htm
'�����г���������ʾ����װ��ʾ��ʹ�����ѽ�����°汾���ص�����
'��Ϊ��Щ���ݿ���ʱ�����£���û�з��ڳ�������Լ�����վ�鿴
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
If Session("CFWztgAdUser")="" Then
 Response.Cookies("CFWztgAdUserCookie")=""
 Response.Cookies("CFWztgAdUserCookie").Expires=Dateadd("n",-1440,Now())
 Call AlertUrl("�Ự�ѹ��ڣ������µ�½!","../../")
Else
 AdUserName=Session("CFWztgAdUser")
End If

RootPath = HttpPath(2)
RootPath = Mid(RootPath,1,InStrRev(RootPath,"/")-1)
RootPath = Mid(RootPath,1,InStrRev(RootPath,"/")-1)
RootPath = Mid(RootPath,1,InStrRev(RootPath,"/"))

If RsSet("AdScriptShowDomain")="" Then
 AdPath = Mid(RootPath,InStr(RootPath,":")+1)'--ʹ�ü��ݸ�ʽ
Else
 AdPath = RsSet("AdScriptShowDomain")
End If

Action=ChkStr(Request("Action"),1)
If Action="" Then Action="main"


If Action="main" Then
 MenuCss = "main_menu1"
ElseIf Action="planadd" Then
 MenuCss = "main_menu2"
 MenuName = "�ƻ�����"
ElseIf Action="adadd" Then
 MenuCss = "main_menu3"
 MenuName = "��淢��"
ElseIf Action="planlist" Or Action="planmodify" Or Action="planchase" Or Action="planview" Then
 MenuCss = "main_menu4"
 MenuName = "�ƻ�����"
ElseIf Action="passadlist" Or Action="pauseadlist" Or Action="waitadlist" Or Action="refuadlist" Or Action="overadlist" Or Action="admodify" Or Action="clickchase" Then
 MenuCss = "main_menu5"
 MenuName = "������"
ElseIf Action="daytj" Or Action="daytjdetail" Or Action="hourtj" Or Action="iplist" Or Action="invalidiplist" Or Action="showlist" Or Action="lylist" Then
 MenuCss = "main_menu6"
 MenuName = "���ݱ���"
ElseIf Action="lowuserlist" Or Action="lowuserdaytj" Or Action="orderlist" Or Action="orderadd" Or Action="ordermoreadd" Or Action="ordermoremodify" Or Action="orderdaytj" Or Action="orderdaytjgoodstime" Then
 MenuCss = "main_menu7"
 MenuName = "CPA��CPS"
ElseIf Action="imglist" Then
 MenuCss = "main_menu8"
 MenuName = "�ϴ�����"
ElseIf Action="enoughlist" Or Action="onlinepay" Then
 MenuCss = "main_menu9"
 MenuName = "���߳�ֵ"
ElseIf Action="expendlist" Then
 MenuCss = "main_menu10"
 MenuName = "���Ѽ�¼"
ElseIf Action="recsafecodemodify" Then
 MenuCss = "main_menu11"
 MenuName = "�ӿ���Կ"
ElseIf Action="reccodeview" Then
 MenuCss = "main_menu12"
 MenuName = "�ӿڴ���"
ElseIf Action="upunioncpain" Or Action="upunioncpaout" Or Action="upuniondataview" Or Action="upunioncpsview" Or Action="upuniondayview" Then
 MenuCss = "main_menu13"
 MenuName = "�ϼ�����"
ElseIf Action="datamodify" Or Action="pwdmodify" Then
 MenuCss = "main_menu14"
 MenuName = "�޸�����"
ElseIf Action="sysinfolist" Or Action="sysinfoshow" Then
 MenuCss = "main_menu15"
 MenuName = "ϵͳ����" 
ElseIf Action="gbooklist" Or Action="gbookadd" Then
 MenuCss = "main_menu16"
 MenuName = "���Բ鿴" 
Else
 MenuCss = "main_menu0"
 MenuName = ""
End If
%>
<!--#Include File="../../include/AdUser_Do.asp"-->

<!DOCTYPE HTML>
<HTML>
<HEAD>
<TITLE>�������̨_<%=SysTitle%></TITLE>
<META content="text/html; charset=gbk" http-equiv=Content-Type>
<META name=description content="">
<META name=keywords content="">
<link href="../../css/sys.css" rel="stylesheet">
<link href="../../css/BeAlert.css" rel="stylesheet">
<link href="images/style.css" rel="stylesheet">
<script src="../../js/jquery.min.js"></script>
<script src="../../js/global.js"></script>
<script src="../../js/BeAlert.js"></script>
<script src="../../js/BeAlert.js"></script>

<style type="text/css">
#container {WIDTH: 100%;}
#container_left {WIDTH:120px;background:#f1fbfd;float:left;position:absolute; top:0;left:0;height:820px;}
#container_right {margin-left:118px;float:right;margin-right:0px;height:820px;}

.banner {
BACKGROUND: url(images/banner-<%=MenuCss%>.jpg) no-repeat right center; 
}
</style>
</head>

<BODY>
<DIV id=container>

<DIV id=container_left>
<!--#Include File="AdUser_Memu.asp"-->
</DIV>


<DIV id=container_right>

<div id="dcHead">
 <div id="head">
  <div class="box">
   <ul class="siteName">
    <%=SysTitle%>
   </ul>
   <ul class="nav">	
	<LI><A href="../../?f=index" target=_blank>������ҳ</A></LI>
	<LI><A href="../../?f=help" target=_blank>��������</A></LI>
	<LI><A href="../../?f=contact" target=_blank>��ϵ����</A></LI>
	<LI><A href="?Action=gbookadd">��㽨��</A></LI>	
	<LI><A href="?Action=pwdmodify">�޸�����</A></LI>	
    <li><a href="?Action=datamodify">���ã�<%=AdUserName%></a></li>
    <li><A href="?Action=aduserlogout">�˳�</A></li>
   </ul>
  </div>
 </div>
</div>



<%If Action="main" Then%>
<DIV id=banner1 class=banner>
<DIV class=title><B>���� ���� ��չ</B> 
<P 
style="PADDING-LEFT: 60px; COLOR: #ff00ff; FONT-SIZE: 14px; FONT-WEIGHT: bold; PADDING-TOP: 10px">���ǳ�ŵ�����Ż�ӯ 
��ʱ���� ���ķ���</P>
</DIV>
</DIV>
<%Else%>
<DIV id=banner2 class=banner>
<DIV class=title><B><span id="bannertext"><%=MenuName%></span></B></DIV></DIV>
<%End If%>


<DIV id=content>
<!--#Include File="AdUser_Select.asp"-->
<DIV id=foot>
Copyright&nbsp;&copy;<%=Year(Now)%>&nbsp;<%=HttpPath(1)%>&nbsp;All Rights Reserved
</DIV>
</DIV>

</DIV>

</DIV>


</BODY>
</HTML>
