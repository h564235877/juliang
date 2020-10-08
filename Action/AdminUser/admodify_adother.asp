,<%
'乘风广告联盟系统 Sql版
'作者QQ：178575
'作者EMail：yliangcf@163.com
'作者网站：http://www.qqcf.com
'详细简介：http://www.qqcf.com/cfwztg.htm
'上面有程序在线演示，安装演示，使用疑难解答，最新版本下载等内容
'因为这些内容可能时常更新，就没有放在程序里，请自己上网站查看
%>

<table class="tb_1" id="tbu">
<%If Rs("Ad_Class") = 3 Or Rs("Ad_Class") = 4 Or Rs("Ad_Class") = 7 Then '普通文字、普通图片或富媒体%>
<tr class="tr_1">
<td colspan="2">广告隐藏代码</td>
</tr>

<tr id="e_1"> 
<td class="td_r">广告隐藏代码：</td>
<td>
<textarea name="AdHiddenCode" style="width:600px;height:80px;"><%=Rs("AdHiddenCode")%></textarea>

<br>
可以加入第三方统计记录(必须不以&lt;script开头和不以&lt;/script&gt;结尾,如需隐藏可自己做成隐藏代码,如加错广告可能不显示,支持代码内接受广告id参数{ad_id},用户名参数{username}</td>
</tr>
<%End If%>

<tr class="tr_1">
<td colspan="2">其它</td>
</tr>

<tr> 
<td class="td_r" width="330">转向到广告页后从广告页看到的来源是：</td>
<td>
<input type="radio" name="AdWebLookLy" value="0"<%If Rs("AdWebLookLy")=0 Then Response.write " checked"%>>JS转向,看到来源为空
<input type="radio" name="AdWebLookLy" value="1"<%If Rs("AdWebLookLy")=1 Then Response.write " checked"%>>JS转向,看到来源为联盟
<input type="radio" name="AdWebLookLy" value="2"<%If Rs("AdWebLookLy")=2 Then Response.write " checked"%>>302转向,看到来源为广告投放页
(默认302转向)</td>
</tr>
<tr>
<td class="td_r">中转页上投放代码：</td>
<td><textarea name="ZZWebCode"  style="width:600px;height:110px;"><%=Rs("ZZWebCode")%></textarea>
<br />默认为空不投放,可放第三方统计代码必须以&lt;script开头和以&lt;/script&gt;结尾，非302转向时可用，不用投放代码则优先用302转向，注册版功能</td>
</tr>

<tr> 
<td class="td_r">直链文字或图片取客户端信息：</td>
<td>
<input type="radio" name="ZLClientInfo" value="1"<%If Rs("ZLClientInfo")=1 Then Response.write " checked"%>>获取
<input type="radio" name="ZLClientInfo" value="0"<%If Rs("ZLClientInfo")=0 Then Response.write " checked"%>>不获取
(默认不获取)</td>
</tr>
	
<tr>
<td class="td_r">最初发布时的时间：</td>
<td><input name="AddTime" type="text" value="<%=Rs("AddTime")%>"></td>
</tr>

<tr>
<td class="td_r">列表排序数字：</td>
<td><input name="ListID" type="text" value="<%=Rs("ListID")%>">(大于0有置顶的功能，越大越在列表上面)</td>
</tr>

<tr> 
<td>&nbsp;</td>
<td>
<input type="submit" name="adotherbtn" id="adotherbtn" value="修改" class="btn btn-primary">
          　 
</td>
</tr>
</table>

