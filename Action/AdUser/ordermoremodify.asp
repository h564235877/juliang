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
OrderInfo=ChkStr(Request("OrderInfo"),1)
%>
  
<form name="form2" method="post" action="../../AdUser.aspx?Action=ordermoremodifysave&RefUrl=<%=Server.URLEncode(Request.ServerVariables("Http_Referer"))%>">
<table class="tb_1"><tr class="tr_1"> 
<td colspan="2">手工批量确认CPS订单</td>
</tr>
<tr> 
<td width="80" class="td_r">订单信息：</td>
<td><textarea name="OrderInfo" cols="40" rows="10"><%=OrderInfo%></textarea>
<br />
注：每行一条信息，每行格式：订单号</td>
</tr>
<tr> 
<td></td>
<td>
<input type="submit" name="submit" value="确认" onclick="return confirm('确定要确认这些定单为成功状态吗?')" class="btn btn-primary">      </td>
</tr>
</table>
</form>