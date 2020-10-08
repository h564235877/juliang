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

function sitetypeset_0(){
$("#t_sitetype_1").hide();
$("#t_sitetype_2").hide();
$("#t_sitetype_3").hide();
}

function sitetypeset_1(){
$("#t_sitetype_1").show();
$("#t_sitetype_2").hide();
$("#t_sitetype_3").hide();
}

function sitetypeset_2(){
$("#t_sitetype_1").hide();
$("#t_sitetype_2").show();
$("#t_sitetype_3").hide();
}

function sitetypeset_3(){
$("#t_sitetype_1").hide();
$("#t_sitetype_2").hide();
$("#t_sitetype_3").show();
}

sitetypeset_<%=Rs("sitetypeset")%>();

$("#sitetypeset_0").click(function(){
sitetypeset_0();
});

$("#sitetypeset_1").click(function(){
sitetypeset_1();
});

$("#sitetypeset_2").click(function(){
sitetypeset_2();
});

$("#sitetypeset_3").click(function(){
sitetypeset_3();
});

});
</script>

<table class="tb_1" id="tbu">
<tr class="tr_1">
<td colspan="2">投放设备</td>
</tr>
<tr> 
<td width="90" class="td_r"><span  id="t3">投放设备：</span></td>
<td><input type="radio" name="sitetypeset" id="sitetypeset_0" value="0"<%If Rs("sitetypeset")=0 Then Response.Write " Checked"%>/>不限<br>
<input type="radio" name="sitetypeset" id="sitetypeset_1" value="1"<%If Rs("sitetypeset")=1 Then Response.Write " Checked"%>/>指定终端(包含微信)<br>
<input type="radio" name="sitetypeset" id="sitetypeset_2" value="2"<%If Rs("sitetypeset")=2 Then Response.Write " Checked"%>/>只投微信<br>
<input type="radio" name="sitetypeset" id="sitetypeset_3" value="3"<%If Rs("sitetypeset")=3 Then Response.Write " Checked"%>/>指定终端(排除微信)
</td>
</tr>

<tr id="t_sitetype_1">
<td></td>
<td>
<input type="checkbox" name="sitetype1" id="sitetype" value="pc,pcwx"<%If Instr(Rs("sitetype"),"pc,pcwx")>0 Then Response.Write " Checked"%>>桌面电脑&nbsp;&nbsp;&nbsp;&nbsp;

<input type="checkbox" name="sitetype1" id="sitetype" value="android,androidwx"<%If Instr(Rs("sitetype"),"android,androidwx")>0 Then Response.Write " Checked"%>>安卓手机&nbsp;&nbsp;&nbsp;&nbsp;
<input type="checkbox" name="sitetype1" id="sitetype" value="apad,apadwx"<%If Instr(Rs("sitetype"),"apad,apadwx")>0 Then Response.Write " Checked"%>>安卓平板&nbsp;&nbsp;&nbsp;&nbsp;

<input type="checkbox" name="sitetype1" id="sitetype" value="ios,ioswx"<%If Instr(Rs("sitetype"),"ios,ioswx")>0 Then Response.Write " Checked"%>>苹果手机&nbsp;&nbsp;&nbsp;&nbsp;
<input type="checkbox" name="sitetype1" id="sitetype" value="ipad,ipadwx"<%If Instr(Rs("sitetype"),"ipad,ipadwx")>0 Then Response.Write " Checked"%>>苹果平板&nbsp;&nbsp;&nbsp;&nbsp;

<input type="checkbox" name="sitetype1" id="sitetype" value="winphone,winphonewx"<%If Instr(Rs("sitetype"),"winphone,winphonewx")>0 Then Response.Write " Checked"%>>微软WP
</td>
</tr>

<tr id="t_sitetype_2">
<td></td>
<td>
<input type="checkbox" name="sitetype2" id="sitetype" value="pcwx"<%If Instr(Rs("sitetype"),"pcwx,")>0 Then Response.Write " Checked"%>>桌面电脑微信&nbsp;&nbsp;&nbsp;&nbsp;

<input type="checkbox" name="sitetype2" id="sitetype" value="androidwx"<%If Instr(Rs("sitetype"),"androidwx,")>0 Then Response.Write " Checked"%>>安卓手机微信&nbsp;&nbsp;&nbsp;&nbsp;
<input type="checkbox" name="sitetype2" id="sitetype" value="apadwx"<%If Instr(Rs("sitetype"),"apadwx,")>0 Then Response.Write " Checked"%>>安卓平板微信&nbsp;&nbsp;&nbsp;&nbsp;

<input type="checkbox" name="sitetype2" id="sitetype" value="ioswx"<%If Instr(Rs("sitetype"),"ioswx,")>0 Then Response.Write " Checked"%>>苹果手机微信&nbsp;&nbsp;&nbsp;&nbsp;
<input type="checkbox" name="sitetype2" id="sitetype" value="ipadwx"<%If Instr(Rs("sitetype"),"ipadwx,")>0 Then Response.Write " Checked"%>>苹果平板微信&nbsp;&nbsp;&nbsp;&nbsp;

<input type="checkbox" name="sitetype2" id="sitetype" value="winphonewx"<%If Instr(Rs("sitetype"),"winphonewx,")>0 Then Response.Write " Checked"%>>微软WP微信
</td>
</tr>

<tr id="t_sitetype_3">
<td></td>
<td>
<input type="checkbox" name="sitetype3" id="sitetype" value="pc"<%If Instr(Rs("sitetype"),"pc,")>0 Then Response.Write " Checked"%>>桌面电脑&nbsp;&nbsp;&nbsp;&nbsp;

<input type="checkbox" name="sitetype3" id="sitetype" value="android"<%If Instr(Rs("sitetype"),"android,")>0 Then Response.Write " Checked"%>>安卓手机&nbsp;&nbsp;&nbsp;&nbsp;
<input type="checkbox" name="sitetype3" id="sitetype" value="apad"<%If Instr(Rs("sitetype"),"apad,")>0 Then Response.Write " Checked"%>>安卓平板&nbsp;&nbsp;&nbsp;&nbsp;

<input type="checkbox" name="sitetype3" id="sitetype" value="ios"<%If Instr(Rs("sitetype"),"ios,")>0 Then Response.Write " Checked"%>>苹果手机&nbsp;&nbsp;&nbsp;&nbsp;
<input type="checkbox" name="sitetype3" id="sitetype" value="ipad"<%If Instr(Rs("sitetype"),"ipad,")>0 Then Response.Write " Checked"%>>苹果平板&nbsp;&nbsp;&nbsp;&nbsp;

<input type="checkbox" name="sitetype3" id="sitetype" value="winphone"<%If Instr(Rs("sitetype"),"winphone,")>0 Then Response.Write " Checked"%>>微软WP
</td>
</tr>

<tr> 
<td></td>
<td>
<input type="submit" name="adrunsitebtn" id="adrunsitebtn" value="修改" class="btn btn-primary">
</td>
</tr>
</table>