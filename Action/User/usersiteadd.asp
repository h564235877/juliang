<%
'乘风广告联盟系统 Sql版
'作者QQ：178575
'作者EMail：yliangcf@163.com
'作者网站：http://www.qqcf.com
'详细简介：http://www.qqcf.com/cfwztg.htm
'上面有程序在线演示，安装演示，使用疑难解答，最新版本下载等内容
'因为这些内容可能时常更新，就没有放在程序里，请自己上网站查看
%>

<script language=JavaScript>
$(function(){

$("#submit").click(function(){

siteurl = $('#siteurl').val().toLowerCase();


if(siteurl == ""){
 alert('请填写域名', '', function () {$("#siteurl").focus();});
 return false;
}

if(isDomain(siteurl)==false){
 alert('域名格式不正确，填写如a.com的主域名即可', '', function () {$("#siteurl").focus();});
 return false;
}
 
if(siteurl.substring(0,4)=="www."){
 alert('域名不要以www.开头', '', function () {$("#siteurl").focus();});
 return false;
}
 
if($('#siteclassid').val()==""){
 alert('请选择分类', '', function () {$("#siteclassid").focus();});
 return false;
}
 
});

});

</script>

<a href="?Action=usersitelist" class="actionBtn" style="margin-top:10px;"><i class="mdi mdi-keyboard-return"></i>返回列表</a>

<form name="form_usersite" method="post" onsubmit="return usersiteaddcheck()" action="../../User.aspx?Action=usersiteaddsave&RefUrl=<%=Server.URLEncode(Request.ServerVariables("Http_Referer"))%>">
<table class="tb_1"><tr class="tr_1"> 
      <td colspan="2">增加审核网址</td>
    </tr>
    <tr> 
      <td width="80" class="td_r">网站域名：</td>
      <td><input name="siteurl" id="siteurl" type="text" size="30"> 
        <br>
        (说明：这里填写主域名就可以，如qqcf.com，在主域名的所有二级域名下有效!)
		</td>
    </tr>
    <tr> 
      <td class="td_r">网站分类：</td>
      <td>
<select name="siteclassid" id="siteclassid">
<option selected value="">请选择分类</option>
<%
Sql="Select * From CFWztg_SiteClass Order By SiteClassName"
Set Rs = Server.CreateObject("ADODB.Recordset")
Rs.open Sql,Conn,1,1
While Not Rs.Eof
%>
<option value="<%=Rs("ID")%>"><%=Rs("SiteClassName")%></option>
<%
Rs.MoveNext
Wend
%>
</select>
      </td>
    </tr>
    <tr> 
      <td></td>
	  <td>
          <input type="submit" name="submit" id="submit" value="增加" class="btn btn-primary">
      </td>
    </tr>
</table></form>