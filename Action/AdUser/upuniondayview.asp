<%
'乘风广告联盟系统 Sql版
'作者QQ：178575
'作者EMail：yliangcf@163.com
'作者网站：http://www.qqcf.com
'详细简介：http://www.qqcf.com/cfwztg.htm
'上面有程序在线演示，安装演示，使用疑难解答，最新版本下载等内容
'因为这些内容可能时常更新，就没有放在程序里，请自己上网站查看
%>

<form action="?Action=upuniondayin" method="post" name="form2" target="_blank">
<table class="tb_1"><tr class="tr_1"> 
      <td colspan="2">统计数据导入</td>
    </tr>
	<tr>
      <td class="td_r">上级联盟网址：</td>
      <td><input name="UnionUrl" type="text" id="UnionUrl">(注：以"/"结尾)</td>
    </tr>
	<tr>
      <td class="td_r">上级联盟用户名：</td>
      <td><input name="UserName" type="text" id="UserName">(需代理权限)</td>
    </tr>
	<tr>
      <td class="td_r">上级联盟登录密码：</td>
      <td><input name="Pwd" type="password" id="Pwd"></td>
    </tr>

	<tr>
      <td class="td_r">开始日期：</td>
      <td><input name="StartDate" type="text" id="StartDate" value="<%=Date%>"></td>
    </tr>
	<tr>
      <td class="td_r">结束日期：</td>
      <td><input name="EndDate" type="text" id="EndDate" value="<%=Date%>"></td>
    </tr>
	<tr>
      <td height="29">&nbsp;</td>
      <td><input type="submit" name="submit" value="导入" class="btn btn-primary"></td>
	</tr>
</table>
</form>
