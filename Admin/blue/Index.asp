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
 AdPath = Mid(RootPath,InStr(RootPath,":")+1)'--ʹ�ü��ݸ�ʽ
Else
 AdPath = RsSet("AdScriptShowDomain")
End If

Action=ChkStr(Request("Action"),1)
If Action="" Then Action="main"


'��ͨ����Աʱ��֤Ȩ��
If GetStr(Session("CFWztgAdmin"),"PowerLevel")="2" And InStr(","&GetStr(Session("CFWztgAdmin"),"PowerHold")&",",","&Action&",")=0 And Action<>"clienttj" Then
 Response.write "û��Ȩ�޲������뷵�أ�"
 Response.End
End If


If Action="main" Then
 MenuCss = "main_menu1"
ElseIf Action="userlist" Or Action="useradd" Or Action="usermodify" Or Action="userspendlist" Or Action="userspendmodify" Or Action="userdeductlist" Or Action="usersitelist" Or Action="usersitemodify" Or Action="seuserlist" Or Action="seuseradd" Or Action="seusermodify" Or Action="seuserlowmove" Or Action="seuserscore" Or Action="seuserscoredetail" Or Action="couserlist" Or Action="couseradd" Or Action="cousermodify" Or Action="couserlowmove" Or Action="couserscore" Or Action="couserscoredetail"  Then
 MenuCss = "main_menu2"
 MenuName = "�û�����"
ElseIf Action="aduserlist" Or Action="aduseradd" Or Action="adusermodify" Or Action="lowlist" Or Action="lowdaytj" Or Action="orderlist" Or Action="orderdaytj" Or Action="orderdaytjgoodstime" Or Action="aduserenoughlist" Or Action="aduserenoughadd" Or Action="imglist" Then
 MenuCss = "main_menu3"
 MenuName = "���������"
ElseIf Action="planlist" Or Action="planadd" Or Action="planmodify" Or Action="planchase" Or Action="planview" Or Action="aduserexpendlist" Or Action="aduserexpendmodify" Or Action="passadlist" Or Action="adadd" Or Action="admodify" Or Action="pauseadlist" Or Action="refuadlist" Or Action="overadlist" Or Action="adcheck" Or Action="adcheckmodify" Then
 MenuCss = "main_menu4"
 MenuName = "������"
ElseIf Action="clienttj" Or Action="showlist" Or Action="iplist" Or Action="errckiplist" Or Action="searchkeywordtj" Or Action="clickflaglist" Or Action="clickflagdetail" Or Action="invalidiplist" Or Action="daytj" Or Action="daytjdetail" Or Action="hourtj" Or Action="userdatadaytj" Or Action="lylist" Or Action="othertj" Or Action="lowuniondaytjbyusername" Or Action="lowuniondaytjbyuserid" Or Action="inputdata" Or Action="inputdataconfirm" Or Action="inputdatasave" Then
 MenuCss = "main_menu5"
 MenuName = "���ݱ���"
ElseIf Action="sysmodify" Or Action="ipblacklist" Or Action="ipblacklistadd" Or Action="ipblacklistmoreadd" Or Action="ipblacklistmodify" Or Action="sysrecset" Or Action="agentadmodify" Or Action="setbclasslist" Or Action="setbclassadd" Or Action="setbclassmodify" Or Action="setsclasslist" Or Action="setsclassadd" Or Action="setsclassmodify" Or Action="setcontentlist" Or Action="setcontentadd" Or Action="setcontentmodify" Or Action="siteclasslist" Or Action="siteclassadd" Or Action="siteclassmodify" Or Action="adsizelist" Or Action="adsizeadd" Or Action="adsizemodify" Or Action="testset" Then
 MenuCss = "main_menu6"
 MenuName = "ϵͳ����"
ElseIf Action="pwdmodify" Then
 MenuCss = "main_menu7"
 MenuName = "�޸�����"
ElseIf Action="adminuserlist" Or Action="adminuseradd" Or Action="adminusermodify" Then
 MenuCss = "main_menu8"
 MenuName = "����Ա�б�"
ElseIf Action="infolist" Or Action="infoadd" Or Action="infomodify" Or Action="infoclasslist" Or Action="infoclassadd" Or Action="infoclassmodify" Then
 MenuCss = "main_menu9"
 MenuName = "����Ͱ�������"
ElseIf Action="gbooklist" Or Action="gbookreply" Then
 MenuCss = "main_menu10"
 MenuName = "���Թ���"
ElseIf Action="emailsend" Then
 MenuCss = "main_menu11"
 MenuName = "�ʼ�����"
ElseIf Action="templatelist" Then
 MenuCss = "main_menu12"
 MenuName = "ģ�����"
ElseIf Action="dbdo" Then
 MenuCss = "main_menu13"
 MenuName = "���ݿ����"
ElseIf Action="licencodemodify" Then
 MenuCss = "main_menu14"
 MenuName = "����ע��"
Else
 MenuCss = "main_menu0"
 MenuName = ""
End If
%>
<!--#Include File="../../include/AdminUser_Do.asp"-->

<!DOCTYPE HTML>
<html>
<head>
<TITLE>����Ա��̨_<%=SysTitle%></TITLE>
<META content="text/html; charset=gbk" http-equiv=Content-Type>
<META name=description content="����Ա��̨_<%=SysTitle%>">
<META name=keywords content="����Ա��̨_<%=SysTitle%>">
<link href="../../css/sys.css" rel="stylesheet">
<link href="../../css/BeAlert.css" rel="stylesheet">
<link href="images/style.css" rel="stylesheet">
<script src="../../js/jquery.min.js"></script>
<script src="../../js/global.js"></script>
<script src="../../js/BeAlert.js"></script>

<style type="text/css">
#container {WIDTH: 100%;}
#container_left {WIDTH:120px;background:#f1fbfd;float:left;position:absolute; top:0;left:0;height:620px;}
#container_right {margin-left:118px;float:right;margin-right:0px;height:620px;}

.menubox .menuright{float:left;padding-left:1px;}
.menubox .menuright ul li{ float:left;padding: 0px 14.5px; position:relative;}
.menubox .menuright ul li a{text-align:center;position:relative; color:#90989e; font-size:12px;}
.menubox .menuright ul li.userinfo .span1{background: url(images/arrow.png) no-repeat 100% 50%;line-height: 30px;color: #90989e;font-size: 14px;    padding-right: 15px;}
.menubox .menuright ul li.userinfo i{margin-top:8px;float:left;width:14px;height:14px;display: block;background: url(images/daohangbiao.gif) no-repeat 100% 50%;}
.menubox .menuright ul li.userinfo .operating{display: none;position: absolute;width: 1160px;top:30px; z-index:100000;left: -10px;border: 1px solid #e9eced;box-shadow: 0 1px 6px rgba(0,0,0,0.12);border-radius: 4px;background: #fff;padding: 15px 20px;color: #999;}
.menubox .menuright ul li .li1{ width:90px;text-align:right;font-size:15px;}

.operating ul{clear:both;}
.operating ul li{line-height:50px;}
.operating .span2{font-weight:normal;font-size:14px;}

.banner {
BACKGROUND: url(images/banner-<%=MenuCss%>.jpg) no-repeat right center; 
}
</style>

<%If RsSet("CacheServer")<>"" Then%>
<script>
//--https����ʱǿ����http����
var tmpTag = "https:" == document.location.protocol ? false : true;
if(!tmpTag){
alert("�����˸��ؾ���Ϊ��ͬ�����վ����Ϣ������Ա��ֻ̨����http���ʲ���ʹ��https���ʣ���վ���Ⱥ�̨��Ӱ��");
var urls=window.location.href;
urls = urls.replace("https", "http");
window.location=urls;
}
</script>
<%End If%>
</head>

<BODY>
<DIV id=container>

<DIV id=container_left>
<!--#Include File="AdminUser_Memu.asp"-->
</DIV>


<DIV id=container_right>

<div id="dcHead">
 <div id="head">
  <div class="box">

   
<div class="menubox">
<div class="menuright">
<ul>
  <li class="userinfo">
	   <i></i><span class="span1">����</span>
	   <div class="operating" style="display: none;">	   

<ul>
<li class="li1">�û�����</li>
<li>��վ���б�<span class="span2">[<a href="?Action=userlist">�б�</a>/<a href="?Action=useradd">����</a>]</span></li>
<li><a href="?Action=userspendlist">�û�����</a></li>
<li><a href="?Action=userdeductlist">�û��ۿ��б�</a></li>
<li><a href="?Action=usersitelist">��վ����վ���</a></li>
<li>�ͷ��б�<span class="span2">[<a href="?Action=seuserlist">�б�</a>/<a href="?Action=seuseradd">����</a>]</span></li>
<li><a href="?Action=seuserscore">�ͷ�ҵ��</a></li>
<li>�����б�<span class="span2">[<a href="?Action=couserlist">�б�</a>/<a href="?Action=couseradd">����</a>]</span></li>
<li><a href="?Action=couserscore">����ҵ��</a></li>
</ul>

<ul>
<li class="li1">������б�</li>
<li>������б�<span class="span2">[<a href="?Action=aduserlist">�б�</a>/<a href="?Action=aduseradd">����</a>]</span></li>
<li>�������ֵ����<span class="span2">[<a href="?Action=aduserenoughlist">�б�</a>/<a href="?Action=aduserenoughadd">��ֵ</a>]</span></li>
<li><a href="?Action=imglist">������ϴ�����</a></li>
<li><a href="?Action=lowlist">CPAע���б�</a></li>
<li><a href="?Action=orderlist">CPS�����б�</a></li>

</ul>

<ul>
<li class="li1">������</li>
<li>���ƻ��б�<span class="span2">[<a href="?Action=planlist">�б�</a>/<a href="?Action=planadd">�����ƻ�</a>]</span></li>
<li><a href="?Action=aduserexpendlist">�������б�</a></li>
<li>�Ѿ���������еĹ��<span class="span2">[<a href="?Action=passadlist">�б�</a>/<a href="?Action=adadd">�������</a>]</span></li>
<li><a href="?Action=pauseadlist">��ͣ�еĹ��</a></li>
<li><a href="?Action=refuadlist">�ܾ���˵Ĺ��</a></li>
<li><a href="?Action=overadlist">�Ѿ���ɵĹ��</a></li>
<li><a href="?Action=adcheck">������޸Ĺ�����</a></li>
</ul>

<ul>
<li class="li1">���ͳ�ƣ�</li>
<li><a href="?Action=daytj">ÿ��ͳ��</a></li>
<li><a href="?Action=hourtj">ÿСʱͳ��</a></li>
<li><a href="?Action=userdatadaytj">�û�ÿ������</a></li>
<li><a href="?Action=iplist">��Ч�����¼</a></li>
<li><a href="?Action=clickflaglist">��Ч���ͳ��</a></li>
<li><a href="?Action=invalidiplist">��Ч�����¼</a></li>
<li><a href="?Action=showlist">��ʾ��¼</a></li>
<li><a href="?Action=clienttj">�ͻ�����Ϣ</a></li>
<li><a href="?Action=lylist">�����Դ</a></li>
<li><a href="?Action=searchkeywordtj">�ؼ���ͳ��</a></li>
<li><a href="?Action=inputdata">��������</a></li>
<li style="clear:both;margin-left:118px;"><a href="?Action=othertj">����ͳ��</a></li>
<li><a href="?Action=lowuniondaytjbyusername">���ع����ͳ��(�û���)</a></li>
<li><a href="?Action=lowuniondaytjbyuserid">���ع����ͳ��(�û�ID)</a></li>
</ul>

<ul>
<li class="li1">ϵͳ���ã�</li>
<li><a href="?Action=sysmodify">ϵͳ����</a></li>
<li><a href="?Action=ipblacklist">IP������</a></li>
<li>��վ��������<span class="span2">[<a href="?Action=siteclasslist">�б�</a>/<a href="?Action=siteclassadd">����</a>]</span></li>
<li>���ߴ����<span class="span2">[<a href="?Action=adsizelist">�б�</a>/<a href="?Action=adsizeadd">����</a>]</span></li>
<li><a href="?Action=setbclasslist">��������</a></li>
<li><a href="?Action=testset">ɾ������IP�ͻ���</a></li>
<li><a href="?Action=sysrecset">���Ͻӿ�����</a></li>
<li><a href="?Action=agentadmodify">����������</a></li>
</ul>

<ul>
<li class="li1">����Ͱ�����</li>
<li>����Ͱ����б�<span class="span2">[<a href="?Action=infolist">�б�</a>/<a href="?Action=infoadd">����</a>]</span></li>
<li>����Ͱ�������<span class="span2">[<a href="?Action=infoclasslist">�б�</a>/<a href="?Action=infoclassadd">����</a>]</span></li>
</ul>

<ul>
<li class="li1">ģ���б�</li>
<li><a href="?Action=templatelist&TemplateType=index">ǰ̨ģ��</a></li>
<li><a href="?Action=templatelist&TemplateType=user">��վ����̨ģ��</a></li>
<li><a href="?Action=templatelist&TemplateType=aduser">�������̨ģ��</a></li>
<li><a href="?Action=templatelist&TemplateType=seuser">�ͷ���̨ģ��</a></li>
<li><a href="?Action=templatelist&TemplateType=couser">�����̨ģ��</a></li>
<li><a href="?Action=templatelist&TemplateType=adminuser">����Ա��̨ģ��</a></li>
<li><a href="?Action=setcontentlist&SetBClassFlag=AdminTemplet&SetSClassFlag=AdminTemplet_SysLabel">ǰ̨��ǩ</a></li>
<li><a href="?Action=setcontentlist&SetBClassFlag=AdminTemplet&SetSClassFlag=AdminTemplet_AdCode">��ѭ��ý����ģ��</a></li>
<li><a href="?Action=setcontentlist&SetBClassFlag=AdminTemplet&SetSClassFlag=AdminTemplet_MixCode">��ϸ�ý����ģ��</a></li>
</ul>



<ul>
<li class="li1">������</li>
<li>����Ա�б�<span class="span2">[<a href="?Action=adminuserlist">�б�</a>/<a href="?Action=adminuseradd">����</a>]</span></li>
<li><a href="?Action=gbooklist">���Թ���</a></li>
<li><a href="?Action=dbdo">���ݿ����</a></li>
<li><a href="?Action=licencodemodify">����ע��</a></li>
</ul>

	   </div>
	</li>
</ul>
</div>
</div>

 <script>
$(function(){
   $("li.userinfo").hover(function(){
		$(this).find(".operating").show();
	},function(){
		$(this).find(".operating").hide();
	});	
});
</script>
			   
   <ul class="siteName">
    <%=SysTitle%>
   </ul>		   
   
   <ul class="nav">	
	<LI><A href="../../?f=index" target=_blank>������ҳ</A></LI>
	<LI><A href="../../?f=help" target=_blank>��������</A></LI>
	<LI><A href="?Action=pwdmodify">�޸�����</A></LI>	
    <li><a href="javascript:;" onclick="$(function () { confirm('����վ��һ�㲻��Ҫ�������վ�����ͬ������ȷ����?', '', function (isConfirm) {if (isConfirm) {gotoUrl('../../AdminUser.aspx?Action=allserversynccache')}}, {confirmButtonText: 'ȷ��', cancelButtonText: 'ȡ��', width: 400});});">������</a></li>
    <li><a href="?Action=adminuserlist">���ã�<%=GetStr(Session("CFWztgAdmin"),"AdminUserName")%></a></li>
    <li><A href="?Action=adminuserlogout">�˳�</A></li>
   </ul>
  </div>
 </div>
</div>





<%If Action="main" Then%>
<DIV id=banner1 class=banner>
<DIV class=title><B>���� ���� ��չ</B> 
</DIV>
</DIV>
<%Else%>
<DIV id=banner2 class=banner>
<DIV class=title><B><span id="bannertext"><%=MenuName%></span></B>
</DIV>
</DIV>
<%End If%>


<DIV id=content>
<!--#Include File="AdminUser_Select.asp"-->
<DIV id=foot>
Copyright&nbsp;&copy;<%=Year(Now)%>&nbsp;<%=HttpPath(1)%>&nbsp;All Rights Reserved
</DIV>
</DIV>

</DIV>

</DIV>


</BODY>
</HTML>
