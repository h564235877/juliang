<%
'乘风广告联盟系统 Sql版
'作者QQ：178575
'作者EMail：yliangcf@163.com
'作者网站：http://www.qqcf.com
'详细简介：http://www.qqcf.com/cfwztg.htm
'上面有程序在线演示，安装演示，使用疑难解答，最新版本下载等内容
'因为这些内容可能时常更新，就没有放在程序里，请自己上网站查看
%>

<form name="form2" method="post" action="../../AdminUser.aspx?Action=sysmodifysave&label=portmap">
<table class="tb_1">
<tr class="tr_1"> 
<td colspan="2" >CDN或云主机</td>
</tr>
<tr> 
<td class="td_r" width="180">是否开启CDN或云主机：</td>
<td>
<input type="radio" name="portmap" id="portmap_1" value="1"<%if rs("portmap")=1 then Response.write " checked"%>>是
<input type="radio" name="portmap" id="portmap_0" value="0"<%if rs("portmap")=0 then Response.write " checked"%>>否
</td>
</tr>

<tr>
<td class="td_r">CDN是否需要开启提示：</td>
<td>
<%
if AdScriptShowDomain="" Then
 Response.write "<script src='../../cf.aspx?Action=cdncheck'></script>"
Else
 Response.write "<script src='"&AdScriptShowDomain&"cf.aspx?Action=cdncheck'></script>"
End If
%>
</td>
</tr>

<tr> 
<td></td>
<td>  
<input type="submit" name="submit" id="submit" value="修改" class="btn btn-primary"></td>
</tr>
</table>
</form>
