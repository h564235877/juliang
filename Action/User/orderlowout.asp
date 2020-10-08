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
AdUserName = ChkStr(Request("AdUserName"),1)

AddTime=Goback(ChkStr(Request("AddTime"),3),"日期不能为空")

Sql="select lowunionusername,count(1) as ordertotal from CFWztg_AdUser_Order where AdUserName='"&AdUserName&"' And UserName='"&UserName&"' And (OrderState=1 or OrderState=3) And Datediff(d,addtime,'"&AddTime&"')=0 group by lowunionusername order by ordertotal desc"

Set Rs=Conn.execute(Sql)
While Not Rs.Eof
 If Rs("lowunionusername")<>"" Then OutStr = OutStr & AddTime&"|"&Rs("lowunionusername")&"|"&Rs("ordertotal")&chr(13)
Rs.MoveNext
Wend
%>

<a href="?Action=orderdaytj" class="actionBtn"><i class="mdi mdi-keyboard-return"></i>返回列表</a>

<table class="tb_1">
<tr> 
<td colspan="17">
<select id='AdUserName' onChange="window.location=document.getElementById('AdUserName').options[document.getElementById('AdUserName').selectedIndex].value">
<option value=?Action=<%=Action%>&AddTime=<%=AddTime%>>请选择广告主</option>
<%
Sql="Select AdUserName From CFWztg_AdUser_Order Group By AdUserName Order By AdUserName"
Set Rs = Server.CreateObject("Adodb.Recordset")
Rs.open Sql,Conn,1,1
While Not Rs.Eof
 Response.Write "<option value='?Action="&Action&"&AddTime="&AddTime&"&AdUserName="&Rs("AdUserName")&"'"
 If Request("AdUserName")=Cstr(Rs("AdUserName")) Then Response.Write " selected"
 Response.Write ">"&Rs("AdUserName")&"</option>"
Rs.MoveNext
Wend
%>
        </select></td>
  </tr> 
  
  <tr class="tr_1">   
    <td colspan="4">	
	广告主:<%=AdUserName%> 日期<%=AddTime%> 下级联盟各子用户的订单数量</td>
  </tr>

<tr>
<td>
<%If AdUserName<>"" Then%>
<textarea name="orderlowinfo" cols="80" rows="20">
<%=OutStr%>
</textarea>
<%Else%>
请在上面选择一个广告主后导出下级联盟子用户订单数据
<%End If%>
</td>
  </tr>
</table>


