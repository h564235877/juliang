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
'--��ȡ��¼
Function GetUserLogin()
PublicStr="<script>" & Chr(13)&Chr(10)
PublicStr=PublicStr&"function userloginccimgchange()" & Chr(13)&Chr(10)
PublicStr=PublicStr&"{" & Chr(13)&Chr(10)
PublicStr=PublicStr&"document.getElementById('userloginccimg').style.display = '';" & Chr(13)&Chr(10)
PublicStr=PublicStr&"document.getElementById('userloginccimg').src = 'include/CheckCode.asp?RanStr=' + Math.random();" & Chr(13)&Chr(10)
PublicStr=PublicStr&"}" & Chr(13)&Chr(10)
PublicStr=PublicStr&"function userlogincheck()" & Chr(13)&Chr(10)
PublicStr=PublicStr&"{" & Chr(13)&Chr(10)
PublicStr=PublicStr&"if(document.form_userlogin.username.value==''){" & Chr(13)&Chr(10)
PublicStr=PublicStr&"alert('�������û���!');" & Chr(13)&Chr(10)
PublicStr=PublicStr&"document.form_userlogin.username.focus();" & Chr(13)&Chr(10)
PublicStr=PublicStr&"return false;" & Chr(13)&Chr(10)
PublicStr=PublicStr&"}" & Chr(13)&Chr(10)
PublicStr=PublicStr&"if(document.form_userlogin.pwd.value==''){" & Chr(13)&Chr(10)
PublicStr=PublicStr&"alert('����������!');" & Chr(13)&Chr(10)
PublicStr=PublicStr&"document.form_userlogin.pwd.focus();" & Chr(13)&Chr(10)
PublicStr=PublicStr&"return false;" & Chr(13)&Chr(10)
PublicStr=PublicStr&"}" & Chr(13)&Chr(10)
If RsSet("LoginCheckCode")=1 Then'--��������֤��ʱ
PublicStr=PublicStr&"if(document.form_userlogin.checkcode.value==''||document.form_userlogin.checkcode.value=='�����ȡ')  {" & Chr(13)&Chr(10)
PublicStr=PublicStr&"alert('��������λ���ֵ���֤��!');" & Chr(13)&Chr(10)
PublicStr=PublicStr&"document.form_userlogin.checkcode.focus();" & Chr(13)&Chr(10)
PublicStr=PublicStr&"return false;" & Chr(13)&Chr(10)
PublicStr=PublicStr&"}" & Chr(13)&Chr(10)
End If
PublicStr=PublicStr&"return true;" & Chr(13)&Chr(10)
PublicStr=PublicStr&"}" & Chr(13)&Chr(10)
PublicStr=PublicStr&"</script>" & Chr(13)&Chr(10)

PublicStr=PublicStr&"<div id='login'><ul id='login_a'>"
PublicStr=PublicStr&"<form name='form_userlogin' id=form_userlogin method='post' action='index.asp?Action=userloginsave' onsubmit='return userlogincheck();'>"

If Session("CFWztgUser")="" And Session("CFWztgAdUser")="" Then

PublicStr=PublicStr&"<li id='login_a1'>�û�����</li>"
PublicStr=PublicStr&"<li><INPUT id=username size=15 name=username></li>"

PublicStr=PublicStr&"<li id='login_a1'>��&nbsp;&nbsp;&nbsp;&nbsp;�룺</li>"
PublicStr=PublicStr&"<li><INPUT id=pwd type=password size=15 name=pwd></li>"

PublicStr=PublicStr&"<li id='login_a1'>Cookie��</li>"
PublicStr=PublicStr&"<li><select name='cookies_time' id='cookies_time'>"
PublicStr=PublicStr&"<option value=60 selected>������</option>"
PublicStr=PublicStr&"<option value=1440>����һ��</option>"
PublicStr=PublicStr&"<option value=10080>����һ��</option>"
PublicStr=PublicStr&"<option value=43200>����һ����</option>"
PublicStr=PublicStr&"</select></li>"

If RsSet("LoginCheckCode")=1 Then'--��������֤��ʱ
PublicStr=PublicStr&"<li id='login_a1'>��֤�룺</li>"
PublicStr=PublicStr&"<li id='login_checkcode'>"
PublicStr=PublicStr&"<INPUT name=checkcode type=text id=checkcode value='�����ȡ' size=7 onclick=""if(document.getElementById('checkcode').value==''||document.getElementById('checkcode').value=='�����ȡ'){userloginccimgchange();document.getElementById('checkcode').value='';}"" autoComplete='off'>"
PublicStr=PublicStr&"<a href=""javascript:userloginccimgchange()""><IMG id=userloginccimg src='' style='display:none;' title='�����������һ����'></a>"
PublicStr=PublicStr&"</li>"
End If

PublicStr=PublicStr&"<li id='login_a2'><a href='{url_pwdrecover}'>��������</a></li>"
PublicStr=PublicStr&"<li>"
PublicStr=PublicStr&"<INPUT type=image border=0 id=login_button name=login_button src='images/login.gif' style='width:53px;height:21px;border:0px'>"
PublicStr=PublicStr&"<a href='{url_reg}'><img src='images/reg.gif' border=0></a>"
PublicStr=PublicStr&"</li>"
Else
 If Session("CFWztgUser")<>"" Then
  LoginUrl=UserManagePath&"/"
  LogoutUrl=UserManagePath&"/?Action=userlogout"
  LoginType="��¼���ͣ���վ�������ѻ������"
  PublicStr=PublicStr&"<li id='login_a3'>"&LoginType&"</li>"
  PublicStr=PublicStr&"<li id='login_a3'><a href='"&LoginUrl&"'><img src='images/manage.gif' border=0></a></li>"
  PublicStr=PublicStr&"<li id='login_a3'><a href='"&LogoutUrl&"' onClick=""return confirm('ȷ��Ҫ�˳�������?')""><img src='images/logout.gif' border=0></a></li>"
 End If
 
 If Session("CFWztgAdUser")<>"" Then
  LoginUrl=AdUserManagePath&"/"
  LogoutUrl=AdUserManagePath&"/?Action=aduserlogout"
  LoginType="��¼���ͣ������"
  PublicStr=PublicStr&"<li id='login_a3'>"&LoginType&"</li>"
  PublicStr=PublicStr&"<li id='login_a3'><a href='"&LoginUrl&"'><img src='images/manage.gif' border=0></a></li>"
  PublicStr=PublicStr&"<li id='login_a3'><a href='"&LogoutUrl&"' onClick=""return confirm('ȷ��Ҫ�˳�������?')""><img src='images/logout.gif' border=0></a></li>"
 End If
end if
PublicStr=PublicStr&"</form>"
PublicStr=PublicStr&"</ul></div>"

GetUserLogin=PublicStr
End Function



'--��ȡ�û�����������
Function GetUserTop(ByVal ShowNum)
PublicStr=""
PublicStr="<div id='userincometop'><ul id='userincometop_a'>"

Sql="Select Top "&ShowNum&" * From CFWztg_User Order By Total_Cent Desc,ID Desc"
Set Rs=Conn.ExeCute(Sql)
PubicI = 0
While Not Rs.Eof
PubicI=PubicI+1
If PubicI<=3 Then
 PubicLiID = "userincometop_a1"
 PubicSpanID = "userincometop_b1"
ElseIf PubicI<=9 Then
 PubicLiID = "userincometop_a2"
 PubicSpanID = "userincometop_b2"
Else
 PubicLiID = "userincometop_a3"
 PubicSpanID = "userincometop_b3"
End If
PublicStr=PublicStr&"<li id='"&PubicLiID&"'><span id='"&PubicSpanID&"'>"&PubicI&"</span>"&GetHiddenUserName(Rs("UserName"))&"</li>"
PublicStr=PublicStr&"<li>"&FormatNumber(Cdbl(Rs("Total_Cent")),2,-1,0,0)&"Ԫ</li>"
Rs.MoveNext
Wend
PublicStr=PublicStr&"</ul></div>"

GetUserTop=PublicStr
End Function

'--��ȡ���Ľ���
Function GetSpendLast(ByVal ShowNum)
PublicStr = ""

PublicStr="<div id='userspendlast'><ul id='userspendlast_a'>"
Sql="Select Top "&ShowNum&" * From CFWztg_Spend Order By SpendTime Desc,ID Desc"
Set Rs=Conn.ExeCute(Sql)
PubicI = 0
While Not Rs.Eof
PubicI=PubicI+1
If PubicI<=3 Then
 PubicLiID = "userspendlast_a1"
 PubicSpanID = "userspendspan_b1"
ElseIf PubicI<=9 Then
 PubicLiID = "userspendlast_a2"
 PubicSpanID = "userspendspan_b2"
Else
 PubicLiID = "userspendlast_a3"
 PubicSpanID = "userspendspan_b3"
End If
PublicStr=PublicStr&"<li id='"&PubicLiID&"'><span id='"&PubicSpanID&"'>"&PubicI&"</span>"&GetHiddenUserName(Rs("UserName"))&"</li>"
PublicStr=PublicStr&"<li>"&GetTurnCent(Rs("Spend_Cent"))&"Ԫ</li>"
Rs.MoveNext
Wend
PublicStr=PublicStr&"</ul></div>"

GetSpendLast=PublicStr
End Function

'--��ȡ���ע����û�
Function GetUserLast(ByVal ShowNum)
PublicStr="<div id='userlastreg'><ul id='userlastreg_a'>"
Sql="Select Top "&ShowNum&" * From CFWztg_User Where UserType=1 Order By AddTime Desc,ID Desc"
Set Rs=Conn.ExeCute(Sql)
PubicI = 0
While Not Rs.Eof
PubicI=PubicI+1
If PubicI<=3 Then
 PubicLiID = "userlastreg_a1"
 PubicSpanID = "userlastreg_b1"
ElseIf PubicI<=9 Then
 PubicLiID = "userlastreg_a2"
 PubicSpanID = "userlastreg_b2"
Else
 PubicLiID = "userlastreg_a3"
 PubicSpanID = "userlastreg_b3"
End If
PublicStr=PublicStr&"<li id='"&PubicLiID&"'><span id='"&PubicSpanID&"'>"&PubicI&"</span>"&GetHiddenUserName(Rs("UserName"))&"</li>"
PublicStr=PublicStr&"<li>"&Right("0"&Month(rs("AddTime")),2)&"-"&Right("0"&Day(rs("AddTime")),2)&"</li>"
Rs.MoveNext
Wend
Rs.Close
PublicStr=PublicStr&"</ul></div>"
GetUserLast=PublicStr
End Function

'--��ȡ���ע��Ĺ����
Function GetAdUserLast(ByVal ShowNum)
PublicStr="<div id='aduserlastreg'><ul id='aduserlastreg_a'>"
Sql="Select Top "&ShowNum&" * From CFWztg_User Where UserType=2 Order By AddTime Desc,ID Desc"
Set Rs=Conn.ExeCute(Sql)
PubicI = 0
While Not Rs.Eof
PubicI=PubicI+1
If PubicI<=3 Then
 PubicLiID = "aduserlastreg_a1"
 PubicSpanID = "aduserlastreg_b1"
ElseIf PubicI<=9 Then
 PubicLiID = "aduserlastreg_a2"
 PubicSpanID = "aduserlastreg_b2"
Else
 PubicLiID = "aduserlastreg_a3"
 PubicSpanID = "aduserlastreg_b3"
End If
PublicStr=PublicStr&"<li id='"&PubicLiID&"'><span id='"&PubicSpanID&"'> "&PubicI&"</span>"&GetHiddenUserName(Rs("UserName"))&"</li>"
PublicStr=PublicStr&"<li>"&Right("0"&Month(rs("AddTime")),2)&"-"&Right("0"&Day(rs("AddTime")),2)&"</li>"
Rs.MoveNext
Wend
Rs.Close
PublicStr=PublicStr&"</ul></div>"
GetAdUserLast=PublicStr
End Function

'--��ȡ����Ĺ���
Function GetInfoLast(ByVal ShowNum)
PublicStr="<div id='infolast'><ul id='infolast_a'>"
Sql="Select Top "&ShowNum&" * From CFWztg_SysInfo Where Assort<>3 And Assort<>4 Order By ListID Desc,AddTime Desc,ID Desc"
Set Rs = Server.CreateObject("ADODB.Recordset")
Rs.open Sql,Conn,1,1
While Not Rs.Eof

If SiteHtml=0 Then
 WebUrl = "?f=infoshow&id="&Rs("ID")
Else'--������α��̬ʱ
 WebUrl = "infoshow_"&Rs("ID")&".html"
End If

PublicStr=PublicStr&"<li>"
PublicStr=PublicStr&Right("0"&Month(rs("AddTime")),2)&"-"&Right("0"&Day(rs("AddTime")),2)&"&nbsp;&nbsp;<a href='"&WebUrl&"' target='_blank'>"&Rs("Title")&"</a>"
PublicStr=PublicStr&"</li>"
Rs.MoveNext
Wend
Rs.Close
PublicStr=PublicStr&"</ul></div>"
GetInfoLast=PublicStr
End Function

'--��ȡ�������
Function GetInfoClassAll()
If Request("Assort") = "" Then
 Assort = 0
Else 
 Assort = CLng(ChkStr(Request("Assort"),2))
End If 

PublicStr="<div id='infoclassall'><ul id='infoclassall_a'>"

Sql="Select * From CFWztg_SysInfoClass Where ID<>3 And ID<>4 Order By ID"
Set Rs = Server.CreateObject("ADODB.Recordset")
Rs.open Sql,Conn,1,1
While Not Rs.Eof
If SiteHtml=0 Then
 WebUrl = "?f=infoall&assort="&Rs("ID")&"&page=1"
Else'--������α��̬ʱ
 WebUrl = "infoall_a"&Rs("ID")&"p1.html"
End If

If CLng(Assort)=Rs("ID") Then
PublicStr=PublicStr&"<li id='infoclassall_a2'>"
Else
PublicStr=PublicStr&"<li id='infoclassall_a1'>"
End If

PublicStr=PublicStr&"<a href='"&WebUrl&"'>"&Rs("InfoClassName")&"</a>"
PublicStr=PublicStr&"</li>"
Rs.MoveNext
Wend
Rs.Close
PublicStr=PublicStr&"</ul></div>"

GetInfoClassAll=PublicStr

End Function


'--��ȡȫ������
Function GetInfoAll(ByVal ShowNum)
If Request("Assort") = "" Then
 Assort = 0
Else 
 Assort = CLng(ChkStr(Request("Assort"),2))
End If 

PublicStr="<div id='infoall'><ul id='infoall_a'>"

Sql="Select a.id,a.assort,a.title,a.addtime,b.infoclassname From CFWztg_SysInfo a inner join CFWztg_SysInfoClass b on a.assort=b.id Where a.Assort<>3 And a.Assort<>4"
If CLng(Assort)>0 Then Sql=Sql&" And a.assort="&Assort
Sql=Sql&" Order By a.ListID Desc,a.AddTime Desc,a.ID Desc"

Set Rs = Server.CreateObject("ADODB.Recordset")
Rs.open Sql,Conn,1,1
If Not Rs.eof Then
 If Request("Page") = "" Then Page = 1 Else Page = CLng(ChkStr(Request("Page"),2))
 Rs.pagesize=ShowNum
 TotalRs=Rs.RecordCount
 TotalPage=Rs.PageCount
 MyPageSize=Rs.PageSize
 Rs.AbsolutePage=Page
End If
While Not Rs.Eof And MyPageSize>0

If SiteHtml=0 Then
 WebUrl = "?f=infoshow&id="&Rs("ID")
Else'--������α��̬ʱ
 WebUrl = "infoshow_"&Rs("ID")&".html"
End If

PublicStr=PublicStr&"<li id='infoall_a1'>"
PublicStr=PublicStr&Year(rs("AddTime"))&"-"&Right("0"&Month(rs("AddTime")),2)&"-"&Right("0"&Day(rs("AddTime")),2)&"&nbsp;&nbsp;<a href='"&WebUrl&"' target='_blank'>"&Rs("Title")&"</a>"
If CLng(Assort)=0 Then
PublicStr=PublicStr&"&nbsp;&nbsp;&nbsp;&nbsp;[ "
PublicStr=PublicStr&rs("InfoClassName")
PublicStr=PublicStr&" ]&nbsp;&nbsp;"
End If
PublicStr=PublicStr&"</li>"

MyPageSize=MyPageSize-1
Rs.MoveNext
Wend
Rs.Close
PublicStr=PublicStr&"</ul></div>"

If SiteHtml=0 Then
 PageUrl_1 = "?f="&TemplateFile&"&assort="&assort&"&page=1"
 PageUrl_2 = "?f="&TemplateFile&"&assort="&assort&"&page="&Page-1
 PageUrl_3 = "?f="&TemplateFile&"&assort="&assort&"&page="&Page+1
 PageUrl_4 = "?f="&TemplateFile&"&assort="&assort&"&page="&totalpage
 PageUrl_5 = "'?f="&TemplateFile&"&assort="&assort&"&page='+document.getElementById('page').options[document.getElementById('page').selectedIndex].value"
Else'--������α��̬ʱ
 PageUrl_1 = TemplateFile&"_a"&assort&"p1.html"
 PageUrl_2 = TemplateFile&"_a"&assort&"p"&Page-1&".html"
 PageUrl_3 = TemplateFile&"_a"&assort&"p"&Page+1&".html"
 If TotalPage=0 Then
  PageUrl_4 = TemplateFile&"_a"&assort&"p1.html"
 Else
  PageUrl_4 = TemplateFile&"_a"&assort&"p"&totalpage&".html"
 End If
 PageUrl_5 = "'"&TemplateFile&"_a"&assort&"p'+document.getElementById('page').options[document.getElementById('page').selectedIndex].value+'.html'"
End If

PublicStr=PublicStr&"<div id='infoall_page'><ul id='infoall_page_a'>"
PublicStr=PublicStr&"<li id='infoall_page_a1'><a href='"&PageUrl_1&"'>��һҳ</a>"

If Page>1 Then
PublicStr=PublicStr&"&nbsp;&nbsp;<a href='"&PageUrl_2&"'>��һҳ</a>"
End If

If Page<TotalPage then
PublicStr=PublicStr&"&nbsp;&nbsp;<a href='"&PageUrl_3&"'>��һҳ</a>"
End If

PublicStr=PublicStr&"&nbsp;&nbsp;<a href='"&PageUrl_4&"'>���һҳ</a> ҳ�Σ�<font color=""#ff0000"">"&page&"</font>/"&totalpage&"ҳ&nbsp;&nbsp;��"&totalrs&"����¼&nbsp;&nbsp;ÿҳ��ʾ"&rs.pagesize&"��"

PublicStr=PublicStr&"&nbsp;&nbsp;ת����<select id='page' onChange=""window.location="&PageUrl_5&""">"
For I=1 To TotalPage
 PublicStr=PublicStr&"<option value="& I
 If Page=I Then PublicStr=PublicStr&" selected"
 PublicStr=PublicStr&">"& I &"</option>"
Next
PublicStr=PublicStr&"</select>ҳ"

PublicStr=PublicStr&"</li>"
PublicStr=PublicStr&"</ul></div>"

GetInfoAll=PublicStr


End Function


'--��ȡ������ʾ
Function GetInfoShow()
ID=Goback(ChkStr(Request("ID"),2),"������ID��")

Sql="Select * From CFWztg_SysInfo Where ID="&ID
Set Rs = Server.CreateObject("ADODB.Recordset")
Rs.open Sql,Conn,1,1
PublicStr="<div id='infoshow'><ul id='infoshow_a'>"
If Not Rs.Eof Then
PublicStr=PublicStr&"<li id='infoshow_a1'>"&Rs("Title")&"</li>"
PublicStr=PublicStr&"<li id='infoshow_a2'>����ʱ�䣺"&Rs("AddTime")&"</li>"
PublicStr=PublicStr&"<li id='infoshow_a3'>"&Rs("Content")&"</li>"
If Rs("InfoLabel")<>"" Then PublicStr=PublicStr&"<li id='infoshow_a2'>��ǩ:"&Rs("InfoLabel")&"</li>"
PublicStr=PublicStr&"<li id='infoshow_a4'>"
PublicStr=PublicStr&"<script>function CloseWin(){window.opener=null;window.open("""",""_self"");window.close();}</script>"
PublicStr=PublicStr&"<a href=""javascript:"" onclick=""CloseWin()"">�رձ�ҳ</a>"
PublicStr=PublicStr&"</li>"
Else
PublicStr="<li id='infoshow_a1'>���治����</li>"
End If
Rs.Close
PublicStr=PublicStr&"</ul></div>"

GetInfoShow=PublicStr
End Function

'--��ȡ�������
Function GetInfoTitle()

If TemplateFile="infoshow" Then
ID=Goback(ChkStr(Request("ID"),2),"������ID��")
Sql="Select Title From CFWztg_SysInfo Where ID="&ID
Set Rs = Server.CreateObject("ADODB.Recordset")
Rs.open Sql,Conn,1,1
If Not Rs.Eof Then
PublicStr=Rs("Title")&"_"&SysSeoTitle
End If
ElseIf TemplateFile="index" Then
PublicStr=SysSeoTitle
ElseIf TemplateFile="webowner" Then
PublicStr="��վ��_"&SysSeoTitle
ElseIf TemplateFile="advertiser" Then
PublicStr="�����_"&SysSeoTitle
ElseIf TemplateFile="agent" Then
PublicStr="������_"&SysSeoTitle
ElseIf TemplateFile="infoall" Then
 If Request("Assort") = "" Then
  PublicStr="��Ϣ�б�_"&SysSeoTitle
 Else 
  Assort = CLng(ChkStr(Request("Assort"),2))
  Sql="Select * From CFWztg_SysInfoClass Where ID="&Assort
  Set Rs = Server.CreateObject("ADODB.Recordset")
  Rs.open Sql,Conn,1,1
  If Not Rs.eof Then
   PublicStr=Rs("InfoClassName")&"_"&SysSeoTitle
  End If
  Rs.Close
 End If 
ElseIf TemplateFile="help" Then
PublicStr="��������_"&SysSeoTitle
ElseIf TemplateFile="style" Then
PublicStr="�����ʽ_"&SysSeoTitle
ElseIf TemplateFile="rule" Then
PublicStr="�������_"&SysSeoTitle
ElseIf TemplateFile="service" Then
PublicStr="��������_"&SysSeoTitle
ElseIf TemplateFile="contact" Then
PublicStr="��ϵ����_"&SysSeoTitle
ElseIf TemplateFile="reg" Then
PublicStr="�û�ע��_"&SysSeoTitle
ElseIf TemplateFile="login" Then
PublicStr="�û���¼_"&SysSeoTitle
ElseIf TemplateFile="pwdrecover" Then
PublicStr="�һ�����_"&SysSeoTitle
ElseIf TemplateFile="pwdmodify" Then
PublicStr="�޸�����_"&SysSeoTitle
ElseIf TemplateFile="pwdanswermodify" Then
PublicStr="�޸��ܱ�_"&SysSeoTitle
Else
PublicStr=SysSeoTitle
End If

GetInfoTitle=PublicStr
End Function

'--��ȡ����ؼ���
Function GetInfoKeyword()
If TemplateFile="infoshow" Then
ID=Goback(ChkStr(Request("ID"),2),"������ID��")
Sql="Select InfoKeyword From CFWztg_SysInfo Where ID="&ID
Set Rs = Server.CreateObject("ADODB.Recordset")
Rs.open Sql,Conn,1,1
If Not Rs.Eof Then
PublicStr=Rs("InfoKeyword")
End If
Rs.Close
ElseIf TemplateFile="index" Then
PublicStr="��ҳ,"&SysTitle
ElseIf TemplateFile="webowner" Then
PublicStr="��վ��,"&SysTitle
ElseIf TemplateFile="advertiser" Then
PublicStr="�����,"&SysTitle
ElseIf TemplateFile="agent" Then
PublicStr="������,"&SysTitle
ElseIf TemplateFile="infoall" Then
 If Request("Assort") = "" Then
  PublicStr="��Ϣ�б�,"&SysTitle
 Else 
  Assort = CLng(ChkStr(Request("Assort"),2))
  Sql="Select * From CFWztg_SysInfoClass Where ID="&Assort
  Set Rs = Server.CreateObject("ADODB.Recordset")
  Rs.open Sql,Conn,1,1
  If Not Rs.eof Then
   PublicStr=Rs("InfoClassName")&","&SysTitle
  End If
  Rs.Close
 End If 
ElseIf TemplateFile="help" Then
PublicStr="��������,"&SysTitle
ElseIf TemplateFile="style" Then
PublicStr="�����ʽ,"&SysTitle
ElseIf TemplateFile="rule" Then
PublicStr="�������,"&SysTitle
ElseIf TemplateFile="service" Then
PublicStr="��������,"&SysTitle
ElseIf TemplateFile="contact" Then
PublicStr="��ϵ����,"&SysTitle
ElseIf TemplateFile="reg" Then
PublicStr="�û�ע��,"&SysTitle
ElseIf TemplateFile="login" Then
PublicStr="�û���¼,"&SysTitle
ElseIf TemplateFile="pwdrecover" Then
PublicStr="�һ�����,"&SysTitle
ElseIf TemplateFile="pwdmodify" Then
PublicStr="�޸�����,"&SysTitle
ElseIf TemplateFile="pwdanswermodify" Then
PublicStr="�޸��ܱ�,"&SysTitle
Else
PublicStr=SysTitle
End If
GetInfoKeyword=PublicStr
End Function

'--��ȡ��������
Function GetInfoDesc()
If TemplateFile="infoshow" Then
ID=Goback(ChkStr(Request("ID"),2),"������ID��")
Sql="Select InfoDesc From CFWztg_SysInfo Where ID="&ID
Set Rs = Server.CreateObject("ADODB.Recordset")
Rs.open Sql,Conn,1,1
If Not Rs.Eof Then
PublicStr=Rs("InfoDesc")
End If
Rs.Close
ElseIf TemplateFile="index" Then
PublicStr=SysTitle&"��ҳ"
ElseIf TemplateFile="webowner" Then
PublicStr=SysTitle&"��վ��"
ElseIf TemplateFile="advertiser" Then
PublicStr=SysTitle&"�����"
ElseIf TemplateFile="agent" Then
PublicStr=SysTitle&"������_"
ElseIf TemplateFile="infoall" Then
 If Request("Assort") = "" Then
  PublicStr=SysTitle&"��Ϣ�б�"
 Else 
  Assort = CLng(ChkStr(Request("Assort"),2))
  Sql="Select * From CFWztg_SysInfoClass Where ID="&Assort
  Set Rs = Server.CreateObject("ADODB.Recordset")
  Rs.open Sql,Conn,1,1
  If Not Rs.eof Then
   PublicStr=SysTitle&Rs("InfoClassName")
  End If
  Rs.Close
 End If 
ElseIf TemplateFile="help" Then
PublicStr=SysTitle&"��������"
ElseIf TemplateFile="style" Then
PublicStr=SysTitle&"�����ʽ"
ElseIf TemplateFile="rule" Then
PublicStr=SysTitle&"�������"
ElseIf TemplateFile="service" Then
PublicStr=SysTitle&"��������"
ElseIf TemplateFile="contact" Then
PublicStr=SysTitle&"��ϵ����"
ElseIf TemplateFile="reg" Then
PublicStr=SysTitle&"�û�ע��"
ElseIf TemplateFile="login" Then
PublicStr=SysTitle&"�û���¼"
ElseIf TemplateFile="pwdrecover" Then
PublicStr=SysTitle&"�һ�����"
ElseIf TemplateFile="pwdmodify" Then
PublicStr=SysTitle&"�޸�����"
ElseIf TemplateFile="pwdanswermodify" Then
PublicStr=SysTitle&"�޸��ܱ�"
Else
PublicStr=SysTitle
End If
GetInfoDesc=PublicStr
End Function


'--��ȡ����İ���
Function GetHelpLast(ByVal ShowNum)
PublicStr="<div id='helplast'><ul id='helplast_a'>"
Sql="Select Top "&ShowNum&" * From CFWztg_SysInfo Where Assort=3 Or Assort=4 Order By ListID Desc,AddTime Desc,ID Desc"
Set Rs = Server.CreateObject("ADODB.Recordset")
Rs.open Sql,Conn,1,1
While Not Rs.Eof
If SiteHtml=0 Then
 WebUrl = "?f=infoshow&id="&Rs("ID")
Else'--������α��̬ʱ
 WebUrl = "infoshow_"&Rs("ID")&".html"
End If
PublicStr=PublicStr&"<li>"
PublicStr=PublicStr&"<a href='"&WebUrl&"' target='_blank'>"&Rs("Title")&"</a>"
PublicStr=PublicStr&"</li>"
Rs.MoveNext
Wend
Rs.Close
PublicStr=PublicStr&"</ul></div>"
GetHelpLast=PublicStr
End Function


'--��ȡ��վ���İ���
Function GetWZZHelpAll()
PublicStr="<div id='wzzhelpall'><ul id='wzzhelpall_a'>"
Sql="Select * From CFWztg_SysInfo Where Assort=3 Order By ListID Desc,AddTime Desc,ID Desc"
Set Rs = Server.CreateObject("ADODB.Recordset")
Rs.open Sql,Conn,1,1
While Not Rs.Eof
If SiteHtml=0 Then
 WebUrl = "?f=infoshow&id="&Rs("ID")
Else'--������α��̬ʱ
 WebUrl = "infoshow_"&Rs("ID")&".html"
End If
PublicStr=PublicStr&"<li>"
PublicStr=PublicStr&"<a href='"&WebUrl&"' target='_blank'>"&Rs("Title")&"</a>"
PublicStr=PublicStr&"</li>"
Rs.MoveNext
Wend
Rs.Close
PublicStr=PublicStr&"</ul></div>"
GetWZZHelpAll=PublicStr
End Function

'--��ȡ������İ���
Function GetGGZHelpAll()
PublicStr="<div id='ggzhelpall'><ul id='ggzhelpall_a'>"
Sql="Select * From CFWztg_SysInfo Where Assort=4 Order By ListID Desc,AddTime Desc,ID Desc"
Set Rs = Server.CreateObject("ADODB.Recordset")
Rs.open Sql,Conn,1,1
While Not Rs.Eof
If SiteHtml=0 Then
 WebUrl = "?f=infoshow&id="&Rs("ID")
Else'--������α��̬ʱ
 WebUrl = "infoshow_"&Rs("ID")&".html"
End If
PublicStr=PublicStr&"<li>"
PublicStr=PublicStr&"<a href='"&WebUrl&"' target='_blank'>"&Rs("Title")&"</a>"
PublicStr=PublicStr&"</li>"
Rs.MoveNext
Wend
Rs.Close
PublicStr=PublicStr&"</ul></div>"
GetGGZHelpAll=PublicStr
End Function


'--��ȡ���߿ͷ�
Function GetQQOnline()

PublicStr="<div id='qqonline'><ul id='qqonline_a'>"

'--˳���������
Sql="Select UserName,UserNick,QQ From CFWztg_User Where UserType=3 And UserState=1 Order By NewID()"
Set Rs=Conn.ExeCute(Sql)
While Not Rs.Eof

PublicStr = PublicStr & "<li><a href='http://wpa.qq.com/msgrd?v=3&amp;uin="&Rs("QQ")&"&amp;site=qq&amp;menu=yes' style='padding-left:1px;' target='_blank' ><img src='images/qqonline.gif' alt='��������"&Rs("UserNick")&"����Ϣ' border='0' align='absmiddle' title='��������"&Rs("UserNick")&"����Ϣ'></a></li>"

Rs.MoveNext
Wend
Rs.Close

PublicStr=PublicStr&"</ul></div>"

GetQQOnline=PublicStr
End Function




'--��ȡע��ҳ���ϵ���վ����
Function GetReg_WebSiteClass()
PublicStr=""
Sql="Select * From CFWztg_SiteClass Order By SiteClassName"
Set Rs = Server.CreateObject("ADODB.Recordset")
Rs.open Sql,Conn,1,1
While Not Rs.Eof

PublicStr=PublicStr&"<option value='"&Rs("ID")&"'>"&Rs("SiteClassName")&"</option>"

Rs.MoveNext
Wend

GetReg_WebSiteClass=PublicStr
End Function


'--��ȡע��ҳ���ϵ�����
Function GetReg_Other()
PublicStr="<script>"	&Chr(13)&Chr(10)
If RsSet("RegType")=1 Then

PublicStr=PublicStr&"$(function(){"		&Chr(13)&Chr(10)
'--�����ֹ�û�ע��ʱ
If(RsSet("UserValid")=0) Then
 PublicStr=PublicStr&"$('#t_usertype_1').hide();"	&Chr(13)&Chr(10)
End If

'--�����ֹ�����ע��ʱ
If(RsSet("AdUserValid")=0) Then
 PublicStr=PublicStr&"$('#t_usertype_2').hide();"	&Chr(13)&Chr(10)
End If

PublicStr=PublicStr&"});"		&Chr(13)&Chr(10)

Else
 PublicStr=PublicStr&"location.href='"&RsSet("RegUrl")&"';"	&Chr(13)&Chr(10)
End If
 PublicStr=PublicStr&"</script>"	&Chr(13)&Chr(10)
 GetReg_Other=PublicStr
End Function


'--���ע��ҳ���Ͽͷ�QQ����
Function GetReg_SeUserName()
PublicStr = ""

If Request.Cookies("CFWztgSeCookie")="" Then

'--˳���������
Sql="Select UserName,UserNick,QQ From CFWztg_User Where UserType=3 And UserState=1 Order By NewID()"
Set Rs=Conn.ExeCute(Sql)
While Not Rs.Eof
PublicStr = PublicStr & "<input name='upusername1' type='radio' value='"&Rs("UserName")&"'>"&Rs("UserNick")&"<a href='http://wpa.qq.com/msgrd?v=3&amp;uin="&Rs("QQ")&"&amp;site=qq&amp;menu=yes' style='padding-left:1px;' target='_blank' ><img src='images/qqonline.gif' alt='���������ҷ���Ϣ' border='0' align='absmiddle' title='���������ҷ���Ϣ'></a>"
Rs.MoveNext
Wend
Rs.Close
Else

Sql="Select UserName,UserNick,QQ From CFWztg_User Where UserType=3 And UserState=1 And id="&ChkStr(Request.Cookies("CFWztgSeCookie"),2)
Set Rs=Conn.ExeCute(Sql)
If Not Rs.Eof Then
 PublicStr = PublicStr & "<input name='upusername1' type='radio' value='"&Rs("UserName")&"' checked>"&Rs("UserNick")&"<a href='http://wpa.qq.com/msgrd?v=3&amp;uin="&Rs("QQ")&"&amp;site=qq&amp;menu=yes' style='padding-left:1px;' target='_blank' ><img src='images/qqonline.gif' alt='���������ҷ���Ϣ' border='0' align='absmiddle' title='���������ҷ���Ϣ'></a>"
 PublicStr = PublicStr & "��Ϊ��Ϊ����˿ͷ�רԱ" 
End If
Rs.Close

End If

GetReg_SeUserName=PublicStr
End Function


'--���ע��ҳ��������QQ����
Function GetReg_CoUserName()
PublicStr = ""

If Request.Cookies("CFWztgCoCookie")="" Then


'--˳���������
Sql="Select UserName,UserNick,QQ From CFWztg_User Where UserType=4 And UserState=1 Order By NewID()"
Set Rs=Conn.ExeCute(Sql)
While Not Rs.Eof
PublicStr = PublicStr & "<input name='upusername1' type='radio' value='"&Rs("UserName")&"'>"&Rs("UserNick")&"<a href='http://wpa.qq.com/msgrd?v=3&amp;uin="&Rs("QQ")&"&amp;site=qq&amp;menu=yes' style='padding-left:1px;' target='_blank' ><img src='images/qqonline.gif' alt='���������ҷ���Ϣ' border='0' align='absmiddle' title='���������ҷ���Ϣ'></a>"
Rs.MoveNext
Wend
Rs.Close
Else

Sql="Select UserName,UserNick,QQ From CFWztg_User Where UserType=4 And UserState=1 And id="&ChkStr(Request.Cookies("CFWztgCoCookie"),2)
Set Rs=Conn.ExeCute(Sql)
If Not Rs.Eof Then
 PublicStr = PublicStr & "<input name='upusername2' type='radio' value='"&Rs("UserName")&"' checked>"&Rs("UserNick")&"<a href='http://wpa.qq.com/msgrd?v=3&amp;uin="&Rs("QQ")&"&amp;site=qq&amp;menu=yes' style='padding-left:1px;' target='_blank' ><img src='images/qqonline.gif' alt='���������ҷ���Ϣ' border='0' align='absmiddle' title='���������ҷ���Ϣ'></a>"
 PublicStr = PublicStr & "��Ϊ��Ϊ���������רԱ" 
End If
Rs.Close

End If

GetReg_CoUserName=PublicStr
End Function


'--��ȡ�һ�ҳ���ϵ�����
Function GetPwdRecoverOther()
If RsSet("RegType")>1 Then
PublicStr=PublicStr&"<script>"&Chr(13)&Chr(10)
PublicStr=PublicStr&"document.getElementById('pwdrecover_1').style.display='none';"&Chr(13)&Chr(10)
PublicStr=PublicStr&"alert('�뵽��վ�Ͻ����һ��������');"&Chr(13)&Chr(10)
PublicStr=PublicStr&"location.href='"&RsSet("LoginUrl")&"';"&Chr(13)&Chr(10)
PublicStr=PublicStr&"</script>"&Chr(13)&Chr(10)
End If
GetPwdRecoverOther=PublicStr
End Function



'--ģ��ת��
Function TemplateConvert(ByVal T_Main,ByVal T_Top,ByVal T_Bottom)

 If InStr(T_Main,"{systitle}")>0 Then T_Main = Replace(T_Main,"{systitle}",SysTitle)
 
 If InStr(T_Main,"{top}")>0 Then T_Main = Replace(T_Main,"{top}",T_Top)
 If InStr(T_Main,"{bottom}")>0 Then T_Main = Replace(T_Main,"{bottom}",T_Bottom)

 If InStr(T_Main,"{userlogin}")>0 Then T_Main = Replace(T_Main,"{userlogin}",GetUserLogin())
 If InStr(T_Main,"{usertop}")>0 Then T_Main = Replace(T_Main,"{usertop}",GetUserTop(10))

 If InStr(T_Main,"{spendlast}")>0 Then T_Main = Replace(T_Main,"{spendlast}",GetSpendLast(10))

 If InStr(T_Main,"{qqonline}")>0 Then T_Main = Replace(T_Main,"{qqonline}",GetQQOnline())

 If InStr(T_Main,"{userlast}")>0 Then T_Main = Replace(T_Main,"{userlast}",GetUserLast(10))
 If InStr(T_Main,"{aduserlast}")>0 Then T_Main = Replace(T_Main,"{aduserlast}",GetAdUserLast(10))
 If InStr(T_Main,"{infolast}")>0 Then T_Main = Replace(T_Main,"{infolast}",GetInfoLast(10))
 If InStr(T_Main,"{infoclassall}")>0 Then T_Main = Replace(T_Main,"{infoclassall}",GetInfoClassAll())
 If InStr(T_Main,"{infoall}")>0 Then T_Main = Replace(T_Main,"{infoall}",GetInfoAll(10))
 If InStr(T_Main,"{infoshow}")>0 Then T_Main = Replace(T_Main,"{infoshow}",GetInfoShow())
 If InStr(T_Main,"{infotitle}")>0 Then T_Main = Replace(T_Main,"{infotitle}",GetInfoTitle())
 If InStr(T_Main,"{infokeyword}")>0 Then T_Main = Replace(T_Main,"{infokeyword}",GetInfoKeyword())
 If InStr(T_Main,"{infodesc}")>0 Then T_Main = Replace(T_Main,"{infodesc}",GetInfoDesc())

 If InStr(T_Main,"{helplast}")>0 Then T_Main = Replace(T_Main,"{helplast}",GetHelpLast(10))
 If InStr(T_Main,"{wzzhelpall}")>0 Then T_Main = Replace(T_Main,"{wzzhelpall}",GetWZZHelpAll())
 If InStr(T_Main,"{ggzhelpall}")>0 Then T_Main = Replace(T_Main,"{ggzhelpall}",GetGGZHelpAll())


 If InStr(T_Main,"{index_bottom}")>0 Then T_Main = Replace(T_Main,"{index_bottom}","<div id='index_bottom'>"&GetAllFlagSet("","AdminTemplet","index_bottom","SetValue")&"</div>")
 If InStr(T_Main,"{index_wyhwzz}")>0 Then T_Main = Replace(T_Main,"{index_wyhwzz}","<div id='index_wyhwzz'>"&GetAllFlagSet("","AdminTemplet","index_wyhwzz","SetValue")&"</div>")
 If InStr(T_Main,"{index_lxwm}")>0 Then T_Main = Replace(T_Main,"{index_lxwm}","<div id='index_lxwm'>"&GetAllFlagSet("","AdminTemplet","index_lxwm","SetValue")&"</div>")
 If InStr(T_Main,"{index_gybxt}")>0 Then T_Main = Replace(T_Main,"{index_gybxt}","<div id='index_gybxt'>"&GetAllFlagSet("","AdminTemplet","index_gybxt","SetValue")&"</div>")
 If InStr(T_Main,"{index_ggz}")>0 Then T_Main = Replace(T_Main,"{index_ggz}","<div id='index_ggz'>"&GetAllFlagSet("","AdminTemplet","index_ggz","SetValue")&"</div>")
 If InStr(T_Main,"{index_gglx}")>0 Then T_Main = Replace(T_Main,"{index_gglx}","<div id='index_gglx'>"&GetAllFlagSet("","AdminTemplet","index_gglx","SetValue")&"</div>")

 If InStr(T_Main,"{menu_wzz}")>0 Then T_Main = Replace(T_Main,"{menu_wzz}","<div id='menu_wzz'>"&GetAllFlagSet("","AdminTemplet","menu_wzz","SetValue")&"</div>")
 If InStr(T_Main,"{menu_lxwm}")>0 Then T_Main = Replace(T_Main,"{menu_lxwm}","<div id='menu_lxwm'>"&GetAllFlagSet("","AdminTemplet","menu_lxwm","SetValue")&"</div>")
 If InStr(T_Main,"{menu_ggz}")>0 Then T_Main = Replace(T_Main,"{menu_ggz}","<div id='menu_ggz'>"&GetAllFlagSet("","AdminTemplet","menu_ggz","SetValue")&"</div>")
 If InStr(T_Main,"{menu_fwtk}")>0 Then T_Main = Replace(T_Main,"{menu_fwtk}","<div id='menu_fwtk'>"&GetAllFlagSet("","AdminTemplet","menu_fwtk","SetValue")&"</div>")
 If InStr(T_Main,"{menu_cjwt}")>0 Then T_Main = Replace(T_Main,"{menu_cjwt}","<div id='menu_cjwt'>"&GetAllFlagSet("","AdminTemplet","menu_cjwt","SetValue")&"</div>")
 If InStr(T_Main,"{menu_ggys}")>0 Then T_Main = Replace(T_Main,"{menu_ggys}","<div id='menu_ggys'>"&GetAllFlagSet("","AdminTemplet","menu_ggys","SetValue")&"</div>")
 If InStr(T_Main,"{menu_jsgz}")>0 Then T_Main = Replace(T_Main,"{menu_jsgz}","<div id='menu_jsgz'>"&GetAllFlagSet("","AdminTemplet","menu_jsgz","SetValue")&"</div>")
 If InStr(T_Main,"{menu_dls}")>0 Then T_Main = Replace(T_Main,"{menu_dls}","<div id='menu_dls'>"&GetAllFlagSet("","AdminTemplet","menu_dls","SetValue")&"</div>")

 If InStr(T_Main,"{reg_websiteclass}")>0 Then T_Main = Replace(T_Main,"{reg_websiteclass}",GetReg_WebSiteClass())
 If InStr(T_Main,"{reg_other}")>0 Then T_Main = Replace(T_Main,"{reg_other}",GetReg_Other())
 If InStr(T_Main,"{reg_seusername}")>0 Then T_Main = Replace(T_Main,"{reg_seusername}",GetReg_SeUserName())
 If InStr(T_Main,"{reg_cousername}")>0 Then T_Main = Replace(T_Main,"{reg_cousername}",GetReg_CoUserName())

 If InStr(T_Main,"{uservalid_username}")>0 Then T_Main = Replace(T_Main,"{uservalid_username}",chkstr(request("username"),1))
 If InStr(T_Main,"{uservalid_email}")>0 Then T_Main = Replace(T_Main,"{uservalid_email}",chkstr(request("email"),1))
 If InStr(T_Main,"{uservalid_maketime}")>0 Then T_Main = Replace(T_Main,"{uservalid_maketime}",chkstr(request("maketime"),2))
 If InStr(T_Main,"{uservalid_checkcode}")>0 Then T_Main = Replace(T_Main,"{uservalid_checkcode}",chkstr(request("checkcode"),1))

 If InStr(T_Main,"{loginurl}")>0 Then T_Main = Replace(T_Main,"{loginurl}",RsSet("LoginUrl"))
 If InStr(T_Main,"{pwdrecoverother}")>0 Then T_Main = Replace(T_Main,"{pwdrecoverother}",GetPwdRecoverOther())

 If InStr(T_Main,"{pwdmodifysaveurl}")>0 Then T_Main = Replace(T_Main,"{pwdmodifysaveurl}","cf.aspx?Action=pwdmodifysave&UserName=" & chkstr(Request("UserName"),1) & "&MakeTime=" & chkstr(Request("MakeTime"),2) & "&CheckCode=" & chkstr(Request("CheckCode"),1) )
 If InStr(T_Main,"{pwdanswermodifysaveurl}")>0 Then T_Main = Replace(T_Main,"{pwdanswermodifysaveurl}","cf.aspx?Action=pwdanswermodifysave&UserName=" & chkstr(Request("UserName"),1) & "&MakeTime=" & chkstr(Request("MakeTime"),2) & "&CheckCode=" & chkstr(Request("CheckCode"),1) )

 If InStr(T_Main,"{ranstr}")>0 Then T_Main = Replace(T_Main,"{ranstr}",DateDiff("s","1970-1-1",Now))


'--�����ͷ�QQ��ǩ
If InStr(T_Main,"{qq_")>0 Then
Sql="Select UserName,UserNick,QQ From CFWztg_User Where UserType=3 Order By NewID()"
Set Rs=Conn.ExeCute(Sql)
I=1
While Not Rs.Eof
QQCode = QQCode & "qq_"&I&"_code="&Rs("QQ")&"|--|qq_"&I&"_nickname="&Rs("UserNick")&"|--|"
I=I+1
Rs.MoveNext
Wend
Rs.Close

I=1
For I=1 To 10 
If InStr(T_Main,"{qq_"&I&"_code}")>0 Then T_Main = Replace(T_Main,"{qq_"&I&"_code}",GetStrB(QQCode,"qq_"&I&"_code",2))
If InStr(T_Main,"{qq_"&I&"_nickname}")>0 Then T_Main = Replace(T_Main,"{qq_"&I&"_nickname}",GetStrB(QQCode,"qq_"&I&"_nickname",2))
Next
End If

'--��������QQ��ǩ
If InStr(T_Main,"{qqb_")>0 Then
Sql="Select UserName,UserNick,QQ From CFWztg_User Where UserType=4 Order By NewID()"
Set Rs=Conn.ExeCute(Sql)
I=1
While Not Rs.Eof
QQCode = QQCode & "qqb_"&I&"_code="&Rs("QQ")&"|--|qqb_"&I&"_nickname="&Rs("UserNick")&"|--|"
I=I+1
Rs.MoveNext
Wend
Rs.Close

I=1
For I=1 To 10 
If InStr(T_Main,"{qqb_"&I&"_code}")>0 Then T_Main = Replace(T_Main,"{qqb_"&I&"_code}",GetStrB(QQCode,"qqb_"&I&"_code",2))
If InStr(T_Main,"{qqb_"&I&"_nickname}")>0 Then T_Main = Replace(T_Main,"{qqb_"&I&"_nickname}",GetStrB(QQCode,"qqb_"&I&"_nickname",2))
Next
End If

'--�������ĵ�����ǩ
If InStr(T_Main,"{infolast_")>0 Then
InfoLast=RsSet("InfoLast")
I=1
For I=1 To 10
If InStr(T_Main,"{infolast_"&I&"_title}")>0 Then T_Main = Replace(T_Main,"{infolast_"&I&"_title}",GetStrB(InfoLast,"infolast_"&I&"_title",2))

J=10
For J=10 To 30
 If InStr(T_Main,"{infolast_"&I&"_title_"&J&"}")>0 Then T_Main = Replace(T_Main,"{infolast_"&I&"_title_"&J&"}",StrLeft(GetStrB(InfoLast,"infolast_"&I&"_title",2),J))
Next

If InStr(T_Main,"{infolast_"&I&"_link}")>0 Then
 If SiteHtml=0 Then
   T_Main = Replace(T_Main,"{infolast_"&I&"_link}","?f=infoshow&id="&GetStrB(InfoLast,"infolast_"&I&"_id",2))
 Else
   T_Main = Replace(T_Main,"{infolast_"&I&"_link}","infoshow_"&GetStrB(InfoLast,"infolast_"&I&"_id",2)&".html")
 End If
End If

If InStr(T_Main,"{infolast_"&I&"_date}")>0 Then T_Main = Replace(T_Main,"{infolast_"&I&"_date}",GetStrB(InfoLast,"infolast_"&I&"_date",2))
If GetStrB(InfoLast,"infolast_"&I&"_date",2)<>"" Then
 If InStr(T_Main,"{infolast_"&I&"_datesimple}")>0 Then T_Main = Replace(T_Main,"{infolast_"&I&"_datesimple}",Right("0"&Month(GetStrB(InfoLast,"infolast_"&I&"_date",2)),2)&"-"&Right("0"&Day(GetStrB(InfoLast,"infolast_"&I&"_date",2)),2))
Else
 T_Main = Replace(T_Main,"{infolast_"&I&"_datesimple}","")
End If
Next
End If

'--��������ĵ�����ǩ
If InStr(T_Main,"{helplast_")>0 Then
helplast=RsSet("InfoLast")
I=1
For I=1 To 10
If InStr(T_Main,"{helplast_"&I&"_title}")>0 Then T_Main = Replace(T_Main,"{helplast_"&I&"_title}",GetStrB(helplast,"helplast_"&I&"_title",2))

J=10
For J=10 To 30
 If InStr(T_Main,"{helplast_"&I&"_title_"&J&"}")>0 Then T_Main = Replace(T_Main,"{helplast_"&I&"_title_"&J&"}",StrLeft(GetStrB(helplast,"helplast_"&I&"_title",2),J))
Next

If InStr(T_Main,"{helplast_"&I&"_link}")>0 Then
 If SiteHtml=0 Then
   T_Main = Replace(T_Main,"{helplast_"&I&"_link}","?f=infoshow&id="&GetStrB(helplast,"helplast_"&I&"_id",2))
 Else
   T_Main = Replace(T_Main,"{helplast_"&I&"_link}","infoshow_"&GetStrB(helplast,"helplast_"&I&"_id",2)&".html")
 End If
End If

If InStr(T_Main,"{helplast_"&I&"_date}")>0 Then T_Main = Replace(T_Main,"{helplast_"&I&"_date}",GetStrB(helplast,"helplast_"&I&"_date",2))
If GetStrB(helplast,"helplast_"&I&"_date",2)<>"" Then
 If InStr(T_Main,"{helplast_"&I&"_datesimple}")>0 Then T_Main = Replace(T_Main,"{helplast_"&I&"_datesimple}",Right("0"&Month(GetStrB(helplast,"helplast_"&I&"_date",2)),2)&"-"&Right("0"&Day(GetStrB(helplast,"helplast_"&I&"_date",2)),2))
Else
 T_Main = Replace(T_Main,"{helplast_"&I&"_datesimple}","")
End If
Next
End If

'--�û�����������
If InStr(T_Main,"{usertop_")>0 Then
UserTop=RsSet("UserTop")
I=1
For I=1 To 10 
If InStr(T_Main,"{usertop_"&I&"_username}")>0 Then T_Main = Replace(T_Main,"{usertop_"&I&"_username}",GetStrB(UserTop,"usertop_"&I&"_code",2))
If InStr(T_Main,"{usertop_"&I&"_cent}")>0 Then T_Main = Replace(T_Main,"{usertop_"&I&"_cent}",GetStrB(UserTop,"usertop_"&I&"_nickname",2))
If InStr(T_Main,"{usertop_"&I&"_date}")>0 Then T_Main = Replace(T_Main,"{usertop_"&I&"_date}",GetStrB(UserTop,"usertop_"&I&"_date",2))
If GetStrB(UserTop,"usertop_"&I&"_date",2)<>"" Then
 If InStr(T_Main,"{usertop_"&I&"_datesimple}")>0 Then T_Main = Replace(T_Main,"{usertop_"&I&"_datesimple}",Right("0"&Month(GetStrB(UserTop,"usertop_"&I&"_date",2)),2)&"-"&Right("0"&Day(GetStrB(UserTop,"usertop_"&I&"_date",2)),2))
Else
 T_Main = Replace(T_Main,"{usertop_"&I&"_datesimple}","")
End If
Next
End If

'--�û���������¼
If InStr(T_Main,"{spendlast_")>0 Then
SpendLast=RsSet("SpendLast")
I=1
For I=1 To 10 
If InStr(T_Main,"{spendlast_"&I&"_username}")>0 Then T_Main = Replace(T_Main,"{spendlast_"&I&"_username}",GetStrB(SpendLast,"spendlast_"&I&"_code",2))
If InStr(T_Main,"{spendlast_"&I&"_cent}")>0 Then T_Main = Replace(T_Main,"{spendlast_"&I&"_cent}",GetStrB(SpendLast,"spendlast_"&I&"_nickname",2))
If InStr(T_Main,"{spendlast_"&I&"_date}")>0 Then T_Main = Replace(T_Main,"{spendlast_"&I&"_date}",GetStrB(SpendLast,"spendlast_"&I&"_date",2))
If GetStrB(SpendLast,"spendlast_"&I&"_date",2)<>"" Then
 If InStr(T_Main,"{spendlast_"&I&"_datesimple}")>0 Then T_Main = Replace(T_Main,"{spendlast_"&I&"_datesimple}",Right("0"&Month(GetStrB(SpendLast,"spendlast_"&I&"_date",2)),2)&"-"&Right("0"&Day(GetStrB(SpendLast,"spendlast_"&I&"_date",2)),2))
Else
 T_Main = Replace(T_Main,"{spendlast_"&I&"_datesimple}","")
End If
Next
End If

'--���ע����վ��
If InStr(T_Main,"{userlast_")>0 Then
UserLast=RsSet("UserLast")
I=1
For I=1 To 10 
If InStr(T_Main,"{userlast_"&I&"_username}")>0 Then T_Main = Replace(T_Main,"{userlast_"&I&"_username}",GetStrB(UserLast,"userlast_"&I&"_code",2))
If InStr(T_Main,"{userlast_"&I&"_date}")>0 Then T_Main = Replace(T_Main,"{userlast_"&I&"_date}",GetStrB(UserLast,"userlast_"&I&"_date",2))
If GetStrB(UserLast,"userlast_"&I&"_date",2)<>"" Then
 If InStr(T_Main,"{userlast_"&I&"_datesimple}")>0 Then T_Main = Replace(T_Main,"{userlast_"&I&"_datesimple}",Right("0"&Month(GetStrB(UserLast,"userlast_"&I&"_date",2)),2)&"-"&Right("0"&Day(GetStrB(UserLast,"userlast_"&I&"_date",2)),2))
Else
 T_Main = Replace(T_Main,"{userlast_"&I&"_datesimple}","")
End If
Next
End If

'--���ע������
If InStr(T_Main,"{aduserlast_")>0 Then
AdUserLast=RsSet("AdUserLast")
I=1
For I=1 To 10 
If InStr(T_Main,"{aduserlast_"&I&"_username}")>0 Then T_Main = Replace(T_Main,"{aduserlast_"&I&"_username}",GetStrB(AdUserLast,"aduserlast_"&I&"_code",2))
If InStr(T_Main,"{aduserlast_"&I&"_date}")>0 Then T_Main = Replace(T_Main,"{aduserlast_"&I&"_date}",GetStrB(AdUserLast,"aduserlast_"&I&"_date",2))
If GetStrB(AdUserLast,"aduserlast_"&I&"_date",2)<>"" Then
 If InStr(T_Main,"{aduserlast_"&I&"_datesimple}")>0 Then T_Main = Replace(T_Main,"{aduserlast_"&I&"_datesimple}",Right("0"&Month(GetStrB(AdUserLast,"aduserlast_"&I&"_date",2)),2)&"-"&Right("0"&Day(GetStrB(AdUserLast,"aduserlast_"&I&"_date",2)),2))
Else
 T_Main = Replace(T_Main,"{aduserlast_"&I&"_datesimple}","")
End If
Next
End If


If SiteHtml=0 Then
 If InStr(T_Main,"{url_index}")>0 Then T_Main = Replace(T_Main,"{url_index}",HttpPath(5))
 If InStr(T_Main,"{url_webowner}")>0 Then T_Main = Replace(T_Main,"{url_webowner}","?f=webowner")
 If InStr(T_Main,"{url_advertiser}")>0 Then T_Main = Replace(T_Main,"{url_advertiser}","?f=advertiser")
 If InStr(T_Main,"{url_agent}")>0 Then T_Main = Replace(T_Main,"{url_agent}","?f=agent")
 If InStr(T_Main,"{url_infoall}")>0 Then T_Main = Replace(T_Main,"{url_infoall}","?f=infoall")
 If InStr(T_Main,"{url_help}")>0 Then T_Main = Replace(T_Main,"{url_help}","?f=help")
 If InStr(T_Main,"{url_style}")>0 Then T_Main = Replace(T_Main,"{url_style}","?f=style")
 If InStr(T_Main,"{url_rule}")>0 Then T_Main = Replace(T_Main,"{url_rule}","?f=rule")
 If InStr(T_Main,"{url_service}")>0 Then T_Main = Replace(T_Main,"{url_service}","?f=service")
 If InStr(T_Main,"{url_contact}")>0 Then T_Main = Replace(T_Main,"{url_contact}","?f=contact")

 If InStr(T_Main,"{url_reg}")>0 Then T_Main = Replace(T_Main,"{url_reg}","?f=reg")
 If InStr(T_Main,"{url_login}")>0 Then T_Main = Replace(T_Main,"{url_login}","?f=login")
 If InStr(T_Main,"{url_pwdrecover}")>0 Then T_Main = Replace(T_Main,"{url_pwdrecover}","?f=pwdrecover")
Else'--������α��̬ʱ
 If InStr(T_Main,"{url_index}")>0 Then T_Main = Replace(T_Main,"{url_index}",HttpPath(5))
 If InStr(T_Main,"{url_webowner}")>0 Then T_Main = Replace(T_Main,"{url_webowner}","webowner.html")
 If InStr(T_Main,"{url_advertiser}")>0 Then T_Main = Replace(T_Main,"{url_advertiser}","advertiser.html")
 If InStr(T_Main,"{url_agent}")>0 Then T_Main = Replace(T_Main,"{url_agent}","agent.html")
 If InStr(T_Main,"{url_infoall}")>0 Then T_Main = Replace(T_Main,"{url_infoall}","infoall.html")
 If InStr(T_Main,"{url_help}")>0 Then T_Main = Replace(T_Main,"{url_help}","help.html")
 If InStr(T_Main,"{url_style}")>0 Then T_Main = Replace(T_Main,"{url_style}","style.html")
 If InStr(T_Main,"{url_rule}")>0 Then T_Main = Replace(T_Main,"{url_rule}","rule.html")
 If InStr(T_Main,"{url_service}")>0 Then T_Main = Replace(T_Main,"{url_service}","service.html")
 If InStr(T_Main,"{url_contact}")>0 Then T_Main = Replace(T_Main,"{url_contact}","contact.html")

 If InStr(T_Main,"{url_reg}")>0 Then T_Main = Replace(T_Main,"{url_reg}","reg.html")
 If InStr(T_Main,"{url_login}")>0 Then T_Main = Replace(T_Main,"{url_login}","login.html")
 If InStr(T_Main,"{url_pwdrecover}")>0 Then T_Main = Replace(T_Main,"{url_pwdrecover}","pwdrecover.html")
End If

'--���˵��ļ���ʱ��CSS���Ƽ���
 If TemplateFile="index" Then T_Main = Replace(T_Main,"{class_index}"," class='active'") else T_Main = Replace(T_Main,"{class_index}","")
 If TemplateFile="webowner" Then T_Main = Replace(T_Main,"{class_webowner}"," class='active'") else T_Main = Replace(T_Main,"{class_webowner}","")
 If TemplateFile="advertiser" Then T_Main = Replace(T_Main,"{class_advertiser}"," class='active'") else T_Main = Replace(T_Main,"{class_advertiser}","")
 If TemplateFile="agent" Then T_Main = Replace(T_Main,"{class_agent}"," class='active'") else T_Main = Replace(T_Main,"{class_agent}","")
 If TemplateFile="infoall" Then T_Main = Replace(T_Main,"{class_infoall}"," class='active'") else T_Main = Replace(T_Main,"{class_infoall}","")
 If TemplateFile="help" Then T_Main = Replace(T_Main,"{class_help}"," class='active'") else T_Main = Replace(T_Main,"{class_help}","")
 If TemplateFile="style" Then T_Main = Replace(T_Main,"{class_style}"," class='active'") else T_Main = Replace(T_Main,"{class_style}","")
 If TemplateFile="rule" Then T_Main = Replace(T_Main,"{class_rule}"," class='active'") else T_Main = Replace(T_Main,"{class_rule}","")
 If TemplateFile="service" Then T_Main = Replace(T_Main,"{class_service}"," class='active'") else T_Main = Replace(T_Main,"{class_service}","")
 If TemplateFile="contact" Then T_Main = Replace(T_Main,"{class_contact}"," class='active'") else T_Main = Replace(T_Main,"{class_contact}","")
 
TemplateConvert = T_Main
End Function
%>