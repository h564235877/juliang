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

$("#infoadd").click(function(){

if ($('#assort').val()==""){
 alert('请选择分类', '', function () {$("#assort").focus();});
 return false;
}

if ($('#title').val()==""){
 alert('标题必须填写', '', function () {$("#title").focus();});
 return false;
}

if ($('#listid').val()==""){
 alert('置顶数字必须填写', '', function () {$("#listid").focus();});
 return false;
}

if ($('#listid').val()<0){
 alert('置顶数字必须大于或等于0', '', function () {$("#listid").focus();});
 return false;
}


if ($('#infokeyword').val()!=""&&getByteLen($('#infokeyword').val())>255){
 alert('文章关键字允许最长字符数:255个,输入过多请减少', '', function () {$("#infokeyword").focus();});
 return false;
}

if ($('#infodesc').val()!=""&&getByteLen($('#infodesc').val())>255){
 alert('文章描述允许最长字符数:255个,输入过多请减少', '', function () {$("#infodesc").focus();});
 return false;
}

if ($('#infolabel').val()!=""&&getByteLen($('#infolabel').val())>255){
 alert('文章标签允许最长字符数:255个,输入过多请减少', '', function () {$("#infolabel").focus();});
 return false;
}

return true;

});


});

</script>

<a href="<%=ChkStr(Request.ServerVariables("Http_Referer"),1)%>" class="actionBtn"><i class="mdi mdi-keyboard-return"></i>返回列表</a>

<form id="form_infoadd" name="form_infoadd" method="post" action="../../AdminUser.aspx?Action=infoaddsave&RefUrl=<%=Server.URLEncode(Request.ServerVariables("Http_Referer"))%>" onsubmit="return infoaddcheck()">
<table class="tb_1">
<tr class="tr_1"> 
<td colspan="2">公告和帮助增加</td>
</tr>
<tr> 
<td width="100" class="td_r">分类：</td>
<td>

<select name="assort" id="assort">
<option selected value="">请选择分类</option>
<%

Sql="Select * From CFWztg_SysInfoClass Order By ID"
Set Rs2= Server.CreateObject("ADODB.Recordset")
Rs2.open Sql,Conn,1,1
While Not Rs2.Eof
%>
<option value="<%=Rs2("ID")%>"><%=Rs2("InfoClassName")%></option>
<%
Rs2.MoveNext
Wend
Rs2.Close
%>
</select>*必选项</td>
</tr>
<tr>
<td class="td_r">标题：</td>
<td><input name="title" type="text" id="title" size="82">*必填项</td>
</tr>
<tr> 
<td class="td_r">内容：</td>
<td>
<input type="hidden" id="content" name="content" value="" style="display:none" /><input type="hidden" id="FCKeditor1___Config" value="" style="display:none" /><iframe id="FCKeditor1___Frame" src="../../js/FckEditor/editor/fckeditor.html?InstanceName=content&amp;Toolbar=Default" width="580" height="350" frameborder="0" scrolling="no"></iframe>
</td>
</tr>
<tr>
<td class="td_r">置顶数字：</td>
<td><input name="listid" type="text" id="listid" value="0" size="10">*必填项(0不置顶，大于0则置顶且数字越大越在上，数字相同越晚发布越在上)</td>
</tr>
<tr class="tr_1"> 
<td colspan="2">SEO信息</td>
</tr>
<tr>
<td class="td_r">文章关键字：</td>
<td><input name="infokeyword" type="text" id="infokeyword" size="82">非必填项
</td>
</tr>
<tr>
<td class="td_r">文章描述：</td>
<td><input name="infodesc" type="text" id="infodesc" size="82">非必填项
</td>
</tr>
<tr>
<td class="td_r">文章标签：</td>
<td><input name="infolabel" type="text" id="infolabel" size="82">非必填项
</td>
</tr>
<tr> 
<td></td>
<td>
<input type="submit" name="infoadd" id="infoadd" value="增加" class="btn btn-primary">
</td>
</tr>
</table></form>