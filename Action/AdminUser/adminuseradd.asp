<%
'乘风广告联盟系统 Sql版
'作者QQ：178575
'作者EMail：yliangcf@163.com
'作者网站：http://www.qqcf.com
'详细简介：http://www.qqcf.com/cfwztg.htm
'上面有程序在线演示，安装演示，使用疑难解答，最新版本下载等内容
'因为这些内容可能时常更新，就没有放在程序里，请自己上网站查看
%>
<SCRIPT>
$(function(){

$("#PowerLevel1").click(function(){
$("#a_1").hide();
});

$("#PowerLevel2").click(function(){
$("#a_1").show();
});

});
</SCRIPT>

<a href="<%=ChkStr(Request.ServerVariables("Http_Referer"),1)%>" class="actionBtn" style="margin-top:10px;"><i class="mdi mdi-keyboard-return"></i>返回列表</a>

<form name="form2" method="post" action="../../AdminUser.aspx?Action=adminuseraddsave&RefUrl=<%=Server.URLEncode(Request.ServerVariables("Http_Referer"))%>">
<table class="tb_1"><tr class="tr_1"> 
<td colspan="2">管理员增加</td>
</tr>

<tr>
<td width="120" class="td_r">管理员用户名：</td>
<td><input name="AdminUserName" type="text" id="AdminUserName" size="30">*(小写英文字母，数字，下划线有效)</td>
</tr>
<tr> 
<td class="td_r">管理员密码：</td>
<td><input name="Pwd" type="password" id="Pwd" size="30">*</td>
</tr>
<tr> 
<td class="td_r">管理员描述：</td>
<td><input name="AdminUserDesc" type="text" id="AdminUserDesc" size="30"></td>
</tr>
<tr> 
<td class="td_r">管理员级别：</td>
<td><input type="radio" name="PowerLevel" value="1" id="PowerLevel1">
超级管理员 
<input type="radio" name="PowerLevel" value="2" id="PowerLevel2">
普通管理员 *</td>
</tr>
<tr> 
<td colspan="2" id="a_1" style="display:none">

<style type="text/css">
.adminpower ul .li1{ width:100%;font-size:15px;font-weight:bold;}
.adminpower ul{clear:both;}
.adminpower ul li{line-height:30px;width:200px;float:left;}
.adminpower .span2{font-weight:normal;font-size:14px;}
}
</style>

<script>
//这里排除PowerLevel
function selectadminpowerbox(form) {
    for (var i = 0; i < form.elements.length; i++) {
        var e = form.elements[i];
        if (e.name != 'chkall' && e.name != 'PowerLevel' && e.disabled != true) e.checked = form.chkall.checked;
    }
}
</script>

<div class="adminpower">

<ul>
<li class="li1">普通管理员请选择以下权限</li>
<li><input name="chkall" type="checkbox" id="chkall" onclick="selectadminpowerbox(this.form)" value="check">全选或取消全选</li>
<ul>

<%
Sql="Select * From CFWztg_SetSClass where SetBClassFlag='AdminPower' Order By SetTaxis"
Set Rs = Conn.Execute(Sql)
While Not Rs.Eof
%>
<ul>
<li class="li1"><%=Rs("SetSclassDesc")%>：</li>
<li style="clear:both"></li>
<%
Sql="Select * From CFWztg_SetContent where SetBClassFlag='AdminPower' And SetSClassFlag='" & Rs("SetSClassFlag") & "' Order By SetTaxis"
Set Rs2 = Conn.Execute(Sql)

While Not Rs2.Eof
%>	
<li><input type="checkbox" name="powerhold" value="<%=Rs2("SetFlag_2")%>"<%If InStr(","&PowerHold&",",","&Rs2("SetFlag_2")&",")>0 Then Response.write " checked"%>><%=Rs2("SetDesc")%></li>
<%
Rs2.MoveNext
Wend
%>
</ul>
<%
Rs.MoveNext
Wend
%>
</div>
</td>
</tr>
<tr> 
<td></td>
<td>
<input type="submit" name="submit" id="submit" value="增加" class="btn btn-primary">
</td>
</tr>
</table>
</form>
