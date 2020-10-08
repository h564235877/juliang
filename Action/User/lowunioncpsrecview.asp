<%
'乘风广告联盟系统 Sql版
'作者QQ：178575
'作者EMail：yliangcf@163.com
'作者网站：http://www.qqcf.com
'详细简介：http://www.qqcf.com/cfwztg.htm
'上面有程序在线演示，安装演示，使用疑难解答，最新版本下载等内容
'因为这些内容可能时常更新，就没有放在程序里，请自己上网站查看
%>

<form action="../../cf.aspx?action=lowunioncpsout" method="post" name="form2" target="_blank">
<table class="tb_1"><tr class="tr_1"> 
      <td colspan="2">CPS数据导出</td>

	<tr>
      <td class="td_r">用户名：</td>
      <td><%=UserName%><input type="hidden" name="UserName" value="<%=UserName%>"></td>
    </tr>
	<tr>
      <td class="td_r">登录密码：</td>
      <td><input name="Pwd" type="password" id="Pwd"></td>
    </tr>
	<tr>
	  <td class="td_r">广告主名：</td>
	  <td><input name="AdUserName" type="text" id="AdUserName" value="">(注:留空则导出所有广告主的cps数据，填写广告主名则导出单个广告主的数据)</td>
    </tr>
	<tr>
      <td class="td_r">下级联盟CPS获利的百分比：</td>
      <td><input name="TcRate" type="text" id="TcRate" value="100">%(注：在已经获利里给下线联盟的比率)</td>
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
	  <td class="td_r">导出数据格式：</td>
	  <td><input type="radio" name="OutType" id="radio" value="json" checked="checked" />json格式
      <input type="radio" name="OutType" id="radio2" value="txt" />txt文本</td>
    </tr>
	<tr>
      <td>&nbsp;</td>
      <td><input type="submit" name="submit" value="导出" class="btn btn-primary"></td>
	</tr>
	<tr class="tr_1"> 
	  <td colspan="2">CPS接口数据查询</td>
    </tr>
	<tr>
	  <td class="td_r">
查询接口：
  <br /></td>
      <td><textarea name="textarea" cols="60" rows="3"><%=AdPath%>cf.aspx?action=lowunioncpsout&username=<%=UserName%>&pwd=&adusername=&tcrate=100&startdate=<%=Date%>&enddate=<%=Date%>&outype=json</textarea></td>
	</tr>
	<tr>
	  <td class="td_r">说明：</td>
	  <td> username：本联盟的用户名<br />
pwd：本联盟的用户密码<br />
adusername：留空则导出所有广告主的cps数据，填写广告主名则导出单个广告主的数据<br />
tcrate：下级联盟用户CPS获利的百分比<br />
startdate：查询开始日期<br />
enddate：查询结束日期<br />
outtype:导出数据的格式，参数可为支持json或txt
</td>
    </tr>
    
	<tr>
	  <td class="td_r">返回的json数据说明</td>
	  <td>返回数据格式如:<br />
{"success": "true","message": "成功","data":[<br />
{"adusername":"myad","ordercode":"c","lowunionusername":"1","spend_cent":"0.30","addtime":"2011-5-4 10:23:19","orderdesc":""},<br />
{"ordercode":"mytest-a-488997151","lowunionusername":"a","spend_cent":"14.00","addtime":"2015-7-2 16:27:06","orderdesc":""},<br />
{"ordercode":"mytest-488997152","lowunionusername":"a","spend_cent":"14.00","addtime":"2015-7-2 16:27:06","orderdesc":""}<br />
]}<br /><br />
success:返回成功true或失败false<br />
message:返回失败时的原因<br />
adusername:本联盟中的cps广告主名<br />
ordercode:订单号，这是一个唯一值，每个订单号不会相同<br />
lowunionusername:下线联盟的用户名或用户id<br />
spend_cent:下线联盟的用户在此订单获得总金额上乘以tcrate%的结果
addtime:订单生成时间
orderdesc:订单描述
</td>
    </tr>
</table></form>
