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
<tr class="tr_1"> 
<td colspan="2">广告类型：<font color="#FF0000"><%=GetAdClassName(Ad_Class)%></font></td>
</tr>
<%
ID=CLng(ChkStr(Request("ID"),2))

Sql="Select * From CFWztg_AgentAd Order By ID Desc"
Set Rs=Conn.Execute(Sql)

While Not Rs.Eof
%>

  <tr> 
    <td>
	<a name="tagad<%=Rs("ID")%>"></a>代理广告编号：<%=Rs("ID")%>
<%
Response.write "<br><br>广告描述："&Rs("AdDesc")
%>
	</td>
    <td style="width:180px;"><a href='?Action=adcodeget&Ad_Class=<%=Ad_Class%>&ID=<%=Rs("ID")%>' class="btn btn-primary"><span>预览及获得此广告代码</span></a></td>
  </tr>
<%
Rs.MoveNext
Wend
%>
</table>