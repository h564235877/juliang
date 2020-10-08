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
If Request("Label")="" Then Label="sysmodify" Else Label=ChkStr(Request("Label"),1)


Set Rs = Server.CreateObject("ADODB.Recordset")
Sql="Select * From CFWztg_Admin"
Rs.open Sql,Conn,1,1
%>


<div class="tabs_header">
<ul class="tabs">
<li <%If Label="sysmodify" Then Response.write " class='active'"%>><a href="?Action=<%=Action%>&Label=sysmodify"><span>常规设置</span></a></li>
<li <%If Label="dataset" Then Response.write " class='active'"%>><a href="?Action=<%=Action%>&Label=dataset"><span>数据自动清理和备份</span></a></li>
<li <%If Label="hostset" Then Response.write " class='active'"%>><a href="?Action=<%=Action%>&Label=hostset"><span>代码域名和负载均衡</span></a></li>
<li <%If Label="payset" Then Response.write " class='active'"%>><a href="?Action=<%=Action%>&Label=payset"><span>在线充值</span></a></li>
<li <%If Label="emailset" Then Response.write " class='active'"%>><a href="?Action=<%=Action%>&Label=emailset"><span>邮件设置</span></a></li>
<li <%If Label="portmap" Then Response.write " class='active'"%>><a href="?Action=<%=Action%>&Label=portmap"><span>CDN或云主机</span></a></li>
<li <%If Label="ipblacklist" Then Response.write " class='active'"%>><a href="?Action=<%=Action%>&Label=ipblacklist"><span>IP黑名单防御</span></a></li>
<li <%If Label="sysotherset" Then Response.write " class='active'"%>><a href="?Action=<%=Action%>&Label=sysotherset"><span>其它设置</span></a></li>
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
      <td colspan="2" >系统</td>
    </tr>
    <tr>
      <td width="350" class="td_r">系统随机安全字符：</td>
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
<input type="button" name="SysCodeDo" id="SysCodeDo" value="显示/隐藏安全字符" />

<input type="button" name="SysCodeShow" id="SysCodeShow" value="安全字符取随机值" onclick="$(function () { confirm('确认要使用随机值吗，生成随机值后需再提交表单才生效?', '', function (isConfirm) {if (isConfirm) {document.getElementById('SysCode').value=generateMixed(16);document.getElementById('SysCode').type='text';document.getElementById('SysCode').readOnly=false;}}, {confirmButtonText: '确定', cancelButtonText: '取消', width: 400});});" />

<br />
(建议填写任意8位以上字母，数字组合，保证系统参数加密传送<%If Rs("SysCode")="12345678" Then Response.write "，<font color='#ff0000'>建议你不要使用默认简单的""12345678""字符</font>"%>)

</td>
    </tr>
	<tr> 
      <td class="td_r">系统名称：</td>
      <td><input name="SysTitle" type="text" id="SysTitle" value="<%=Rs("SysTitle")%>"></td>
    </tr>
	
	<tr> 
      <td class="td_r">系统SEO名称：</td>
      <td><input name="SysSeoTitle" type="text" id="SysSeoTitle" value="<%=Rs("SysSeoTitle")%>" size=80>(前台页面上使用)</td>
    </tr>
    
	<tr> 
      <td class="td_r">管理员后台电脑版所在目录：</td>
      <td><input name="AdminUserManagePath" type="text" id="AdminUserManagePath" value="<%=Rs("AdminUserManagePath")%>">(默认admin/default,其中admin为管理目录名default为模板目录名,修改了admin目录名后这里相应修改)</td>
    </tr>
    
	<tr> 
      <td class="td_r">管理员后台手机版所在目录：</td>
      <td><input name="AdminUserManagePath_M" type="text" id="AdminUserManagePath_M" value="<%=Rs("AdminUserManagePath_M")%>">(手机版和电脑版目录一样则填写和电脑版相同)</td>
    </tr>
    
  <tr class="tr_1"> 
      <td colspan="2" >用户结算</td>
    </tr>
	<tr> 
      <td class="td_r">普通用户结算方式：</td>
      <td><input name="UserSpendType" type="text" value="<%=Rs("UserSpendType")%>"> 天
      <br />(注：如填写0为用户手工结算，正数为系统自动统计结算，数值为间隔周期多少天)</td>
    </tr>
	
	<tr> 
      <td class="td_r">普通用户最低结算金额：</td>
      <td><input name="LowSpendCent" type="text" value="<%=Rs("LowSpendCent")%>">
        元</td>
    </tr>
	
    <tr>
      <td class="td_r">普通用户结算规则:</td>
      <td>
<input type="radio" name="SpendCentBS" id="SpendCentBS" value="0"<%if Rs("SpendCentBS")=0 Then Response.write " checked"%>>可结算任意金额      
<input type="radio" name="SpendCentBS" id="SpendCentBS" value="1"<%if Rs("SpendCentBS")=1 Then Response.write " checked"%>>只能结算1元整数倍
<input type="radio" name="SpendCentBS" id="SpendCentBS" value="10"<%if Rs("SpendCentBS")=10 Then Response.write " checked"%>>只能结算10元整数倍
<input type="radio" name="SpendCentBS" id="SpendCentBS" value="50"<%if Rs("SpendCentBS")=50 Then Response.write " checked"%>>只能结算50元整数倍
<input type="radio" name="SpendCentBS" id="SpendCentBS" value="100"<%if Rs("SpendCentBS")=100 Then Response.write " checked"%>>只能结算100元整数倍
</td>
    </tr>
    
    <tr>
      <td class="td_r">手工结算时还有等待审核的结算时是否可新提交结算:</td>
      <td>
<input type="radio" name="SpendSecAdd" id="SpendSecAdd" value="1"<%if Rs("SpendSecAdd")=1 Then Response.write " checked"%>>允许      
<input type="radio" name="SpendSecAdd" id="SpendSecAdd" value="0"<%if Rs("SpendSecAdd")=0 Then Response.write " checked"%>>禁止</td>
    </tr>
	
	
    <tr class="tr_1"> 
      <td colspan="2">用户对推荐注册用户提成率</td>
    </tr>
    <tr> 
      <td class="td_r">用户对推荐的注册用户结算时提成分几级提成：</td>
      <td>
<input name="UserTcLayer" id="UserTcLayer_0" type="radio" value="0"<%if Rs("UserTcLayer")=0 Then Response.write " checked"%>>
关闭
<input name="UserTcLayer" id="UserTcLayer_1" type="radio"  value="1"<%if Rs("UserTcLayer")=1 Then Response.write " checked"%>>
一级(直接推荐的用户)
<input name="UserTcLayer" id="UserTcLayer_2" type="radio"  value="2"<%if Rs("UserTcLayer")=2 Then Response.write " checked"%>>
二级
<input name="UserTcLayer" id="UserTcLayer_3" type="radio"  value="3"<%if Rs("UserTcLayer")=3 Then Response.write " checked"%>>
三级
<input name="UserTcLayer" id="UserTcLayer_4" type="radio"  value="4"<%if Rs("UserTcLayer")=4 Then Response.write " checked"%>>
四级
<input name="UserTcLayer" id="UserTcLayer_5" type="radio"  value="5"<%if Rs("UserTcLayer")=5 Then Response.write " checked"%>>
五级<br />
如用户a推广了b，b推荐了c，c推荐了d，d推荐了e，e推荐了f。然后f在收入结算时他的一级是e，二级是d，三级是c，四级是b，五级是a
</td>
</tr>
	
<TR id="t_UserTcLayer_1"> 
<TD class="td_r">一级(直接推荐的用户)：</TD>
<TD><input name="UserTcLayer1Rate" type="text" id="UserTcLayer1Rate" value="<%=Rs("UserTcLayer1Rate")%>" />%</TD>
</TR>

<TR id="t_UserTcLayer_2"> 
<TD class="td_r">第二级：</TD>
<TD><input name="UserTcLayer2Rate" type="text" id="UserTcLayer2Rate" value="<%=Rs("UserTcLayer2Rate")%>" />%</TD>
</TR>

<TR id="t_UserTcLayer_3"> 
<TD class="td_r">第三级：</TD>
<TD><input name="UserTcLayer3Rate" type="text" id="UserTcLayer3Rate" value="<%=Rs("UserTcLayer3Rate")%>" />%</TD>
</TR>

<TR id="t_UserTcLayer_4"> 
<TD class="td_r">第四级：</TD>
<TD><input name="UserTcLayer4Rate" type="text" id="UserTcLayer4Rate" value="<%=Rs("UserTcLayer4Rate")%>" />%</TD>
</TR>

<TR id="t_UserTcLayer_5"> 
<TD class="td_r">第五级：</TD>
<TD><input name="UserTcLayer5Rate" type="text" id="UserTcLayer5Rate" value="<%=Rs("UserTcLayer5Rate")%>" />%</TD>
</TR>

<tr> 
<td class="td_r">用户对推荐的注册用户购买商品时提成：</td>
<td><input name="UserOrderTcRate" type="text" value="<%=Rs("UserOrderTcRate")%>">%<br>
(设置为0则表示提成功能无效;大于0,比如设置10%，推荐来的用户购买一个100元的商品后，广告主导入订单到推广系统后，用户将得到10元提成)</td>
</tr>
<tr class="tr_1"> 
<td colspan="2">用户扣点</td>
</tr>
<tr> 

<td class="td_r">单个用户扣点开关：</td>
<td><input type="radio" name="UserDeDuctState" value="1"<%If Rs("UserDeDuctState")=1 Then Response.Write " checked"%>>
开启扣点 
<input type="radio" name="UserDeDuctState" value="0"<%If Rs("UserDeDuctState")=0 Then Response.Write " checked"%>>
关闭扣点(关闭后所有用户资料里的扣点率统一失效)</td>

<TR> 
<TD class="td_r">系统统一CPC扣点率：</TD>
<TD><input name="SysCpcDeDuct_Rate" type="text" id="SysCpcDeDuct_Rate" value="<%=Rs("SysCpcDeDuct_Rate")%>" />%(0-100之间，0为不扣点，100为扣除全部点数)</TD>
</TR>

<TR> 
<TD class="td_r">系统统一CPV扣点率：</TD>
<TD><input name="SysCpmDeDuct_Rate" type="text" id="SysCpmDeDuct_Rate" value="<%=Rs("SysCpmDeDuct_Rate")%>" />%(0-100之间，0为不扣点，100为扣除全部点数)</TD>
</TR>

<TR> 
<TD class="td_r">系统统一CPA扣点率：</TD>
<TD><input name="SysCpaDeDuct_Rate" type="text" id="SysCpaDeDuct_Rate" value="<%=Rs("SysCpaDeDuct_Rate")%>" />%(0-100之间，0为不扣点，100为扣除全部点数)</TD>
</TR>

</tr>
<tr class="tr_1"> 
<td colspan="2">用户注册</td>
</tr>
<tr> 
<td class="td_r">网站主注册：</td>
<td>
<input name="UserValid" type="radio" value="3"<%If Rs("UserValid")=3 Then Response.Write " checked"%>>手工审核
<input name="UserValid" type="radio" value="2"<%If Rs("UserValid")=2 Then Response.Write " checked"%>>邮件审核
<input name="UserValid" type="radio" value="1"<%If Rs("UserValid")=1 Then Response.Write " checked"%>>无需审核
<input name="UserValid" type="radio" value="0"<%If Rs("UserValid")=0 Then Response.Write " checked"%>>禁止注册
</td>
</tr>
<tr> 
<td class="td_r">广告主注册：</td>
<td>
<input name="AdUserValid" type="radio" value="3"<%If Rs("AdUserValid")=3 Then Response.Write " checked"%>>手工审核
<input name="AdUserValid" type="radio" value="2"<%If Rs("AdUserValid")=2 Then Response.Write " checked"%>>邮件审核
<input name="AdUserValid" type="radio" value="1"<%If Rs("AdUserValid")=1 Then Response.Write " checked"%>>无需审核
<input name="AdUserValid" type="radio" value="0"<%If Rs("AdUserValid")=0 Then Response.Write " checked"%>>禁止注册
</td>
</tr>
<tr class="tr_1"> 
<td colspan="2">用户登录</td>
</tr>
<tr> 
<td class="td_r">网站主登录：</td>
<td>
<input name="UserLoginOpen" type="radio" value="1"<%If Rs("UserLoginOpen")=1 Then Response.Write " checked"%>>开启登录
<input name="UserLoginOpen" type="radio" value="0"<%If Rs("UserLoginOpen")=0 Then Response.Write " checked"%>>关闭登录
</td>
</tr>
<tr> 
<td class="td_r">广告主登录：</td>
<td>
<input name="AdUserLoginOpen" type="radio" value="1"<%If Rs("AdUserLoginOpen")=1 Then Response.Write " checked"%>>开启登录
<input name="AdUserLoginOpen" type="radio" value="0"<%If Rs("AdUserLoginOpen")=0 Then Response.Write " checked"%>>关闭登录
</td>
</tr>
<tr class="tr_1">
<td colspan="2">新加入的站点默认的审核状态</td>
</tr>
<tr>
<td class="td_r">新加站点默认自动通过审核：</td>
<td>
<input name="SiteAutoPass" type="radio" value="1"<%If Rs("SiteAutoPass")=1 Then Response.Write " checked"%>>是 
<input name="SiteAutoPass" type="radio" value="0"<%If Rs("SiteAutoPass")=0 Then Response.Write " checked"%>>否
</td>
</tr>
    
<tr class="tr_1">
<td colspan="2">下线广告</td>
</tr>
<tr>
<td class="td_r">下线广告ID：</td>
<td><input name="LowReg_Ad_ID" type="text" value="<%=Rs("LowReg_Ad_ID")%>">      
<%Sql="Select Count(1) From CFWztg_Ad Where ID="&Rs("LowReg_Ad_ID")
Set Rs2=Conn.Execute(Sql)
If Rs2(0)=0 And Rs("LowReg_Ad_ID")<>0 Then Response.write "<font color='#ff0000'>你设置的下线广告ID不存在,请重新设置</font>"
Rs2.Close
%>
(为0时前用户首页不出现推荐，需要时填写下线广告ID)
</td>
</tr>
   
<tr class="tr_1">
<td colspan="2">注册送钱</td>
</tr>
<tr>
<td class="td_r">网站主：</td>
<td><input type="text" name="UserFirstDot" id="UserFirstDot" value="<%=Rs("UserFirstDot")%>">元(注：填写0则不赠送)</td>
</tr>
<tr>
<td class="td_r">广告主：</td>
<td><input type="text" name="AdUserFirstDot" id="AdUserFirstDot" value="<%=Rs("AdUserFirstDot")%>">元(注：填写0则不赠送)</td>
</tr>
    
    
<tr class="tr_1">
<td colspan="2">前台伪静态</td>
</tr>
<tr>
<td class="td_r">伪静态：</td>
<td><input name="SiteHtml" type="radio" value="1"<%If Rs("SiteHtml")=1 Then Response.Write " checked"%>>
开启
<input name="SiteHtml" type="radio" value="0"<%If Rs("SiteHtml")=0 Then Response.Write " checked"%>>
关闭 (默认关闭，如开启需站点支持伪静态功能，如用Microsoft IIS URL伪静态软件请去掉web.config的伪静态规则的注解才生效。还支持ISAPI_Rewrite的伪静态软件。)</td>
</tr>

<tr class="tr_1">
<td colspan="2">用户登录验证码</td>
</tr>
<tr>
<td class="td_r">用户登录验证码：</td>
<td><input name="LoginCheckCode" type="radio" value="0"<%If Rs("LoginCheckCode")=0 Then Response.Write " checked"%>>
关闭
<input name="LoginCheckCode" type="radio" value="1"<%If Rs("LoginCheckCode")=1 Then Response.Write " checked"%>>
开启 (注:一般关闭，如果开启模板上没有输入处，请自己加上验证码图片和输入框)</td>
</tr>
    
<tr class="tr_1">
<td colspan="2">上传图片组件类型</td>
</tr>
<tr>
<td class="td_r">上传图片组件：</td>
<td><input name="UploadType" type="radio" value="1"<%If Rs("UploadType")=1 Then Response.Write " checked"%>>
无组件上传(不需安装,推荐使用,默认200K以内)
<input name="UploadType" type="radio" value="2"<%If Rs("UploadType")=2 Then Response.Write " checked"%>>
AspUpload组件上传<%
on error resume next
set TestObj=server.CreateObject ("Persits.Upload.1")
If -2147221005 <> Err then
Response.write "(已安装,版本:"&TestObj.version&")"
Else
Response.write "(未安装)"
End If
%></td>
</tr>
    
<tr class="tr_1">
<td colspan="2">已登录用户打开首页自动登录后台</td>
</tr>
<tr>
<td class="td_r">已登录用户打开首页自动登录后台：</td>
<td><input name="AutoLogin" type="radio" value="0"<%If Rs("AutoLogin")=0 Then Response.Write " checked"%>>
否
<input name="AutoLogin" type="radio" value="1"<%If Rs("AutoLogin")=1 Then Response.Write " checked"%>>
是</td>
</tr>
    
<tr> 
<td></td>
<td>  
<input type="submit" name="submit" id="sysmodify" value="修改" class="btn btn-primary">
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

