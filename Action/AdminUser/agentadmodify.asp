<%
'乘风广告联盟系统 Sql版
'作者QQ：178575
'作者EMail：yliangcf@163.com
'作者网站：http://www.qqcf.com
'详细简介：http://www.qqcf.com/cfwztg.htm
'上面有程序在线演示，安装演示，使用疑难解答，最新版本下载等内容
'因为这些内容可能时常更新，就没有放在程序里，请自己上网站查看
%>
<table class="tb_1">
<tr class="tr_h"> 
<td colspan="4">代理广告修改或删除</td>
</tr>
<tr class="tr_1"> 
<td>ID</td>
<td>广告代码</td>
<td>广告说明</td>
<td>操作</td>
</tr>
<%
MyStr=""

Sql="Select * From CFWztg_AgentAd Order By ID Desc"
Set Rs=Conn.Execute(Sql)

While Not Rs.Eof
%>
<form name="<%="form_"&Rs("ID")%>" id="<%="form_"&Rs("ID")%>" method="post" action="../../AdminUser.aspx?Action=agentadmodifysave&ID=<%=Rs("ID")%>">
<tr class="tr_2"> 
<td><%=Rs("ID")%></td>
<td><textarea name="AdCode" cols="40" rows="6" id="textarea"><%=Rs("AdCode")%></textarea></td>
<td><textarea name="AdDesc" cols="40" rows="6" id="textarea"><%=Rs("AdDesc")%></textarea></td>
<td>
<a href="#" onclick="document.getElementById('<%="form_"&Rs("ID")%>').submit();" class="btn_edit"><i class="mdi mdi-pencil"></i> 修改</a>

<a href="javascript:;" onclick="$(function () { confirm('你确定要删除吗?', '', function (isConfirm) {if (isConfirm) {gotoUrl('../../AdminUser.aspx?Action=agentaddel&ID=<%=Rs("ID")%>')}}, {confirmButtonText: '确定', cancelButtonText: '取消', width: 400});});" class="btn_del"><i class="mdi mdi-window-close"></i> 删除</a>
</td>
</tr>
</form>
<%
Rs.MoveNext
Wend
%>
<tr class="tr_1"> 
<td colspan="4">代理广告新增</td>
</tr>
<tr class="tr_2"> 
<td></td>
<td>广告代码ID</td>
<td>广告说明</td>
<td>操作</td>
</tr>

<form name="agentadadd" id="agentadadd" method="post" action="../../AdminUser.aspx?Action=agentadaddsave">
<tr class="tr_2"> 
<td></td>
<td>
<textarea name="AdCode" cols="40" rows="6" id="AdCode"></textarea>
<br>支持参数：{username},{userid}
</td>
<td>
<textarea name="AdDesc" cols="40" rows="6" id="AdDesc"></textarea><br>支持html代码
</td>
<td><a href="javascript:document.getElementById('agentadadd').submit();" class="btn_add"><i class="fa fa-plus"></i> 新增</a>
</td>
</tr>
</form>
<tr> 
<td colspan="4"></td>
</tr>
</table>
