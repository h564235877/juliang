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
Set Rs = Server.CreateObject("Adodb.RecordSet")
Sql="Select * From CFWztg_User Where UserName='"&UserName&"'"
Rs.Open Sql,Conn,1,1

If Rs("BindUserName")="" Then AlertRef("需先在安全中心绑定一个广告主后才能把资金转给广告主")
%>

<script>
$(function(){
 $("#submit").click(function(){
  Spend_Cent=$('#Spend_Cent').val();
  if(Spend_Cent==""){
   alert('请填写想要转出的金额', '', function () {$("#Spend_Cent").focus();});
   return false;
  }

  if(Spend_Cent<=0){
   alert('填写想要转出的金额必须大于0', '', function () {$("#Spend_Cent").focus();});
   return false;
  }

  if($("#PwdAnswer").val()==""){
   alert('请填写密码回答答案', '', function () {$("#PwdAnswer").focus();});
   return false;
  }

 })
});
</script>

<form name="form4" method="post" action="../../User.aspx?Action=spareoutsave&RefUrl=<%=Server.URLEncode(Request.ServerVariables("Http_Referer"))%>">
<table class="tb_1">
<tr class="tr_1"> 
      <td colspan="2">资金转给广告主 </td>
    </tr>
    <tr> 
      <td width="130" class="td_r">剩余金额：</td>
      <td><%
Response.write GetTurnCent(Rs("Spare_Cent"))&"元"
%></td>
    </tr>
    <tr> 
      <td class="td_r">把资金转给广告主：</td>
      <td><%=Rs("BindUserName")%></td>
    </tr>
    <tr> 
      <td class="td_r">想要转出的金额：</td>
      <td>
<input name="Spend_Cent" id="Spend_Cent" type="text">元<font color="#ff0000">*</font>
</td>
    </tr>
<tr class="tr_1"> 
      <td colspan="2" >请输入验证确认以上修改</td>
    </tr>
    <tr> 
      <td class="td_r">密码提示问题：</td>
      <td><%=Rs("PwdAsk")%></td>
    </tr>
    <tr> 
      <td class="td_r">密码回答答案：</td>
      <td>
<input type="text" name="PwdAnswer" id="PwdAnswer"><font color="#ff0000">*</font>
</td>
    </tr>
    <tr> 
      <td>&nbsp;</td>
      <td><input type="submit" name="submit" id="submit" value="转出" class="btn btn-primary"></td>
    </tr>
</table>
</form>