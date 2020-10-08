<%
'乘风广告联盟系统 Sql版
'作者QQ：178575
'作者EMail：yliangcf@163.com
'作者网站：http://www.qqcf.com
'详细简介：http://www.qqcf.com/cfwztg.htm
'上面有程序在线演示，安装演示，使用疑难解答，最新版本下载等内容
'因为这些内容可能时常更新，就没有放在程序里，请自己上网站查看
%>

<form action="../../cf.aspx?action=lowuniondataout" method="post" name="form2" target="_blank">
<table class="tb_1"><tr class="tr_1"> 
      <td colspan="2">CPC、CPV和CPA收入数据导出</td>

	<tr>
      <td class="td_r">用户名：</td>
      <td><%=UserName%><input type="hidden" name="UserName" value="<%=UserName%>"></td>
    </tr>
	<tr>
      <td class="td_r">登录密码：</td>
      <td><input name="Pwd" type="password" id="Pwd"></td>
    </tr>
	<tr>
      <td class="td_r">下级联盟获利的百分比：</td>
      <td><input name="TcRate" type="text" id="TcRate" value="100">%(注：在已经获利里给下线联盟的比率)</td>
    </tr>
	<tr>
      <td class="td_r">开始日期：</td>
      <td><input name="StartDate" type="text" id="StartDate" value="<%=Date-1%>">(注：不能为今天的日期)</td>
    </tr>
	<tr>
      <td class="td_r">结束日期：</td>
      <td><input name="EndDate" type="text" id="EndDate" value="<%=Date-1%>">(注：不能为今天的日期)</td>
    </tr>
	<tr>
	  <td class="td_r">导出数据格式：</td>
	  <td><input name="OutType" type="radio" id="radio" value="json" checked="checked" />json格式
      <input type="radio" name="OutType" id="radio2" value="txt" />txt文本</td>
    </tr>
	<tr>
      <td height="29">&nbsp;</td>
      <td><input type="submit" name="submit" value="导出" class="btn btn-primary"></td>
	</tr>
	<tr class="tr_1"> 
	  <td colspan="2">CPC、CPV和CPA收入数据接口查询</td>
    </tr>
	<tr>
	  <td class="td_r">
查询接口：</td>
      <td><textarea name="textarea" cols="60" rows="3"><%=AdPath%>cf.aspx?action=lowuniondataout&username=<%=UserName%>&pwd=&tcrate=100&startdate=<%=Date-1%>&enddate=<%=Date-1%>&outype=json</textarea></td>
	</tr>
	<tr>
	  <td class="td_r">查询接口参数说明：</td>
	  <td>

username：本联盟的用户名<br />
pwd：本联盟的用户密码<br />
tcrate：下级联盟用户获利的百分比<br />
startdate：查询开始日期,不能为今天的日期<br />
enddate：查询结束日期,不能为今天的日期<br />
outtype:导出数据的格式，参数可为支持json或txt
</td>
    </tr>
	<tr>
	  <td class="td_r">返回的json数据说明</td>
	  <td>返回数据格式如:<br />
{"success": "true","message": "成功","data":[
{"lowunionusername":"xxx","total_cent":"0.03","adddate":"2011-5-28"}
]}<br /><br />
success:返回成功true或失败false<br />
message:返回失败时的原因<br />
lowunionusername:下线联盟的用户名或用户id<br />
total_cent:下线联盟的用户在adddate这一天日期获取到的总金额乘以tcrate%的结果<br />
adddate:日期，每个下线联盟用户在同一天只有一条记录
</td>
    </tr>
</table>
</form>
