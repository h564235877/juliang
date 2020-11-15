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
Set Rs= Server.CreateObject("Adodb.RecordSet")
Sql="Select ID From CFWztg_User Where UserName='"&UserName&"'"
Rs.Open Sql,Conn,1,1
UserID = Rs("ID")
Rs.Close
%>

<script src="../../js/clipboard.min.js"></script>

<%If Action="adcodeget" And CInt(ChkStr(Request("Ad_Class"),2))=1 Then%>
<%
ID=ChkStr(Request("ID"),2)
ClickState=CInt(Request("ClickState"))

Set Rs = Server.CreateObject("Adodb.RecordSet")
Sql="Select * From CFWztg_AD where ID="&ID
Rs.Open Sql,Conn,1,1
%>


	
<table class="tb_1">  
  <tr class="tr_1"> 
    <td>代码a1（用户ID类）</td>
  </tr>
  <tr>
    <td><textarea id="ada1" cols="80" rows="2"><%=AdPath_2&"cf.aspx?"&Rs("ID")&"."&UserID%></textarea>

<input type="button" value="复制代码" id="copya1" data-clipboard-target="#ada1" data-clipboard-action="copy" class="btn btn-primary">
<script>    
    $(function(){
        var clipboard = new Clipboard('#copya1');
        clipboard.on('success', function(e) {
            e.clearSelection();
            console.log(e.clearSelection);
        });
    });
</script>


<input type="submit" name="submit" value="　返回　" onclick="location.href='?Action=adlist&Ad_Class=<%=Request("Ad_Class")%>&Ad_ID=<%=Rs("ID")%>&ClickState=<%=ClickState%>#ad<%=Rs("ID")%>'" class="btn btn-dark"></td>
</tr>
  

<tr class="tr_1"> 
<td>代码a1效果：</td>
</tr>
<tr> 
<td><a href=<%=AdPath_2&"cf.aspx?"&Rs("ID")&"."&UserID%> target=_blank><%=AdPath_2&"cf.aspx?"&Rs("ID")&"."&UserID%></a></td>
</tr>
  
  
<tr class="tr_1"> 
<td>代码a2（用户ID类，支持下级联盟的代码，xxx代表下级联盟的用户名或用户ID）</td>
</tr>
<tr>
    <td><textarea id="ada2" cols="80" rows="2"><%=AdPath_2&"cf.aspx?"&Rs("ID")&"."&UserID&".xxx"%></textarea>

<input type="button" value="复制代码" id="copya2" data-clipboard-target="#ada2" data-clipboard-action="copy" class="btn btn-primary">
<script>    
    $(function(){
        var clipboard = new Clipboard('#copya2');
        clipboard.on('success', function(e) {
            e.clearSelection();
            console.log(e.clearSelection);
        });
    });
</script>
</td>
  </tr>

 
   <tr class="tr_1"> 
    <td>代码b1（用户名类）</td>
  </tr>
  <tr>
    <td><textarea id="adb1" cols="80" rows="2"><%=AdPath_2&"cf.aspx?"&Rs("ID")&"&"&UserName%></textarea>

<input type="button" value="复制代码" id="copyb1" data-clipboard-target="#adb1" data-clipboard-action="copy" class="btn btn-primary">
<script>    
    $(function(){
        var clipboard = new Clipboard('#copyb1');
        clipboard.on('success', function(e) {
            e.clearSelection();
            console.log(e.clearSelection);
        });
    });
</script>
</td>
  </tr>
  
  <tr class="tr_1"> 
    <td>代码b1效果：</td>
  </tr>
  <tr> 
    <td><a href=<%=AdPath_2&"cf.aspx?"&Rs("ID")&"&"&UserName%> target=_blank><%=AdPath_2&"cf.aspx?"&Rs("ID")&"&"&UserName%></a></td>
  </tr>
  
  <tr class="tr_1"> 
    <td>代码b2（用户名类，支持下级联盟的代码，xxx代表下级联盟的用户名）</td>
  </tr>
  <tr>
    <td><textarea id="adb2" cols="80" rows="2"><%=AdPath_2&"cf.aspx?"&Rs("ID")&"&"&UserName&"&xxx"%></textarea>

<input type="button" value="复制代码" id="copyb2" data-clipboard-target="#adb2" data-clipboard-action="copy" class="btn btn-primary">
<script>    
    $(function(){
        var clipboard = new Clipboard('#copyb2');
        clipboard.on('success', function(e) {
            e.clearSelection();
            console.log(e.clearSelection);
        });
    });
</script>
</td>
  </tr>

  
</table>
<%End If%>


<%If Action="adcodeget" And CInt(ChkStr(Request("Ad_Class"),2))=2 Then%>
<%
ID=ChkStr(Request("ID"),2)
ClickState=CInt(Request("ClickState"))


Set Rs = Server.CreateObject("Adodb.RecordSet")
Sql="Select * From CFWztg_AD where ID="&ID
Rs.Open Sql,Conn,1,1


%>
<table class="tb_1">
    <tr>
      <td>效果：</td>
    </tr>
	    <tr>
      <td><a href="<%=AdPath_2&"cf.aspx?"&Rs("ID")&"."&UserID%>" target="_blank"><img src="<%=AdPath&"cf.aspx?action=adget&ad_id="&Rs("ID")&"&userid="&userid%>" border="0"></a></td>
    </tr>
	

    <tr class="tr_1">       
    <td>代码a1(Html调用)</td>
    </tr>
    <tr>
      <td>可以发布在任何地方，包括论坛,网站普通页和H5页面上,APP上等</td>
    </tr>
	<tr> 
      <td><textarea id="ada1" cols="80" rows="3"><a href="<%=AdPath_2&"cf.aspx?"&Rs("ID")&"."&UserID%>" target="_blank"><img src="<%=AdPath&"cf.aspx?action=adget&ad_id="&Rs("ID")&"&userid="&userid%>" border="0"></a></textarea> 

<input type="button" value="复制代码" id="copya1" data-clipboard-target="#ada1" data-clipboard-action="copy" class="btn btn-primary">
<script>    
    $(function(){
        var clipboard = new Clipboard('#copya1');
        clipboard.on('success', function(e) {
            e.clearSelection();
            console.log(e.clearSelection);
        });
    });
</script>
		<input type="submit" name="submit" value="　返回　" onclick="location.href='?Action=adlist&Ad_Class=<%=Request("Ad_Class")%>&Ad_ID=<%=Rs("ID")%>&ClickState=<%=ClickState%>#ad<%=Rs("ID")%>'" class="btn btn-dark">
	  </td>
    </tr>
    <tr class="tr_1"> 
      
    <td>代码a2(Js文件调用)</td>
    </tr>
    <tr>
      <td>可以发布在地方，包括论坛,网站普通页和H5页面上,APP上等</td>
    </tr>
	<tr> 
      <td><textarea id="ada2" cols="80" rows="3">document.write('<a href="<%=AdPath_2&"cf.aspx?"&Rs("ID")&"."&UserID%>" target="_blank"><img src="<%=AdPath&"cf.aspx?action=adget&ad_id="&Rs("ID")&"&userid="&userid%>" border="0"></a>');</textarea> 

<input type="button" value="复制代码" id="copya2" data-clipboard-target="#ada2" data-clipboard-action="copy" class="btn btn-primary">
<script>    
    $(function(){
        var clipboard = new Clipboard('#copya2');
        clipboard.on('success', function(e) {
            e.clearSelection();
            console.log(e.clearSelection);
        });
    });
</script>	
	  </td>
    </tr>

    <tr class="tr_1"> 
    <td>图片和点击地址单独链接</td>

    <tr>
      <td>图片地址：可以发布在任何地方，包括论坛,网站普通页和H5页面上,APP上等</td>
    </tr>
	<tr> 
      <td><textarea id="ada3" cols="80" rows="1"><%=AdPath&"cf.aspx?action=adget&ad_id="&Rs("ID")&"&userid="&userid%></textarea> 
<input type="button" value="复制代码" id="copya3" data-clipboard-target="#ada3" data-clipboard-action="copy" class="btn btn-primary">
<script>    
    $(function(){
        var clipboard = new Clipboard('#copya3');
        clipboard.on('success', function(e) {
            e.clearSelection();
            console.log(e.clearSelection);
        });
    });
</script>	
	  </td>
    </tr>
	
    <tr>
      <td>点击地址：可以发布在任何地方，包括论坛,网站普通页和H5页面上,APP上等，图片显示后再点图片加载图片上的链接点击才有效</td>
    </tr>
	<tr> 
      <td><textarea id="ada4" cols="80" rows="1"><%=AdPath_2&"cf.aspx?"&Rs("ID")&"."&UserID%></textarea> 

<input type="button" value="复制代码" id="copya4" data-clipboard-target="#ada4" data-clipboard-action="copy" class="btn btn-primary">
<script>    
    $(function(){
        var clipboard = new Clipboard('#copya4');
        clipboard.on('success', function(e) {
            e.clearSelection();
            console.log(e.clearSelection);
        });
    });
</script>		
	  </td>
    </tr>
	
</table>
<%End If%>


<%If Action="adcodeget" And (CInt(Request("Ad_Class"))=3  Or CInt(Request("Ad_Class"))=4) Then%>
<%
ID=ChkStr(Request("ID"),2)
ClickState=CInt(Request("ClickState"))

Set Rs = Server.CreateObject("Adodb.RecordSet")
Sql="Select * From CFWztg_AD where ID="&ID
Rs.Open Sql,Conn,1,1
%>

<table class="tb_1">  
  <tr> 
    <td>效果：</td>
  </tr>
  <tr> 
    <td><script src="<%=AdPath&RsSet("AdMainFileName")&".aspx?action="&GetValName("adget")&"&"&GetParaName("ad_id")&"="&Rs("ID")&"&"&GetParaName("userid")&"="&userid%>"></script></td>
  </tr>

<%
JsUrlA=AdPath&RsSet("AdMainFileName")&".aspx?action="&GetValName("adget")&"&"&GetParaName("ad_id")&"="&Rs("ID")&"&"&GetParaName("userid")&"="&userid&"&"&GetParaName("lowunionusername")&"=&"&GetParaName("ly")&"=""+escape(document.referrer)+""&"&GetParaName("webwidth")&"=""+webwidth+""&"&GetParaName("webheight")&"=""+webheight+""&"&GetParaName("webtitle")&"=""+escape(document.title)+""&"&GetParaName("iframe")&"=1"

JsUrlB=AdPath&RsSet("AdMainFileName")&".aspx?action="&GetValName("adget")&"&"&GetParaName("ad_id")&"="&Rs("ID")&"&"&GetParaName("userid")&"="&userid&"&"&GetParaName("lowunionusername")&"="

If InStr(LCase(Rs("ad")), "</script>');") = 0 and InStr(LCase(Rs("ad")), "</script>"");") = 0 and InStr(LCase(Rs("ad")), "</scr'+'ipt>") = 0 and InStr(LCase(Rs("ad")), "</scr""+""ipt>") = 0 Then '--广告文字里存在</scr'+'ipt>或</scr"+"ipt>，则表示需要直接显示外部广告
%>

  <tr class="tr_1"> 
    <td>iframe代码-Html调用(不会影响网站打开速度)</td>
  </tr>
  <tr>
    <td><textarea id="ada1" cols="80" rows="5"><script>
var webwidth,webheight;if(document.documentElement.clientWidth&&document.documentElement.clientHeight){webwidth=document.documentElement.clientWidth;webheight=document.documentElement.clientHeight;}else if(document.body){webwidth=document.body.clientWidth;webheight=document.body.clientHeight;}document.write("<iframe src='<%=JsUrlA%>' frameborder=0 width=<%=Rs("AdWidth")%> height=<%=Rs("AdHeight")%> marginheight=0 marginwidth=0 scrolling=no></iframe>");
</script>
</textarea> 

<input type="button" value="复制iframe代码-Html调用" id="copya1" data-clipboard-target="#ada1" data-clipboard-action="copy" class="btn btn-primary">
<script>    
    $(function(){
        var clipboard = new Clipboard('#copya1');
        clipboard.on('success', function(e) {
            e.clearSelection();
            console.log(e.clearSelection);
        });
    });
</script>

	  <input type="submit" name="submit" value="　返回　" onclick="location.href='?Action=adlist&Ad_Class=<%=Request("Ad_Class")%>&Ad_ID=<%=Rs("ID")%>&ClickState=<%=ClickState%>#ad<%=Rs("ID")%>'" class="btn btn-dark">
    </td>
  </tr>

  <tr class="tr_1"> 
    <td>iframe代码-Js文件调用(不会影响网站打开速度)</td>
  </tr>
  <tr>
    <td><textarea id="ada2" cols="80" rows="5">var webwidth,webheight;if(document.documentElement.clientWidth&&document.documentElement.clientHeight){webwidth=document.documentElement.clientWidth;webheight=document.documentElement.clientHeight;}else if(document.body){webwidth=document.body.clientWidth;webheight=document.body.clientHeight;}document.write("<iframe src='<%=JsUrlA%>' frameborder=0 width=<%=Rs("AdWidth")%> height=<%=Rs("AdHeight")%> marginheight=0 marginwidth=0 scrolling=no></iframe>");</textarea> 
<input type="button" value="复制iframe代码-Js文件调用" id="copya2" data-clipboard-target="#ada2" data-clipboard-action="copy" class="btn btn-primary">
<script>    
    $(function(){
        var clipboard = new Clipboard('#copya2');
        clipboard.on('success', function(e) {
            e.clearSelection();
            console.log(e.clearSelection);
        });
    });
</script>	
    </td>
  </tr>
<%End If%>

  <tr class="tr_1"> 
    <td>Js代码-Html调用</td>
  </tr>
  <tr>
    <td><textarea id="adb1" cols="80" rows="5"><script src="<%=JsUrlB%>"></script></textarea> 

<input type="button" value="复制Js代码-Html调用" id="copyb1" data-clipboard-target="#adb1" data-clipboard-action="copy" class="btn btn-primary">
<script>    
    $(function(){
        var clipboard = new Clipboard('#copyb1');
        clipboard.on('success', function(e) {
            e.clearSelection();
            console.log(e.clearSelection);
        });
    });
</script>	
    </td>
  </tr>
  <tr class="tr_1"> 
    <td>Js代码-Js文件调用</td>
  </tr>

  <tr>
    <td><textarea name="ad<%=Rs("ID")%>b2" id="adb2" cols="80" rows="5">document.write('<scr'+'ipt src="<%=JsUrlB%>"></scr'+'ipt>');</textarea> 

<input type="button" value="复制Js代码-Js文件调用" id="copyb2" data-clipboard-target="#adb2" data-clipboard-action="copy" class="btn btn-primary">
<script>    
    $(function(){
        var clipboard = new Clipboard('#copyb2');
        clipboard.on('success', function(e) {
            e.clearSelection();
            console.log(e.clearSelection);
        });
    });
</script>	
    </td>
  </tr>
</table>

<%End If%>

<%If Action="adcodeget" And CInt(Request("Ad_Class"))=7 Then%>
<%
ID=ChkStr(Request("ID"),2)
ClickState=CInt(Request("ClickState"))

Set Rs = Server.CreateObject("Adodb.RecordSet")
Sql="Select * From CFWztg_AD where ID="&ID
Rs.Open Sql,Conn,1,1

%>

<table class="tb_1">  
  <tr> 
    <td>效果：</td>
  </tr>
  <tr> 
    <td><script src="<%=AdPath&RsSet("AdMainFileName")&".aspx?action="&GetValName("adget")&"&"&GetParaName("ad_id")&"="&Rs("ID")&"&"&GetParaName("userid")&"="&userid%>"></script></td>
  </tr>
  
<%
JsUrlA=AdPath&RsSet("AdMainFileName")&".aspx?action="&GetValName("adget")&"&"&GetParaName("ad_id")&"="&Rs("ID")&"&"&GetParaName("userid")&"="&userid&"&"&GetParaName("lowunionusername")&"=&"&GetParaName("ly")&"=""+escape(document.referrer)+""&"&GetParaName("webwidth")&"=""+webwidth+""&"&GetParaName("webheight")&"=""+webheight+""&"&GetParaName("webtitle")&"=""+escape(document.title)+""&"&GetParaName("iframe")&"=1"

JsUrlB=AdPath&RsSet("AdMainFileName")&".aspx?action="&GetValName("adget")&"&"&GetParaName("ad_id")&"="&Rs("ID")&"&"&GetParaName("userid")&"="&userid&"&"&GetParaName("lowunionusername")&"="

'--自己定义HMTL代码或普通图片轮循时
If Rs("AdShowType") = "AdCode_ptxs" Or Rs("AdShowType") = "AdCode_tplx" Then
%>
<tr class="tr_1"> 
<td>iframe代码-Html调用(不会影响网站打开速度)</td>
</tr>
<tr>
    <td><textarea id="ada1" cols="80" rows="5"><script>
var webwidth,webheight;if(document.documentElement.clientWidth&&document.documentElement.clientHeight){webwidth=document.documentElement.clientWidth;webheight=document.documentElement.clientHeight;}else if(document.body){webwidth=document.body.clientWidth;webheight=document.body.clientHeight;}document.write("<iframe src='<%=JsUrlA%>' frameborder=0 width=<%=Rs("AdWidth")%> height=<%=Rs("AdHeight")%> marginheight=0 marginwidth=0 scrolling=no></iframe>");
</script>
</textarea> 

<input type="button" value="复制iframe代码-Html调用" id="copya1" data-clipboard-target="#ada1" data-clipboard-action="copy" class="btn btn-primary">
<script>    
    $(function(){
        var clipboard = new Clipboard('#copya1');
        clipboard.on('success', function(e) {
            e.clearSelection();
            console.log(e.clearSelection);
        });
    });
</script>	
	  <input type="submit" name="submit" value="　返回　" onclick="location.href='?Action=adlist&Ad_Class=<%=Request("Ad_Class")%>&Ad_ID=<%=Rs("ID")%>&ClickState=<%=ClickState%>#ad<%=Rs("ID")%>'" class="btn btn-dark">
    </td>
  </tr>

  <tr class="tr_1"> 
    <td>iframe代码-Js文件调用(不会影响网站打开速度)</td>
  </tr>
  <tr>
    <td><textarea id="ada2" cols="80" rows="5">var webwidth,webheight;if(document.documentElement.clientWidth&&document.documentElement.clientHeight){webwidth=document.documentElement.clientWidth;webheight=document.documentElement.clientHeight;}else if(document.body){webwidth=document.body.clientWidth;webheight=document.body.clientHeight;}document.write("<iframe src='<%=JsUrlA%>' frameborder=0 width=<%=Rs("AdWidth")%> height=<%=Rs("AdHeight")%> marginheight=0 marginwidth=0 scrolling=no></iframe>");</textarea> 

<input type="button" value="复制iframe代码-Js文件调用" id="copya2" data-clipboard-target="#ada2" data-clipboard-action="copy" class="btn btn-primary">
<script>    
    $(function(){
        var clipboard = new Clipboard('#copya2');
        clipboard.on('success', function(e) {
            e.clearSelection();
            console.log(e.clearSelection);
        });
    });
</script>	
    </td>
  </tr>
<%
Else
 tfts="(尽量放在&lt;/body&gt;上一行或网页底部，不会影响网站打开速度)"
End If%>

  <tr class="tr_1"> 
    <td>Js代码-Html调用<%=tfts%></td>
  </tr>
  <tr>
    <td><textarea id="adb1" cols="80" rows="5"><script src="<%=JsUrlB%>"></script></textarea> 

<input type="button" value="复制Html调用代码" id="copyb1" data-clipboard-target="#adb1" data-clipboard-action="copy" class="btn btn-primary">
<script>    
    $(function(){
        var clipboard = new Clipboard('#copyb1');
        clipboard.on('success', function(e) {
            e.clearSelection();
            console.log(e.clearSelection);
        });
    });
</script>	
	  <input type="submit" name="submit" value="　返回　" onclick="location.href='?Action=adlist&Ad_Class=<%=Request("Ad_Class")%>&Ad_ID=<%=Rs("ID")%>&ClickState=<%=ClickState%>#ad<%=Rs("ID")%>'" class="btn btn-dark">
    </td>
  </tr>
  
  <tr class="tr_1"> 
    <td>Js代码-Js文件调用<%=tfts%></td>
  </tr>
  <tr>
    <td><textarea id="adb2" cols="80" rows="5">document.write('<scr'+'ipt src="<%=JsUrlB%>"></scr'+'ipt>');</textarea> 

<input type="button" value="复制JS调用代码" id="copyb2" data-clipboard-target="#adb2" data-clipboard-action="copy" class="btn btn-primary">
<script>    
    $(function(){
        var clipboard = new Clipboard('#copyb2');
        clipboard.on('success', function(e) {
            e.clearSelection();
            console.log(e.clearSelection);
        });
    });
</script>	
    </td>
  </tr>
</table>

<%
end If
%>

<%If Action="adcodeget" And CInt(ChkStr(Request("Ad_Class"),2))=0 Then%>
<%
ID=GoBack(ChkStr(Request("ID"),2),"ID不能为空")

Sql="Select * From CFWztg_AgentAd Where ID="&ID
Set Rs=Conn.Execute(Sql)
AdCode=Rs("AdCode")


AdCode=Replace(AdCode,"{username}",UserName)
AdCode=Replace(AdCode,"{userid}",UserID)
%>

<table class="tb_1">
  <tr class="tr_1"> 
    <td>代码</td>
  </tr>
  <tr>
    <td><textarea id="ada1" cols="80" rows="5"><%=AdCode%></textarea> 

<input type="button" value="复制代码" id="copya1" data-clipboard-target="#ada1" data-clipboard-action="copy" class="btn btn-primary">
<script>    
    $(function(){
        var clipboard = new Clipboard('#copya1');
        clipboard.on('success', function(e) {
            e.clearSelection();
            console.log(e.clearSelection);
        });
    });
</script>	

	  <input type="submit" name="submit" value="　返回　" onclick="location.href='?Action=adlist&Ad_Class=0&ID=<%=ID%>#agad<%=ID%>'" class="btn btn-dark">
    </td>
  </tr>
</table>
<%End If%>


<%If Action="adcodeget" And CInt(ChkStr(Request("Ad_Class"),2))=12 Then%>
<%
ID=ChkStr(Request("ID"),2)

Sql="Select ID From CFWztg_User Where UserName='"&UserName&"'"
Set Rs=Conn.Execute(Sql)
UserID=Rs("ID")
Rs.Close

Set Rs = Server.CreateObject("Adodb.RecordSet")
Sql="Select * From CFWztg_Ad where ID="&ID
Rs.Open Sql,Conn,1,1

SoftDownUrl = AdPath_2&"cf.aspx?"&Rs("id")&"."&UserID

%>

<table class="tb_1">
    <tr class="tr_1">
      <td>软件推广代码获取(有代理权限的lowunionusername为下级联盟的用户名)</td>
    </tr>

    <tr>
      <td>软件名称:<%=Rs("AdName")%></td>
    </tr>
    <tr>
      <td>软件说明:<%=Rs("adintro")%></td>
    </tr>
    <tr>
      <td><b>安装说明:</b>可以把软件包下载到本地，一般不用更换文件名，如果要更换文件名，只能更换文件名里"_"前面的部分，否则可能不能计费！</td>
    </tr>

<tr>
<td>效果</td>
</tr>
<tr>
<td><a href="<%=SoftDownUrl%>" target="_blank"><%=SoftDownUrl%></a></td>
</tr>

    <tr class="tr_1">
      <td>软件直接下载地址代码(第三个参数支持下线)</td>
    </tr>
      <td><textarea id="ada1" cols="80" rows="2"><%=SoftDownUrl%></textarea> 

<input type="button" value="复制代码" id="copya1" data-clipboard-target="#ada1" data-clipboard-action="copy" class="btn btn-primary">
<script>    
    $(function(){
        var clipboard = new Clipboard('#copya1');
        clipboard.on('success', function(e) {
            e.clearSelection();
            console.log(e.clearSelection);
        });
    });
</script>	
                <input type="submit" name="submit" value="　返回　" onclick="location.href='?Action=adlist&Ad_Class=<%=ChkStr(Request("Ad_Class"),2)%>&Ad_ID=<%=ID%>'" class="btn btn-dark"></td>
    </tr>

<tr>
<td>效果</td>
</tr>
<tr>
<td><a href="<%=SoftDownUrl%>" target="_blank"><img src="<%=Rs("Ad")%>" border="0"></a></td>
</tr>
	  
    <tr class="tr_1">
        <td>软件图片下载地址代码</td>
      </tr>
      <tr>
        <td>
<textarea id="ada2" cols="80" rows="4"><a href="<%=SoftDownUrl%>" target="_blank"><img src="<%=Rs("Ad")%>" border="0"></a></textarea>

<input type="button" value="复制代码" id="copya2" data-clipboard-target="#ada2" data-clipboard-action="copy" class="btn btn-primary">
<script>    
    $(function(){
        var clipboard = new Clipboard('#copya2');
        clipboard.on('success', function(e) {
            e.clearSelection();
            console.log(e.clearSelection);
        });
    });
</script>	


</td>
</tr>
</table>

<%End If%>
