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
Set Rs = Server.CreateObject("ADODB.Recordset")
Sql="Select * From CFWztg_Admin"
Rs.open Sql,Conn,1,1
%>
<SCRIPT>
$(function(){

function PasswordType_1(){$("#t_SaveRegPasswordSalt").hide();}
function PasswordType_2(){PasswordType_1();}
function PasswordType_3(){PasswordType_1();}
function PasswordType_4(){$("#t_SaveRegPasswordSalt").show();}

function GetPasswordType(){

if($("#PasswordType_1").prop("checked")||$("#PasswordType_2").prop("checked")||$("#PasswordType_3").prop("checked")){PasswordType_1();}
if($("#PasswordType_4").prop("checked")){PasswordType_4();}
}

$("#PasswordType_1,#PasswordType_2,#PasswordType_3").click(function(){
PasswordType_1();
});

$("#PasswordType_4").click(function(){
PasswordType_4();
});

PasswordType_<%=Rs("PasswordType")%>();

function hiddall(){
$("#t_1,#t_AccessPath,#t_SqlIP,#t_SqlLinkName,#t_SqlLinkPassword,#t_SqlDbName,#t_SelfRecUrl,#t_2,#t_SaveProSet,#t_SaveRegTable,#t_SaveRegUserID,#t_SaveRegUserName,#t_SaveRegPassword,#t_PasswordType,#t_SaveRegPasswordSalt,#t_SaveRegEmail,#t_3,#t_RegUrl,#t_LoginUrl").hide();
}

function regtype_1(){
hiddall();
}

function regtype_2(){
hiddall();
$("#t_AccessPath,#t_2,#t_SaveProSet,#t_SaveRegTable,#t_SaveRegUserID,#t_SaveRegUserName,#t_SaveRegPassword,#t_PasswordType,#t_SaveRegEmail,#t_3,#t_RegUrl,#t_LoginUrl").show();
GetPasswordType();
}

function regtype_3(){
hiddall();
$("#t_SqlIP,#t_SqlLinkName,#t_SqlLinkPassword,#t_SqlDbName,#t_2,#t_SaveProSet,#t_SaveRegTable,#t_SaveRegUserID,#t_SaveRegUserName,#t_SaveRegPassword,#t_PasswordType,#t_SaveRegEmail,#t_3,#t_RegUrl,#t_LoginUrl").show();
$("#tx_SqlIP,#tx_SqlLinkName,#tx_SqlLinkPassword,#tx_SqlDbName").html("sqlserver");
GetPasswordType();
}

function regtype_4(){
hiddall();
$("#t_SqlIP,#t_SqlLinkName,#t_SqlLinkPassword,#t_SqlDbName,#t_2,#t_SaveProSet,#t_SaveRegTable,#t_SaveRegUserID,#t_SaveRegUserName,#t_SaveRegPassword,#t_PasswordType,#t_SaveRegEmail,#t_3,#t_RegUrl,#t_LoginUrl").show();
$("#tx_SqlIP,#tx_SqlLinkName,#tx_SqlLinkPassword,#tx_SqlDbName").html("mysql");
GetPasswordType();
}

function regtype_5(){
hiddall();
$("#t_SelfRecUrl,#t_3,#t_RegUrl,#t_LoginUrl").show();
}

$("#regtype_1").click(function(){
regtype_1();
});

$("#regtype_2").click(function(){
regtype_2();
});

$("#regtype_3").click(function(){
regtype_3();
});

$("#regtype_4").click(function(){
regtype_4();
});

$("#regtype_5").click(function(){
regtype_5();
});

regtype_<%=Rs("regtype")%>();

$("#SaveProSet").change(function(){

if($("#SaveProSet option:selected").val()=="ecshop"){
$("#SaveRegTable").prop("value",'ecs_users');
$("#SaveRegUserID").prop("value",'user_id');
$("#SaveRegUserName").prop("value",'user_name');
$("#SaveRegPassword").prop("value",'password');
$("#PasswordType_3").prop("checked",true);
PasswordType_3();
$("#SaveRegEmail").prop("value",'email');
}

if($("#SaveProSet option:selected").val()=="iwebshop"){
$("#SaveRegTable").prop("value",'iwebshop_user');
$("#SaveRegUserID").prop("value",'id');
$("#SaveRegUserName").prop("value",'username');
$("#SaveRegPassword").prop("value",'password');
$("#PasswordType_3").prop("checked",true);
PasswordType_3();
$("#SaveRegEmail").prop("value",'email');
}

if($("#SaveProSet option:selected").val()=="discuz"){
$("#SaveRegTable").prop("value",'pre_ucenter_members');
$("#SaveRegUserID").prop("value",'uid');
$("#SaveRegUserName").prop("value",'username');
$("#SaveRegPassword").prop("value",'password');
$("#PasswordType_4").prop("checked",true);
PasswordType_4();
$("#SaveRegPasswordSalt").prop("value",'salt');
$("#SaveRegEmail").prop("value",'email');
}

if($("#SaveProSet option:selected").val()=="dedecms"){
$("#SaveRegTable").prop("value",'dede_member');
$("#SaveRegUserID").prop("value",'mid');
$("#SaveRegUserName").prop("value",'userid');
$("#SaveRegPassword").prop("value",'pwd');
$("#PasswordType_3").prop("checked",true);
PasswordType_3();
$("#SaveRegEmail").prop("value",'email');
}

if($("#SaveProSet option:selected").val()=="phpcms"){
$("#SaveRegTable").prop("value",'v9_member');
$("#SaveRegUserID").prop("value",'userid');
$("#SaveRegUserName").prop("value",'username');
$("#SaveRegPassword").prop("value",'password');
$("#PasswordType_4").prop("checked",true);
PasswordType_4();
$("#SaveRegPasswordSalt").prop("value",'encrypt');
$("#SaveRegEmail").prop("value",'email');
}

});


});
</SCRIPT>

<table class="tb_2">
<tr>
<td>
<div class="explain">
�����ʹ�ù������ϵͳ�Դ��Ļ�Աע�Ṧ����ѡ��ӿ�����-ϵͳ�Դ�,�����������վ�����ݿ�����ѡ����Ӧ�Ľӿ�����</div>
</td>
</tr>
</table>


<table class="tb_1">
<form name="form2" method="post" action="../../AdminUser.aspx?Action=sysrecsetsave">
<tr class="tr_1"> 
<td colspan="2">��վ�ӿ�����</td>
</tr>
<tr> 
<td width="200" class="td_r">�ӿ����ͣ�</td>
<td>
<input type="radio" name="regtype" id="regtype_1" value="1"<%If Rs("RegType")=1 Then Response.Write " checked"%>>��ϵͳ�Դ� 
<input type="radio" name="regtype" id="regtype_2" value="2"<%If Rs("RegType")=2 Then Response.Write " checked"%>>access���ݿ� 
<input type="radio" name="regtype" id="regtype_3" value="3"<%If Rs("RegType")=3 Then Response.Write " checked"%>>sqlserver���ݿ�
<input type="radio" name="regtype" id="regtype_4" value="4"<%If Rs("RegType")=4 Then Response.Write " checked"%>>mysql���ݿ�
<input type="radio" name="regtype" id="regtype_5" value="5"<%If Rs("RegType")=5 Then Response.Write " checked"%>>�Զ���ӿ��ļ�
</td>
</tr>

<tr class="tr_1" id="t_1"> 
<td colspan="2">��վ���ݿ�������Ϣ</td>
</tr>

<tr id="t_AccessPath"> 
<td class="td_r">access���ݿ��ļ�·����</td>
<td><input name="AccessPath" type="text" id="AccessPath" value="<%=Rs("AccessPath")%>" style="width:360px;"><font color='#FF0000'>*</font>
<br />�����ݿ��ļ���data.mdb������վ��Ŀ¼aa���bbĿ¼��,·��Ӧ������Ϊ/aa/bb/data.mdb</td>
</tr>

<tr id="t_SqlIP"> 
<td class="td_r"><span id="tx_SqlIP"></span>���ݿ�IP�� </td>
<td><input name="SqlIP" type="text" id="SqlIP" value="<%=rs("SqlIP")%>"><font color='#FF0000'>*</font></td>
</tr>

<tr id="t_SqlLinkName"> 
<td class="td_r"><span id="tx_SqlLinkName"></span>���ݿ������û�����</td>
<td><input name="SqlLinkName" type="text" id="SqlLinkName" value="<%=rs("SqlLinkName")%>"><font color='#FF0000'>*</font></td>
</tr>
<tr id="t_SqlLinkPassword"> 
<td class="td_r"><span id="tx_SqlLinkPassword"></span>���ݿ��������룺</td>
<td><input name="SqlLinkPassword" type="password" id="SqlLinkPassword" value="<%=rs("SqlLinkPassword")%>"><font color='#FF0000'>*</font>
</td>
</tr>

<tr id="t_SqlDbName"> 
<td class="td_r"><span id="tx_SqlDbName"></span>���ݿ����ƣ�</td>
<td><input name="SqlDbName" type="text" id="SqlDbName" value="<%=rs("SqlDbName")%>"><font color='#FF0000'>*</font></td>
</tr>

<tr id="t_SelfRecUrl"> 
<td class="td_r">�Զ���ӿ��ļ���ַ��</td>
<td><input name="SelfRecUrl" type="text" id="SelfRecUrl" value="<%=Rs("SelfRecUrl")%>" style="width:360px;"><font color='#FF0000'>*</font></td>
</tr>

<tr class="tr_1" id="t_2"> 
<td colspan="2">��վ����Ϣ</td>
</tr>
<tr id="t_SaveProSet"> 
<td class="td_r">���������վ����Ϣ��</td>
<td>

<select name="SaveProSet" id="SaveProSet">
<option value="" selected>ʹ�������Զ�������</option>
<option value="ecshop">ʹ��������-ecshop</option>
<option value="iwebshop">ʹ��������-iwebshop</option>
<option value="discuz">ʹ��������-discuz</option>
<option value="dedecms">ʹ��������-dedecms</option>
<option value="phpcms">ʹ��������-phpcms</option>
</select>
����ϵͳ�û������������û������ֶ������ʹ��Ψһ��Email�ֶΣ��û�ʹ��EMail��¼
</td>
</tr>

    <tr id="t_SaveRegTable"> 
      <td class="td_r">���ע���û��ı�����</td>
      <td><input name="SaveRegTable" type="text" id="SaveRegTable" value="<%=Rs("SaveRegTable")%>"><font color='#FF0000'>*</font></td>
    </tr>
    <tr id="t_SaveRegUserID"> 
      <td class="td_r">���ע���û�����ID���ֶ�����</td>
      <td><input name="SaveRegUserID" type="text" id="SaveRegUserID" value="<%=Rs("SaveRegUserID")%>"><font color='#FF0000'>*</font></td>
    </tr>
    <tr id="t_SaveRegUserName"> 
      <td class="td_r">���ע���û����Ƶ��ֶ�����</td>
      <td><input name="SaveRegUserName" type="text" id="SaveRegUserName" value="<%=Rs("SaveRegUserName")%>"><font color='#FF0000'>*</font>(������ʹ�����������������ֶε�¼���˳���)</td>
    </tr>
    <tr id="t_SaveRegPassword"> 
      <td class="td_r">���ע���û�������ֶ�����</td>
      <td><input name="SaveRegPassword" type="text" id="SaveRegPassword" value="<%=Rs("SaveRegPassword")%>"><font color='#FF0000'>*</font></td>
    </tr>
    <tr id="t_PasswordType">
      <td class="td_r">���ע���û�������ܷ�ʽ��</td>
      <td><input type="radio" name="PasswordType" id="PasswordType_1" value="1"<%If Rs("PassWordType")=1 Then Response.Write " checked"%>>û�м��� 
        <input type="radio" name="PasswordType" id="PasswordType_2" value="2"<%If Rs("PassWordType")=2 Then Response.Write " checked"%>>������16λMd5���� 
        <input type="radio" name="PasswordType" id="PasswordType_3" value="3"<%If Rs("PassWordType")=3 Then Response.Write " checked"%>>������32λMd5����
        <input type="radio" name="PasswordType" id="PasswordType_4" value="4"<%If Rs("PassWordType")=4 Then Response.Write " checked"%>>������������(��uc)</td>
    </tr>
    <tr id="t_SaveRegPasswordSalt"> 
      <td class="td_r">���ע���û��������ӵ��ֶ�����</td>
      <td><input name="SaveRegPasswordSalt" type="text" id="SaveRegPasswordSalt" value="<%=Rs("SaveRegPasswordSalt")%>"><font color='#FF0000'>*</font></td>
    </tr>
    <tr id="t_SaveRegEmail"> 
      <td class="td_r">���ע���û�EMail���ֶ�����</td>
      <td><input name="SaveRegEmail" type="text" id="SaveRegEmail" value="<%=Rs("SaveRegEmail")%>"><font color='#FF0000'>*</font></td>
    </tr>

    <tr class="tr_1" id="t_3"> 
      <td colspan="2">��վ��ַ</td>
    </tr>
    <tr id="t_RegUrl"> 
      <td class="td_r">�����վע���û�ҳ����ַ��</td>
      <td><input name="RegUrl" type="text" id="RegUrl" value="<%=Rs("RegUrl")%>" style="width:360px;"><font color='#FF0000'>*</font></td>
    </tr>
    <tr id="t_LoginUrl"> 
      <td class="td_r">�����վ�û���½ҳ����ַ��</td>
      <td><input name="LoginUrl" type="text" id="LoginUrl" value="<%=rs("LoginUrl")%>" style="width:360px;"><font color='#FF0000'>*</font></td>
    </tr>

<tr>
<td></td>
<td colspan="2">
<input type="submit" name="submit" value="�޸�" class="btn btn-primary">

</td>
</tr>
</form>
<%
Rs.Close
%>

<tr> 
<td colspan="2" class="td_1">�ӿ�ѡ��˵����</td>
</tr>
<tr> 
<td colspan="2" class="td_1">
��ϵͳ�Դ�:ԭ����վû�л�Աע��ϵͳ���߲����ԭ�ȵ�ע��ϵͳ������һ��ʹ�õ���վ��ѡ�����<br>
Access���ݿ�: �����վʹ��Access���ݿⲢ�Դ���Աע��ϵͳ����վѡ�����<br>
SQLSERVER���ݿ�:�����վʹ��Sqlserver���ݿⲢ�Դ���Աע��ϵͳ����վѡ�����<br>
Mysql���ݿ�:�����վʹ��Mysql���ݿⲢ�Դ���Աע��ϵͳ����վѡ�����<br>
�Զ���ӿ��ļ�:�����վ�Լ��������ת�����˽ӿ�</td>
</tr>

<%If RsSet("RegType")<>1 Then%>
<tr>
<td colspan="2" class="td_1">���ݿ�ӿ������Ƿ���ȷ�Ĳ��Խ����<a name="sysrecsetresultview"></a></td>
</tr>
<tr> 
<td colspan="2" class="td_1">
<%
If RsSet("RegType")=2 Or RsSet("RegType")=3 Then

If RsSet("RegType")=2 Then
 Connstr_Rec="DBQ="+server.mappath(RsSet("AccessPath"))+";DefaultDir=;DRIVER={Microsoft Access Driver (*.mdb)};"
 Set conn_Rec= Server.CreateObject ("ADODB.Connection")
 Conn_Rec.Open Connstr_Rec 
ElseIf RsSet("RegType")=3 Then
 Connstr_rec="DRIVER={SQL Server};SERVER="&RsSet("SqlIP")&";UID="&RsSet("SqlLinkName")&";PWD="&RsSet("SqlLinkPassword")&";DATABASE="&RsSet("SqlDbName")&""
 Set Conn_Rec= Server.CreateObject ("ADODB.Connection")
 Conn_Rec.Open Connstr_rec
End If

Pass=1

If Err Then Pass=0

Set Rs = Server.CreateObject("ADODB.Recordset")
Sql="Select Count(1) From "&RsSet("SaveRegTable")
Rs.Open Sql,Conn_Rec,1,1
ReguserTotal=Rs(0)
Rs.Close

Sql="Select Count("&RsSet("SaveRegUserName")&") From "&RsSet("SaveRegTable")
Rs.Open Sql,Conn_Rec,1,1
ReguserTotal_2=Rs(0)
Rs.Close

Sql="Select Count("&RsSet("SaveRegPassword")&") From "&RsSet("SaveRegTable")
Rs.Open Sql,Conn_Rec,1,1
ReguserTotal_3=Rs(0) 
Rs.Close

Sql="Select Top 1 "&RsSet("SaveRegUserName")&","&RsSet("SaveRegPassword")&" From "&RsSet("SaveRegTable")
Rs.Open Sql,Conn_Rec,1,1
RegUserName=Rs(0)
RegUserPassword=Rs(1)
Rs.Close

If Len(RegUserPassword)=16 Then
 Response.Write "����һ���û����볤�ȣ�16λ,������16λMd5���ܷ�ʽ!<br><br>"
ElseIf Len(RegUserPassword)=32 Then
 Response.Write "����һ���û����볤�ȣ�32λ,������32λMd5���ܷ�ʽ!<br><br>"
Else
 Response.Write "����һ���û����볤�ȣ�"&Len(RegUserPassword)&"λ!<br><br>"
End if
%>
ע���û���:<%=ReguserTotal%>,����һ��ע���û�����<%=RegUserName%><br>
<br>
<font color="#FF0000">���Խ����</font> 
<%
If RsSet("RegType")=2 And Pass=0 Then Response.write "ACCESS���ݿ��ļ�·����������!"
If RsSet("RegType")=3 And Pass=0 Then Response.write "SQLSERVER���ݿ�IP�����ݿ����ƻ������û���������������������!"

If Pass=1 And Len(Cstr(ReguserTotal))=0 Then Response.write "���ݿ�������ô�������������!"
If Pass=1 And Len(Cstr(ReguserTotal))>0 And Len(Cstr(ReguserTotal_2))=0 Then Response.write "���ݿ��û����ֶ����ô�������������!<br>"
If Pass=1 And Len(Cstr(ReguserTotal))>0 And Len(Cstr(ReguserTotal_3))=0 Then Response.write "���ݿ������ֶ����ô�������������!<br>"

If Pass=1 And Len(Cstr(ReguserTotal))>0 And Len(Cstr(ReguserTotal_2))>0 And Len(Cstr(ReguserTotal_3))>0 Then 
 Response.write "���ݿ�ӿڴ������óɹ�����������ļ��ܷ�ʽû����֤������������һ��ע���û�������������½���ԣ����Ե�½�Ļ���һ���������������������ļ��ܷ�ʽ�����д���!"
 Login=1
End If

ElseIf RsSet("RegType")=4 or RsSet("RegType")=5 Then
 Login=1
End If
%>
<%If Login=1 Then%>
      
<form name="form3" method="post" target="_blank" action="../../AdminUser.aspx?Action=sysreclogintest">
<table border="0" cellspacing="1" cellpadding="3"><tr>
<td>��½����</td>
</tr>
<tr> 
<td>�û����� <input name="UserName" type="text" id="UserName"> </td>
</tr>

<tr> 
<td>�ܡ��룺 <input name="Pwd" type="password" id="Pwd"></td>
</tr>
<tr> 
<td><div align="center">
<input type="submit" name="submit" value="����" class="btn btn-sm btn-primary">
</td>
</tr>
</table>
</form>
<%End If'����login%>
</td>
</tr>
<%End If'����RegType%>
</table>