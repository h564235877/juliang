<%
'乘风广告联盟系统 Sql版
'作者QQ：178575
'作者EMail：yliangcf@163.com
'作者网站：http://www.qqcf.com
'详细简介：http://www.qqcf.com/cfwztg.htm
'上面有程序在线演示，安装演示，使用疑难解答，最新版本下载等内容
'因为这些内容可能时常更新，就没有放在程序里，请自己上网站查看
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
如果你使用广告联盟系统自带的会员注册功能请选择接口类型-系统自带,否则根据你网站的数据库类型选择相应的接口类型</div>
</td>
</tr>
</table>


<table class="tb_1">
<form name="form2" method="post" action="../../AdminUser.aspx?Action=sysrecsetsave">
<tr class="tr_1"> 
<td colspan="2">网站接口设置</td>
</tr>
<tr> 
<td width="200" class="td_r">接口类型：</td>
<td>
<input type="radio" name="regtype" id="regtype_1" value="1"<%If Rs("RegType")=1 Then Response.Write " checked"%>>本系统自带 
<input type="radio" name="regtype" id="regtype_2" value="2"<%If Rs("RegType")=2 Then Response.Write " checked"%>>access数据库 
<input type="radio" name="regtype" id="regtype_3" value="3"<%If Rs("RegType")=3 Then Response.Write " checked"%>>sqlserver数据库
<input type="radio" name="regtype" id="regtype_4" value="4"<%If Rs("RegType")=4 Then Response.Write " checked"%>>mysql数据库
<input type="radio" name="regtype" id="regtype_5" value="5"<%If Rs("RegType")=5 Then Response.Write " checked"%>>自定义接口文件
</td>
</tr>

<tr class="tr_1" id="t_1"> 
<td colspan="2">主站数据库连接信息</td>
</tr>

<tr id="t_AccessPath"> 
<td class="td_r">access数据库文件路径：</td>
<td><input name="AccessPath" type="text" id="AccessPath" value="<%=Rs("AccessPath")%>" style="width:360px;"><font color='#FF0000'>*</font>
<br />如数据库文件夹data.mdb放在网站根目录aa里的bb目录里,路径应该设置为/aa/bb/data.mdb</td>
</tr>

<tr id="t_SqlIP"> 
<td class="td_r"><span id="tx_SqlIP"></span>数据库IP： </td>
<td><input name="SqlIP" type="text" id="SqlIP" value="<%=rs("SqlIP")%>"><font color='#FF0000'>*</font></td>
</tr>

<tr id="t_SqlLinkName"> 
<td class="td_r"><span id="tx_SqlLinkName"></span>数据库连接用户名：</td>
<td><input name="SqlLinkName" type="text" id="SqlLinkName" value="<%=rs("SqlLinkName")%>"><font color='#FF0000'>*</font></td>
</tr>
<tr id="t_SqlLinkPassword"> 
<td class="td_r"><span id="tx_SqlLinkPassword"></span>数据库连接密码：</td>
<td><input name="SqlLinkPassword" type="password" id="SqlLinkPassword" value="<%=rs("SqlLinkPassword")%>"><font color='#FF0000'>*</font>
</td>
</tr>

<tr id="t_SqlDbName"> 
<td class="td_r"><span id="tx_SqlDbName"></span>数据库名称：</td>
<td><input name="SqlDbName" type="text" id="SqlDbName" value="<%=rs("SqlDbName")%>"><font color='#FF0000'>*</font></td>
</tr>

<tr id="t_SelfRecUrl"> 
<td class="td_r">自定义接口文件网址：</td>
<td><input name="SelfRecUrl" type="text" id="SelfRecUrl" value="<%=Rs("SelfRecUrl")%>" style="width:360px;"><font color='#FF0000'>*</font></td>
</tr>

<tr class="tr_1" id="t_2"> 
<td colspan="2">主站表信息</td>
</tr>
<tr id="t_SaveProSet"> 
<td class="td_r">快捷设置主站表信息：</td>
<td>

<select name="SaveProSet" id="SaveProSet">
<option value="" selected>使用以下自定义设置</option>
<option value="ecshop">使用新配置-ecshop</option>
<option value="iwebshop">使用新配置-iwebshop</option>
<option value="discuz">使用新配置-discuz</option>
<option value="dedecms">使用新配置-dedecms</option>
<option value="phpcms">使用新配置-phpcms</option>
</select>
如主系统用户名带中文则用户名称字段里可以使用唯一性Email字段，用户使用EMail登录
</td>
</tr>

    <tr id="t_SaveRegTable"> 
      <td class="td_r">存放注册用户的表名：</td>
      <td><input name="SaveRegTable" type="text" id="SaveRegTable" value="<%=Rs("SaveRegTable")%>"><font color='#FF0000'>*</font></td>
    </tr>
    <tr id="t_SaveRegUserID"> 
      <td class="td_r">存放注册用户数字ID的字段名：</td>
      <td><input name="SaveRegUserID" type="text" id="SaveRegUserID" value="<%=Rs("SaveRegUserID")%>"><font color='#FF0000'>*</font></td>
    </tr>
    <tr id="t_SaveRegUserName"> 
      <td class="td_r">存放注册用户名称的字段名：</td>
      <td><input name="SaveRegUserName" type="text" id="SaveRegUserName" value="<%=Rs("SaveRegUserName")%>"><font color='#FF0000'>*</font>(将可以使用其它程序里的这个字段登录联盟程序)</td>
    </tr>
    <tr id="t_SaveRegPassword"> 
      <td class="td_r">存放注册用户密码的字段名：</td>
      <td><input name="SaveRegPassword" type="text" id="SaveRegPassword" value="<%=Rs("SaveRegPassword")%>"><font color='#FF0000'>*</font></td>
    </tr>
    <tr id="t_PasswordType">
      <td class="td_r">存放注册用户密码加密方式：</td>
      <td><input type="radio" name="PasswordType" id="PasswordType_1" value="1"<%If Rs("PassWordType")=1 Then Response.Write " checked"%>>没有加密 
        <input type="radio" name="PasswordType" id="PasswordType_2" value="2"<%If Rs("PassWordType")=2 Then Response.Write " checked"%>>经过了16位Md5加密 
        <input type="radio" name="PasswordType" id="PasswordType_3" value="3"<%If Rs("PassWordType")=3 Then Response.Write " checked"%>>经过了32位Md5加密
        <input type="radio" name="PasswordType" id="PasswordType_4" value="4"<%If Rs("PassWordType")=4 Then Response.Write " checked"%>>密码加因子类的(如uc)</td>
    </tr>
    <tr id="t_SaveRegPasswordSalt"> 
      <td class="td_r">存放注册用户密码因子的字段名：</td>
      <td><input name="SaveRegPasswordSalt" type="text" id="SaveRegPasswordSalt" value="<%=Rs("SaveRegPasswordSalt")%>"><font color='#FF0000'>*</font></td>
    </tr>
    <tr id="t_SaveRegEmail"> 
      <td class="td_r">存放注册用户EMail的字段名：</td>
      <td><input name="SaveRegEmail" type="text" id="SaveRegEmail" value="<%=Rs("SaveRegEmail")%>"><font color='#FF0000'>*</font></td>
    </tr>

    <tr class="tr_1" id="t_3"> 
      <td colspan="2">主站网址</td>
    </tr>
    <tr id="t_RegUrl"> 
      <td class="td_r">你的网站注册用户页面网址：</td>
      <td><input name="RegUrl" type="text" id="RegUrl" value="<%=Rs("RegUrl")%>" style="width:360px;"><font color='#FF0000'>*</font></td>
    </tr>
    <tr id="t_LoginUrl"> 
      <td class="td_r">你的网站用户登陆页面网址：</td>
      <td><input name="LoginUrl" type="text" id="LoginUrl" value="<%=rs("LoginUrl")%>" style="width:360px;"><font color='#FF0000'>*</font></td>
    </tr>

<tr>
<td></td>
<td colspan="2">
<input type="submit" name="submit" value="修改" class="btn btn-primary">

</td>
</tr>
</form>
<%
Rs.Close
%>

<tr> 
<td colspan="2" class="td_1">接口选择说明：</td>
</tr>
<tr> 
<td colspan="2" class="td_1">
本系统自带:原先网站没有会员注册系统或者不想和原先的注册系统集成在一起使用的网站则选择此项<br>
Access数据库: 你的网站使用Access数据库并自带会员注册系统的网站选择此项<br>
SQLSERVER数据库:你的网站使用Sqlserver数据库并自带会员注册系统的网站选择此项<br>
Mysql数据库:你的网站使用Mysql数据库并自带会员注册系统的网站选择此项<br>
自定义接口文件:你的网站自己较验后再转向到联盟接口</td>
</tr>

<%If RsSet("RegType")<>1 Then%>
<tr>
<td colspan="2" class="td_1">数据库接口设置是否正确的测试结果：<a name="sysrecsetresultview"></a></td>
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
 Response.Write "其中一个用户密码长度：16位,可能是16位Md5加密方式!<br><br>"
ElseIf Len(RegUserPassword)=32 Then
 Response.Write "其中一个用户密码长度：32位,可能是32位Md5加密方式!<br><br>"
Else
 Response.Write "其中一个用户密码长度："&Len(RegUserPassword)&"位!<br><br>"
End if
%>
注册用户数:<%=ReguserTotal%>,其中一个注册用户名是<%=RegUserName%><br>
<br>
<font color="#FF0000">测试结果：</font> 
<%
If RsSet("RegType")=2 And Pass=0 Then Response.write "ACCESS数据库文件路径设置有误!"
If RsSet("RegType")=3 And Pass=0 Then Response.write "SQLSERVER数据库IP或数据库名称或连接用户名或连接密码设置有误!"

If Pass=1 And Len(Cstr(ReguserTotal))=0 Then Response.write "数据库表名设置错误，请重新设置!"
If Pass=1 And Len(Cstr(ReguserTotal))>0 And Len(Cstr(ReguserTotal_2))=0 Then Response.write "数据库用户名字段设置错误，请重新设置!<br>"
If Pass=1 And Len(Cstr(ReguserTotal))>0 And Len(Cstr(ReguserTotal_3))=0 Then Response.write "数据库密码字段设置错误，请重新设置!<br>"

If Pass=1 And Len(Cstr(ReguserTotal))>0 And Len(Cstr(ReguserTotal_2))>0 And Len(Cstr(ReguserTotal_3))>0 Then 
 Response.write "数据库接口大致设置成功，还有密码的加密方式没有验证，请在以下用一个注册用户名和密码做登陆测试，可以登陆的话就一切正常，否则可能是密码的加密方式设置有错误!"
 Login=1
End If

ElseIf RsSet("RegType")=4 or RsSet("RegType")=5 Then
 Login=1
End If
%>
<%If Login=1 Then%>
      
<form name="form3" method="post" target="_blank" action="../../AdminUser.aspx?Action=sysreclogintest">
<table border="0" cellspacing="1" cellpadding="3"><tr>
<td>登陆测试</td>
</tr>
<tr> 
<td>用户名： <input name="UserName" type="text" id="UserName"> </td>
</tr>

<tr> 
<td>密　码： <input name="Pwd" type="password" id="Pwd"></td>
</tr>
<tr> 
<td><div align="center">
<input type="submit" name="submit" value="测试" class="btn btn-sm btn-primary">
</td>
</tr>
</table>
</form>
<%End If'结束login%>
</td>
</tr>
<%End If'结束RegType%>
</table>