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
If Request("Label")="" Then Label="sysmodify" Else Label=ChkStr(Request("Label"),1)


Set Rs = Server.CreateObject("ADODB.Recordset")
Sql="Select * From CFWztg_Admin"
Rs.open Sql,Conn,1,1
%>


<div class="tabs_header">
<ul class="tabs">
<li <%If Label="sysmodify" Then Response.write " class='active'"%>><a href="?Action=<%=Action%>&Label=sysmodify"><span>��������</span></a></li>
<li <%If Label="dataset" Then Response.write " class='active'"%>><a href="?Action=<%=Action%>&Label=dataset"><span>�����Զ�����ͱ���</span></a></li>
<li <%If Label="hostset" Then Response.write " class='active'"%>><a href="?Action=<%=Action%>&Label=hostset"><span>���������͸��ؾ���</span></a></li>
<li <%If Label="payset" Then Response.write " class='active'"%>><a href="?Action=<%=Action%>&Label=payset"><span>���߳�ֵ</span></a></li>
<li <%If Label="emailset" Then Response.write " class='active'"%>><a href="?Action=<%=Action%>&Label=emailset"><span>�ʼ�����</span></a></li>
<li <%If Label="portmap" Then Response.write " class='active'"%>><a href="?Action=<%=Action%>&Label=portmap"><span>CDN��������</span></a></li>
<li <%If Label="ipblacklist" Then Response.write " class='active'"%>><a href="?Action=<%=Action%>&Label=ipblacklist"><span>IP����������</span></a></li>
<li <%If Label="sysotherset" Then Response.write " class='active'"%>><a href="?Action=<%=Action%>&Label=sysotherset"><span>��������</span></a></li>
</ul>
</div>



<%If Label="sysmodify" Then%>
<form name="form1" method="post" action="../../AdminUser.aspx?Action=sysmodifysave&Label=<%=Label%>">

<script>
$(function(){

function UserTcLayer_0(){
$("#t_UserTcLayer_1,#t_UserTcLayer_2,#t_UserTcLayer_3,#t_UserTcLayer_4,#t_UserTcLayer_5").hide();
}

function UserTcLayer_1(){
$("#t_UserTcLayer_1").show();
$("#t_UserTcLayer_2,#t_UserTcLayer_3,#t_UserTcLayer_4,#t_UserTcLayer_5").hide();
}

function UserTcLayer_2(){
$("#t_UserTcLayer_1,#t_UserTcLayer_2").show();
$("#t_UserTcLayer_3,#t_UserTcLayer_4,#t_UserTcLayer_5").hide();
}

function UserTcLayer_3(){
$("#t_UserTcLayer_1,#t_UserTcLayer_2,#t_UserTcLayer_3").show();
$("#t_UserTcLayer_4,#t_UserTcLayer_5").hide();
}

function UserTcLayer_4(){
$("#t_UserTcLayer_1,#t_UserTcLayer_2,#t_UserTcLayer_3,#t_UserTcLayer_4").show();
$("#t_UserTcLayer_5").hide();
}

function UserTcLayer_5(){
 $("#t_UserTcLayer_1,#t_UserTcLayer_2,#t_UserTcLayer_3,#t_UserTcLayer_4,#t_UserTcLayer_5").show();
}


UserTcLayer_<%=Rs("UserTcLayer")%>();

$("#UserTcLayer_0").click(function(){UserTcLayer_0();});
$("#UserTcLayer_1").click(function(){UserTcLayer_1();});
$("#UserTcLayer_2").click(function(){UserTcLayer_2();});
$("#UserTcLayer_3").click(function(){UserTcLayer_3();});
$("#UserTcLayer_4").click(function(){UserTcLayer_4();});
$("#UserTcLayer_5").click(function(){UserTcLayer_5();});

});


var chars = ['0','1','2','3','4','5','6','7','8','9','a','b','d','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z','A','B','D','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z'];

function generateMixed(n) {
     var res = "";
     for(var i = 0; i < n ; i ++) {
         var id = Math.ceil(Math.random()*61);
         res += chars[id];
     }
     return res;
}
</script>

<form name="form1" method="post" action="../../AdminUser.aspx?Action=sysmodifysave&label=sysmodify">
<table class="tb_1">
  <tr class="tr_1"> 
      <td colspan="2" >ϵͳ</td>
    </tr>
    <tr>
      <td width="350" class="td_r">ϵͳ�����ȫ�ַ���</td>
      <td>
<input name="SysCode" type="password" id="SysCode" value="<%=Rs("SysCode")%>" readonly style="background-color:white">

<script>
 window.onload=function(){
  var SysCodeBtn=document.getElementById("SysCodeDo");
  var SysCodeInput=document.getElementById("SysCode")
  SysCodeBtn.onmousedown=function(){
    	if(SysCodeInput.type=="password"){SysCodeInput.type="text";SysCodeInput.removeAttribute('readonly')}else{SysCodeInput.type="password";SysCodeInput.setAttribute('readOnly','true')}
  };
 }
</script> 
<input type="button" name="SysCodeDo" id="SysCodeDo" value="��ʾ/���ذ�ȫ�ַ�" />

<input type="button" name="SysCodeShow" id="SysCodeShow" value="��ȫ�ַ�ȡ���ֵ" onclick="$(function () { confirm('ȷ��Ҫʹ�����ֵ���������ֵ�������ύ������Ч?', '', function (isConfirm) {if (isConfirm) {document.getElementById('SysCode').value=generateMixed(16);document.getElementById('SysCode').type='text';document.getElementById('SysCode').readOnly=false;}}, {confirmButtonText: 'ȷ��', cancelButtonText: 'ȡ��', width: 400});});" />

<br />
(������д����8λ������ĸ��������ϣ���֤ϵͳ�������ܴ���<%If Rs("SysCode")="12345678" Then Response.write "��<font color='#ff0000'>�����㲻Ҫʹ��Ĭ�ϼ򵥵�""12345678""�ַ�</font>"%>)

</td>
    </tr>
	<tr> 
      <td class="td_r">ϵͳ���ƣ�</td>
      <td><input name="SysTitle" type="text" id="SysTitle" value="<%=Rs("SysTitle")%>"></td>
    </tr>
	
	<tr> 
      <td class="td_r">ϵͳSEO���ƣ�</td>
      <td><input name="SysSeoTitle" type="text" id="SysSeoTitle" value="<%=Rs("SysSeoTitle")%>" size=80>(ǰ̨ҳ����ʹ��)</td>
    </tr>
    
	<tr> 
      <td class="td_r">����Ա��̨���԰�����Ŀ¼��</td>
      <td><input name="AdminUserManagePath" type="text" id="AdminUserManagePath" value="<%=Rs("AdminUserManagePath")%>">(Ĭ��admin/default,����adminΪ����Ŀ¼��defaultΪģ��Ŀ¼��,�޸���adminĿ¼����������Ӧ�޸�)</td>
    </tr>
    
	<tr> 
      <td class="td_r">����Ա��̨�ֻ�������Ŀ¼��</td>
      <td><input name="AdminUserManagePath_M" type="text" id="AdminUserManagePath_M" value="<%=Rs("AdminUserManagePath_M")%>">(�ֻ���͵��԰�Ŀ¼һ������д�͵��԰���ͬ)</td>
    </tr>
    
  <tr class="tr_1"> 
      <td colspan="2" >�û�����</td>
    </tr>
	<tr> 
      <td class="td_r">��ͨ�û����㷽ʽ��</td>
      <td><input name="UserSpendType" type="text" value="<%=Rs("UserSpendType")%>"> ��
      <br />(ע������д0Ϊ�û��ֹ����㣬����Ϊϵͳ�Զ�ͳ�ƽ��㣬��ֵΪ������ڶ�����)</td>
    </tr>
	
	<tr> 
      <td class="td_r">��ͨ�û���ͽ����</td>
      <td><input name="LowSpendCent" type="text" value="<%=Rs("LowSpendCent")%>">
        Ԫ</td>
    </tr>
	
    <tr>
      <td class="td_r">��ͨ�û��������:</td>
      <td>
<input type="radio" name="SpendCentBS" id="SpendCentBS" value="0"<%if Rs("SpendCentBS")=0 Then Response.write " checked"%>>�ɽ���������      
<input type="radio" name="SpendCentBS" id="SpendCentBS" value="1"<%if Rs("SpendCentBS")=1 Then Response.write " checked"%>>ֻ�ܽ���1Ԫ������
<input type="radio" name="SpendCentBS" id="SpendCentBS" value="10"<%if Rs("SpendCentBS")=10 Then Response.write " checked"%>>ֻ�ܽ���10Ԫ������
<input type="radio" name="SpendCentBS" id="SpendCentBS" value="50"<%if Rs("SpendCentBS")=50 Then Response.write " checked"%>>ֻ�ܽ���50Ԫ������
<input type="radio" name="SpendCentBS" id="SpendCentBS" value="100"<%if Rs("SpendCentBS")=100 Then Response.write " checked"%>>ֻ�ܽ���100Ԫ������
</td>
    </tr>
    
    <tr>
      <td class="td_r">�ֹ�����ʱ���еȴ���˵Ľ���ʱ�Ƿ�����ύ����:</td>
      <td>
<input type="radio" name="SpendSecAdd" id="SpendSecAdd" value="1"<%if Rs("SpendSecAdd")=1 Then Response.write " checked"%>>����      
<input type="radio" name="SpendSecAdd" id="SpendSecAdd" value="0"<%if Rs("SpendSecAdd")=0 Then Response.write " checked"%>>��ֹ</td>
    </tr>
	
	
    <tr class="tr_1"> 
      <td colspan="2">�û����Ƽ�ע���û������</td>
    </tr>
    <tr> 
      <td class="td_r">�û����Ƽ���ע���û�����ʱ��ɷּ�����ɣ�</td>
      <td>
<input name="UserTcLayer" id="UserTcLayer_0" type="radio" value="0"<%if Rs("UserTcLayer")=0 Then Response.write " checked"%>>
�ر�
<input name="UserTcLayer" id="UserTcLayer_1" type="radio"  value="1"<%if Rs("UserTcLayer")=1 Then Response.write " checked"%>>
һ��(ֱ���Ƽ����û�)
<input name="UserTcLayer" id="UserTcLayer_2" type="radio"  value="2"<%if Rs("UserTcLayer")=2 Then Response.write " checked"%>>
����
<input name="UserTcLayer" id="UserTcLayer_3" type="radio"  value="3"<%if Rs("UserTcLayer")=3 Then Response.write " checked"%>>
����
<input name="UserTcLayer" id="UserTcLayer_4" type="radio"  value="4"<%if Rs("UserTcLayer")=4 Then Response.write " checked"%>>
�ļ�
<input name="UserTcLayer" id="UserTcLayer_5" type="radio"  value="5"<%if Rs("UserTcLayer")=5 Then Response.write " checked"%>>
�弶<br />
���û�a�ƹ���b��b�Ƽ���c��c�Ƽ���d��d�Ƽ���e��e�Ƽ���f��Ȼ��f���������ʱ����һ����e��������d��������c���ļ���b���弶��a
</td>
</tr>
	
<TR id="t_UserTcLayer_1"> 
<TD class="td_r">һ��(ֱ���Ƽ����û�)��</TD>
<TD><input name="UserTcLayer1Rate" type="text" id="UserTcLayer1Rate" value="<%=Rs("UserTcLayer1Rate")%>" />%</TD>
</TR>

<TR id="t_UserTcLayer_2"> 
<TD class="td_r">�ڶ�����</TD>
<TD><input name="UserTcLayer2Rate" type="text" id="UserTcLayer2Rate" value="<%=Rs("UserTcLayer2Rate")%>" />%</TD>
</TR>

<TR id="t_UserTcLayer_3"> 
<TD class="td_r">��������</TD>
<TD><input name="UserTcLayer3Rate" type="text" id="UserTcLayer3Rate" value="<%=Rs("UserTcLayer3Rate")%>" />%</TD>
</TR>

<TR id="t_UserTcLayer_4"> 
<TD class="td_r">���ļ���</TD>
<TD><input name="UserTcLayer4Rate" type="text" id="UserTcLayer4Rate" value="<%=Rs("UserTcLayer4Rate")%>" />%</TD>
</TR>

<TR id="t_UserTcLayer_5"> 
<TD class="td_r">���弶��</TD>
<TD><input name="UserTcLayer5Rate" type="text" id="UserTcLayer5Rate" value="<%=Rs("UserTcLayer5Rate")%>" />%</TD>
</TR>

<tr> 
<td class="td_r">�û����Ƽ���ע���û�������Ʒʱ��ɣ�</td>
<td><input name="UserOrderTcRate" type="text" value="<%=Rs("UserOrderTcRate")%>">%<br>
(����Ϊ0���ʾ��ɹ�����Ч;����0,��������10%���Ƽ������û�����һ��100Ԫ����Ʒ�󣬹�������붩�����ƹ�ϵͳ���û����õ�10Ԫ���)</td>
</tr>
<tr class="tr_1"> 
<td colspan="2">�û��۵�</td>
</tr>
<tr> 

<td class="td_r">�����û��۵㿪�أ�</td>
<td><input type="radio" name="UserDeDuctState" value="1"<%If Rs("UserDeDuctState")=1 Then Response.Write " checked"%>>
�����۵� 
<input type="radio" name="UserDeDuctState" value="0"<%If Rs("UserDeDuctState")=0 Then Response.Write " checked"%>>
�رտ۵�(�رպ������û�������Ŀ۵���ͳһʧЧ)</td>

<TR> 
<TD class="td_r">ϵͳͳһCPC�۵��ʣ�</TD>
<TD><input name="SysCpcDeDuct_Rate" type="text" id="SysCpcDeDuct_Rate" value="<%=Rs("SysCpcDeDuct_Rate")%>" />%(0-100֮�䣬0Ϊ���۵㣬100Ϊ�۳�ȫ������)</TD>
</TR>

<TR> 
<TD class="td_r">ϵͳͳһCPV�۵��ʣ�</TD>
<TD><input name="SysCpmDeDuct_Rate" type="text" id="SysCpmDeDuct_Rate" value="<%=Rs("SysCpmDeDuct_Rate")%>" />%(0-100֮�䣬0Ϊ���۵㣬100Ϊ�۳�ȫ������)</TD>
</TR>

<TR> 
<TD class="td_r">ϵͳͳһCPA�۵��ʣ�</TD>
<TD><input name="SysCpaDeDuct_Rate" type="text" id="SysCpaDeDuct_Rate" value="<%=Rs("SysCpaDeDuct_Rate")%>" />%(0-100֮�䣬0Ϊ���۵㣬100Ϊ�۳�ȫ������)</TD>
</TR>

</tr>
<tr class="tr_1"> 
<td colspan="2">�û�ע��</td>
</tr>
<tr> 
<td class="td_r">��վ��ע�᣺</td>
<td>
<input name="UserValid" type="radio" value="3"<%If Rs("UserValid")=3 Then Response.Write " checked"%>>�ֹ����
<input name="UserValid" type="radio" value="2"<%If Rs("UserValid")=2 Then Response.Write " checked"%>>�ʼ����
<input name="UserValid" type="radio" value="1"<%If Rs("UserValid")=1 Then Response.Write " checked"%>>�������
<input name="UserValid" type="radio" value="0"<%If Rs("UserValid")=0 Then Response.Write " checked"%>>��ֹע��
</td>
</tr>
<tr> 
<td class="td_r">�����ע�᣺</td>
<td>
<input name="AdUserValid" type="radio" value="3"<%If Rs("AdUserValid")=3 Then Response.Write " checked"%>>�ֹ����
<input name="AdUserValid" type="radio" value="2"<%If Rs("AdUserValid")=2 Then Response.Write " checked"%>>�ʼ����
<input name="AdUserValid" type="radio" value="1"<%If Rs("AdUserValid")=1 Then Response.Write " checked"%>>�������
<input name="AdUserValid" type="radio" value="0"<%If Rs("AdUserValid")=0 Then Response.Write " checked"%>>��ֹע��
</td>
</tr>
<tr class="tr_1"> 
<td colspan="2">�û���¼</td>
</tr>
<tr> 
<td class="td_r">��վ����¼��</td>
<td>
<input name="UserLoginOpen" type="radio" value="1"<%If Rs("UserLoginOpen")=1 Then Response.Write " checked"%>>������¼
<input name="UserLoginOpen" type="radio" value="0"<%If Rs("UserLoginOpen")=0 Then Response.Write " checked"%>>�رյ�¼
</td>
</tr>
<tr> 
<td class="td_r">�������¼��</td>
<td>
<input name="AdUserLoginOpen" type="radio" value="1"<%If Rs("AdUserLoginOpen")=1 Then Response.Write " checked"%>>������¼
<input name="AdUserLoginOpen" type="radio" value="0"<%If Rs("AdUserLoginOpen")=0 Then Response.Write " checked"%>>�رյ�¼
</td>
</tr>
<tr class="tr_1">
<td colspan="2">�¼����վ��Ĭ�ϵ����״̬</td>
</tr>
<tr>
<td class="td_r">�¼�վ��Ĭ���Զ�ͨ����ˣ�</td>
<td>
<input name="SiteAutoPass" type="radio" value="1"<%If Rs("SiteAutoPass")=1 Then Response.Write " checked"%>>�� 
<input name="SiteAutoPass" type="radio" value="0"<%If Rs("SiteAutoPass")=0 Then Response.Write " checked"%>>��
</td>
</tr>
    
<tr class="tr_1">
<td colspan="2">���߹��</td>
</tr>
<tr>
<td class="td_r">���߹��ID��</td>
<td><input name="LowReg_Ad_ID" type="text" value="<%=Rs("LowReg_Ad_ID")%>">      
<%Sql="Select Count(1) From CFWztg_Ad Where ID="&Rs("LowReg_Ad_ID")
Set Rs2=Conn.Execute(Sql)
If Rs2(0)=0 And Rs("LowReg_Ad_ID")<>0 Then Response.write "<font color='#ff0000'>�����õ����߹��ID������,����������</font>"
Rs2.Close
%>
(Ϊ0ʱǰ�û���ҳ�������Ƽ�����Ҫʱ��д���߹��ID)
</td>
</tr>
   
<tr class="tr_1">
<td colspan="2">ע����Ǯ</td>
</tr>
<tr>
<td class="td_r">��վ����</td>
<td><input type="text" name="UserFirstDot" id="UserFirstDot" value="<%=Rs("UserFirstDot")%>">Ԫ(ע����д0������)</td>
</tr>
<tr>
<td class="td_r">�������</td>
<td><input type="text" name="AdUserFirstDot" id="AdUserFirstDot" value="<%=Rs("AdUserFirstDot")%>">Ԫ(ע����д0������)</td>
</tr>
    
    
<tr class="tr_1">
<td colspan="2">ǰ̨α��̬</td>
</tr>
<tr>
<td class="td_r">α��̬��</td>
<td><input name="SiteHtml" type="radio" value="1"<%If Rs("SiteHtml")=1 Then Response.Write " checked"%>>
����
<input name="SiteHtml" type="radio" value="0"<%If Rs("SiteHtml")=0 Then Response.Write " checked"%>>
�ر� (Ĭ�Ϲرգ��翪����վ��֧��α��̬���ܣ�����Microsoft IIS URLα��̬�����ȥ��web.config��α��̬�����ע�����Ч����֧��ISAPI_Rewrite��α��̬�����)</td>
</tr>

<tr class="tr_1">
<td colspan="2">�û���¼��֤��</td>
</tr>
<tr>
<td class="td_r">�û���¼��֤�룺</td>
<td><input name="LoginCheckCode" type="radio" value="0"<%If Rs("LoginCheckCode")=0 Then Response.Write " checked"%>>
�ر�
<input name="LoginCheckCode" type="radio" value="1"<%If Rs("LoginCheckCode")=1 Then Response.Write " checked"%>>
���� (ע:һ��رգ��������ģ����û�����봦�����Լ�������֤��ͼƬ�������)</td>
</tr>
    
<tr class="tr_1">
<td colspan="2">�ϴ�ͼƬ�������</td>
</tr>
<tr>
<td class="td_r">�ϴ�ͼƬ�����</td>
<td><input name="UploadType" type="radio" value="1"<%If Rs("UploadType")=1 Then Response.Write " checked"%>>
������ϴ�(���谲װ,�Ƽ�ʹ��,Ĭ��200K����)
<input name="UploadType" type="radio" value="2"<%If Rs("UploadType")=2 Then Response.Write " checked"%>>
AspUpload����ϴ�<%
on error resume next
set TestObj=server.CreateObject ("Persits.Upload.1")
If -2147221005 <> Err then
Response.write "(�Ѱ�װ,�汾:"&TestObj.version&")"
Else
Response.write "(δ��װ)"
End If
%></td>
</tr>
    
<tr class="tr_1">
<td colspan="2">�ѵ�¼�û�����ҳ�Զ���¼��̨</td>
</tr>
<tr>
<td class="td_r">�ѵ�¼�û�����ҳ�Զ���¼��̨��</td>
<td><input name="AutoLogin" type="radio" value="0"<%If Rs("AutoLogin")=0 Then Response.Write " checked"%>>
��
<input name="AutoLogin" type="radio" value="1"<%If Rs("AutoLogin")=1 Then Response.Write " checked"%>>
��</td>
</tr>
    
<tr> 
<td></td>
<td>  
<input type="submit" name="submit" id="sysmodify" value="�޸�" class="btn btn-primary">
 </td>
</tr>
</table>
</form>
<%End If%>

<%If Label="dataset" Then%>
<!--#Include File="sysmodify_dataset.asp"-->
<%End If%>

<%If Label="hostset" Then%>
<!--#Include File="sysmodify_hostset.asp"-->
<%End If%>

<%If Label="payset" Then%>
<!--#Include File="sysmodify_payset.asp"-->
<%End If%>

<%If Label="emailset" Then%>
<!--#Include File="sysmodify_emailset.asp"-->
<%End If%>

<%If Label="portmap" Then%>
<!--#Include File="sysmodify_portmap.asp"-->
<%End If%>

<%If Label="ipblacklist" Then%>
<!--#Include File="sysmodify_ipblacklist.asp"-->
<%End If%>

<%If Label="sysotherset" Then%>
<!--#Include File="sysmodify_sysotherset.asp"-->
<%End If%>

<%Rs.Close%>

