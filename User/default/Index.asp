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

MenuAllAction1 = "|-|main=��̨��ҳ"
MenuAllAction2 = "|-|adlist=��ȡ���|-|adcodeget=��ȡ������"
MenuAllAction3 = "|-|daytj=ÿ��ͳ��|-|daytjdetail=ÿ����ϸͳ��|-|hourtj=ÿСʱͳ��|-|iplist=��Ч���IP|-|invalidiplist=��Ч���IP|-|showlist=�����ʾ|-|searchkeywordtj=�ؼ���|-|lylist=�����Դ|-|ipareatj=IP����|-|webwidthtj=��ҳ���|-|othertj=����"
MenuAllAction4 = "|-|lowview=CPA�б�|-|lowdaytj=CPAͳ��|-|orderview=CPS����|-|orderdaytj=CPSͳ��[������ʱ��]|-|orderdaytjgoodstime=CPSͳ��[������ʱ��]|-|lowuniondaytj=�¼�����|-|lowunionincometj=|-|lowuniondatarecview=�¼�����CPC��CPV��CPA���밴�쵼��|-|lowunioncpsrecview=�¼�����CPS���밴��������|-|lowuniondayrecview=�¼�����CPC��CPV��CPA���ݰ��쵼��|-|agentaddaytj=����������ͳ��"
MenuAllAction5 = "|-|usersiteadd=������վ"
MenuAllAction6 = "|-|usersitelist=��վ�б�"
MenuAllAction7 = "|-|spendlist=Ӷ������б�|-|spendadd=Ӷ���������|-|spareout=Ӷ��ת�����"
MenuAllAction8 = "|-|pwdmodify=�޸�����|-|pwdanswermodify=�޸����뱣��|-|userpaymodify=�޸Ļ�ʽ|-|datamodify=�޸�����|-|aduserbindmodify=��������޸�"
MenuAllAction9 = "|-|sysinfolist=ϵͳ����|-|sysinfoshow=ϵͳ������ʾ"
MenuAllAction10 = "|-|gbooklist=������ѯ|-|gbookadd=������ѯ����"


If Instr(MenuAllAction1,"|-|" & Action & "=")>0 Then
	 MenuName= GetStr(MenuAllAction1,Action)
	 
ElseIf Instr(MenuAllAction2,"|-|" & Action & "=")>0 Then
	If Request("Ad_Class")<>"" Then Ad_Class=CInt(ChkStr(Request("Ad_Class"),2)) Else Ad_Class = RsSet("AdListDefaultClass")

	MenuName= GetStr(MenuAllAction2,Action) & "-"
	 
	If Ad_Class=1 Then
	 MenuName = MenuName & "ֱ������"
	ElseIf Ad_Class=2 Then
	 MenuName = MenuName & "ֱ��ͼƬ"
	ElseIf Ad_Class=3 Then
	 MenuName = MenuName & "��ͨ����"
	ElseIf Ad_Class=4 Then
	 MenuName = MenuName & "��ͨͼƬ"
	ElseIf Ad_Class=5 Then
	 MenuName = MenuName & "�������"
	ElseIf Ad_Class=6 Then
	 MenuName = MenuName & "���ͼƬ"
	ElseIf Ad_Class=7 Then
	 MenuName = MenuName & "��ý��"
	ElseIf Ad_Class=8 Then
	 MenuName = MenuName & "ǿ��"
	ElseIf Ad_Class=9 Then
	 MenuName = MenuName & "�˵�"
	ElseIf Ad_Class=10 Then
	 MenuName = MenuName & "��ϱ�ǩ��"
	ElseIf Ad_Class=11 Then
	 MenuName = MenuName & "��ϸ�ý��"
	ElseIf Ad_Class=12 Then
	 MenuName = MenuName & "������ذ�װ"
	ElseIf Ad_Class=0 Then
	 MenuName = MenuName & "������"
	ElseIf Ad_Class=-1 Then
	 MenuName = MenuName & "��ѭֱ��"
	ElseIf Ad_Class=-4 Then
	 MenuName = MenuName & "��ѭͼƬ"
	ElseIf Ad_Class=-7 Then
	 MenuName = MenuName & "��ѭ��ý��"
	End If
ElseIf Instr(MenuAllAction3,"|-|" & Action & "=")>0 Then
	MenuName = "���ݱ���-" & GetStr(MenuAllAction3,Action)
	
ElseIf Instr(MenuAllAction4,"|-|" & Action & "=")>0 Then
	MenuName = "Ч��ͳ��-" & GetStr(MenuAllAction4,Action)

ElseIf Instr(MenuAllAction5,"|-|" & Action & "=")>0 Then
	 MenuName = GetStr(MenuAllAction5,Action)
	 
ElseIf Instr(MenuAllAction6,"|-|" & Action & "=")>0 Then
	 MenuName = GetStr(MenuAllAction6,Action)
	 
ElseIf Instr(MenuAllAction7,"|-|" & Action & "=")>0 Then
	 MenuName = GetStr(MenuAllAction7,Action)
	 
ElseIf Instr(MenuAllAction8,"|-|" & Action & "=")>0 Then
	 MenuName = "��ȫ����-" & GetStr(MenuAllAction8,Action)

ElseIf Instr(MenuAllAction9,"|-|" & Action & "=")>0 Then
	 MenuName = GetStr(MenuAllAction9,Action)
	 
ElseIf Instr(MenuAllAction10,"|-|" & Action & "=")>0 Then
	 MenuName = GetStr(MenuAllAction10,Action)
	 
End If
%>
<!--#Include File="../../include/User_Do.asp"-->
<!DOCTYPE html>
<html lang="zh">
<head>
<meta charset="gbk">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />
<title>��վ����̨_<%=SysTitle%></title>
<link rel="icon" href="../../images/favicon.ico" type="image/ico">
<meta name="keywords" content="��վ����̨_<%=SysTitle%>">
<meta name="description" content="��վ����̨_<%=SysTitle%>">
<link href="../../css/bootstrap.min.css" rel="stylesheet">
<link href="../../css/materialdesignicons.min.css" rel="stylesheet">
<link href="../../css/style.min.css" rel="stylesheet">
<link href="../../css/my.css" rel="stylesheet">
<link href="../../css/BeAlert.css" rel="stylesheet">
<script src="../../js/jquery.min.js"></script>
<script src="../../js/jquery.cookie.min.js"></script>
<script src="../../js/global.js"></script>
<script src="../../js/BeAlert.js"></script>
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
            <li class="nav-item nav-item-has-subnav<%If Instr(MenuAllAction2,"|-|" & Action & "=")>0 Then Response.write " active open"%>">
              <a href="javascript:void(0)"><i class="mdi mdi-stackoverflow"></i> ��ȡ���</a>
              <ul class="nav nav-subnav">
<%
Sql="SELECT "
Sql=Sql&"(SELECT Count(1) FROM CFWztg_AD a inner join CFWztg_Plan b on a.plan_id=b.id Where b.PlanState=2 and a.AdState=2 And a.AdListShowState=1) adclass_0,"
Sql=Sql&"(SELECT Count(1) FROM CFWztg_AD a inner join CFWztg_Plan b on a.plan_id=b.id Where b.PlanState=2 and a.Ad_Class=1 And a.AdState=2 And a.AdListShowState=1) adclass_1,"
Sql=Sql&"(SELECT Count(1) FROM CFWztg_AD a inner join CFWztg_Plan b on a.plan_id=b.id Where b.PlanState=2 and a.Ad_Class=2 And a.AdState=2 And a.AdListShowState=1) adclass_2,"
Sql=Sql&"(SELECT Count(1) FROM CFWztg_AD a inner join CFWztg_Plan b on a.plan_id=b.id Where b.PlanState=2 and a.Ad_Class=3 And a.AdState=2 And a.AdListShowState=1) adclass_3,"
Sql=Sql&"(SELECT Count(1) FROM CFWztg_AD a inner join CFWztg_Plan b on a.plan_id=b.id Where b.PlanState=2 and a.Ad_Class=4 And a.AdState=2 And a.AdListShowState=1) adclass_4,"
Sql=Sql&"(SELECT Count(1) FROM CFWztg_AD a inner join CFWztg_Plan b on a.plan_id=b.id Where b.PlanState=2 and a.Ad_Class=5 And a.AdState=2 And a.AdListShowState=1) adclass_5,"
Sql=Sql&"(SELECT Count(1) FROM CFWztg_AD a inner join CFWztg_Plan b on a.plan_id=b.id Where b.PlanState=2 and a.Ad_Class=6 And a.AdState=2 And a.AdListShowState=1) adclass_6,"
Sql=Sql&"(SELECT Count(1) FROM CFWztg_AD a inner join CFWztg_Plan b on a.plan_id=b.id Where b.PlanState=2 and a.Ad_Class=7 And a.AdState=2 And a.AdListShowState=1) adclass_7,"
Sql=Sql&"(SELECT Count(1) FROM CFWztg_AD a inner join CFWztg_Plan b on a.plan_id=b.id Where b.PlanState=2 and a.Ad_Class=8 And a.AdState=2 And a.AdListShowState=1) adclass_8,"
Sql=Sql&"(SELECT Count(1) FROM CFWztg_AD a inner join CFWztg_Plan b on a.plan_id=b.id Where b.PlanState=2 and a.Ad_Class=9 And a.AdState=2 And a.AdListShowState=1) adclass_9,"
Sql=Sql&"(SELECT Count(1) FROM CFWztg_AD a inner join CFWztg_Plan b on a.plan_id=b.id Where b.PlanState=2 and a.Ad_Class=10 And a.AdState=2 And a.AdListShowState=1) adclass_10,"
Sql=Sql&"(SELECT Count(1) FROM CFWztg_AD a inner join CFWztg_Plan b on a.plan_id=b.id Where b.PlanState=2 and a.Ad_Class=11 And a.AdState=2 And a.AdListShowState=1) adclass_11,"
Sql=Sql&"(SELECT Count(1) FROM CFWztg_AD a inner join CFWztg_Plan b on a.plan_id=b.id Where b.PlanState=2 and a.Ad_Class=12 And a.AdState=2 And a.AdListShowState=1) adclass_12,"
Sql=Sql&"(SELECT Count(1) FROM CFWztg_AgentAd Where 1=1) adclass_f0,"
Sql=Sql&"(SELECT Count(1) FROM CFWztg_AD a inner join CFWztg_Plan b on a.plan_id=b.id Where b.PlanState=2 and a.Ad_Class=1 And a.AdState=2 And a.CycState>0) adclass_f1,"
Sql=Sql&"(SELECT Count(1) FROM CFWztg_AD a inner join CFWztg_Plan b on a.plan_id=b.id Where b.PlanState=2 and a.Ad_Class=4 And a.AdState=2 And a.CycState>0) adclass_f4,"
Sql=Sql&"(SELECT Count(1) FROM CFWztg_AD a inner join CFWztg_Plan b on a.plan_id=b.id Where b.PlanState=2 and a.Ad_Class=7 And a.AdState=2 And a.CycState>0) adclass_f7"


Set Rs=Conn.Execute(Sql)
%>
<%If InStr(RsSet("AdListOpenClass"),",-7,")>0 And Rs("AdClass_f7")>0 Then%>
<li<%If Ad_Class=-7 Then Response.write " class='active'"%>><a href="?Action=adlist&Ad_Class=-7"><SPAN>��ѭ��ý��[<%=Rs("AdClass_f7")%>]</SPAN></a></li>
<%End If%>

<%If InStr(RsSet("AdListOpenClass"),",-1,")>0 And Rs("AdClass_f1")>0 Then%>
<li<%If Ad_Class=-1 Then Response.write " class='active'"%>><a href="?Action=adlist&Ad_Class=-1"><SPAN>��ѭֱ��[<%=Rs("AdClass_f1")%>]</SPAN></a></li>
<%End If%>

<%If InStr(RsSet("AdListOpenClass"),",-4,")>0 And Rs("AdClass_f4")>0 Then%>
<li<%If Ad_Class=-4 Then Response.write " class='active'"%>><a href="?Action=adlist&Ad_Class=-4"><SPAN>��ѭ��ͨͼƬ[<%=Rs("AdClass_f4")%>]</SPAN></a></li>
<%End If%>

<%If InStr(RsSet("AdListOpenClass"),",8,")>0 And Rs("AdClass_8")>0 Then%>
<li<%If Ad_Class=8 Then Response.write " class='active'"%>><a href="?Action=adlist&Ad_Class=8"><SPAN>��ѭǿ��[<%=Rs("AdClass_8")%>]</SPAN></a></li>
<%End If%>

<%If InStr(RsSet("AdListOpenClass"),",9,")>0 And Rs("AdClass_9")>0 Then%>
<li<%If Ad_Class=9 Then Response.write " class='active'"%>><a href="?Action=adlist&Ad_Class=9"><SPAN>��ѭ�˵�[<%=Rs("AdClass_9")%>]</SPAN></a></li>
<%End If%>

<%If InStr(RsSet("AdListOpenClass"),",11,")>0 And Rs("AdClass_11")>0 Then%>
<li<%If Ad_Class=11 Then Response.write " class='active'"%>><a href="?Action=adlist&Ad_Class=11"><SPAN>��ϸ�ý��[<%=Rs("AdClass_11")%>]</SPAN></a></li>
<%End If%>

<%If InStr(RsSet("AdListOpenClass"),",5,")>0 And Rs("AdClass_5")>0 Then%>
<li<%If Ad_Class=5 Then Response.write " class='active'"%>><a href="?Action=adlist&Ad_Class=5"><SPAN>�������[<%=Rs("AdClass_5")%>]</SPAN></a></li>
<%End If%>

<%If InStr(RsSet("AdListOpenClass"),",6,")>0 And Rs("AdClass_6")>0 Then%>
<li<%If Ad_Class=6 Then Response.write " class='active'"%>><a href="?Action=adlist&Ad_Class=6"><SPAN>���ͼƬ[<%=Rs("AdClass_6")%>]</SPAN></a></li>
<%End If%>

<%If InStr(RsSet("AdListOpenClass"),",10,")>0 And Rs("AdClass_10")>0 Then%>
<li<%If Ad_Class=10 Then Response.write " class='active'"%>><a href="?Action=adlist&Ad_Class=10"><SPAN>��ϱ�ǩ��[<%=Rs("AdClass_10")%>]</SPAN></a></li>
<%End If%>

<%If InStr(RsSet("AdListOpenClass"),",1,")>0 And Rs("AdClass_1")>0 Then%>
<li<%If Ad_Class=1 Then Response.write " class='active'"%>><a href="?Action=adlist&Ad_Class=1"><span>ֱ�����[<%=Rs("AdClass_1")%>]</span></a></li>
<%End If%>

<%If InStr(RsSet("AdListOpenClass"),",2,")>0 And Rs("AdClass_2")>0 Then%>
<li<%If Ad_Class=2 Then Response.write " class='active'"%>><a href="?Action=adlist&Ad_Class=2"><SPAN>ֱͼ���[<%=Rs("AdClass_2")%>]</SPAN></a></li>
<%End If%>

<%If InStr(RsSet("AdListOpenClass"),",3,")>0 And Rs("AdClass_3")>0 Then%>
<li<%If Ad_Class=3 Then Response.write " class='active'"%>><a href="?Action=adlist&Ad_Class=3"><SPAN>��ͨ����[<%=Rs("AdClass_3")%>]</SPAN></a></li>
<%End If%>

<%If InStr(RsSet("AdListOpenClass"),",4,")>0 And Rs("AdClass_4")>0 Then%>
<li<%If Ad_Class=4 Then Response.write " class='active'"%>><a href="?Action=adlist&Ad_Class=4"><SPAN>��ͨͼƬ[<%=Rs("AdClass_4")%>]</SPAN></a></li>
<%End If%>

<%If InStr(RsSet("AdListOpenClass"),",7,")>0 And Rs("AdClass_7")>0 Then%>
<li<%If Ad_Class=7 Then Response.write " class='active'"%>><a href="?Action=adlist&Ad_Class=7"><SPAN>��ý��[<%=Rs("AdClass_7")%>]</SPAN></a></li>
<%End If%>

<%If InStr(RsSet("AdListOpenClass"),",0,")>0 And Rs("AdClass_f0")>0 Then%>
<li<%If Ad_Class=0 Then Response.write " class='active'"%>><a href="?Action=adlist&Ad_Class=0"><SPAN>������[<%=Rs("AdClass_f0")%>]</SPAN></a></li>
<%End If%>

<%If InStr(RsSet("AdListOpenClass"),",12,")>0 And Rs("AdClass_12")>0 Then%>
<li<%If Ad_Class=12 Then Response.write " class='active'"%>><a href="?Action=adlist&Ad_Class=12"><SPAN>������ذ�װ[<%=Rs("AdClass_12")%>]</SPAN></a></li>
<%End If%>

              </ul>
            </li>
            <li class="nav-item nav-item-has-subnav<%If Instr(MenuAllAction3,"|-|" & Action & "=")>0 Then Response.write " active open"%>">
              <a href="javascript:void(0)"><i class="mdi mdi-google-analytics"></i> ���ݱ���</a>
              <ul class="nav nav-subnav">
<%If InStr(RsSet("UserOpenShow"),",daytj,")>0 Then%><li<%If Action="daytj" or Action="daytjdetail" Then Response.write " class='active'"%>> <a href="?Action=daytj">ÿ��ͳ��</a> </li><%End If%>
<%If InStr(RsSet("UserOpenShow"),",hourtj,")>0 Then%><li<%If Action="hourtj" Then Response.write " class='active'"%>> <a href="?Action=hourtj">ÿСʱͳ��</a> </li><%End If%>
<%If InStr(RsSet("UserOpenShow"),",iplist,")>0 Then%><li<%If Action="iplist" Then Response.write " class='active'"%>> <a href="?Action=iplist">��Ч���IP</a> </li><%End If%>
<%If InStr(RsSet("UserOpenShow"),",invalidiplist,")>0 Then%><li<%If Action="invalidiplist" Then Response.write " class='active'"%>> <a href="?Action=invalidiplist">��Ч���IP</a> </li><%End If%>
<%If InStr(RsSet("UserOpenShow"),",showlist,")>0 Then%><li<%If Action="showlist" Then Response.write " class='active'"%>> <a href="?Action=showlist">�����ʾ</a> </li><%End If%>
<%If InStr(RsSet("UserOpenShow"),",searchkeywordtj,")>0 Then%><li<%If Action="searchkeywordtj" Then Response.write " class='active'"%>> <a href="?Action=searchkeywordtj">�ؼ���</a> </li><%End If%>
<%If InStr(RsSet("UserOpenShow"),",lylist,")>0 Then%><li<%If Action="lylist" Then Response.write " class='active'"%>> <a href="?Action=lylist">�����Դ</a> </li><%End If%>
<%If InStr(RsSet("UserOpenShow"),",ipareatj,")>0 Then%><li<%If Action="ipareatj" Then Response.write " class='active'"%>> <a href="?Action=ipareatj">IP����</a> </li><%End If%>
<%If InStr(RsSet("UserOpenShow"),",webwidthtj,")>0 Then%><li<%If Action="webwidthtj" Then Response.write " class='active'"%>> <a href="?Action=webwidthtj">��ҳ���</a> </li><%End If%>
<%If InStr(RsSet("UserOpenShow"),",othertj,")>0 Then%><li<%If Action="othertj" Then Response.write " class='active'"%>> <a href="?Action=othertj">����</a> </li><%End If%>
              </ul>
            </li>
            <li class="nav-item nav-item-has-subnav<%If Instr(MenuAllAction4,"|-|" & Action & "=")>0 Then Response.write " active open"%>">
              <a href="javascript:void(0)"><i class="mdi mdi-human-greeting"></i> CPA��CPS</a>
              <ul class="nav nav-subnav">
<%If InStr(RsSet("UserOpenShow"),",lowview,")>0 Then%><li<%If Action="lowview" Then Response.write " class='active'"%>> <a href="?Action=lowview">CPA�б�</a> </li><%End If%>
<%If InStr(RsSet("UserOpenShow"),",lowdaytj,")>0 Then%><li<%If Action="lowdaytj" Then Response.write " class='active'"%>> <a href="?Action=lowdaytj">CPAͳ��</a> </li><%End If%>
<%If InStr(RsSet("UserOpenShow"),",orderview,")>0 Then%><li<%If Action="orderview" Then Response.write " class='active'"%>> <a href="?Action=orderview">CPS����</a> </li><%End If%>
<%If InStr(RsSet("UserOpenShow"),",orderdaytj,")>0 Then%><li<%If Action="orderdaytj" Then Response.write " class='active'"%>> <a href="?Action=orderdaytj">CPSͳ��[������ʱ��]</a> </li><%End If%>
<%If InStr(RsSet("UserOpenShow"),",orderdaytjgoodstime,")>0 Then%><li<%If Action="orderdaytjgoodstime" Then Response.write " class='active'"%>> <a href="?Action=orderdaytjgoodstime">CPSͳ��[������ʱ��]</a> </li><%End If%>
<%If InStr(RsSet("UserOpenShow"),",lowuniondaytj,")>0 Then%><li<%If Action="lowuniondaytj" Then Response.write " class='active'"%>> <a href="?Action=lowuniondaytj">�¼�����</a> </li><%End If%>
<%If InStr(RsSet("UserOpenShow"),",lowuniondatarecview,")>0 Then%><li<%If Action="lowuniondatarecview" Or Action="lowuniondayrecview" Or Action="lowunioncpsrecview" Then Response.write " class='active'"%>> <a href="?Action=lowuniondatarecview">�¼��������ݵ���</a> </li><%End If%>
<%If InStr(RsSet("UserOpenShow"),",agentaddaytj,")>0 Then%><li<%If Action="agentaddaytj" Then Response.write " class='active'"%>> <a href="?Action=agentaddaytj">����������ͳ��</a> </li><%End If%>
              </ul>
            </li>
			
            <li class="nav-item<%If Instr(MenuAllAction5,"|-|" & Action & "=")>0 Then Response.write " active"%>"> <a href="?Action=usersiteadd"><i class="mdi mdi-web"></i> ������վ</a> </li>
			<li class="nav-item<%If Instr(MenuAllAction6,"|-|" & Action & "=")>0 Then Response.write " active"%>"> <a href="?Action=usersitelist"><i class="mdi mdi-image-filter-none"></i> ��վ�б�</a> </li>
<%
Sql = "Select Count(1) From CFWztg_Spend Where UserName='"&UserName&"' And SpendType=0 And SpendState=1"
Set Rs2=Conn.Execute(Sql)
SpendNoReplyNum=Rs2(0)
Rs2.Close
%>
			<li class="nav-item<%If Instr(MenuAllAction7,"|-|" & Action & "=")>0 Then Response.write " active"%>"> <a href="?Action=spendlist"><i class="mdi mdi-currency-cny"></i> Ӷ�����<%If SpendNoReplyNum>0 Then Response.write "<span class='badge'>"&SpendNoReplyNum&"</span>"%></a> </li>
			 
            <li class="nav-item nav-item-has-subnav<%If Instr(MenuAllAction8,"|-|" & Action & "=")>0 Then Response.write " active open"%>">
              <a href="javascript:void(0)"><i class="mdi mdi-security"></i> ��ȫ����</a>
              <ul class="nav nav-subnav">
                <li<%If Action="pwdmodify" Then Response.write " class='active'"%>> <a href="?Action=pwdmodify">�޸�����</a> </li>
                <li<%If Action="pwdanswermodify" Then Response.write " class='active'"%>> <a href="?Action=pwdanswermodify">�޸����뱣��</a> </li>
                <li<%If Action="userpaymodify" Then Response.write " class='active'"%>> <a href="?Action=userpaymodify">�޸Ļ�ʽ</a> </li>
                <li<%If Action="datamodify" Then Response.write " class='active'"%>> <a href="?Action=datamodify">�޸�����</a> </li>
                <li<%If Action="aduserbindmodify" Then Response.write " class='active'"%>> <a href="?Action=aduserbindmodify">�޸Ĺ������</a> </li>
              </ul>
            </li>
            
			<li class="nav-item<%If Instr(MenuAllAction9,"|-|" & Action & "=")>0 Then Response.write " active"%>"> <a href="?Action=sysinfolist"><i class="mdi mdi-volume-high"></i> ϵͳ����</a> </li>
<%
Sql="Select Count(1) From CFWztg_Gbook where UserName='"&UserName&"' And IsRead_Admin=0"
Set Rs2=Conn.Execute(Sql)
GookNoReplyNum=Rs2(0)
Rs2.Close
%>
			<li class="nav-item<%If Instr(MenuAllAction10,"|-|" & Action & "=")>0 Then Response.write " active"%>"> <a href="?Action=gbooklist"><i class="mdi mdi-content-paste"></i> ������ѯ<%If GookNoReplyNum>0 Then Response.write "<span class='badge'>"&GookNoReplyNum&"</span>"%></a> </li>
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
                <img class="img-avatar img-avatar-48 m-r-10" src="images/users/avatar.jpg" alt="<%=UserName%>" />
                <span><%=UserName%> <span class="caret"></span></span>
              </a>
              <ul class="dropdown-menu dropdown-menu-right">
                <li> <a href="?Action=datamodify"><i class="mdi mdi-account"></i>������Ϣ</a> </li>
                <li> <a href="?Action=pwdmodify"><i class="mdi mdi-lock-outline"></i>�޸�����</a> </li>
                <li> <a href="?Action=gbookadd"><i class="mdi mdi-content-paste"></i>�ύ����</a></li>
                <li class="divider"></li>
                <li> <a href="?Action=userlogout"><i class="mdi mdi-logout-variant"></i>�˳���¼</a> </li>
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
      
     <!--#Include File="User_Select.asp"-->
      
    </main>
    <!--End ҳ����Ҫ����-->
  </div>
</div>


<script type="text/javascript" src="../../js/bootstrap.min.js"></script>
<script type="text/javascript" src="../../js/perfect-scrollbar.min.js"></script>
<script type="text/javascript" src="../../js/main.min.js"></script>


<%If Action="main" Then%>

<%
Sql="Select top 7 AddDate,Sum(User_Income_Cent) As User_Income_Cent From CFWztg_AD_Counter_Day Where UserName='"&UserName&"'  Group By AddDate Order By AddDate"
Set Rs2=Conn.Execute(Sql)
While Not Rs2.Eof
 ChartDate = ChartDate & "'" & Rs2("AddDate") & "',"
 ChartData = ChartData & FormatNumber(Cdbl(Rs2("User_Income_Cent")),2,-1,0,0) & ","
Rs2.MoveNext
Wend
ChartDate=StrReverse(Mid(StrReverse(ChartDate), 2))
ChartData=StrReverse(Mid(StrReverse(ChartData), 2))


Sql="Select top 15 AddDate,Sum(Display_Counter) As Display_Counter From CFWztg_AD_Counter_Day Where UserName='"&UserName&"'  Group By AddDate Order By AddDate"
Set Rs2=Conn.Execute(Sql)
While Not Rs2.Eof
 ChartDate2 = ChartDate2 & "'" & Rs2("AddDate") & "',"
 ChartData2 = ChartData2 & Rs2("Display_Counter") & ","
Rs2.MoveNext
Wend
ChartDate2=StrReverse(Mid(StrReverse(ChartDate2), 2))
ChartData2=StrReverse(Mid(StrReverse(ChartData2), 2))
%>
<!--ͼ����-->
<script type="text/javascript" src="../../js/Chart.js"></script>
<script type="text/javascript">
$(document).ready(function(e) {
    var $dashChartBarsCnt  = jQuery( '.js-chartjs-bars' )[0].getContext( '2d' ),
        $dashChartLinesCnt = jQuery( '.js-chartjs-lines' )[0].getContext( '2d' );
    
    var $dashChartBarsData = {
		labels: [<%=ChartDate%>],
		datasets: [
			{
				label: '�������',
                borderWidth: 1,
                borderColor: 'rgba(0,0,0,0)',
				backgroundColor: 'rgba(51,202,185,0.5)',
                hoverBackgroundColor: "rgba(51,202,185,0.7)",
                hoverBorderColor: "rgba(0,0,0,0)",
				data: [<%=ChartData%>]
			}
		]
	};
    var $dashChartLinesData = {
		labels: [<%=ChartDate2%>],
		datasets: [
			{
				label: '���PV',
				data: [<%=ChartData2%>],
				borderColor: '#358ed7',
				backgroundColor: 'rgba(53, 142, 215, 0.175)',
                borderWidth: 1,
                fill: false,
                lineTension: 0.5
			}
		]
	};
    
    new Chart($dashChartBarsCnt, {
        type: 'bar',
        data: $dashChartBarsData
    });
    
    var myLineChart = new Chart($dashChartLinesCnt, {
        type: 'line',
        data: $dashChartLinesData,
    });
});
</script>
<%End If%>


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
