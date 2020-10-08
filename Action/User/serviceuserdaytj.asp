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
StartDate=ChkStr(Request("StartDate"),3):If StartDate="" Then StartDate=Date()
EndDate=ChkStr(Request("EndDate"),3):If EndDate="" Then EndDate=Date()

if IsDate(StartDate) = False Or IsDate(EndDate) = False Or Cdate(StartDate)>Cdate(EndDate) Then Call AlertBack("时间格式有错误或第一个输入的日期比第二个输入的日期要大!",1)


Sql="select username,ServiceUserNick,"

Sql=Sql&"(select IsNull(sum(b1.user_income_cent),0) from CFWztg_AD_Counter_Day b1 where b1.adddate >='"&StartDate&"' and b1.adddate <='"&EndDate&"' and  b1.username in (select b2.username from CFWztg_User b2 where b2.myserviceusername=a.username)) income_cent,"

Sql=Sql&"(select IsNull(sum(c1.ordercent * c1.ordertcrate/100),0) as tccent from CFWztg_AdUser_Order c1 Where c1.addtime >='"&StartDate&"' and c1.addtime <='"&EndDate&"'  And (c1.OrderState=1 or c1.OrderState=3) and c1.username in (select c2.username from CFWztg_User c2 where c2.myserviceusername=a.username)) income_cent_cps"

Sql=Sql&" from CFWztg_User a where serviceuser=1 "


Set Rs = Server.CreateObject("Adodb.RecordSet")
Rs.Open Sql,Conn,1,1
%>
     
<table class="tb_2">
<tr>
<td><span class="title">客服业绩统计 从<%=StartDate%>到<%=EndDate%></span></td>

</tr>
</table>
     
<table class="tb_1">

  <tr class="tr_1"> 
    <td>客服用户名</td>
    <td>呢称</td>
    <td>CPC,CPV,CPA业绩</td>
    <td>CPS业绩</td>
  </tr>
  <%
While Not Rs.Eof
%>
  <tr class="tr_2"> 
    <td><%=Rs("UserName")%></td>
<td>
<%=Rs("ServiceUserNick")%>
</td>
    <td><%=GetTurnCent(Rs("income_cent"))%>元</td>
    <td><%=GetTurnCent(Rs("income_cent_cps"))%>元</td>
  </tr>
  <%
Rs.MoveNext
Wend
%>
</table>


<script>
$(function(){

$("#search").click(function(){
 var searchurl ="?Action=<%=Action%>";
 searchurl += '&StartDate=' + $('#StartDate').val();
 searchurl += '&EndDate=' + $('#EndDate').val();

 location.href=searchurl;
});

});
</script>

<table class="tb_3"><tr> 
      <td>开始日期：</td>
      <td><input name="StartDate" type="text" id="StartDate" value="<%=StartDate%>" size="10"onclick="fPopCalendar(event,this,this)" onfocus="this.select()"  /></td>
      <td>结束日期：</td>
      <td><input name="EndDate" type="text" id="EndDate" value="<%=EndDate%>" size="10"onclick="fPopCalendar(event,this,this)" onfocus="this.select()" /></td>
      <td><input type="submit" name="submit" value="查询" class="btn btn-sm btn-primary" id="search"></td>
	  </tr>
</table>
