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

$("#hostset").click(function(){

 var AdScriptShowDomain = $('#AdScriptShowDomain').val();
 var AdScriptClickDomain = $('#AdScriptClickDomain').val();
 var AdZlDomain = $('#AdZlDomain').val();
 var AdSysWebDomain = $('#AdSysWebDomain').val();

 if(AdScriptShowDomain!=""&&((AdScriptShowDomain.substr(0,2)!="//"&&AdScriptShowDomain.substr(0,7)!="http://"&&AdScriptShowDomain.substr(0,8)!="https://")||AdScriptShowDomain.substr(AdScriptShowDomain.length-1)!="/")){
  alert('Script类广告显示代码授权域名格式有误', '', function () {$("#AdScriptShowDomain").focus();});
  return false;
 }
 
 if(AdScriptShowDomain!=""&&AdScriptClickDomain==""){
  alert('填写了 Script类广告显示代码授权域名 则必须同时填写此项 Script类广告点击代码授权域名!', '', function () {$("#AdScriptClickDomain").focus();});
  return false;
 }
 
 if(AdScriptClickDomain!=""&&((AdScriptClickDomain.substr(0,7)!="http://"&&AdScriptClickDomain.substr(0,8)!="https://")||AdScriptClickDomain.substr(AdScriptClickDomain.length-1)!="/")){
  alert('Script类广告点击代码授权域名格式有误', '', function () {$("#AdScriptClickDomain").focus();});
  return false;
 }
 
 if(AdZlDomain!=""&&((AdZlDomain.substr(0,7)!="http://"&&AdZlDomain.substr(0,8)!="https://")||AdZlDomain.substr(AdZlDomain.length-1)!="/")){
  alert('直接类广告点击代码授权域名格式有误', '', function () {$("#AdZlDomain").focus();});
  return false;
 }

 if(AdScriptShowDomain!=""&&AdSysWebDomain==""){
  alert('填写了Script类广告显示代码授权域名则必须同时填写此项 联盟前台访问的授权域名', '', function () {$("#AdSysWebDomain").focus();});
  return false;
 }
 
 if(AdSysWebDomain!=""){
  if(isDomain(AdSysWebDomain)==false){
   alert('域名格式不正确，填写如a.com的主域名即可', '', function () {$("#AdSysWebDomain").focus();});
   return false;
  }
  
  if(AdSysWebDomain.substring(0,4)=="www."){
   alert('域名不要以www.开头', '', function () {$("#AdSysWebDomain").focus();});
   return false;
  }
 }

});

});
</script>
   

<table class="tb_1">
<form name="formhost" method="post" action="../../AdminUser.aspx?Action=sysmodifysave&Label=<%=Label%>" onsubmit="return hostsetcheck();">
 <tr class="tr_1">
      <td colspan="2">获取广告代码时的域名设置</td>
    </tr>
    <tr>
      <td class="td_r" width="260">Script类广告获取代码域名：</td>
      <td><input name="AdScriptShowDomain" type="text" id="AdScriptShowDomain" value="<%=rs("AdScriptShowDomain")%>" size="70">
	  <br />(默认为空则和前台域名一样，此域名可任意填写不用授权，请以//自适应格式或http://或https://开头，以/结尾)</td>
    </tr>
    <tr>
      <td class="td_r">Script类广告点击的链接里的授权域名：</td>
      <td><input name="AdScriptClickDomain" type="text" id="AdScriptClickDomain" value="<%=rs("AdScriptClickDomain")%>" size="70">
	  <br />(默认为空，如果上面的Script显示域名填写了，此处应该填写上授权域名，请以http://或https://开头，以/结尾)</td>
    </tr>
    <tr>
      <td class="td_r">直接类广告点击代码授权域名：</td>
      <td><input name="AdZlDomain" type="text" id="AdZlDomain" value="<%=rs("AdZlDomain")%>" size="70">
	  <br />(默认为空则和前台域名一样，如果填写其它授权域名，请以http://或https://开头，以/结尾)</td>
    </tr>
	
    <tr>
      <td class="td_r">联盟前台访问的授权域名：</td>
      <td><input name="AdSysWebDomain" type="text" id="AdSysWebDomain" value="<%=rs("AdSysWebDomain")%>" size="70">
	  <br />(默认为空，如果上面的Script显示域名填写了，这里也应该填写上授权域名，例子联盟如果是www.a.com和a.com访问填写a.com就可以，是其它二级域名则按实际填写)</td>
    </tr>


 <tr class="tr_1">
      <td colspan="2">负载均衡服务器设置</td>
    </tr>
    <tr>
      <td class="td_r">负载均衡服务器访问地址：</td>
      <td>
<input name="CacheServer" type="text" id="CacheServer" value="<%=rs("CacheServer")%>" size="70">
<br />
注:默认为空，如果只有一个WEB站点缓存服务器不需要同步，留空即可。
<br />
如果有多个WEB站点请填写每个站点(包含此台服务器)的主页访问地址，以http://或https://开头,以/结尾，每个中间以英文逗号,分隔
<br />
填写了多个服务器时，上面的获取广告代码时的域名里的"Script类广告获取代码域名"要填写，防止获取到的广告代码里带端口号和上传的文件复制的地址带端口号
      </td>
    </tr>
    
<%
CacheServer=RsSet("CacheServer")
CheckTime  = DateDiff("s", "1970-1-1", Now)
CheckCode  = Md5(CheckTime & RsSet("SysCode"), 2)
If CacheServer <> "" Then
%>
<tr>
  <td class="td_r">负载均衡站点运行检测结果：</td>
  <td>
<%
MyArray = Split(CacheServer, ",")

Response.Write("共" & UBound(MyArray) + 1 & "个站点<br>")
 For I = 0 To UBound(MyArray)
 Response.Write("第" & I + 1 & "个:<iframe scrolling='no' width='450' height='16' src='" & MyArray(I) & "cf.aspx?Action=cachecheck&CacheServer=" & MyArray(I) & "&CheckTime=" & CheckTime & "&CheckCode=" & CheckCode & "' frameborder='0' marginheight=0 marginwidth=0></iframe><br>")
 Next
%>
</td>
</tr>
<%end if%>
    
    
    <tr> 
	<td></td>
      <td>  
          <input type="submit" name="hostset" id="hostset" value="修改" class="btn btn-primary">
     </td>
    </tr>
</form>


</table>
