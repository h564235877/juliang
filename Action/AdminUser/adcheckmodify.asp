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
Ad_ID=ChkStr(Request("Ad_ID"),2)

Set Rs = Server.CreateObject("ADODB.Recordset")
Sql="Select a.Ad_ID,a.CheckState,a.Unit_Cent_First as Unit_Cent_First_New,b.* From CFWztg_AD_Check a inner join CFWztg_AD b on a.ad_id=b.id where a.Ad_ID="&Ad_ID
Rs.open Sql,Conn,1,1
If Not(Rs.Eof) Then
 Ad_ID=Rs("Ad_ID")
 CheckState=Rs("CheckState")
 Unit_Cent_First_New=Rs("Unit_Cent_First_New")
   

 Ad_Class=Rs("Ad_Class")
 AdName=Rs("AdName")
 Ad=Rs("Ad")
 AdIntro=Rs("AdIntro")
 Ad_Url=Rs("Ad_Url")
 Ad_Url_TypeSet=Rs("Ad_Url_TypeSet")
 Ad_Url_Android=Rs("Ad_Url_Android")
 Ad_Url_Iphone=Rs("Ad_Url_Iphone")
 AdSimpleUrl=Rs("AdSimpleUrl")
 Unit_Cent_First=Rs("Unit_Cent_First")

 CheckDesc="降低价格需要审核，提高价格和修改非价格项的修改无需审核即时生效!"
Else
 Response.write "信息不存在"
 Response.end
End If
Rs.Close


%>


<script>
$(function(){


$("#admodifysave").click(function(){


if($("#unit_cent_first_new").val()==""){
 alert('请输入新单价', '', function () {$("#unit_cent_first_new").focus();});
 return false;
}

if($("#CheckState option:selected").val()==""){
 alert('请选择审核状态', '', function () {$("#CheckState").focus();});
 return false;
}


if($("#CheckState option:selected").val()=="2"){
 return confirm('确定要审核成功吗?');
}


});

});
</script>


<a href="<%=ChkStr(Request.ServerVariables("Http_Referer"),1)%>" class="actionBtn"><i class="mdi mdi-keyboard-return"></i>返回列表</a>

  <form name="form1" method="post" action="../../AdminUser.aspx?Action=adcheckmodifysave&Ad_ID=<%=Ad_ID%>&RefUrl=<%=Server.URLEncode(Request.ServerVariables("Http_Referer"))%>">

<table class="tb_1">

   <tr class="tr_1"> 
      <td colspan="2">广告信息</td>
  </tr>
  
   <tr>
     <td class="td_r">&nbsp;</td>
     <td><font color="#FF0000">(注:<%=CheckDesc%>)</font></td>
   </tr>
   <tr>
  <td class="td_r">广告名称：</td>
<td><input name="adname" id="adname" type="text"  value="<%=adname%>" readonly style="width:300px;background-color:#eeeeee"></td>
</tr>


 <%If Ad_Class=1 Or Ad_Class=3 Or Ad_Class=5  Or Ad_Class=6 Or Ad_Class=7 Then%>

    <tr> 
      <td class="td_r">广告文字：</td>
      <td><textarea name="ad" id="ad" rows="5" readonly style="width:300px;background-color:#eeeeee"><%=ad%></textarea>
      <a href="?Action=imglist" target="_blank">上传文件</a></td>
      </tr>
    <%ElseIf Ad_Class=2 Or Ad_Class=4 Then%>
    <tr> 
      <td class="td_r">广告图片：</td>
      <td><input name="ad" id="ad" type="text" value="<%=ad%>" readonly style="width:300px;background-color:#eeeeee">
  <a href="?Action=imglist" target="_blank">上传文件</a>
      </td>
    </tr>
    <%End If%>
   <%If Ad_Class=5 Or Ad_Class=6 Then%>
    <tr> 
      <td class="td_r">广告简介文字：</td>
      <td><input name="AdIntro" id="AdIntro" type="text" value="<%=AdIntro%>" readonly style="width:300px;background-color:#eeeeee"></td>
    </tr>
    <%End If%>
	
	<TR> 
      <TD class="td_r">广告链接：</TD>
      <TD><input name="ad_url" id="ad_url" type="text" value="<%=Ad_Url%>" readonly style="width:300px;background-color:#eeeeee"></TD>
    </TR>

<TR> 
<TD class="td_r">移动设备广告链接：</TD>
<TD><input type="radio" name="ad_url_typeset" id="ad_url_typeset_0" value="0"<%If Ad_Url_TypeSet=0 Then Response.write " checked"%> disabled />和PC广告链接相同
  <input type="radio" name="ad_url_typeset" id="ad_url_typeset_1" value="1"<%If Ad_Url_TypeSet=1 Then Response.write " checked"%> disabled />和PC广告链接不同,分别指定
  
<%If Ad_Url_TypeSet=1 Then%>
  <div id="t_ad_url_android">
  <br />
    安卓手机广告链接：<input name="ad_url_android" type="text" id="ad_url_android" value="<%=ad_url_android%>" readonly  style="width:300px;background-color:#eeeeee">
  </div>
  
  <div id="t_ad_url_iphone">
  <br />
    苹果手机广告链接：<input name="ad_url_iphone" type="text" id="ad_url_iphone" value="<%=ad_url_iphone%>" readonly  style="width:300px;background-color:#eeeeee">
  </div>
<%End If%>
  
  
</TD>
</TR>



   <%If Ad_Class=5 Then%>
    <tr> 
      <td class="td_r">简短域名：</td>
      <td><input name="adsimpleurl" id="adsimpleurl" type="text" value="<%=AdSimpleUrl%>" readonly style='width:300px;background-color:#eeeeee'></td>
    </tr>
    <%End If%>



    
    <tr> 
      <td class="td_r">移动设备单价倍数：</td>
      <td><input name="Moblie_Mul_First" type="text" value="<%=Moblie_Mul_First%>" readonly style='width:300px;background-color:#eeeeee'>倍</td>
    </tr>
    <tr>
      <td class="td_r">投放设备：</td>
      <td><input type="radio" name="sitetypeset" id="sitetypeset_1" value="0" disabled <%If Ad_Url_TypeSet=0 Then Response.write " checked"%>/>不限
        <input type="radio" name="sitetypeset" id="sitetypeset_2" value="1" disabled <%If Ad_Url_TypeSet=1 Then Response.write " checked"%>/>指定终端
  <%If Ad_Url_TypeSet=1 Then%>  
  <br />
<input type="checkbox" name="sitetype" id="sitetype" value="pc" disabled<%If Instr(Rs("sitetype"),"pc")>0 Then Response.Write " Checked"%>>桌面电脑&nbsp;&nbsp;&nbsp;&nbsp;

<input type="checkbox" name="sitetype" id="sitetype" value="android" disabled<%If Instr(Rs("sitetype"),"android")>0 Then Response.Write " Checked"%>>安卓手机&nbsp;&nbsp;&nbsp;&nbsp;
<input type="checkbox" name="sitetype" id="sitetype" value="apad" disabled<%If Instr(Rs("sitetype"),"apad")>0 Then Response.Write " Checked"%>>安卓平板&nbsp;&nbsp;&nbsp;&nbsp;

<input type="checkbox" name="sitetype" id="sitetype" value="ios" disabled<%If Instr(Rs("sitetype"),"ios")>0 Then Response.Write " Checked"%>>苹果手机&nbsp;&nbsp;&nbsp;&nbsp;
<input type="checkbox" name="sitetype" id="sitetype" value="ipad" disabled<%If Instr(Rs("sitetype"),"ipad")>0 Then Response.Write " Checked"%>>苹果平板&nbsp;&nbsp;&nbsp;&nbsp;

<input type="checkbox" name="sitetype" id="sitetype" value="windows phone"<%If Instr(Rs("sitetype"),"windows phone")>0 Then Response.Write " Checked"%>>微软WP

  <%End If%></td>
    </tr>



<tr class="tr_1"> 
<td colspan="2">审核</td>
</tr>
  
<tr> 
<td class="td_r">广告单价：</td>
<td>
当前最新<input name="unit_cent_first" id="unit_cent_first" type="text" value="<%=GetTurnCent(unit_cent_first)%>" readonly style='width:100px;background-color:#eeeeee'>元
--->修改为
<input name="unit_cent_first_new" id="unit_cent_first_new" type="text" value="<%=GetTurnCent(unit_cent_first_new)%>"
<%
If CheckState=1 Then
 Response.write " style='width:100px;'"
Else
 Response.write " readonly style='width:100px;background-color:#eeeeee'"
End If
%>

>元
</td>
    </tr>
    
<TR> 
<TD class="td_r">当前状态：</TD>
<TD>
<%
If CheckState=1 Then
 Response.write "审核中  --->  修改为："
 Response.write "<select name='CheckState' id='CheckState'>"
 Response.write "<option value=''>请选择</option>"
 Response.write "<option value='1'>审核中</option>"
 Response.write "<option value='2'>审核成功</option>"
 Response.write "<option value='3'>审核失败</option>"
 Response.write "</select>"
ElseIf CheckState=2 Then
 Response.write "审核成功"
ElseIf CheckState=3 Then
 Response.write "审核失败"
End If
%>

</TD>
</TR>
<%
If CheckState=1 Then
%> 
    <tr>
      <td class="td_r">&nbsp;</td>
      <td><input type="submit" name="submit" value="修改" id="admodifysave" class="btn btn-primary"></td>
    </tr>
<%
End If
%>


</table>

</form>