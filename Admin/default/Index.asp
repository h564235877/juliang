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




MenuAllAction1 = "|-|main=������ҳ"
MenuAllAction2 = "|-|userlist=��վ���б�|-|useradd=��վ������|-|usermodify=��վ���޸�|-|userspendlist=�����б�|-|userspendmodify=�û�����|-|userdeductlist=�û��ۿ��б�|-|usersitelist=��վ����վ���|-|usersitemodify=��վ����վ�޸�|-|seuserlist=�ͷ��б�|-|seuseradd=�ͷ�����|-|seusermodify=�ͷ��޸�|-|seuserlowmove=�ͷ�ת��|-|seuserscore=�ͷ�ҵ��|-|seuserscoredetail=�ͷ�ҵ����ϸ|-|couserlist=�����б�|-|couseradd=��������|-|cousermodify=�����޸�|-|couserlowmove=����ת��|-|couserscore=����ҵ��|-|couserscoredetail=����ҵ����ϸ"
MenuAllAction3 = "|-|aduserlist=������б�|-|aduseradd=���������|-|adusermodify=������޸�|-|lowlist=CPAע���б�|-|lowdaytj=CPA�û�ÿ��ͳ��|-|orderlist=CPS�����б�|-|orderdaytj=����ÿ��ͳ��|-|orderdaytjgoodstime=����ÿ��ͳ��[����Ʒ����ʱ��]|-|aduserenoughlist=�������ֵ����|-|aduserenoughadd=Ϊ�������ֵ|-|imglist=������ϴ�����"
MenuAllAction4 = "|-|planlist=���ƻ��б�|-|planadd=���ƻ�����|-|planmodify=���ƻ��޸�|-|planchase=���ƻ�׷�ӽ��|-|planview=���ƻ���ϸ|-|aduserexpendlist=�������б�|-|aduserexpendmodify=������|-|passadlist=�Ѿ���������еĹ��|-|adadd=�������|-|admodify=����޸�|-|pauseadlist=��ͣ�еĹ��|-|refuadlist=�ܾ���˵Ĺ��|-|overadlist=�Ѿ���ɵĹ��|-|adcheck=������޸Ĺ������б�|-|adcheckmodify=������޸Ĺ�����"
MenuAllAction5 = "|-|clienttj=�ͻ���|-|showlist=�����ʾ|-|iplist=��Ч���|-|invalidiplist=��Ч���|-|searchkeywordtj=���ƻ���ϸ|-|clickflaglist=�������б�|-|clickflagdetail=��Ч���ͳ��|-|daytj=ÿ��ͳ��|-|hourtj=Сʱͳ��|-|userdatadaytj=�û�����|-|daytjdetail=ÿ��ͳ����ϸ|-|lylist=��Դͳ��|-|othertj=����ͳ��|-|lowuniondaytjbyusername=�¼����˰��û���ͳ��|-|lowuniondaytjbyuserid=�¼����˰��û�IDͳ��|-|inputdata=���ݵ���|-|inputdataconfirm=���ݵ���ȷ��|-|inputdatasave=���ݵ��뱣��"
MenuAllAction6 = "|-|sysmodify=ϵͳ����|-|ipblacklist=IP�������б�|-|ipblacklistadd=IP����������|-|ipblacklistmoreadd=IP��������������|-|ipblacklistmodify=IP�������޸�|-|sysrecset=���Ͻӿ�����|-|agentadmodify=����������|-|setbclasslist=һ�������б�|-|setbclassadd=һ����������|-|setbclassmodify=һ�������޸�|-|setsclasslist=���������б�|-|setsclassadd=������������|-|setsclassmodify=���������޸�|-|setcontentlist=���������б�|-|setcontentadd=������������|-|setcontentmodify=���������޸�|-|siteclasslist=��վ�����б�|-|siteclassadd=��վ��������|-|siteclassmodify=��վ�����޸�|-|adsizelist=���ߴ��б�|-|adsizeadd=���ߴ�����|-|adsizemodify=���ߴ��޸�|-|testset=ɾ������IP�ͻ���"
MenuAllAction7 = "|-|adminuserlist=����Ա�б�|-|adminuseradd=����Ա����|-|adminusermodify=����Ա�޸�"
MenuAllAction8 = "|-|infolist=����Ͱ���|-|infoadd=��������|-|infomodify=�����޸�|-|infoclasslist=�������|-|infoclassadd=�����������|-|infoclassmodify=��������޸�"
MenuAllAction9 = "|-|gbooklist=�����б�|-|gbookadd=��������|-|gbookmodify=�����޸�"
MenuAllAction10 = "|-|templatelist=ģ���б�"
MenuAllAction11 = "|-|dbdo=���ݿ����"
MenuAllAction12 = "|-|licencodemodify=����ע��"

If Instr(MenuAllAction1,"|-|" & Action & "=")>0 Then
	 MenuName= GetStr(MenuAllAction1,Action)
	 
ElseIf Instr(MenuAllAction2,"|-|" & Action & "=")>0 Then
	MenuName= GetStr(MenuAllAction2,Action)
	
ElseIf Instr(MenuAllAction3,"|-|" & Action & "=")>0 Then
	MenuName = GetStr(MenuAllAction3,Action)
	
ElseIf Instr(MenuAllAction4,"|-|" & Action & "=")>0 Then
	MenuName= GetStr(MenuAllAction4,Action)
	
ElseIf Instr(MenuAllAction5,"|-|" & Action & "=")>0 Then
	MenuName = GetStr(MenuAllAction5,Action)

ElseIf Instr(MenuAllAction6,"|-|" & Action & "=")>0 Then
	 MenuName = GetStr(MenuAllAction6,Action)
	 
ElseIf Instr(MenuAllAction7,"|-|" & Action & "=")>0 Then
	 MenuName = GetStr(MenuAllAction7,Action)

ElseIf Instr(MenuAllAction8,"|-|" & Action & "=")>0 Then
	 MenuName = GetStr(MenuAllAction8,Action)
	 
ElseIf Instr(MenuAllAction9,"|-|" & Action & "=")>0 Then
	 MenuName = GetStr(MenuAllAction9,Action)
	 
ElseIf Instr(MenuAllAction10,"|-|" & Action & "=")>0 Then
	 MenuName = GetStr(MenuAllAction10,Action)
	 
ElseIf Instr(MenuAllAction11,"|-|" & Action & "=")>0 Then
	 MenuName = GetStr(MenuAllAction11,Action)
	 
ElseIf Instr(MenuAllAction12,"|-|" & Action & "=")>0 Then
	 MenuName = GetStr(MenuAllAction12,Action)

End If
%>
<!--#Include File="../../include/AdminUser_Do.asp"-->

<!DOCTYPE html>
<html lang="zh">
<head>
<meta charset="gbk">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />
<title>����Ա��̨_<%=SysTitle%></title>
<link rel="icon" href="../../images/favicon.ico" type="image/ico">
<meta name="keywords" content="����Ա��̨_<%=SysTitle%>">
<meta name="description" content="����Ա��̨_<%=SysTitle%>">
<link href="../../css/bootstrap.min.css" rel="stylesheet">
<link href="../../css/materialdesignicons.min.css" rel="stylesheet">
<link href="../../css/style.min.css" rel="stylesheet">
<link href="../../css/my.css" rel="stylesheet">
<link href="../../css/BeAlert.css" rel="stylesheet">
<script src="../../js/jquery.min.js"></script>
<script src="../../js/jquery.cookie.min.js"></script>
<script src="../../js/global.js"></script>
<script src="../../js/BeAlert.js"></script>

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
  
<body>
<div class="lyear-layout-web">
  <div class="lyear-layout-container">
    <!--��ർ��-->
    <aside class="lyear-layout-sidebar">
      
      <!-- logo -->
      <div id="logo" class="sidebar-header">
        <a href="?"><img src="images/logo-sidebar.png" title="" alt="" /></a>
      </div>
      <div class="lyear-layout-sidebar-scroll"> 
        
        <nav class="sidebar-main">
          <ul class="nav nav-drawer">
            <li class="nav-item<%If Instr(MenuAllAction1,"|-|" & Action & "=")>0 Then Response.write " active"%>"> <a href="?Action=main"><i class="mdi mdi-home"></i> ��̨��ҳ</a> </li>
            <li class="nav-item<%If Instr(MenuAllAction2,"|-|" & Action & "=")>0 Then Response.write " active"%>"> <a href="?Action=userlist"><i class="mdi mdi-account"></i> �û�����</a> </li>
			<li class="nav-item<%If Instr(MenuAllAction3,"|-|" & Action & "=")>0 Then Response.write " active"%>"> <a href="?Action=aduserlist"><i class="mdi mdi-account-box"></i> ���������</a> </li>
			<li class="nav-item<%If Instr(MenuAllAction4,"|-|" & Action & "=")>0 Then Response.write " active"%>"> <a href="?Action=passadlist"><i class="mdi mdi-stackoverflow"></i> ������</a> </li>          
			<li class="nav-item<%If Instr(MenuAllAction5,"|-|" & Action & "=")>0 Then Response.write " active"%>"> <a href="?Action=daytj"><i class="mdi mdi-google-analytics"></i> ���ͳ�� </a> </li>
			<li class="nav-item<%If Instr(MenuAllAction6,"|-|" & Action & "=")>0 Then Response.write " active"%>"> <a href="?Action=sysmodify"><i class="mdi mdi-settings"></i> ϵͳ����</a> </li>
			<li class="nav-item<%If Instr(MenuAllAction7,"|-|" & Action & "=")>0 Then Response.write " active"%>"> <a href="?Action=adminuserlist"><i class="mdi mdi-owl"></i> ����Ա�б�</a> </li>
			<li class="nav-item<%If Instr(MenuAllAction8,"|-|" & Action & "=")>0 Then Response.write " active"%>"> <a href="?Action=infolist"><i class="mdi mdi-volume-high"></i> ����Ͱ���</a> </li>
			<li class="nav-item<%If Instr(MenuAllAction9,"|-|" & Action & "=")>0 Then Response.write " active"%>"> <a href="?Action=gbooklist"><i class="mdi mdi-content-paste"></i> ���Թ���</a> </li>
			<li class="nav-item<%If Instr(MenuAllAction10,"|-|" & Action & "=")>0 Then Response.write " active"%>"> <a href="?Action=templatelist"><i class="mdi mdi-tshirt-crew"></i> ģ���б�</a> </li>
			<li class="nav-item<%If Instr(MenuAllAction11,"|-|" & Action & "=")>0 Then Response.write " active"%>"> <a href="?Action=dbdo"><i class="mdi mdi-database"></i> ���ݿ����</a> </li>
			<li class="nav-item<%If Instr(MenuAllAction12,"|-|" & Action & "=")>0 Then Response.write " active"%>"> <a href="?Action=licencodemodify"><i class="mdi mdi-shopping"></i> ����ע��</a> </li>
          </ul>
        </nav>
        
        <div class="sidebar-footer">
          <p class="copyright">Copyright&nbsp;&copy;<%=Year(Now)%>&nbsp;<%=GetTopDomainName(HttpPath(1))%>&nbsp;All Rights Reserved. </p>
        </div>
      </div>
      
    </aside>
    <!--End ��ർ��-->
    
    <!--ͷ����Ϣ-->
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
                <img class="img-avatar img-avatar-48 m-r-10" src="images/users/avatar.jpg" alt="<%=GetStr(Session("CFWztgAdmin"),"AdminUserName")%>" />
                <span><%=GetStr(Session("CFWztgAdmin"),"AdminUserName")%> <span class="caret"></span></span>
              </a>
              <ul class="dropdown-menu dropdown-menu-right">
                <li> <a href="javascript:;" onclick="$(function () { confirm('����վ��һ�㲻��Ҫ�������վ�����ͬ������ȷ����?', '', function (isConfirm) {if (isConfirm) {gotoUrl('../../AdminUser.aspx?Action=allserversynccache')}}, {confirmButtonText: 'ȷ��', cancelButtonText: 'ȡ��', width: 400});});"><i class="mdi mdi-cached"></i>������</a> </li>
                <li> <a href="?Action=pwdmodify"><i class="mdi mdi-lock-outline"></i>�޸�����</a> </li>
				<li> <a href="../../" target="_blank"><i class="mdi mdi-home"></i>������ҳ</a> </li>
                <li class="divider"></li>
                <li> <a href="?Action=adminuserlogout"><i class="mdi mdi-logout-variant"></i>�˳���¼</a> </li>
              </ul>
            </li>
            <!--�л�������ɫ-->
		    <li class="dropdown dropdown-skin">
			  <span data-toggle="dropdown" class="icon-palette"><i class="mdi mdi-palette"></i></span>
			  <ul class="dropdown-menu dropdown-menu-right" data-stopPropagation="true">
                <li class="drop-title"><p>����</p></li>
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
				<li class="drop-title"><p>ͷ��</p></li>
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
				<li class="drop-title"><p>�����</p></li>
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
            <!--�л�������ɫ-->
          </ul>
          
        </div>
      </nav>
      
    </header>
    <!--End ͷ����Ϣ-->
    
    <!--ҳ����Ҫ����-->
    <main class="lyear-layout-content">
      
     <!--#Include File="AdminUser_Select.asp"-->
      
    </main>
    <!--End ҳ����Ҫ����-->
  </div>
</div>


<script type="text/javascript" src="../../js/bootstrap.min.js"></script>
<script type="text/javascript" src="../../js/perfect-scrollbar.min.js"></script>
<script type="text/javascript" src="../../js/main.min.js"></script>


<script>
//������ɫ������
var the_logo_bg    = $.cookie('the_logo_bg'),
	    the_header_bg  = $.cookie('the_header_bg'),
	    the_sidebar_bg = $.cookie('the_sidebar_bg'),
	    the_site_theme = $.cookie('the_site_theme');
	
	if (the_logo_bg) $('body').attr('data-logobg', the_logo_bg);
	if (the_header_bg) $('body').attr('data-headerbg', the_header_bg);
	if (the_sidebar_bg) $('body').attr('data-sidebarbg', the_sidebar_bg);
	if (the_site_theme) $('body').attr('data-theme', the_site_theme);
	
	// ����������ɫ����ѡ��
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
	
	// ����������ɫ
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
