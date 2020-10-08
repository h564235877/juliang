<%
'乘风广告联盟系统 Sql版
'作者QQ：178575
'作者EMail：yliangcf@163.com
'作者网站：http://www.qqcf.com
'详细简介：http://www.qqcf.com/cfwztg.htm
'上面有程序在线演示，安装演示，使用疑难解答，最新版本下载等内容
'因为这些内容可能时常更新，就没有放在程序里，请自己上网站查看
%>

<%
Ad_ID=ChkStr(Request("Ad_ID"),2)

Set Rs = Server.CreateObject("ADODB.Recordset")
Sql="Select * From CFWztg_AD where ID="&Ad_ID
Rs.open Sql,Conn,1,1
Ad_Class=Rs("Ad_Class")
a_AdName=Rs("AdName")
a_Ad=Rs("Ad")
a_AdTitle=Rs("AdTitle")
a_AdIntro=Rs("AdIntro")
a_Ad_Url=Rs("Ad_Url")
a_Ad_Url_TypeSet=Rs("Ad_Url_TypeSet")
a_a_Ad_Url_Android=Rs("Ad_Url_Android")
a_Ad_Url_Iphone=Rs("Ad_Url_Iphone")
a_AdSimpleUrl=Rs("AdSimpleUrl")
a_Unit_Cent_First=Rs("Unit_Cent_First")
Moblie_Mul_First=Rs("Moblie_Mul_First")
sitetypeset=Rs("sitetypeset")
sitetype=Rs("sitetype")
CheckDesc="降低价格需要审核，提高价格和修改非价格项的修改无需审核即时生效!"
Rs.Close


Set Rs = Server.CreateObject("ADODB.Recordset")
Sql="Select * From CFWztg_AD_Check where Ad_ID="&Ad_ID
Rs.open Sql,Conn,1,1
If Not(Rs.Eof) Then
 AdName=Rs("AdName")
 Ad=Rs("Ad")
 AdTitle=Rs("AdTitle")
 AdIntro=Rs("AdIntro")
 Ad_Url=Rs("Ad_Url")
 Ad_Url_TypeSet=Rs("Ad_Url_TypeSet")
 Ad_Url_Android=Rs("Ad_Url_Android")
 Ad_Url_Iphone=Rs("Ad_Url_Iphone")
 AdSimpleUrl=Rs("AdSimpleUrl")
 Unit_Cent_First=Rs("Unit_Cent_First")
 CheckState=Rs("CheckState")
Else
 AdName=a_AdName
 Ad=a_Ad
 AdTitle=a_AdTitle
 AdIntro=a_AdIntro
 Ad_Url=a_Ad_Url
 Ad_Url_TypeSet=a_Ad_Url_TypeSet
 Ad_Url_Android=a_Ad_Url_Android
 Ad_Url_Iphone=a_Ad_Url_Iphone
 AdSimpleUrl=a_AdSimpleUrl
 Unit_Cent_First=a_Unit_Cent_First
 CheckState=2
End If
Rs.Close


%>

<script>
$(function(){

function ad_url_typeset_0(){
 $("#t_ad_url_android,#t_ad_url_iphone").hide();
}

function ad_url_typeset_1(){
 $("#t_ad_url_android,#t_ad_url_iphone").show();
}

ad_url_typeset_<%=Ad_Url_TypeSet%>()

$("#ad_url_typeset_0").click(function(){
 ad_url_typeset_0();
});

$("#ad_url_typeset_1").click(function(){
 ad_url_typeset_1();
});





$("#admodifysave").click(function(){


if($('#adname').val()==""){
 alert('广告名称必须填写', '', function () {$("#adname").focus();});
 return false;
}



});

});
</script>

<a href="<%=ChkStr(Request.ServerVariables("Http_Referer"),1)%>" class="actionBtn" style="margin-top:10px;"><i class="mdi mdi-keyboard-return"></i>返回列表</a>

<form name="form1" method="post" action="../../AdUser.aspx?Action=admodifysave&Ad_ID=<%=Ad_ID%>&RefUrl=<%=Server.URLEncode(Request.ServerVariables("Http_Referer"))%>">

<table class="tb_1">

<tr class="tr_1"> 
<td colspan="4">修改广告</td>
</tr>

<tr>
<td class="td_r"></td>
<td width="350px">广告修改前</td>
<td class="tr_1">&nbsp;</td>
<td>广告修改后<font color="#FF0000">(注:<%=CheckDesc%>)</font></td>
</tr>
<tr>
<td class="td_r">广告名称：</td>
<td><input name="a_adname" id="a_adname" type="text" value="<%=a_adname%>" readonly style="width:400px;background-color:#eeeeee"></td>
<td>---></td>
<td><input name="adname" id="adname" type="text"  value="<%=adname%>" style="width:400px;"></td>
</tr>


 <%If Ad_Class=1 Or Ad_Class=3 Or Ad_Class=7 Then%>
<tr> 
<td class="td_r">广告文字：</td>
<td><textarea name="a_ad" rows="5" readonly style='width:400px;background-color:#eeeeee'><%=a_ad%></textarea>
<br>
支持的参数有{username},{userid},{ad_id},{selfvar},{reurl}等</td>
<td>---></td>
<td><textarea name="ad" id="ad" rows="5" style="width:400px"><%=ad%></textarea>
<a href="?Action=imglist" target="_blank">上传文件</a></td>
</tr>
<%ElseIf Ad_Class=2 Or Ad_Class=4 Or Ad_Class=6 Then%>
<tr> 
<td class="td_r">广告图片：</td>
<td><textarea name="a_ad" rows="5" readonly style='width:400px;background-color:#eeeeee'><%=a_ad%></textarea>
<br>
(注:广告图片放在upload目录下,这里填写upload/aaa.jpg之类)</td>
<td>---></td>
<td><textarea name="ad" id="ad" rows="5" style="width:400px"><%=ad%></textarea>
<a href="?Action=imglist" target="_blank">上传文件</a>
</td>
</tr>
<%End If%>

<%If Ad_Class=5 Or Ad_Class=6  Or Ad_Class=10 Or Ad_Class=11 Then%>
<tr> 
<td class="td_r">广告标题：</td>
<td><input name="a_AdTitle" type="text" value="<%=a_AdTitle%>" readonly style='width:400px;background-color:#eeeeee'></td>
<td>---></td>
<td><input name="AdTitle" id="AdTitle" type="text" value="<%=AdTitle%>" style="width:400px"></td>
</tr>
<%End If%>
    
<%If Ad_Class=5 Or Ad_Class=11 Then%>
<tr> 
<td class="td_r">广告简介文字：</td>
<td><input name="a_AdIntro" type="text" value="<%=a_AdIntro%>" readonly style='width:400px;background-color:#eeeeee'></td>
<td>---></td>
<td><input name="AdIntro" id="AdIntro" type="text" value="<%=AdIntro%>" style="width:400px"></td>
</tr>
<%End If%>

	
<TR> 
<TD class="td_r">广告链接：</TD>
<TD><input name="a_ad_url" type="text" value="<%=a_ad_url%>" readonly style='width:400px;background-color:#eeeeee'> 
</TD>
<td>---></td>
<TD><input name="ad_url" id="ad_url" type="text" value="<%=Ad_Url%>" style="width:400px"></TD>
</TR>

<TR> 
<TD class="td_r">移动设备广告链接：</TD>
<TD>
<input type="radio" name="a_ad_url_typeset" id="a_ad_url_typeset_0" value="0"<%If Ad_Url_TypeSet=0 Then Response.write " checked"%> disabled />和PC广告链接相同
<input type="radio" name="a_ad_url_typeset" id="a_ad_url_typeset_1" value="1"<%If Ad_Url_TypeSet=1 Then Response.write " checked"%> disabled />和PC广告链接不同,分别指定

<%If Ad_Url_TypeSet=1 Then%>
<br />

安卓手机广告链接：<input name="a_ad_url_android" type="text" id="a_ad_url_android" value="<%=ad_url_android%>" readonly  style="width:400px;background-color:#eeeeee">
<br />
苹果手机广告链接：<input name="a_ad_url_iphone" type="text" id="a_ad_url_iphone" value="<%=ad_url_iphone%>" readonly style="width:400px;background-color:#eeeeee" >
<%End If%>

</TD>
<td>---></td>
<TD><input type="radio" name="ad_url_typeset" id="ad_url_typeset_0" value="0"<%If Ad_Url_TypeSet=0 Then Response.write " checked"%> />和PC广告链接相同
<input type="radio" name="ad_url_typeset" id="ad_url_typeset_1" value="1"<%If Ad_Url_TypeSet=1 Then Response.write " checked"%> />和PC广告链接不同,分别指定


<div id="t_ad_url_android">
<br />
安卓手机广告链接：<input name="ad_url_android" type="text" id="ad_url_android" value="<%=ad_url_android%>" style="width:400px;">
</div>

<div id="t_ad_url_iphone">
<br />
苹果手机广告链接：<input name="ad_url_iphone" type="text" id="ad_url_iphone" value="<%=ad_url_iphone%>" style="width:400px;" >
</div>
</TD>
</TR>

<%If Ad_Class=5 Then%>
<tr> 
<td class="td_r">简短域名：</td>
<td><input name="a_AdSimpleUrl" type="text" value="<%=AdSimpleUrl%>" readonly style='width:400px;background-color:#eeeeee'></td>
<td>---></td>
<td><input name="adsimpleurl" id="adsimpleurl" type="text" value="<%=AdSimpleUrl%>" style="width:400px"></td>
</tr>
<%End If%>


<tr> 
<td class="td_r">广告单价：</td>
<td><input name="a_unit_cent_first" id="a_unit_cent_first" type="text" value="<%=GetTurnCent(a_unit_cent_first)%>" style='width:400px;background-color:#eeeeee'>元/IP</td>
<td>---></td>
<td><input name="unit_cent_first" id="unit_cent_first" type="text" value="<%=GetTurnCent(unit_cent_first)%>" style='width:400px;'>元/IP
<font color="#FF0000">(此项状态:<%
If CheckState=1 Then
 Response.write "审核中"
ElseIf CheckState=2 Then
 Response.write "审核成功"
ElseIf CheckState=3 Then
 Response.write "审核失败"
End If
%>)</font></td>
    </tr>
    
<tr> 
<td class="td_r">移动设备单价倍数：</td>
<td><input name="Moblie_Mul_First" type="text" value="<%=Moblie_Mul_First%>" readonly style='width:400px;background-color:#eeeeee'>倍</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
</tr>
<tr>
<td class="td_r">投放设备：</td>
<td>
<input type="radio" name="sitetypeset" id="sitetypeset_0" value="0" disabled <%If Rs("sitetypeset")=0 Then Response.Write " Checked"%>/>不限<br>
<input type="radio" name="sitetypeset" id="sitetypeset_1" value="1" disabled <%If Rs("sitetypeset")=1 Then Response.Write " Checked"%>/>指定终端(包含微信)<br>
<input type="radio" name="sitetypeset" id="sitetypeset_2" value="2" disabled <%If Rs("sitetypeset")=2 Then Response.Write " Checked"%>/>只投微信<br>
<input type="radio" name="sitetypeset" id="sitetypeset_3" value="3" disabled <%If Rs("sitetypeset")=3 Then Response.Write " Checked"%>/>指定终端(排除微信)

</td>
<td class="tr_1">&nbsp;</td>
<td>&nbsp;</td>
</tr>

<tr>
<td class="td_r">&nbsp;</td>
<td>&nbsp;</td>
<td class="tr_1">&nbsp;</td>
<td><input type="submit" name="submit" value="修改" id="admodifysave" class="btn btn-primary"></td>
</tr>
</table>

</form>