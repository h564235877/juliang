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
ID=ChkStr(Request("ID"),2)

If Request("Label")="" Then Label="admodify" Else Label=ChkStr(Request("Label"),1)

If Request("RefUrl")="" Then
 RefUrl=ChkStr(Request.ServerVariables("Http_Referer"),1) 
 CurrUrl= HttpPath(5) & "?"&Request.ServerVariables("QUERY_STRING") & "&RefUrl=" & Server.URLEncode(RefUrl)
Else
 RefUrl=ChkStr(Request("RefUrl"),1)
 CurrUrl= HttpPath(5) & "?"&Request.ServerVariables("QUERY_STRING")
End If


Set Rs = Server.CreateObject("ADODB.Recordset")
Sql="Select * From CFWztg_AD where ID="&ID
Rs.open Sql,Conn,1,1
%>


<table class="tb_2">
<tr>
<td><span class="title">正在修改广告<%=ID%></span></td>
</tr>
</table>

<div class="tabs_header">
<ul class="tabs">
<li <%If Label="admodify" Then Response.write " class='active'"%>><a href="?Action=<%=Action%>&ID=<%=ID%>&Label=admodify&RefUrl=<%=Server.URLEncode(RefUrl)%>"><span>基本设置</span></a></li>
<li <%If Label="adprice" Then Response.write " class='active'"%>><a href="?Action=<%=Action%>&ID=<%=ID%>&Label=adprice&RefUrl=<%=Server.URLEncode(RefUrl)%>"><span>单价和扣点</span></a></li>
<li <%If Label="adguardcheat" Then Response.write " class='active'"%>><a href="?Action=<%=Action%>&ID=<%=ID%>&Label=adguardcheat&RefUrl=<%=Server.URLEncode(RefUrl)%>"><span>防作弊</span></a></li>
<li <%If Label="adrunsite" Then Response.write " class='active'"%>><a href="?Action=<%=Action%>&ID=<%=ID%>&Label=adrunsite&RefUrl=<%=Server.URLEncode(RefUrl)%>"><span>投放位置</span></a></li>
<li <%If Label="adsitetype" Then Response.write " class='active'"%>><a href="?Action=<%=Action%>&ID=<%=ID%>&Label=adsitetype&RefUrl=<%=Server.URLEncode(RefUrl)%>"><span>投放设备</span></a></li>
<li <%If Label="adlevel" Then Response.write " class='active'"%>><a href="?Action=<%=Action%>&ID=<%=ID%>&Label=adlevel&RefUrl=<%=Server.URLEncode(RefUrl)%>"><span>广告等级</span></a></li>
<li <%If Label="adother" Then Response.write " class='active'"%>><a href="?Action=<%=Action%>&ID=<%=ID%>&Label=adother&RefUrl=<%=Server.URLEncode(RefUrl)%>"><span>其它设置</span></a></li>

<a href="<%=RefUrl%>" class="actionBtn"><i class="mdi mdi-keyboard-return"></i>返回列表</a>
</ul>
</div>

<form name="form1" method="post" action="../../AdminUser.aspx?Action=admodifysave&ID=<%=ID%>&Label=<%=Label%>&Ad_Class=<%=Rs("Ad_Class")%>&CurrUrl=<%=Server.URLEncode(CurrUrl)%>">
<%If Label="admodify" Then%>
<table class="tb_1" id="tbu">
<tr class="tr_1"> 
<td colspan="2">基本信息</td>
</tr>

<tr> 
<td class="td_r">广告名称：</td>
<td><input name="AdName" type="text" value="<%=Rs("AdName")%>"></td>
</tr>

<tr> 
<td width="220" class="td_r">广告类型：</td>
<td><%=GetAdClassName(Rs("Ad_Class"))%></td>
</tr>

<TR id="hangp">
<TD class="td_r">加入轮循：</TD>
<TD>
<%
If Rs("Ad_Class")=1 Or Rs("Ad_Class")=4 Or Rs("Ad_Class")=7 Then
 Response.write "<input name='cycstate' type='radio' value='1'"
 If Rs("cycstate")=1 Then Response.write " checked"
 Response.write ">是"
 
 Response.write "<input name='cycstate' type='radio' value='0'"
 If Rs("cycstate")=0 Then Response.write " checked"
 Response.write ">否"
 
ElseIf Rs("Ad_Class")=2 Or Rs("Ad_Class")=3 Or Rs("Ad_Class")=12 Then
 Response.write "<input name='cycstate' type='radio' value='0'"
 If Rs("cycstate")=0 Then Response.write " checked"
 Response.write ">否"
 
ElseIf Rs("Ad_Class")=5 Or Rs("Ad_Class")=6 Or Rs("Ad_Class")=8 Or Rs("Ad_Class")=9 Or Rs("Ad_Class")=10 Or Rs("Ad_Class")=11 Then
 Response.write "<input name='cycstate' type='radio' value='1'"
 If Rs("cycstate")=1 Then Response.write " checked"
 Response.write ">是"
End If
%>
</TD>
</TR>

<tr> 
<td class="td_r">广告权重：</td>
<td><input name="Weight" type="text" value="<%=Rs("Weight")%>">(默认为1，范围1-10，数值越大则在按权重的广告代码里显示机会越大)</td>
</tr>

<TR> 
<TD class="td_r">获利方式：</TD>
<TD>
<%
If Rs("ClickState")=1 Then
 Response.write "点击获利(CPC)"
ElseIf Rs("ClickState")=2 Then
 Response.write "显示获利(CPV)"
ElseIf Rs("ClickState")=3 Then
 Response.write "注册获利(CPA)"
ElseIf Rs("ClickState")=4 Then
 Response.write "商品获利(CPS)"
End If

If Rs("ClickSeState")=0 Then
 Response.Write "<br>[次要计费:关]"
 
ElseIf Rs("ClickSeState")=1 Then
 Response.Write "<br>[次要计费:CPC]"
 
ElseIf Rs("ClickSeState")=2 Then
 Response.Write "<br>[次要计费:CPV]"
 
End If

%></TD>
</TR>

	
<TR> 
<TD class="td_r">审核状态：</TD>
<TD>
<%
If Rs("AdState")=1 Then 
Response.Write "审核中"
ElseIf Rs("AdState")=2 Then
Response.Write "审核成功"
ElseIf Rs("AdState")=3 Then
Response.Write "审核失败"
ElseIf Rs("AdState")=4 Then
Response.Write "完成点击"
ElseIf Rs("AdState")=5 Then
Response.Write "已经审核，但暂停投放"
End If
%></TD>
</TR>

<TR> 
<TD class="td_r">发布时间：</TD>
<TD>
<%=Rs("AddTime")%></TD>
</TR>

<tr class="tr_1">
<td colspan="2">广告内容和链接</td>
</tr>
<%If Rs("ad_class")=1 Or Rs("ad_class")=3 Or Rs("ad_class")=7 Then%>
<tr> 
<td class="td_r">广告文字或图片：</td>
<td><textarea name="Ad" cols="50" rows="5" style="width:400px"><%=Rs("Ad")%></textarea>
<br>
支持的参数有{username},{userid},{ad_id},{clickurl},{clickurl_2}，如支持多个图片轮循之间用,分隔</td>
</tr>

<%ElseIf Rs("ad_class")=2 Or Rs("ad_class")=4 Or Rs("ad_class")=6 Or Rs("ad_class")=11 Then%>
<tr> 
<td class="td_r">广告图片：</td>
<td><input type="text" name="Ad" value="<%=Rs("Ad")%>" style="width:400px;">
<br>
(注:填写http://或https://开头的图片外链，或广告图片放在upload目录下之类)</td>
</tr>
<%End If%>
	
<%If Rs("ad_class")=5 Or Rs("ad_class")=6 Or Rs("ad_class")=10 Or Rs("ad_class")=11 Then%>
<tr> 
<td class="td_r">广告标题：</td>
<td><input name="AdTitle" type="text" value="<%=Rs("AdTitle")%>" style="width:400px;"></td>
</tr>
<%End If%>
    
<%If Rs("ad_class")=5 Or Rs("ad_class")=11 Then%>
<tr> 
<td class="td_r">广告简介文字：</td>
<td><input name="AdIntro" type="text" value="<%=Rs("AdIntro")%>" style="width:400px;"></td>
</tr>
<%End If%>

<TR> 
<TD class="td_r">PC广告链接：</TD>
<TD><input name="Ad_Url" type="text" value="<%=Rs("Ad_Url")%>" style="width:400px;"> 
<br> <font color="#FF0000">*</font> 注：链接请以http://或https://开头，支持标签参数用户id:{userid}，用户名:{username},广告id:{ad_id},直链的自定义:{selfvar}，如支持多个链接轮循之间用,分隔</TD>
</TR>

<script>
$(function(){

function ad_url_typeset_0(){
 $("#t_ad_url_android,#t_ad_url_iphone").hide();
}

function ad_url_typeset_1(){
 $("#t_ad_url_android,#t_ad_url_iphone").show();
}

ad_url_typeset_<%=Rs("Ad_Url_TypeSet")%>()

$("#ad_url_typeset_0").click(function(){
 ad_url_typeset_0();
});

$("#ad_url_typeset_1").click(function(){
 ad_url_typeset_1();
});

});

</script>
<TR> 
<TD class="td_r">移动设备广告链接：</TD>
<TD>
<input type="radio" name="ad_url_typeset" id="ad_url_typeset_0" value="0"<%If Rs("Ad_Url_TypeSet")=0 Then Response.write " checked"%> />和PC广告链接相同
<input type="radio" name="ad_url_typeset" id="ad_url_typeset_1" value="1"<%If Rs("Ad_Url_TypeSet")=1 Then Response.write " checked"%> />和PC广告链接不同,分别指定</TD>
</TR>


<TR id="t_ad_url_android"> 
<TD class="td_r">安卓设备广告链接：</TD>
<TD><input name="ad_url_android" type="text" id="ad_url_android"  value="<%=Rs("ad_url_android")%>" style="width:400px"></TD>
</TR>

<TR id="t_ad_url_iphone"> 
<TD class="td_r">苹果设备广告链接：</TD>
<TD><input name="ad_url_iphone" type="text" id="ad_url_iphone"  value="<%=Rs("ad_url_iphone")%>" style="width:400px"></TD>
</TR>


<%If Rs("ad_class")=5 Then%>
<tr> 
<td class="td_r">简短域名：</td>
<td><input name="AdSimpleUrl" type="text" value="<%=Rs("AdSimpleUrl")%>" style="width:400px"></td>
</tr>
<%End If%>


<%
'--为软件下载安装广告时
If Rs("ad_class")=12 Then%>
<TR>
<TD class="td_r">软件安装后主程序名称：</TD>
<TD><input name="softexename" type="text" id="softexename" value="<%=Rs("softexename")%>" style="width:400px">如填写须带扩展名，可留空则不判断是否主程序是否存在</TD>
</TR>

<TR>
<TD class="td_r">软件安装何时才计费</TD>
<TD>
<input type="radio" name="softtctype" value="1"<%If Rs("softtctype")=1 Then Response.write " checked"%>>安装后即计费
<input type="radio" name="softtctype" value="2"<%If Rs("softtctype")=2 Then Response.write " checked"%>>安装后需等待符合一定条件确认
<input type="radio" name="softtctype" value="3"<%If Rs("softtctype")=3 Then Response.write " checked"%>>安装后多少分钟内卸载无效
</TD>
</TR>
<%end If%>
	
<%If Rs("ad_class")=3 Or Rs("ad_class")=4 Or Rs("ad_class")=6 Or Rs("ad_class")=7 Then%>
<%
AdSizeInlist=0
AdSize=Rs("AdWidth")&"x"&Rs("AdHeight")
%>

<TR> 
<TD class="td_r">修改广告尺寸：</TD>
<TD>

<li style="clear:both;">横向</li>
<%
Sql="Select * From CFwztg_AdSize where Direction=1 Order By Direction,Width Desc,Height Desc"

Set Rs2 = Server.CreateObject("ADODB.Recordset")
Rs2.open Sql,Conn,1,1
While Not Rs2.Eof
 Response.write "<li style='width:100px;float:left;'><input type='radio' name='adsize' value='"&Rs2("Width")&"x"&Rs2("Height")&"' id='adsize' onclick=""document.getElementById('AdWidth').value="&Rs2("Width")&";document.getElementById('AdHeight').value="&Rs2("Height")&";"""
 If AdSize = Rs2("Width")&"x"&Rs2("Height") Then
  Response.write " checked"
 End If
 Response.write ">" & Rs2("Width")&"x"&Rs2("Height") & "</li>"
Rs2.MoveNext
Wend
Rs2.Close
%>
<li style="clear:both;">纵向</li>
<%
Sql="Select * From CFwztg_AdSize where Direction=2 Order By Direction,Width Desc,Height Desc"

Set Rs2 = Server.CreateObject("ADODB.Recordset")
Rs2.open Sql,Conn,1,1
While Not Rs2.Eof
 Response.write "<li style='width:100px;float:left;'><input type='radio' name='adsize' value='"&Rs2("Width")&"x"&Rs2("Height")&"' id='adsize' onclick=""document.getElementById('AdWidth').value="&Rs2("Width")&";document.getElementById('AdHeight').value="&Rs2("Height")&";"""
 If AdSize = Rs2("Width")&"x"&Rs2("Height") Then
  Response.write " checked"
 End If
 Response.write ">" & Rs2("Width")&"x"&Rs2("Height") & "</li>"
Rs2.MoveNext
Wend
Rs2.Close
%>
<li style="clear:both;">方形</li>
<%
Sql="Select * From CFwztg_AdSize where Direction=3 Order By Direction,Width Desc,Height Desc"

Set Rs2 = Server.CreateObject("ADODB.Recordset")
Rs2.open Sql,Conn,1,1
While Not Rs2.Eof
 Response.write "<li style='width:100px;float:left;'><input type='radio' name='adsize' value='"&Rs2("Width")&"x"&Rs2("Height")&"' id='adsize' onclick=""document.getElementById('AdWidth').value="&Rs2("Width")&";document.getElementById('AdHeight').value="&Rs2("Height")&";"""
 If AdSize = Rs2("Width")&"x"&Rs2("Height") Then
  Response.write " checked"
 End If
 Response.write ">" & Rs2("Width")&"x"&Rs2("Height") & "</li>"
Rs2.MoveNext
Wend
Rs2.Close
%>

<br /><br />如以上尺寸列表没有需要使用广告尺寸，可自定义请填写其它尺寸
<br />宽度：<input name="AdWidth" type="text" id="AdWidth" value="<%=Rs("AdWidth")%>">
<br />高度：<input name="AdHeight" type="text" id="AdHeight" value="<%=Rs("AdHeight")%>">

</TD>
</TR>
    <%End If%>

<%If Rs("ad_class")=7 Or Rs("ad_class")=11 Then%>
<TR> 
<TD class="td_r">广告效果：</TD>
<TD>
<%If Rs("ad_class")=7 Then%>
<%
Sql="Select SetFlag From CFWztg_SetContent Where SetBClassFlag='AdminTemplet' And SetSClassFlag='AdminTemplet_AdCode' Order By SetTaxis"
Set Rs2=Conn.Execute(Sql)
%>
<select name="AdShowType" id="AdShowType">
<%
Sql="Select SetFlag,SetDesc From CFWztg_SetContent Where SetBClassFlag='AdminTemplet' And SetSClassFlag='AdminTemplet_AdCode' Order By SetTaxis"
Set Rs2=Conn.Execute(Sql)
While Not Rs2.Eof
%>
<option value="<%=Trim(Rs2("SetFlag"))%>"<%If Rs("AdShowType")=Rs2("SetFlag") Then Response.write " selected"%>><%=Trim(Rs2("SetDesc"))%></option>
<%
Rs2.MoveNext
Wend
%>
<%ElseIf Rs("ad_class")=11 Then%>
<%
Sql="Select SetFlag From CFWztg_SetContent Where SetBClassFlag='AdminTemplet' And SetSClassFlag='AdminTemplet_MixCode' Order By SetTaxis"
Set Rs2=Conn.Execute(Sql)
%>
<select name="AdShowType" id="AdShowType">
<%
Sql="Select SetFlag,SetDesc From CFWztg_SetContent Where SetBClassFlag='AdminTemplet' And SetSClassFlag='AdminTemplet_MixCode' Order By SetTaxis"
Set Rs2=Conn.Execute(Sql)
While Not Rs2.Eof
%>
<option value="<%=Trim(Rs2("SetFlag"))%>"<%If Rs("AdShowType")=Rs2("SetFlag") Then Response.write " selected"%>><%=Trim(Rs2("SetDesc"))%></option>
<%
Rs2.MoveNext
Wend
%>
<%End If%>
</select>
</TD>
</TR>
<%End If%>	



<tr class="tr_1">
<td colspan="2">网站主获取代码时的显示</td>
</tr>

<TR> 
<TD class="td_r">在普通用户显示广告可申请：</TD>
<td>
<input type="radio" name="AdListShowState" value="1"<%If Rs("AdListShowState")=1 Then Response.Write " checked"%>>是
<input type="radio" name="AdListShowState" value="0"<%If Rs("AdListShowState")=0 Then Response.Write " checked"%>>否
</TD>
</TR>
	


<TR> 
<TD class="td_r">普通用户界面点数显示：</TD>
<td>
<input type="radio" name="AdSpareShowState" value="1"<%If Rs("AdSpareShowState")=1 Then Response.Write " checked"%>>
实际数目显示 
<input type="radio" name="AdSpareShowState" value="0"<%If Rs("AdSpareShowState")=0 Then Response.Write " checked"%>>
无限多<br>
(注：此项是指普通用户在获得广告代码页面上，广告显示可以申请的剩余点数)</TD>
</TR>

<tr class="tr_1">
<td colspan="2">CPA广告时验证设置</td>
</tr>
<TR> 
<TD class="td_r">引导用户注册提交参数MD5验证：</TD>
<TD> 
<input type="radio" name="AdRegUserCheck" value="0"<%If Rs("AdRegUserCheck")=0 Then Response.write " checked"%>>
否
<input type="radio" name="AdRegUserCheck" value="1"<%If Rs("AdRegUserCheck")=1 Then Response.write " checked"%>>
系统外部用户注册验证
<input type="radio" name="AdRegUserCheck" value="2"<%If Rs("AdRegUserCheck")=2 Then Response.write " checked"%>>
系统内部用户注册验证
<br />*默认为否 验证格式:推荐用户名|Md5(推荐用户名&广告主安全码)</TD>
</TR>
    
<%If Rs("ad_class")=1 or Rs("ad_class")=2 Then%>
<SCRIPT>
$(function(){
function selfvartype_1(){
$("#t_selfvardomain").hide();
}

function selfvartype_2(){
selfvartype_1();
}

function selfvartype_3(){
$("#t_selfvardomain").show();
}

function selfvartype_4(){
selfvartype_3();
}

selfvartype_<%=Rs("SelfVarType")%>();

$("#selfvartype_1,#selfvartype_2").click(function(){
selfvartype_1();
});

$("#selfvartype_3,#selfvartype_4").click(function(){
selfvartype_3();
});

});
</script>

<tr class="tr_1">
<td colspan="2">直链文字或直链图片广告第四个自定义参数的设置</td>
</tr>
<TR>
<TD class="td_r">第四个参数类型：</TD>
<TD>
<input type="radio" name="selfvartype" id="selfvartype_1" value="1"<%If Rs("SelfVarType")=1 Then Response.write " checked"%>>普通字符<br />
<input type="radio" name="selfvartype" id="selfvartype_2" value="2"<%If Rs("SelfVarType")=2 Then Response.write " checked"%>>验证字符，格式:距离1970-1-1秒数|Md5(现在北京时间非UTC时间距离日期1970-1-1秒数&广告主安全码)<br />
<input type="radio" name="selfvartype" id="selfvartype_3" value="3"<%If Rs("SelfVarType")=3 Then Response.write " checked"%>>转向网址<br />
<input type="radio" name="selfvartype" id="selfvartype_4" value="4"<%If Rs("SelfVarType")=4 Then Response.write " checked"%>>转向网址(系统会在网址后自动补充userid=用户id或username=用户名参数)
<br />*默认为普通字符,转向网址时为简化可以不以http://开头,cf.aspx?的所有字符支持base64加密</TD>
</TR>

<TR id="t_selfvardomain">
<TD class="td_r">转向网址时限制网址填写的主域名：</TD>
<TD> 
<input name="selfvardomain" type="text" value="<%=Rs("SelfVarDomain")%>">
<br />设置转向网址时这项有效，不限制留空，限定填写域名就可以，多个域名以英文状态的逗号分隔如：a.com,b.com，不合规范的转到默认广告链接</TD>
</TR>
<%End If%>

<tr class="tr_1">
<td colspan="2">网站主获取代码时里的广告说明文字</td>
</tr>
<TR> 
<TD class="td_r">广告说明：</TD>
<td><input name="AdDesc" type="text" value="<%=Server.HTMLEncode(Rs("AdDesc"))%>"> 
<br>(比如说明广告的长度和高度，投放地区等)</TD>
</TR>


	
<tr class="tr_1">
<td colspan="2">广告分类</td>
</tr>
<tr> 
<td class="td_r">广告分类：</td>
<td>
<select name="SiteClassID" id="SiteClassID">
<option selected value="">请选择分类</option>
<%

Sql="Select * From CFWztg_SiteClass Order By SiteClassName"
Set Rs2= Server.CreateObject("ADODB.Recordset")
Rs2.open Sql,Conn,1,1
While Not Rs2.Eof
%>
<option value="<%=Rs2("ID")%>"<%If Rs("SiteClassID")=Rs2("ID") Then Response.write " selected"%>><%=Rs2("SiteClassName")%></option>
<%
Rs2.MoveNext
Wend
%>
</select></td>
</tr>


<tr class="tr_1">
<td colspan="2">广告状态</td>
</tr>
<tr> 
<td class="td_r">广告状态：</td>
<td>
<%
If Rs("AdState")=2 Or Rs("AdState")=5 Or Rs("AdState")=6 Then'只有已经审核或暂停中的广告才能修改

Response.write "<input type='radio' name='AdState' value='2'"
If Rs("AdState")=2 Then Response.write " checked"
Response.write ">已经审核，投放中"

Response.write "<input type='radio' name='AdState' value='5'"
If Rs("AdState")=5 Then Response.write " checked"
Response.write ">已经审核，但暂停投放(管理员设置)"

Response.write "<input type='radio' name='AdState' value='6'"
If Rs("AdState")=6 Then Response.write " checked"
Response.write ">已经审核，但暂停投放(广告主设置)"

Else

if Rs("AdState")=1 Then
Response.write "<input type='radio' name='AdState' value='1'"
If Rs("AdState")=1 Then Response.write " checked"
Response.write ">等待审核的广告"
  
elseif Rs("AdState")=3 Then
Response.write "<input type='radio' name='AdState' value='3'"
If Rs("AdState")=3 Then Response.write " checked"
Response.write ">拒绝通过审核的广告"

elseif Rs("AdState")=4 Then
Response.write "<input type='radio' name='AdState' value='4'"
If Rs("AdState")=4 Then Response.write " checked"
Response.write ">已经完成的广告"
End If

End If
%>
</td>
</tr>


<tr> 
<td>&nbsp;</td>
<td>
<input type="submit" name="admodifybtn" id="admodifybtn" value="修改" class="btn btn-primary">
 </td>
</tr>

</table>

<%End If%>

<%If Label="adprice" Then%>
<!--#Include File="admodify_adprice.asp"-->
<%End If%>

<%If Label="adguardcheat" Then%>
<!--#Include File="admodify_adguardcheat.asp"-->
<%End If%>

<%If Label="adrunsite" Then%>
<!--#Include File="admodify_adrunsite.asp"-->
<%End If%>

<%If Label="adsitetype" Then%>
<!--#Include File="admodify_adsitetype.asp"-->
<%End If%>

<%If Label="adlevel" Then%>
<!--#Include File="admodify_adlevel.asp"-->
<%End If%>

<%If Label="adother" Then%>
<!--#Include File="admodify_adother.asp"-->
<%End If%>
</form>
  
<%Rs.Close%>

