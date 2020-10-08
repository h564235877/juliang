<%
'乘风广告联盟系统 Sql版
'作者QQ：178575
'作者EMail：yliangcf@163.com
'作者网站：http://www.qqcf.com
'详细简介：http://www.qqcf.com/cfwztg.htm
'上面有程序在线演示，安装演示，使用疑难解答，最新版本下载等内容
'因为这些内容可能时常更新，就没有放在程序里，请自己上网站查看
%>

<form name="form2" method="post" action="../../AdminUser.aspx?Action=sysmodifysave&label=ipblacklist">
<table class="tb_1">
<tr class="tr_1"> 
<td colspan="2" >IP黑名单防御</td>
</tr>

<tr>
<td class="td_r" width="350">IP黑名单永久表开启防御：</td>
<td>
<input type="radio" name="IpBlackListOpen" value="1"<%if rs("IpBlackListOpen")=1 then Response.write " checked"%>>是
<input type="radio" name="IpBlackListOpen" value="0"<%if rs("IpBlackListOpen")=0 then Response.write " checked"%>>否
</td>
</tr>

<tr>
<td class="td_r">无效IP表里的刷IP的单个类型加入IP临时黑名单防御：</td>
<td>
<input type="radio" name="IpBlackFlagOpen" value="1"<%if rs("IpBlackFlagOpen")=1 then Response.write " checked"%>>是
<input type="radio" name="IpBlackFlagOpen" value="0"<%if rs("IpBlackFlagOpen")=0 then Response.write " checked"%>>否
</td>
</tr>


<tr>
<td class="td_r">无效IP表里的刷IP的C段类型加入IP临时黑名单防御：</td>
<td>
<input type="radio" name="IpSegmentBlackFlagOpen" value="1"<%if rs("IpSegmentBlackFlagOpen")=1 then Response.write " checked"%>>是
<input type="radio" name="IpSegmentBlackFlagOpen" value="0"<%if rs("IpSegmentBlackFlagOpen")=0 then Response.write " checked"%>>否
</td>
</tr>

<tr> 
<td></td>
<td>  
<input type="submit" name="submit" id="submit" value="修改" class="btn btn-primary"></td>
</tr>
</table>
</form>
