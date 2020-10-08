<%
'乘风广告联盟系统 Sql版
'作者QQ：178575
'作者EMail：yliangcf@163.com
'作者网站：http://www.qqcf.com
'详细简介：http://www.qqcf.com/cfwztg.htm
'上面有程序在线演示，安装演示，使用疑难解答，最新版本下载等内容
'因为这些内容可能时常更新，就没有放在程序里，请自己上网站查看
%>


  
<form name="form2" method="post" action="../../AdminUser.aspx?Action=sysmodifysave&Label=<%=Label%>">
<table class="tb_1">



<tr class="tr_1"> 
<td colspan="2" >系统数据清理规则</td>
</tr>
<tr> 
<td class="td_r" width="300">系统最大保留来源数：</td>
<td><input name="LyMaxTotal" type="text" id="LyMaxTotal" value="<%=Rs("LyMaxTotal")%>">
条(注:一般在10000-50000之间)</td>
</tr>
<tr> 
<td class="td_r">系统最大保留有效点击IP数：</td>
<td><input name="IpMaxTotal" type="text" id="IpMaxTotal" value="<%=Rs("IpMaxTotal")%>">
条(注:一般在100000-200000之间)</td>
</tr>
<tr> 
<td class="td_r">系统最大保留无效点击IP数：</td>
<td><input name="InvalidIpMaxTotal" type="text" id="InvalidIpMaxTotal" value="<%=Rs("InvalidIpMaxTotal")%>">
条(注:一般在100000-200000之间)</td>
</tr>
<tr> 
<td class="td_r">搜索关键字最大保留数：</td>
<td><input name="SearchKeywordMaxTotal" type="text" id="SearchKeywordMaxTotal" value="<%=Rs("SearchKeywordMaxTotal")%>">
条(注:一般在10000-50000之间)</td>
</tr>


<tr class="tr_1"> 
<td colspan="2">数据库自动清理</td>
</tr>

<tr> 
<td class="td_r">自动清理设置最大保留外数据的方式：</td>
<td><input name="DataDelType" type="text" id="DataDelType" value="<%=Rs("DataDelType")%>">
<br />
(
默认为-1，注：-1为自动，每天在设置是时分秒时间清理，0为禁止自动清理，正数为间隔最后时间多少分钟清理
<%If Rs("DataDelType")>0 And Rs("DataDelType")<1440 Then Response.write "<br><font color='#FF0000'>设置的间隔时间不要过短，建议在1440分钟或以上"%>
)</td>
</tr>

<tr> 
<td class="td_r">自动清理设置最大保留外数据最后的执行时间：</td>
<td><input name="DataDelLastTime" type="text" id="DataDelLastTime" value="<%=Rs("DataDelLastTime")%>">
<br />(<a href="javascript:" onclick="document.getElementById('DataDelLastTime').value='<%=year(now)&"-"&month(now)&"-"&day(now)&" 3:00:00"%>';">设置</a>，最好设置在在流量小的时段，比如凌晨3点整)		</td>
</tr>

<tr> 
<td class="td_r">自动清理日志的方式：</td>
<td><input name="DbLogDelType" type="text" id="DbLogDelType" value="<%=Rs("DbLogDelType")%>">
<br />
(
默认为-1，注：-1为自动，每天在设置是时分秒时间清理，0为禁止自动清理，正数为间隔最后时间多少分钟清理
<%If Rs("DbLogDelType")>0 And Rs("DbLogDelType")<1440 Then Response.write "<br><font color='#FF0000'>设置的间隔时间不要过短，建议在1440分钟或以上"%>
)</td>
</tr>

<tr> 
<td class="td_r">自动清理日志最后的执行时间：</td>
<td><input name="DbLogDelLastTime" type="text" id="DbLogDelLastTime" value="<%=Rs("DbLogDelLastTime")%>">
<br />
(<a href="javascript:" onclick="document.getElementById('DbLogDelLastTime').value='<%=year(now)&"-"&month(now)&"-"&day(now)&" 3:05:00"%>';">设置</a>，最好设置在在流量小的时段，比如凌晨3点05分)		</td>
</tr>

<tr class="tr_1"> 
<td colspan="2">数据库自动备份</td>
</tr>
<tr> 
<td class="td_r">自动备份数据库的方式：</td>
<td><input name="DbBackupType" type="text" id="DbBackupType" value="<%=Rs("DbBackupType")%>">
<br />
(
默认为-3，注：负数为自动备份,负数的数字代表保留最近几天的备份,最大10天，0为禁止自动备份，正数为间隔最后时间多少分钟备份
<%If Rs("DbBackupType")>0 And Rs("DbBackupType")<1440 Then Response.write "<br><font color='#FF0000'>设置的间隔时间不要过短，建议在1440分钟或以上"%>
)</td>
</tr>

<tr> 
<td class="td_r">自动备份最后的执行时间：</td>
<td><input name="DbBackupLastTime" type="text" id="DbBackupLastTime" value="<%=Rs("DbBackupLastTime")%>">
<br />(<a href="javascript:" onclick="document.getElementById('DbBackupLastTime').value='<%=year(now)&"-"&month(now)&"-"&day(now)&" 3:10:00"%>';">设置</a>，最好设置在在流量小的时段，比如凌晨3点10分)</td>
</tr>

<tr class="tr_1"> 
<td colspan="2">数据记录开关</td>
</tr>

<tr> 
<td class="td_r">广告日统计：</td>
<td>
<input type="radio" name="DayTj" id="DayTj"  value="1"<%if rs("DayTj")=1 then Response.write " checked"%>>是
<input type="radio" name="DayTj" id="DayTj"  value="0"<%if rs("DayTj")=0 then Response.write " checked"%>>否
</td>
</tr>

<tr> 
<td class="td_r">广告小时统计：</td>
<td>
<input type="radio" name="HourTj" id="HourTj"  value="1"<%if rs("HourTj")=1 then Response.write " checked"%>>是
<input type="radio" name="HourTj" id="HourTj"  value="0"<%if rs("HourTj")=0 then Response.write " checked"%>>否
</td>
</tr>

<tr> 
<td class="td_r">地区统计：</td>
<td>
<input type="radio" name="AreaTj" id="AreaTj"  value="1"<%if rs("AreaTj")=1 then Response.write " checked"%>>是
<input type="radio" name="AreaTj" id="AreaTj"  value="0"<%if rs("AreaTj")=0 then Response.write " checked"%>>否
</td>
</tr>

<tr> 
<td class="td_r">访问来源统计：</td>
<td>
<input type="radio" name="LyTj" id="LyTj"  value="1"<%if rs("LyTj")=1 then Response.write " checked"%>>是
<input type="radio" name="LyTj" id="LyTj"  value="0"<%if rs("LyTj")=0 then Response.write " checked"%>>否
</td>
</tr>

<tr> 
<td class="td_r">客户端信息统计：</td>
<td>
<input type="radio" name="ClientTj" id="ClientTj"  value="1"<%if rs("ClientTj")=1 then Response.write " checked"%>>是
<input type="radio" name="ClientTj" id="ClientTj"  value="0"<%if rs("ClientTj")=0 then Response.write " checked"%>>否
</td>
</tr>

<tr> 
<td class="td_r">页面宽度统计：</td>
<td>
<input type="radio" name="WebWidthTj" id="WebWidthTj"  value="1"<%if rs("WebWidthTj")=1 then Response.write " checked"%>>是
<input type="radio" name="WebWidthTj" id="WebWidthTj"  value="0"<%if rs("WebWidthTj")=0 then Response.write " checked"%>>否
</td>
</tr>

<tr> 
<td class="td_r">搜索引擎关键字统计：</td>
<td>
<input type="radio" name="SearchKeywordTj" id="SearchKeywordTj"  value="1"<%if rs("SearchKeywordTj")=1 then Response.write " checked"%>>是
<input type="radio" name="SearchKeywordTj" id="SearchKeywordTj"  value="0"<%if rs("SearchKeywordTj")=0 then Response.write " checked"%>>否
</td>
</tr>

<tr> 
<td class="td_r">非正常点击错误类型记录保存：</td>
<td>
<input type="radio" name="ClickFlagTj" id="ClickFlagTj"  value="1"<%if rs("ClickFlagTj")=1 then Response.write " checked"%>>是
<input type="radio" name="ClickFlagTj" id="ClickFlagTj"  value="0"<%if rs("ClickFlagTj")=0 then Response.write " checked"%>>否
</td>
</tr>
    

<tr class="tr_1"> 
<td colspan="2">数据保存的天数</td>
</tr>

<tr> 
<td class="td_r">小时统计保留天数：</td>
<td>
<input name="HourKeepDay" type="text" id="HourKeepDay" value="<%=Rs("HourKeepDay")%>">天
</td>
</tr>

<tr> 
<td class="td_r">每日统计记录保留的天数：</td>
<td>
<input name="DayKeepDay" type="text" id="DayKeepDay" value="<%=Rs("DayKeepDay")%>">天
</td>
</tr>

<tr> 
<td class="td_r">客户端信息统计记录保留的天数：</td>
<td>
<input name="ClientKeepDay" type="text" id="ClientKeepDay" value="<%=Rs("ClientKeepDay")%>">天
</td>
</tr>

<tr> 
<td class="td_r">IP地区统计记录保留的天数：</td>
<td>
<input name="IpAreaKeepDay" type="text" id="IpAreaKeepDay" value="<%=Rs("IpAreaKeepDay")%>">天
</td>
</tr>

<tr> 
<td class="td_r">页面宽度统计记录保留的天数：</td>
<td>
<input name="WebWidthKeepDay" type="text" id="WebWidthKeepDay" value="<%=Rs("WebWidthKeepDay")%>">天
</td>
</tr>

<tr> 
<td class="td_r">非正常点击错误类型记录保存的天数：</td>
<td>
<input name="ClickFlagKeepDay" type="text" id="ClickFlagKeepDay" value="<%=Rs("ClickFlagKeepDay")%>">天
</td>
</tr>

<tr> 
<td class="td_r">其它统计保留的天数：</td>
<td>
<input name="OtherKeepDay" type="text" id="OtherKeepDay" value="<%=Rs("OtherKeepDay")%>">天
</td>
</tr>
<tr> 
<td>&nbsp;</td>
<td>
<input type="submit" name="submit" value="修改" class="btn btn-primary">

</td>
</tr>
</table>
</form>
