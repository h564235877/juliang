<%
'乘风广告联盟系统 Sql版
'作者QQ：178575
'作者EMail：yliangcf@163.com
'作者网站：http://www.qqcf.com
'详细简介：http://www.qqcf.com/cfwztg.htm
'上面有程序在线演示，安装演示，使用疑难解答，最新版本下载等内容
'因为这些内容可能时常更新，就没有放在程序里，请自己上网站查看
%>

<table class="tb_1" id="tbu">
<tr class="tr_1">
<td colspan="2">广告投放地区</td>
</tr>

<tr> 
<td width="220" class="td_r">广告投放地区：</td>
<td><input name="AdPutArea" type="text" value="<%=Rs("AdPutArea")%>" style="width:400px;"> 
<br>(多个地区中间以英文,分隔，留空则为全部地区)</td>
</tr>

<tr class="tr_1">
<td colspan="2">允许网站主在哪类网站上投放</td>
</tr>
<TR> 
<TD class="td_r">发布在哪种类型的网站上：</TD>
<TD>
<%If (Rs("PutObj")=1 And Rs("PutRange")=4) Or (Rs("PutObj")=2 And Rs("PutRange_2")=5) Then%>
<script>
$(function(){

function siteclass_1(){
$("#t_siteclass").hide();
}

function siteclass_2(){
$("#t_siteclass").show();
}

<%If Rs("PutSiteClassID")="" Then%>
siteclass_1();
<%Else%>
siteclass_2();
<%End If%>

$("#siteclass_1").click(function(){
siteclass_1();
});

$("#siteclass_2").click(function(){
siteclass_2();
});

});
</script>

<input name="siteclass" id="siteclass_1" type="radio" value="1"<%if Rs("PutSiteClassID")="" Then Response.write " checked"%>>
全部　 
<input name="siteclass" id="siteclass_2" type="radio"  value="2"<%if Rs("PutSiteClassID")<>"" Then Response.write " checked"%>>
以下选择
<%
Else
Response.Write "<script>"
Response.Write "$(function(){"
Response.Write "$(""#t_siteclass"").hide();"
Response.Write "});"
Response.Write "</script>"

Response.Write "广告发布的范围，选择用户申请后管理员审核选项，这项功能才能设置生效"
End If
%>
</TD>
    </TR>
    <TR id="t_siteclass"> 
      <TD>&nbsp;</TD>
      <TD>
	  

	  <table border="0" cellpadding="0" cellspacing="0">
          <%
Set Rs2=Server.CreateObject("Adodb.RecordSet")
Sql="Select * From CFWztg_SiteClass Order By SiteClassName"
Rs2.Open Sql,Conn,1,1
linenum=5
tdwidth=int(100/linenum)&"%"
jishu=1
While Not Rs2.Eof
If jishu mod linenum=1 or linenum=1 Then
Response.Write "<tr>"
End If%>
          <td width="<%=tdwidth%>"> 
            <input type="checkbox" name="PutSiteClassID" value="<%=Rs2("ID")%>"<%if Instr(Rs("PutSiteClassID"),","&Rs2("ID")&",")>0 Then Response.write " checked"%>> 
            <%=Rs2("SiteClassName")%></td>
          <%
If jishu mod linenum=0 Then
 Response.write "</tr>"
End If
jishu=jishu+1
Rs2.MoveNext
Wend '写tr和td,jishu mod 列数为1时开始tr,为0时结束tr

jishu=jishu-1
If jishu Mod linenum <> 0 Then
For i= 1 to linenum-(jishu mod linenum)
	response.write "<td width='"&tdwidth&"'>&nbsp;</td>"
	If  i = linenum-(jishu mod linenum) Then response.write "</tr>"
Next
End If '判断最后一行tr是否正好闭合,否则增加td,里面填入空格
%>
        </table>
		
		</TD>
    </TR>
    
 

    <tr class="tr_1">
      <td colspan="2">投放页面指定</td>
    </tr>
    <tr> 
      <td class="td_r">广告发布对象：</td>
      <td>
<%If Rs("Ad_Class") = 1 Or Rs("Ad_Class") = 2 Then '直接文字或图片类型%>
<script>
$(function(){

function putrange_1(){
$("#t_putsite").hide();
$("#t_putsite_forbit").show();
}

function putrange_2(){
$("#t_putsite").hide();
$("#t_putsite_forbit").show();
}

function putrange_3(){
$("#t_putsite_forbit").hide();
$("#t_putsite").show();
}

function putrange_4(){
$("#t_putsite,#t_putsite_forbit").hide();
}


putrange_<%=Rs("PutRange")%>();

$("#putrange_1").click(function(){
putrange_1();
});

$("#putrange_2").click(function(){
putrange_2();
});

$("#putrange_3").click(function(){
putrange_3();
});

$("#putrange_4").click(function(){
putrange_4();
});

});

</script>

<input name="PutObj" id="putobj_1" type="radio" value="1"<%If Rs("PutObj")=1 Then Response.Write " Checked"%>>所有人都可以申请 


<%Else'直接文字或图片类型外的%>

<script>
$(function(){

function putrange_1(){
$("#t_putsite").hide();
$("#t_putsite_forbit").show();
}

function putrange_2(){
$("#t_putsite,#t_putsite_forbit").hide();
}

function putrange_3(){
$("#t_putsite_forbit").hide();
$("#t_putsite").show();
}


putrange_<%=Rs("PutRange_2")%>();

$("#putrange_2_1").click(function(){
putrange_1();
});

$("#putrange_2_2").click(function(){
putrange_2();
});

$("#putrange_2_3").click(function(){
putrange_3();
});


});

</script>

<input type="radio" id="putobj_2" name="PutObj" value="2"<%If Rs("PutObj")=2 Then Response.Write " Checked"%>>只有有网站的站长才可以申请 
<%End If%>
</td>
</tr>

<%If Rs("Ad_Class") = 1 Or Rs("Ad_Class") = 2 Then '直接文字或图片类型%>
<tr id="t_putrange_1"> 
<td class="td_r">广告发布的范围(对象是所有人)：</td>
<td>
<input type="radio" name="PutRange" id="putrange_1" value="1"<%If Rs("PutRange")=1 Then Response.Write " checked"%>>可以在任何地方，如网站，论坛，ＱＱ上<br>
<input type="radio" name="PutRange" id="putrange_2" value="2"<%If Rs("PutRange")=2 Then Response.Write " checked"%>>只能发布在网页上，如网站，论坛，但不能发布在ＱＱ上<br>
<input type="radio" name="PutRange" id="putrange_3" value="3"<%If Rs("PutRange")=3 Then Response.Write " checked"%>>只能发布在以下系统允许的站点上<br>
<input type="radio" name="PutRange" id="putrange_4" value="4"<%If Rs("PutRange")=4 Then Response.Write " checked"%>>只能发布在自己申请后通过管理员审核的网站上<br>
</td>
</tr>
<%End If%>

<%If Not(Rs("Ad_Class") = 1 Or Rs("Ad_Class") = 2) Then '直接文字或图片类型外的%>
<tr id="t_putrange_2"> 
<td class="td_r">广告发布的范围(对象是站长)：</td>
<td>
<input type="radio" name="PutRange_2" id="putrange_2_1" value="1"<%If Rs("PutRange_2")=1 Then Response.Write " Checked"%>>可以发布在任何网页上<br>
<input type="radio" name="PutRange_2" id="putrange_2_2" value="2"<%If Rs("PutRange_2")=2 Then Response.Write " Checked"%>>只能发布在自己申请后通过管理员审核的网站上<br>
<input type="radio" name="PutRange_2" id="putrange_2_3" value="3"<%If Rs("PutRange_2")=3 Then Response.Write " checked"%>>只能发布在以下系统允许的站点上<br>
</td>
</tr>
<%End If%>
	
    <tr id="t_putsite"> 
      <td class="td_r">只允许发布在的站点：</td>
      <td><input name="PutSite" type="text" id="PutSite" value="<%=Rs("PutSite")%>" style="width:400px;">
        多个站点请用英文&quot;,&quot;分隔</td>
    </tr>

    <tr id="t_putsite_forbit"> 
      <td class="td_r">禁止投放的站点：</td>
      <td><input name="PutSite_Forbit" type="text" id="PutSite_Forbit" value="<%=Rs("PutSite_Forbit")%>" style="width:400px;">
        多个域名请用英文&quot;,&quot;分隔</td>
    </tr>


<script>
$(function(){

function userlimitopen_0(){
$("#t_userlimitlist").hide();
}

function userlimitopen_1(){
$("#t_userlimitlist").show();
}

function userlimitopen_2(){
$("#t_userlimitlist").show();
}

function userlimitopen_3(){
$("#t_userlimitlist").show();
}

userlimitopen_<%=Rs("userlimitopen")%>();

$("#userlimitopen_0").click(function(){
userlimitopen_0();
});

$("#userlimitopen_1").click(function(){
userlimitopen_1();
});

$("#userlimitopen_2").click(function(){
userlimitopen_2();
});

$("#userlimitopen_3").click(function(){
userlimitopen_3();
});

});
</script>

    <tr class="tr_1">
      <td colspan="2">投放用户指定</td>
    </tr>
    
<TR> 
<TD class="td_r"><span  id="t3">用户限制：</span></TD>
<TD>
<input type="radio" name="userlimitopen" id="userlimitopen_0" value="0"<%If Rs("userlimitopen")=0 Then Response.Write " Checked"%>/>不限
<input type="radio" name="userlimitopen" id="userlimitopen_1" value="1"<%If Rs("userlimitopen")=1 Then Response.Write " Checked"%>/>只允许以下用户
<input type="radio" name="userlimitopen" id="userlimitopen_2" value="2"<%If Rs("userlimitopen")=2 Then Response.Write " Checked"%>/>屏蔽以下用户
<input type="radio" name="userlimitopen" id="userlimitopen_3" value="3"<%If Rs("userlimitopen")=3 Then Response.Write " Checked"%>/>只允许以下分组的用户
</TD>
</TR>


<tr id="t_userlimitlist">
<td class="td_r">填写用户名或分组：</td>
<td>
<input name="userlimitlist" type="text" id="userlimitlist" value="<%=Rs("userlimitlist")%>" size="30" style="width:400px;">多个用户情况或分组限制请用“,”逗号隔开
</td>
</tr>
</TR>

	
<%If Not(Rs("Ad_Class") = 1 Or Rs("Ad_Class") = 2) Then '直接文字或图片类型外的%>
<tr class="tr_1">
<td colspan="2">CPC广告投放页面的来源页指定(否定优先)</td>
</tr>

<tr> 
<td class="td_r">包括填写来源页域名才算有效：</td>
<td><input name="AllowLyDomain" type="text" id="AllowLyDomain" value="<%=Rs("AllowLyDomain")%>" style="width:400px;">
<br />留空则所有域名有效,包括来源为空,一般填写主域名如a.com,主域名下的任意二级域名被设置在里面,多个域名请用英文&quot;,&quot;分隔</td>
</tr>
	
<tr> 
<td class="td_r">包括填写来源页域名则无效：</td>
<td><input name="ForbidLyDomain" type="text" id="ForbidLyDomain" value="<%=Rs("ForbidLyDomain")%>" style="width:400px;">
<br />一般填写主域名如a.com,主域名下的任意二级域名被设置在里面,多个域名请用英文&quot;,&quot;分隔</td>
</tr>
<%End If%>


<tr class="tr_1">
<td colspan="2">Iframe和Cookies</td>
</tr>

    <%
	
	If Rs("Ad_Class") = 1 Then '直接文字类型设置%>
    <tr> 
      <td class="td_r">直接文字广告放在Iframe里是否有效：</td>
      <td><input type="radio" name="DirectTextAdIframe" value="1"<%If Rs("DirectTextAdIframe")=1 Then Response.write " checked"%>>
        是 
        <input type="radio" name="DirectTextAdIframe" value="0"<%If Rs("DirectTextAdIframe")=0 Then Response.write " checked"%>>
        否　*默认为否</td>
    </tr>
    <tr> 
      <td class="td_r">直接文字广告放在Iframe时自动跳出：</td>
      <td><input type="radio" name="DirectTextAdIframeOpen" value="1"<%If Rs("DirectTextAdIframeOpen")=1 Then Response.write " checked"%>>
        是 
        <input type="radio" name="DirectTextAdIframeOpen" value="0"<%If Rs("DirectTextAdIframeOpen")=0 Then Response.write " checked"%>>
        否　*默认为是</td>
    </tr>

    <tr> 
      <td class="td_r">直接文字广告浏览器不支持Cookies点击也有效：</td>
      <td><input type="radio" name="DirectTextCookieAllYes" value="1"<%If Rs("DirectTextCookieAllYes")=1 Then Response.write " checked"%>>
        是 
        <input type="radio" name="DirectTextCookieAllYes" value="0"<%If Rs("DirectTextCookieAllYes")=0 Then Response.write " checked"%>>
        否　*默认为否</td>
    </tr>
	
	<%End If%>


	<%
	
	If Rs("Ad_Class") = 3 Or Rs("Ad_Class") = 4 Or Rs("Ad_Class") = 5 Or Rs("Ad_Class") = 6 Or Rs("Ad_Class") = 7 Then '普通文字,普通图片,弹出广告，弹出点击或富媒体广告%>
     <tr> 
      <td class="td_r">广告放在Iframe时自动跳出：</td>
      <td><input type="radio" name="WebAdIframeOpen" value="1"<%If Rs("WebAdIframeOpen")=1 Then Response.write " checked"%>>
        是 
        <input type="radio" name="WebAdIframeOpen" value="0"<%If Rs("WebAdIframeOpen")=0 Then Response.write " checked"%>>
        否　*默认为是</td>
    </tr>
	<%End If%>

<tr> 
<td>&nbsp;</td>
<td>
<input type="submit" name="adrunsitebtn" id="adrunsitebtn" value="修改" class="btn btn-primary">
</td>
</tr>

</table>

