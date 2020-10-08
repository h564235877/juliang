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
<td colspan="2">其它设置</td>
</tr>

<tr>
<td class="td_r" width="280">前台开启系统今天和昨天的广告显示量：</td>
<td><input name="WebDataShow" type="text" value="<%=Rs("WebDataShow")%>"><br />
(注：值为-1关闭显示，0或正数为开启显示，数据为在实际显示数上加上的量)</td>
</tr>

<tr>
<td class="td_r">前台开启显示量更新间隔时间：</td>
<td><input name="WebDataSpaceTime" type="text" value="<%=Rs("WebDataSpaceTime")%>">
分钟(默认：30分钟，0为即时)</td>
</tr>

<tr>
<td class="td_r">混合广告保留IP多少分钟：</td>
<td>
<input name="MixAdEffectTime" type="text" id="MixAdEffectTime" value="<%=rs("MixAdEffectTime")%>">
</td>
</tr>
 
<tr>
<td class="td_r">混合广告放在Iframe里自动弹出：</td>
<td>
<input name="MixAdIframeOpen" type="radio" value="1"<%If Rs("MixAdIframeOpen")=1 Then Response.Write " checked"%>>是 
<input name="MixAdIframeOpen" type="radio" value="0"<%If Rs("MixAdIframeOpen")=0 Then Response.Write " checked"%>>否
</td>
</tr>

<tr>
<td class="td_r">是否在中转页上显示扣点信息：</td>
<td>
<input name="DeductClickInfo" type="radio" value="1"<%If Rs("DeductClickInfo")=1 Then Response.Write " checked"%>>是 
<input name="DeductClickInfo" type="radio" value="0"<%If Rs("DeductClickInfo")=0 Then Response.Write " checked"%>>否
</td>
</tr>

<tr>
<td class="td_r">搜索引擎及搜索标识设置：</td>
<td>
<input name="AllSearch" type="text" id="AllSearch" value="<%=rs("AllSearch")%>">
</td>
</tr>

<tr>
<td class="td_r">普通用户注册时是否可以选择开通代理功能：</td>
<td>
<input name="UseAgentReg" type="radio" value="1"<%If Rs("UseAgentReg")=1 Then Response.Write " checked"%>>是 
<input name="UseAgentReg" type="radio" value="0"<%If Rs("UseAgentReg")=0 Then Response.Write " checked"%>>否
</td>
</tr>


<tr class="tr_1"> 
<td colspan="2">网站主获取广告列表</td>
</tr>
<tr>
<td class="td_r">网站主列表打开时默认显示哪项：</td>
<td>
<select name="AdListDefaultClass" id="AdListDefaultClass">
<option value="-7"<%If Rs("AdListDefaultClass")=-7 Then Response.write " selected"%>>轮循富媒体</option>
<option value="-1"<%If Rs("AdListDefaultClass")=-1 Then Response.write " selected"%>>轮循直链</option>
<option value="-4"<%If Rs("AdListDefaultClass")=-4 Then Response.write " selected"%>>轮循普通图片</option>
<option value="8"<%If Rs("AdListDefaultClass")=8 Then Response.write " selected"%>>强弹轮循</option>
<option value="9"<%If Rs("AdListDefaultClass")=9 Then Response.write " selected"%>>退弹轮循</option>

<option value="5"<%If Rs("AdListDefaultClass")=5 Then Response.write " selected"%>>混合文字</option>
<option value="6"<%If Rs("AdListDefaultClass")=6 Then Response.write " selected"%>>混合图片</option>
<option value="10"<%If Rs("AdListDefaultClass")=10 Then Response.write " selected"%>>混合标签云</option>
<option value="11"<%If Rs("AdListDefaultClass")=11 Then Response.write " selected"%>>混合富媒体</option>

<option value="1"<%If Rs("AdListDefaultClass")=1 Then Response.write " selected"%>>直链广告</option>
<option value="2"<%If Rs("AdListDefaultClass")=2 Then Response.write " selected"%>>直图广告</option>
<option value="3"<%If Rs("AdListDefaultClass")=3 Then Response.write " selected"%>>普通文字</option>
<option value="4"<%If Rs("AdListDefaultClass")=4 Then Response.write " selected"%>>普通图片</option>
<option value="7"<%If Rs("AdListDefaultClass")=7 Then Response.write " selected"%>>富媒体</option>
<option value="12"<%If Rs("AdListDefaultClass")=12 Then Response.write " selected"%>>软件下载安装</option>
<option value="0"<%If Rs("AdListDefaultClass")=0 Then Response.write " selected"%>>代理广告</option>
</select>
</td>
</tr>

<tr>
<td class="td_r">网站主列表需要打开的分类数字：</td>
<td>
<input type="checkbox" name="AdListOpenClass" value="-7"<%if Instr(Rs("AdListOpenClass"),",-7,")>0 Then Response.write " checked"%>>轮循富媒体
<input type="checkbox" name="AdListOpenClass" value="-1"<%if Instr(Rs("AdListOpenClass"),",-1,")>0 Then Response.write " checked"%>>轮循直链
<input type="checkbox" name="AdListOpenClass" value="-4"<%if Instr(Rs("AdListOpenClass"),",-4,")>0 Then Response.write " checked"%>>轮循普通图片
<input type="checkbox" name="AdListOpenClass" value="8"<%if Instr(Rs("AdListOpenClass"),",8,")>0 Then Response.write " checked"%>>轮循强弹
<input type="checkbox" name="AdListOpenClass" value="9"<%if Instr(Rs("AdListOpenClass"),",9,")>0 Then Response.write " checked"%>>轮循退弹

<br>
<input type="checkbox" name="AdListOpenClass" value="11"<%if Instr(Rs("AdListOpenClass"),",11,")>0 Then Response.write " checked"%>>混合富媒体
<input type="checkbox" name="AdListOpenClass" value="5"<%if Instr(Rs("AdListOpenClass"),",5,")>0 Then Response.write " checked"%>>混合文字
<input type="checkbox" name="AdListOpenClass" value="6"<%if Instr(Rs("AdListOpenClass"),",6,")>0 Then Response.write " checked"%>>混合图片
<input type="checkbox" name="AdListOpenClass" value="10"<%if Instr(Rs("AdListOpenClass"),",10,")>0 Then Response.write " checked"%>>混合标签云

<br>
<input type="checkbox" name="AdListOpenClass" value="1"<%if Instr(Rs("AdListOpenClass"),",1,")>0 Then Response.write " checked"%>>直链广告
<input type="checkbox" name="AdListOpenClass" value="2"<%if Instr(Rs("AdListOpenClass"),",2,")>0 Then Response.write " checked"%>>直图广告
<input type="checkbox" name="AdListOpenClass" value="3"<%if Instr(Rs("AdListOpenClass"),",3,")>0 Then Response.write " checked"%>>普通文字
<input type="checkbox" name="AdListOpenClass" value="4"<%if Instr(Rs("AdListOpenClass"),",4,")>0 Then Response.write " checked"%>>普通图片
<input type="checkbox" name="AdListOpenClass" value="7"<%if Instr(Rs("AdListOpenClass"),",7,")>0 Then Response.write " checked"%>>富媒体
<input type="checkbox" name="AdListOpenClass" value="12"<%if Instr(Rs("AdListOpenClass"),",12,")>0 Then Response.write " checked"%>>软件下载安装
<input type="checkbox" name="AdListOpenClass" value="0"<%if Instr(Rs("AdListOpenClass"),",0,")>0 Then Response.write " checked"%>>代理广告
</td>
</tr>


<tr class="tr_1"> 
<td colspan="2">网站主可以在前台显示的统计功能：</td>
</tr>
<tr>
<td class="td_r">统计功能：</td>
<td>
<input type="checkbox" name="UserOpenShow" value="daytj"<%if Instr(Rs("UserOpenShow"),",daytj,")>0 Then Response.write " checked"%>>每天统计
<input type="checkbox" name="UserOpenShow" value="hourtj"<%if Instr(Rs("UserOpenShow"),",hourtj,")>0 Then Response.write " checked"%>>每小时统计
<input type="checkbox" name="UserOpenShow" value="iplist"<%if Instr(Rs("UserOpenShow"),",iplist,")>0 Then Response.write " checked"%>>有效点击IP
<input type="checkbox" name="UserOpenShow" value="invalidiplist"<%if Instr(Rs("UserOpenShow"),",invalidiplist,")>0 Then Response.write " checked"%>>无效点击IP
<input type="checkbox" name="UserOpenShow" value="showlist"<%if Instr(Rs("UserOpenShow"),",showlist,")>0 Then Response.write " checked"%>>最近显示

<input type="checkbox" name="UserOpenShow" value="searchkeywordtj"<%if Instr(Rs("UserOpenShow"),",searchkeywordtj,")>0 Then Response.write " checked"%>>搜索关键字
<input type="checkbox" name="UserOpenShow" value="lylist"<%if Instr(Rs("UserOpenShow"),",lylist,")>0 Then Response.write " checked"%>>点击来源
<input type="checkbox" name="UserOpenShow" value="ipareatj"<%if Instr(Rs("UserOpenShow"),",ipareatj,")>0 Then Response.write " checked"%>>IP地区
<input type="checkbox" name="UserOpenShow" value="webwidthtj"<%if Instr(Rs("UserOpenShow"),",webwidthtj,")>0 Then Response.write " checked"%>>网页宽度

<input type="checkbox" name="UserOpenShow" value="othertj"<%if Instr(Rs("UserOpenShow"),",othertj,")>0 Then Response.write " checked"%>>其它统计

<br>



<input type="checkbox" name="UserOpenShow" value="lowview"<%if Instr(Rs("UserOpenShow"),",lowview,")>0 Then Response.write " checked"%>>CPA列表
<input type="checkbox" name="UserOpenShow" value="lowdaytj"<%if Instr(Rs("UserOpenShow"),",lowdaytj,")>0 Then Response.write " checked"%>>CPA统计
<input type="checkbox" name="UserOpenShow" value="orderview"<%if Instr(Rs("UserOpenShow"),",orderview,")>0 Then Response.write " checked"%>>CPS订单
<input type="checkbox" name="UserOpenShow" value="orderdaytj"<%if Instr(Rs("UserOpenShow"),",orderdaytj,")>0 Then Response.write " checked"%>>CPS订单[按导入时间]
<input type="checkbox" name="UserOpenShow" value="orderdaytjgoodstime"<%if Instr(Rs("UserOpenShow"),",orderdaytjgoodstime,")>0 Then Response.write " checked"%>>CPS订单计[按购买时间]
<input type="checkbox" name="UserOpenShow" value="lowuniondaytj"<%if Instr(Rs("UserOpenShow"),",lowuniondaytj,")>0 Then Response.write " checked"%>>下级联盟
<input type="checkbox" name="UserOpenShow" value="lowuniondatarecview"<%if Instr(Rs("UserOpenShow"),",lowuniondatarecview,")>0 Then Response.write " checked"%>>下级联盟数据导出
<input type="checkbox" name="UserOpenShow" value="agentaddaytj"<%if Instr(Rs("UserOpenShow"),",agentaddaytj,")>0 Then Response.write " checked"%>>代理广告数据统计
</td>
</tr>


<tr class="tr_1"> 
<td colspan="2">广告Logo设置</td>
</tr>

<tr>
<td class="td_r">普通图片和混合类广告上是否开启联盟logo功能：</td>
<td>
<input name="AdLogoOpen" type="radio" value="0"<%If Rs("AdLogoOpen")=0 Then Response.Write " checked"%>>关闭
<input name="AdLogoOpen" type="radio" value="1"<%If Rs("AdLogoOpen")=1 Then Response.Write " checked"%>>开启，先小logo，放上去变成大logo
<input name="AdLogoOpen" type="radio" value="2"<%If Rs("AdLogoOpen")=2 Then Response.Write " checked"%>>开启，始终大logo
<input name="AdLogoOpen" type="radio" value="3"<%If Rs("AdLogoOpen")=3 Then Response.Write " checked"%>>开启，始终小logo
</td>
</tr>

<tr>
<td class="td_r">联盟小logo的宽度多少像素：</td>
<td>
<input name="AdLogoSmallWidth" type="text" id="AdLogoSmallWidth" value="<%=rs("AdLogoSmallWidth")%>">
</td>
</tr>

<tr>
<td class="td_r">联盟小logo的高度多少像素：</td>
<td>
<input name="AdLogoSmallHeight" type="text" id="AdLogoSmallHeight" value="<%=rs("AdLogoSmallHeight")%>">
</td>
</tr>

<tr>
<td class="td_r">联盟大logo的宽度多少像素：</td>
<td>
<input name="AdLogoLargeWidth" type="text" id="AdLogoLargeWidth" value="<%=rs("AdLogoLargeWidth")%>">
</td>
</tr>

<tr>
<td class="td_r">联盟大logo的高度多少像素：</td>
<td>
<input name="AdLogoLargeHeight" type="text" id="AdLogoLargeHeight" value="<%=rs("AdLogoLargeHeight")%>">
</td>
</tr>


      <tr> 
        <td>&nbsp;</td>
        <td>

<input type="submit" name="submit" value="修改" class="btn btn-primary">
          　　 
 </td>
      </tr>
</table></form>
