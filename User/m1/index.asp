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
If Session("CFWztgUser")="" Then
 Response.Cookies("CFWztgUserCookie")=""
 Response.Cookies("CFWztgUserCookie").Expires=Dateadd("n",-1440,Now())
 Call AlertUrl("�Ự�ѹ��ڣ������µ�½!","../../")
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
 AdPath = Mid(RootPath,InStr(RootPath,":")+1)'--ʹ�ü��ݸ�ʽ
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

%>
<!--#Include File="../../include/User_Do.asp"-->

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3c.org/TR/1999/REC-html401-19991224/loose.dtd">
<html>
<head>

<title>��վ����̨_<%=SysTitle%></title>

<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="keywords" content="">
<script language=javascript src="../../js/calendar.js"></script>
<script language=javascript src="../../js/jquery.min.js"></script>
<link rel=stylesheet type=text/css href="../../css/sys.css">


<script language=javascript src="images/bootstrap.min.js"></script>
<link rel=stylesheet type=text/css href="images/style.css">
<link rel=stylesheet href="images/bootstrap.min.css">

<style type="text/css">object,embed{                -webkit-animation-duration:.001s;-webkit-animation-name:playerInserted;                -ms-animation-duration:.001s;-ms-animation-name:playerInserted;                -o-animation-duration:.001s;-o-animation-name:playerInserted;                animation-duration:.001s;animation-name:playerInserted;}                @-webkit-keyframes playerInserted{from{opacity:0.99;}to{opacity:1;}}                @-ms-keyframes playerInserted{from{opacity:0.99;}to{opacity:1;}}                @-o-keyframes playerInserted{from{opacity:0.99;}to{opacity:1;}}                @keyframes playerInserted{from{opacity:0.99;}to{opacity:1;}}</style>
</head>

<body style="margin-top:70px;">
    <nav class="navbar navbar-inverse navbar-fixed-top">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
        <ul class="nav navbar-nav navbar-left">
            <li><a href="?Action=usersitelist">��վ����</a></li>
            <li><a href="?Action=adlist">��ȡ������</a></li>
            <li class="dropdown">
                  <a aria-expanded="false" aria-haspopup="true" role="button" data-toggle="dropdown" class="dropdown-toggle" href="#">���ͳ�� <span class="caret"></span></a>
                  <ul class="dropdown-menu">
                    <li><a href="?Action=iplist">���IP</a></li>
                    <li><a href="?Action=daytj">���ͳ��</a></li>
					<li><a href="?Action=lowview">CPA/CPS</a></li>
                  </ul>
			</li>
            <li class="dropdown">
                  <a aria-expanded="false" aria-haspopup="true" role="button" data-toggle="dropdown" class="dropdown-toggle" href="#">�˻����� <span class="caret"></span></a>
                  <ul class="dropdown-menu">
                    <li><a href="?Action=pwdmodify">�޸�����</a></li>
					<li><a href="?Action=pwdanswermodify">�޸��ܱ�</a></li>
					<li><a href="?Action=userpaymodify">�޸��տʽ</a></li>
					<li><a href="?Action=datamodify">�޸�����</a></li>	
                  </ul>
			</li>
			 <li><a href="?Action=spendlist">Ӷ�����</a></li>
          </ul>
          <ul class="nav navbar-nav navbar-right">
            <li class="navbar-text">���� ,<%=UserName%></li>
            <li class="navbar-right active"><a href="?Action=userlogout">ע��</a></li>
          </ul>
        </div>
      </div>
    </nav>
	<div class="clear"></div>
	
	<div class="container">
	<div class="row">


<!--#Include File="User_Select.asp"-->


</div>
</div>


</body>
</html>
