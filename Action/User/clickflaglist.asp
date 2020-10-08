<%
'乘风广告联盟系统 Sql版
'作者QQ：178575
'作者EMail：yliangcf@163.com
'作者网站：http://www.qqcf.com
'详细简介：http://www.qqcf.com/cfwztg.htm
'上面有程序在线演示，安装演示，使用疑难解答，最新版本下载等内容
'因为这些内容可能时常更新，就没有放在程序里，请自己上网站查看
%>


<script>
$(function(){

$("#search").click(function(){
 var searchurl = "?Action=<%=Action%>";
 searchurl += '&adddate=' + $('#adddate').val();
 searchurl += '&ad_id=' + $('#ad_id').val(); 

 location.href=searchurl;
});

});
</script>

<table class="tb_1">
  <tr class="tr_h">     
      <td colspan="4" >
日期：<select id='adddate' name="adddate">
<%
Sql="Select AddDate From CFWztg_ClickFlag_Day Where UserName='"&UserName&"' Group By AddDate Order By AddDate Desc"
Set Rs = Server.CreateObject("ADODB.Recordset")
Rs.open Sql,Conn,1,1
While Not Rs.Eof 
 Response.Write "<option value='"&Rs("AddDate")&"'"
 If Request("AddDate")=Cstr(Rs("AddDate")) Then Response.Write " selected"
 Response.Write ">"&Rs("AddDate")&"</option>"  
Rs.MoveNext
Wend  
%>
</select>

广告：<select id='ad_id' name="ad_id">
<option value=''<%If Request("Ad_ID")="" Then Response.write " selected"%>>全部广告</option>
<%
Sql="Select min(b.AdName) as AdName,a.Ad_ID From CFWztg_ClickFlag_Day a inner join cfwztg_ad b on a.ad_id=b.id Where a.UserName='"&UserName&"' Group By a.Ad_ID Order By a.Ad_ID"
Set Rs = Server.CreateObject("Adodb.Recordset")
Rs.open Sql,Conn,1,1
While Not Rs.Eof
 Response.Write "<option value='"&Rs("Ad_ID")&"'"
 If Request("Ad_ID")=Cstr(Rs("Ad_ID")) Then Response.Write " selected"
 Response.Write ">"&Rs("AdName")&"["&Rs("Ad_ID")&"]</option>"
Rs.MoveNext
Wend
%>

</select>
<input type="submit" name="search" id="search" value="查询" class="btn btn-sm btn-primary">

</td>    
</tr>
</table>


<table class="tb_1">
<%
AD_ID=ChkStr(Request("AD_ID"),2)

AddDate=ChkStr(Request("AddDate"),3):If AddDate="" Then AddDate=CStr(Date)

Sql="Select sum(Click_Counter) as Click_Counter,sum(Click_2_Counter) as Click_2_Counter From CFWztg_AD_Counter_Day where UserName='"&UserName&"' And Datediff(d,AddDate,'"&AddDate&"')=0"
If AD_ID<>"" Then Sql=Sql & " And Ad_ID="&Ad_ID


Set Rs=Conn.Execute(Sql)
If Not Rs.Eof Then
 Click_Counter=Rs("Click_Counter")
 Click_2_Counter=Rs("Click_2_Counter")
Else
 Click_Counter=0
 Click_2_Counter=0
End If
Rs.Close()

 Sql= "Select sum(ClickFlag_1) as ClickFlag_1,"
 Sql= Sql & "sum(ClickFlag_2) as ClickFlag_2,"
 Sql= Sql & "sum(ClickFlag_3) as ClickFlag_3,"
 Sql= Sql & "sum(ClickFlag_4) as ClickFlag_4,"
 Sql= Sql & "sum(ClickFlag_5) as ClickFlag_5,"
 Sql= Sql & "sum(ClickFlag_6) as ClickFlag_6,"
 Sql= Sql & "sum(ClickFlag_7) as ClickFlag_7,"
 Sql= Sql & "sum(ClickFlag_7) as ClickFlag_7,"
 Sql= Sql & "sum(ClickFlag_8) as ClickFlag_8,"
 Sql= Sql & "sum(ClickFlag_9) as ClickFlag_9,"
 Sql= Sql & "sum(ClickFlag_10) as ClickFlag_10,"
 Sql= Sql & "sum(ClickFlag_11) as ClickFlag_11,"
 Sql= Sql & "sum(ClickFlag_12) as ClickFlag_12,"
 Sql= Sql & "sum(ClickFlag_13) as ClickFlag_13,"
 Sql= Sql & "sum(ClickFlag_14) as ClickFlag_14,"
 Sql= Sql & "sum(ClickFlag_15) as ClickFlag_15,"
 Sql= Sql & "sum(ClickFlag_16) as ClickFlag_16,"
 Sql= Sql & "sum(ClickFlag_17) as ClickFlag_17,"
 Sql= Sql & "sum(ClickFlag_18) as ClickFlag_18,"
 Sql= Sql & "sum(ClickFlag_19) as ClickFlag_19,"
 Sql= Sql & "sum(ClickFlag_20) as ClickFlag_20,"
 Sql= Sql & "sum(ClickFlag_21) as ClickFlag_21,"
 Sql= Sql & "sum(ClickFlag_22) as ClickFlag_22,"
 Sql= Sql & "sum(ClickFlag_23) as ClickFlag_23,"
 Sql= Sql & "sum(ClickFlag_24) as ClickFlag_24,"
 Sql= Sql & "sum(ClickFlag_25) as ClickFlag_25,"
 Sql= Sql & "sum(ClickFlag_26) as ClickFlag_26,"
 Sql= Sql & "sum(ClickFlag_27) as ClickFlag_27,"
 Sql= Sql & "sum(ClickFlag_28) as ClickFlag_28,"
 Sql= Sql & "sum(ClickFlag_29) as ClickFlag_29,"
 Sql= Sql & "sum(ClickFlag_30) as ClickFlag_30,"
 Sql= Sql & "sum(ClickFlag_31) as ClickFlag_31,"
 Sql= Sql & "sum(ClickFlag_32) as ClickFlag_32,"
 Sql= Sql & "sum(ClickFlag_33) as ClickFlag_33,"
 Sql= Sql & "sum(ClickFlag_34) as ClickFlag_34,"
 Sql= Sql & "sum(ClickFlag_35) as ClickFlag_35,"
 Sql= Sql & "sum(ClickFlag_36) as ClickFlag_36,"
 Sql= Sql & "sum(ClickFlag_37) as ClickFlag_37,"
 Sql= Sql & "sum(ClickFlag_38) as ClickFlag_38,"
 Sql= Sql & "sum(ClickFlag_39) as ClickFlag_39,"
 Sql= Sql & "sum(ClickFlag_40) as ClickFlag_40,"
 Sql= Sql & "sum(ClickFlag_41) as ClickFlag_41,"
 Sql= Sql & "sum(ClickFlag_42) as ClickFlag_42"
 Sql= Sql & "sum(ClickFlag_43) as ClickFlag_43"
 Sql= Sql & "sum(ClickFlag_44) as ClickFlag_44"

 Sql= Sql & " From CFWztg_ClickFlag_Day where UserName='"&UserName&"' And Datediff(d,AddDate,'"&AddDate&"')=0"

 If AD_ID<>"" Then Sql=Sql & " And Ad_ID="&Ad_ID

Set Rs=Conn.Execute(Sql)
%>
  <tr class="tr_1"> 
    <td colspan="2">正常点击和无效点击比较 日期:<%=AddDate%> 广告:<%If Ad_ID="" Then Response.write "全部广告"  Else Response.write Ad_ID%></td>
  </tr>
  <tr class="tr_2">
    <td><strong>点击类型</strong></td>
    <td><strong>点击数量</strong></td>
  </tr>
<%If Click_Counter>0 Then%>
  <tr>
    <td class="td_3">正常点击：</td>
    <td><%=Click_Counter%></td>
  </tr>
<%End If%>

<%If Not Rs.Eof Then%> 
<%
For I=1 To 44

'--扣点的内容不显示出来
If I<>15 And I<>16 Then
%>
<tr> 
<td class=td_3" width="200"><%=GetClickFlagDesc(I)%>：</td>
<td><%=Rs("ClickFlag_"&I)%></td>
</tr>
<%
End If

Next
%>
<%End If%>
</table>
