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

Sql="Select * From CFWztg_SetSClass Where ID="&ID
Set Rs=Conn.Execute(Sql)
%>

<a href="?Action=setsclasslist&SetBClassFlag=<%=Rs("SetBClassFlag")%>" class="actionBtn"><i class="mdi mdi-keyboard-return"></i><span>返回二级设置配置列表</span></a>

<form name="form1" method="post" action="../../AdminUser.aspx?Action=setsclassmodifysave&ID=<%=ID%>&RefUrl=<%=Server.URLEncode(Request.ServerVariables("Http_Referer"))%>">

<table class="tb_1">
<tr class="tr_1">
<td colspan="2">二级设置配置修改</td>
</tr>
<tr>
<td class="td_r">设置描述：</td>
<td><input name="SetSclassDesc" type="text" id="SetSclassDesc" value="<%=Rs("SetSclassDesc")%>" size="40"<%If Rs("SetType")=1 Then Response.write " readonly style='background-color:#eeeeee'"%>></td>
</tr>
<tr>
<td class="td_r">设置的类型：</td>
<td>
<input type="radio" name="SetType" value="1"<%If Rs("SetType")=1 Then Response.write " checked"%>>内部
<input type="radio" name="SetType" value="2"<%If Rs("SetType")=2 Then Response.write " checked"%>>外部
</td>
</tr>
<tr>
<td class="td_r">排序数字：</td>
<td><input name="SetTaxis" type="text" id="SetTaxis" value="<%=Rs("SetTaxis")%>" size="40">*</td>
</tr>
<tr>
<td></td>
<td>此处无法修改三级设置的值，修改请返回在列表里点管理进入三级配置列表修改!</td>
</tr>
<tr>
<td></td>
<td><input type="submit" name="submit" value="修改" class="btn btn-primary"></td>
</tr>
</table></form>
  
  