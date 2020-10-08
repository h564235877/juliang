<%
'乘风广告联盟系统 Sql版
'作者QQ：178575
'作者EMail：yliangcf@163.com
'作者网站：http://www.qqcf.com
'详细简介：http://www.qqcf.com/cfwztg.htm
'上面有程序在线演示，安装演示，使用疑难解答，最新版本下载等内容
'因为这些内容可能时常更新，就没有放在程序里，请自己上网站查看
%>

<script>
$(function(){

$("#submit").click(function(){

if ($('#Ip').val()==""){
 alert('Ip必须填写', '', function () {$("#Ip").focus();});
 return false;
}

if ($('#IpType').val()==""){
 alert('请选择分类', '', function () {$("#IpType").focus();});
 return false;
}

return true;

});


});
</script>

<a href="<%=ChkStr(Request.ServerVariables("Http_Referer"),1)%>" class="actionBtn"><i class="mdi mdi-keyboard-return"></i>返回列表</a>

<form id="form_infoadd" name="form_infoadd" method="post" action="../../AdminUser.aspx?Action=ipblacklistaddsave&RefUrl=<%=Server.URLEncode(Request.ServerVariables("Http_Referer"))%>" onsubmit="return infoaddcheck()">
<table class="tb_1">
<tr class="tr_1"> 
<td colspan="2">IP黑名单手工增加</td>
</tr>
<tr>
  <td class="td_r">IP地址：</td>
  <td><input name="Ip" type="text" id="Ip" size="30">*</td>
</tr>
<tr> 
<td width="100" class="td_r">黑名单类型：</td>
<td>
<select name="IpType" id="IpType">
<option selected value="">请选择分类</option>
<option value="1">封单个IP</option>
<option  value="2">封IP的C段</option>
</select>
*</td>
</tr>
<tr> 
  <td></td>
  <td>
  <input type="submit" name="submit" id="submit" value="增加" class="btn btn-primary">
  </td>
</tr>
</table></form>