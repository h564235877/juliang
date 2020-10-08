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
 $("#adguardcheatbtn").click(function(){
  AllowClickTotal=parseInt($('#AllowClickTotal').val());
  AllowAdUserClickTotal=parseInt($('#AllowAdUserClickTotal').val());


  if(AllowAdUserClickTotal < AllowClickTotal){
   alert('填写的对广告主同一IP在上面设置的时间内最多能点击或展示多少次有效的值需大于或等于对网站主同一IP在上面设置的时间内最多能点击或展示多少次有效的值', '', function () {$("#AllowAdUserClickTotal").focus();});
   return false;
  }


 })
});
</script>

<table class="tb_1" id="tbu">
<tr class="tr_1">
<td colspan="2">防作弊设置</td>
</tr>
<tr> 
<td width="240"  class="td_r">IP数据库没有的IP点击有效：</td>
<td><input type="radio" name="OtherIpEffect" value="1"<%If Rs("OtherIpEffect")=1 Then Response.write " checked"%>>
是 
<input type="radio" name="OtherIpEffect" value="0"<%If Rs("OtherIpEffect")=0 Then Response.write " checked"%>>
否　*默认为是</td>
</tr>

<tr> 
<td class="td_r">是否允许从本系统内部点击：</td>
<td><input type="radio" name="SysClick" value="1"<%If Rs("SysClick")=1 Then Response.write " checked"%>>
是 
<input type="radio" name="SysClick" value="0"<%If Rs("SysClick")=0 Then Response.write " checked"%>>
否　*默认为是</td>
</tr>

<tr> 
<td class="td_r">IP防作弊的级别：</td>
<td>
<input type="radio" name="IpGuardLevel" value="1"<%If Rs("IpGuardLevel")=1 Then Response.write " checked"%>>
严格(一个ip点击或显示所有广告只计第一次)<br />
<input type="radio" name="IpGuardLevel" value="2"<%If Rs("IpGuardLevel")=2 Then Response.write " checked"%>>
较严格(一个ip点击或显示不同广告主的广告, 每个广告主计一次)<br />
<input type="radio" name="IpGuardLevel" value="3"<%If Rs("IpGuardLevel")=3 Then Response.write " checked"%>>
宽松(一个ip点击或显示所有不同广告, 每个广告计一次)<br />
</td>
</tr>

<tr> 
<td class="td_r">相同IP点第二个不同广告时：</td>
<td><input type="radio" name="IpDiffAdEffect" value="1"<%If Rs("IpDiffAdEffect")=1 Then Response.write " checked"%>>
是
<input type="radio" name="IpDiffAdEffect" value="0"<%If Rs("IpDiffAdEffect")=0 Then Response.write " checked"%>>
否 默认否 (是：广告主计费网站主不计，否：两者都不计)</td>
</tr>

<tr> 
<td class="td_r">点击防IP段：</td>
<td><input type="radio" name="IpSegmentGuard" value="1"<%If Rs("IpSegmentGuard")=1 Then Response.write " checked"%>>
开启
<input type="radio" name="IpSegmentGuard" value="0"<%If Rs("IpSegmentGuard")=0 Then Response.write " checked"%>>
关闭 (默认开启,防止换ip点击,相同ip段点击过多视为无效点击)</td>
</tr>

<tr> 
<td class="td_r">是否把IP转换成对应的地区：</td>
<td><input type="radio" name="IpAreaSwitch" value="1"<%If Rs("IpAreaSwitch")=1 Then Response.write " checked"%>>
是
<input type="radio" name="IpAreaSwitch" value="0"<%If Rs("IpAreaSwitch")=0 Then Response.write " checked"%>>
否</td>
</tr>
	
<tr> 
<td class="td_r">广告显示后多少秒后点击才有效：</td>
<td><input name="AdShowAfterToClickTime" type="text" value="<%=Rs("AdShowAfterToClickTime")%>">（默认为0）</td>
</tr>

<tr> 
<td class="td_r">广告点击后出现多少秒钟的中转页：</td>
<td><input name="ShowClickInfoTime" type="text" value="<%=Rs("ShowClickInfoTime")%>">（默认为0）</td>
</tr>

<tr class="tr_1">
<td colspan="2">防作弊时间设置</td>
</tr>

<tr> 
<td class="td_r">同一IP多少分钟后可以再次点击此广告有效：</td>
<td><input name="EffectTime" type="text" value="<%=Rs("EffectTime")%>">（默认为1440，注：0表示不防IP,-1表示不防IP且不记录IP在表里）</td>
</tr>

<tr> 
<td class="td_r">同一电脑多少分钟后可以再次点击或展示此广告有效：</td>
<td><input name="EffectTime_Cookie" type="text" value="<%=Rs("EffectTime_Cookie")%>">（默认为1440，注：0表示不防Cookie）</td>
</tr>

<tr class="tr_1">
<td colspan="2">按IP或PV计费设置</td>
</tr>

<tr> 
<td class="td_r">对网站主同一IP在上面设置的时间内最多能点击或展示多少次有效：</td>
<td><input name="AllowClickTotal" id="AllowClickTotal" type="text" value="<%=Rs("AllowClickTotal")%>">(默认为1次，1为按IP计费，大于1为按PV计费，填写的大于1的数值为一个IP最多可按PV计费多少次)</td>
</tr>

<tr> 
<td class="td_r">对广告主同一IP在上面设置的时间内最多能点击或展示多少次有效：</td>
<td><input name="AllowAdUserClickTotal" id="AllowAdUserClickTotal" type="text" value="<%=Rs("AllowAdUserClickTotal")%>">(默认为1次，1为按IP扣费，大于1为按PV扣费，填写的大于1的数值为一个IP最多可按PV扣费多少次)</td>
</tr>


<tr class="tr_1">
<td colspan="2">点击确认设置</td>
</tr>

<tr> 
<td class="td_r">点击类广告需多少次确认有效：</td>
<td><input name="AdAffirmTotal" type="text" value="<%=Rs("AdAffirmTotal")%>">
(默认为0，不需确认点击就有效)</td>
</tr>

	
<tr class="tr_1">
<td colspan="2">PC设备上的防作弊辅助设置</td>
</tr>
<tr> 
<td class="td_r">投放页面最小打开的页面宽度：</td>
<td><input name="WebMinWidth" type="text" value="<%=Rs("WebMinWidth")%>">
(默认为100，注：0表示不判断)</td>
</tr>
	
<tr> 
<td class="td_r">投放页面最大打开的页面宽度：</td>
<td><input name="WebMaxWidth" type="text" value="<%=Rs("WebMaxWidth")%>">
(默认为-1，注：0表示不判断,-1表示自动判断)</td>
</tr>

<tr> 
<td class="td_r">投放页面最小打开的页面高度：</td>
<td><input name="WebMinHeight" type="text" value="<%=Rs("WebMinHeight")%>">
(默认为100，注：0表示不判断)</td>
</tr>
	
<tr> 
<td class="td_r">投放页面最大打开的页面高度：</td>
<td><input name="WebMaxHeight" type="text" value="<%=Rs("WebMaxHeight")%>">
(默认为-1，注：0表示不判断,-1表示自动判断)</td>
</tr>

<tr> 
<td class="td_r">投放页面页部离屏幕顶部的最小距离：</td>
<td><input name="WebMinTop" type="text" value="<%=Rs("WebMinTop")%>">
(默认为-100，注：0表示不判断)</td>
</tr>

<tr> 
<td class="td_r">投放页面页部离屏幕顶部的最大距离：</td>
<td><input name="WebMaxTop" type="text" value="<%=Rs("WebMaxTop")%>">
(默认为-1，注：0表示不判断,-1表示自动判断)</td>
</tr>

<tr> 
<td class="td_r">投放页面页部离屏幕左边的最小距离：</td>
<td><input name="WebMinLeft" type="text" value="<%=Rs("WebMinLeft")%>">
(默认为-100，注：0表示不判断)</td>
</tr>

<tr> 
<td class="td_r">投放页面页部离屏幕左边的最大距离：</td>
<td><input name="WebMaxLeft" type="text" value="<%=Rs("WebMaxLeft")%>">
(默认为-1，注：0表示不判断,-1表示自动判断)</td>
</tr>

<tr> 
<td>&nbsp;</td>
<td>
<input type="submit" name="adguardcheatbtn" id="adguardcheatbtn" value="修改" class="btn btn-primary">
</td>
</tr>

</table>

