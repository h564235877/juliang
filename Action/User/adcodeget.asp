<%
'�˷�������ϵͳ Sql��
'����QQ��178575
'����EMail��yliangcf@163.com
'������վ��http://www.qqcf.com
'��ϸ��飺http://www.qqcf.com/cfwztg.htm
'�����г���������ʾ����װ��ʾ��ʹ�����ѽ�����°汾���ص�����
'��Ϊ��Щ���ݿ���ʱ�����£���û�з��ڳ�������Լ�����վ�鿴
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
    <td>����a1���û�ID�ࣩ</td>
  </tr>
  <tr>
    <td><textarea id="ada1" cols="80" rows="2"><%=AdPath_2&"cf.aspx?"&Rs("ID")&"."&UserID%></textarea>

<input type="button" value="���ƴ���" id="copya1" data-clipboard-target="#ada1" data-clipboard-action="copy" class="btn btn-primary">
<script>    
    $(function(){
        var clipboard = new Clipboard('#copya1');
        clipboard.on('success', function(e) {
            e.clearSelection();
            console.log(e.clearSelection);
        });
    });
</script>


<input type="submit" name="submit" value="�����ء�" onclick="location.href='?Action=adlist&Ad_Class=<%=Request("Ad_Class")%>&Ad_ID=<%=Rs("ID")%>&ClickState=<%=ClickState%>#ad<%=Rs("ID")%>'" class="btn btn-dark"></td>
</tr>
  

<tr class="tr_1"> 
<td>����a1Ч����</td>
</tr>
<tr> 
<td><a href=<%=AdPath_2&"cf.aspx?"&Rs("ID")&"."&UserID%> target=_blank><%=AdPath_2&"cf.aspx?"&Rs("ID")&"."&UserID%></a></td>
</tr>
  
  
<tr class="tr_1"> 
<td>����a2���û�ID�֧࣬���¼����˵Ĵ��룬xxx�����¼����˵��û������û�ID��</td>
</tr>
<tr>
    <td><textarea id="ada2" cols="80" rows="2"><%=AdPath_2&"cf.aspx?"&Rs("ID")&"."&UserID&".xxx"%></textarea>

<input type="button" value="���ƴ���" id="copya2" data-clipboard-target="#ada2" data-clipboard-action="copy" class="btn btn-primary">
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
    <td>����b1���û����ࣩ</td>
  </tr>
  <tr>
    <td><textarea id="adb1" cols="80" rows="2"><%=AdPath_2&"cf.aspx?"&Rs("ID")&"&"&UserName%></textarea>

<input type="button" value="���ƴ���" id="copyb1" data-clipboard-target="#adb1" data-clipboard-action="copy" class="btn btn-primary">
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
    <td>����b1Ч����</td>
  </tr>
  <tr> 
    <td><a href=<%=AdPath_2&"cf.aspx?"&Rs("ID")&"&"&UserName%> target=_blank><%=AdPath_2&"cf.aspx?"&Rs("ID")&"&"&UserName%></a></td>
  </tr>
  
  <tr class="tr_1"> 
    <td>����b2���û����֧࣬���¼����˵Ĵ��룬xxx�����¼����˵��û�����</td>
  </tr>
  <tr>
    <td><textarea id="adb2" cols="80" rows="2"><%=AdPath_2&"cf.aspx?"&Rs("ID")&"&"&UserName&"&xxx"%></textarea>

<input type="button" value="���ƴ���" id="copyb2" data-clipboard-target="#adb2" data-clipboard-action="copy" class="btn btn-primary">
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
      <td>Ч����</td>
    </tr>
	    <tr>
      <td><a href="<%=AdPath_2&"cf.aspx?"&Rs("ID")&"."&UserID%>" target="_blank"><img src="<%=AdPath&"cf.aspx?action=adget&ad_id="&Rs("ID")&"&userid="&userid%>" border="0"></a></td>
    </tr>
	

    <tr class="tr_1">       
    <td>����a1(Html����)</td>
    </tr>
    <tr>
      <td>���Է������κεط���������̳,��վ��ͨҳ��H5ҳ����,APP�ϵ�</td>
    </tr>
	<tr> 
      <td><textarea id="ada1" cols="80" rows="3"><a href="<%=AdPath_2&"cf.aspx?"&Rs("ID")&"."&UserID%>" target="_blank"><img src="<%=AdPath&"cf.aspx?action=adget&ad_id="&Rs("ID")&"&userid="&userid%>" border="0"></a></textarea> 

<input type="button" value="���ƴ���" id="copya1" data-clipboard-target="#ada1" data-clipboard-action="copy" class="btn btn-primary">
<script>    
    $(function(){
        var clipboard = new Clipboard('#copya1');
        clipboard.on('success', function(e) {
            e.clearSelection();
            console.log(e.clearSelection);
        });
    });
</script>
		<input type="submit" name="submit" value="�����ء�" onclick="location.href='?Action=adlist&Ad_Class=<%=Request("Ad_Class")%>&Ad_ID=<%=Rs("ID")%>&ClickState=<%=ClickState%>#ad<%=Rs("ID")%>'" class="btn btn-dark">
	  </td>
    </tr>
    <tr class="tr_1"> 
      
    <td>����a2(Js�ļ�����)</td>
    </tr>
    <tr>
      <td>���Է����ڵط���������̳,��վ��ͨҳ��H5ҳ����,APP�ϵ�</td>
    </tr>
	<tr> 
      <td><textarea id="ada2" cols="80" rows="3">document.write('<a href="<%=AdPath_2&"cf.aspx?"&Rs("ID")&"."&UserID%>" target="_blank"><img src="<%=AdPath&"cf.aspx?action=adget&ad_id="&Rs("ID")&"&userid="&userid%>" border="0"></a>');</textarea> 

<input type="button" value="���ƴ���" id="copya2" data-clipboard-target="#ada2" data-clipboard-action="copy" class="btn btn-primary">
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
    <td>ͼƬ�͵����ַ��������</td>

    <tr>
      <td>ͼƬ��ַ�����Է������κεط���������̳,��վ��ͨҳ��H5ҳ����,APP�ϵ�</td>
    </tr>
	<tr> 
      <td><textarea id="ada3" cols="80" rows="1"><%=AdPath&"cf.aspx?action=adget&ad_id="&Rs("ID")&"&userid="&userid%></textarea> 
<input type="button" value="���ƴ���" id="copya3" data-clipboard-target="#ada3" data-clipboard-action="copy" class="btn btn-primary">
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
      <td>�����ַ�����Է������κεط���������̳,��վ��ͨҳ��H5ҳ����,APP�ϵȣ�ͼƬ��ʾ���ٵ�ͼƬ����ͼƬ�ϵ����ӵ������Ч</td>
    </tr>
	<tr> 
      <td><textarea id="ada4" cols="80" rows="1"><%=AdPath_2&"cf.aspx?"&Rs("ID")&"."&UserID%></textarea> 

<input type="button" value="���ƴ���" id="copya4" data-clipboard-target="#ada4" data-clipboard-action="copy" class="btn btn-primary">
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
    <td>Ч����</td>
  </tr>
  <tr> 
    <td><script src="<%=AdPath&RsSet("AdMainFileName")&".aspx?action="&GetValName("adget")&"&"&GetParaName("ad_id")&"="&Rs("ID")&"&"&GetParaName("userid")&"="&userid%>"></script></td>
  </tr>

<%
JsUrlA=AdPath&RsSet("AdMainFileName")&".aspx?action="&GetValName("adget")&"&"&GetParaName("ad_id")&"="&Rs("ID")&"&"&GetParaName("userid")&"="&userid&"&"&GetParaName("lowunionusername")&"=&"&GetParaName("ly")&"=""+escape(document.referrer)+""&"&GetParaName("webwidth")&"=""+webwidth+""&"&GetParaName("webheight")&"=""+webheight+""&"&GetParaName("webtitle")&"=""+escape(document.title)+""&"&GetParaName("iframe")&"=1"

JsUrlB=AdPath&RsSet("AdMainFileName")&".aspx?action="&GetValName("adget")&"&"&GetParaName("ad_id")&"="&Rs("ID")&"&"&GetParaName("userid")&"="&userid&"&"&GetParaName("lowunionusername")&"="

If InStr(LCase(Rs("ad")), "</script>');") = 0 and InStr(LCase(Rs("ad")), "</script>"");") = 0 and InStr(LCase(Rs("ad")), "</scr'+'ipt>") = 0 and InStr(LCase(Rs("ad")), "</scr""+""ipt>") = 0 Then '--������������</scr'+'ipt>��</scr"+"ipt>�����ʾ��Ҫֱ����ʾ�ⲿ���
%>

  <tr class="tr_1"> 
    <td>iframe����-Html����(����Ӱ����վ���ٶ�)</td>
  </tr>
  <tr>
    <td><textarea id="ada1" cols="80" rows="5"><script>
var webwidth,webheight;if(document.documentElement.clientWidth&&document.documentElement.clientHeight){webwidth=document.documentElement.clientWidth;webheight=document.documentElement.clientHeight;}else if(document.body){webwidth=document.body.clientWidth;webheight=document.body.clientHeight;}document.write("<iframe src='<%=JsUrlA%>' frameborder=0 width=<%=Rs("AdWidth")%> height=<%=Rs("AdHeight")%> marginheight=0 marginwidth=0 scrolling=no></iframe>");
</script>
</textarea> 

<input type="button" value="����iframe����-Html����" id="copya1" data-clipboard-target="#ada1" data-clipboard-action="copy" class="btn btn-primary">
<script>    
    $(function(){
        var clipboard = new Clipboard('#copya1');
        clipboard.on('success', function(e) {
            e.clearSelection();
            console.log(e.clearSelection);
        });
    });
</script>

	  <input type="submit" name="submit" value="�����ء�" onclick="location.href='?Action=adlist&Ad_Class=<%=Request("Ad_Class")%>&Ad_ID=<%=Rs("ID")%>&ClickState=<%=ClickState%>#ad<%=Rs("ID")%>'" class="btn btn-dark">
    </td>
  </tr>

  <tr class="tr_1"> 
    <td>iframe����-Js�ļ�����(����Ӱ����վ���ٶ�)</td>
  </tr>
  <tr>
    <td><textarea id="ada2" cols="80" rows="5">var webwidth,webheight;if(document.documentElement.clientWidth&&document.documentElement.clientHeight){webwidth=document.documentElement.clientWidth;webheight=document.documentElement.clientHeight;}else if(document.body){webwidth=document.body.clientWidth;webheight=document.body.clientHeight;}document.write("<iframe src='<%=JsUrlA%>' frameborder=0 width=<%=Rs("AdWidth")%> height=<%=Rs("AdHeight")%> marginheight=0 marginwidth=0 scrolling=no></iframe>");</textarea> 
<input type="button" value="����iframe����-Js�ļ�����" id="copya2" data-clipboard-target="#ada2" data-clipboard-action="copy" class="btn btn-primary">
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
    <td>Js����-Html����</td>
  </tr>
  <tr>
    <td><textarea id="adb1" cols="80" rows="5"><script src="<%=JsUrlB%>"></script></textarea> 

<input type="button" value="����Js����-Html����" id="copyb1" data-clipboard-target="#adb1" data-clipboard-action="copy" class="btn btn-primary">
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
    <td>Js����-Js�ļ�����</td>
  </tr>

  <tr>
    <td><textarea name="ad<%=Rs("ID")%>b2" id="adb2" cols="80" rows="5">document.write('<scr'+'ipt src="<%=JsUrlB%>"></scr'+'ipt>');</textarea> 

<input type="button" value="����Js����-Js�ļ�����" id="copyb2" data-clipboard-target="#adb2" data-clipboard-action="copy" class="btn btn-primary">
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
    <td>Ч����</td>
  </tr>
  <tr> 
    <td><script src="<%=AdPath&RsSet("AdMainFileName")&".aspx?action="&GetValName("adget")&"&"&GetParaName("ad_id")&"="&Rs("ID")&"&"&GetParaName("userid")&"="&userid%>"></script></td>
  </tr>
  
<%
JsUrlA=AdPath&RsSet("AdMainFileName")&".aspx?action="&GetValName("adget")&"&"&GetParaName("ad_id")&"="&Rs("ID")&"&"&GetParaName("userid")&"="&userid&"&"&GetParaName("lowunionusername")&"=&"&GetParaName("ly")&"=""+escape(document.referrer)+""&"&GetParaName("webwidth")&"=""+webwidth+""&"&GetParaName("webheight")&"=""+webheight+""&"&GetParaName("webtitle")&"=""+escape(document.title)+""&"&GetParaName("iframe")&"=1"

JsUrlB=AdPath&RsSet("AdMainFileName")&".aspx?action="&GetValName("adget")&"&"&GetParaName("ad_id")&"="&Rs("ID")&"&"&GetParaName("userid")&"="&userid&"&"&GetParaName("lowunionusername")&"="

'--�Լ�����HMTL�������ͨͼƬ��ѭʱ
If Rs("AdShowType") = "AdCode_ptxs" Or Rs("AdShowType") = "AdCode_tplx" Then
%>
<tr class="tr_1"> 
<td>iframe����-Html����(����Ӱ����վ���ٶ�)</td>
</tr>
<tr>
    <td><textarea id="ada1" cols="80" rows="5"><script>
var webwidth,webheight;if(document.documentElement.clientWidth&&document.documentElement.clientHeight){webwidth=document.documentElement.clientWidth;webheight=document.documentElement.clientHeight;}else if(document.body){webwidth=document.body.clientWidth;webheight=document.body.clientHeight;}document.write("<iframe src='<%=JsUrlA%>' frameborder=0 width=<%=Rs("AdWidth")%> height=<%=Rs("AdHeight")%> marginheight=0 marginwidth=0 scrolling=no></iframe>");
</script>
</textarea> 

<input type="button" value="����iframe����-Html����" id="copya1" data-clipboard-target="#ada1" data-clipboard-action="copy" class="btn btn-primary">
<script>    
    $(function(){
        var clipboard = new Clipboard('#copya1');
        clipboard.on('success', function(e) {
            e.clearSelection();
            console.log(e.clearSelection);
        });
    });
</script>	
	  <input type="submit" name="submit" value="�����ء�" onclick="location.href='?Action=adlist&Ad_Class=<%=Request("Ad_Class")%>&Ad_ID=<%=Rs("ID")%>&ClickState=<%=ClickState%>#ad<%=Rs("ID")%>'" class="btn btn-dark">
    </td>
  </tr>

  <tr class="tr_1"> 
    <td>iframe����-Js�ļ�����(����Ӱ����վ���ٶ�)</td>
  </tr>
  <tr>
    <td><textarea id="ada2" cols="80" rows="5">var webwidth,webheight;if(document.documentElement.clientWidth&&document.documentElement.clientHeight){webwidth=document.documentElement.clientWidth;webheight=document.documentElement.clientHeight;}else if(document.body){webwidth=document.body.clientWidth;webheight=document.body.clientHeight;}document.write("<iframe src='<%=JsUrlA%>' frameborder=0 width=<%=Rs("AdWidth")%> height=<%=Rs("AdHeight")%> marginheight=0 marginwidth=0 scrolling=no></iframe>");</textarea> 

<input type="button" value="����iframe����-Js�ļ�����" id="copya2" data-clipboard-target="#ada2" data-clipboard-action="copy" class="btn btn-primary">
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
 tfts="(��������&lt;/body&gt;��һ�л���ҳ�ײ�������Ӱ����վ���ٶ�)"
End If%>

  <tr class="tr_1"> 
    <td>Js����-Html����<%=tfts%></td>
  </tr>
  <tr>
    <td><textarea id="adb1" cols="80" rows="5"><script src="<%=JsUrlB%>"></script></textarea> 

<input type="button" value="����Html���ô���" id="copyb1" data-clipboard-target="#adb1" data-clipboard-action="copy" class="btn btn-primary">
<script>    
    $(function(){
        var clipboard = new Clipboard('#copyb1');
        clipboard.on('success', function(e) {
            e.clearSelection();
            console.log(e.clearSelection);
        });
    });
</script>	
	  <input type="submit" name="submit" value="�����ء�" onclick="location.href='?Action=adlist&Ad_Class=<%=Request("Ad_Class")%>&Ad_ID=<%=Rs("ID")%>&ClickState=<%=ClickState%>#ad<%=Rs("ID")%>'" class="btn btn-dark">
    </td>
  </tr>
  
  <tr class="tr_1"> 
    <td>Js����-Js�ļ�����<%=tfts%></td>
  </tr>
  <tr>
    <td><textarea id="adb2" cols="80" rows="5">document.write('<scr'+'ipt src="<%=JsUrlB%>"></scr'+'ipt>');</textarea> 

<input type="button" value="����JS���ô���" id="copyb2" data-clipboard-target="#adb2" data-clipboard-action="copy" class="btn btn-primary">
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
ID=GoBack(ChkStr(Request("ID"),2),"ID����Ϊ��")

Sql="Select * From CFWztg_AgentAd Where ID="&ID
Set Rs=Conn.Execute(Sql)
AdCode=Rs("AdCode")


AdCode=Replace(AdCode,"{username}",UserName)
AdCode=Replace(AdCode,"{userid}",UserID)
%>

<table class="tb_1">
  <tr class="tr_1"> 
    <td>����</td>
  </tr>
  <tr>
    <td><textarea id="ada1" cols="80" rows="5"><%=AdCode%></textarea> 

<input type="button" value="���ƴ���" id="copya1" data-clipboard-target="#ada1" data-clipboard-action="copy" class="btn btn-primary">
<script>    
    $(function(){
        var clipboard = new Clipboard('#copya1');
        clipboard.on('success', function(e) {
            e.clearSelection();
            console.log(e.clearSelection);
        });
    });
</script>	

	  <input type="submit" name="submit" value="�����ء�" onclick="location.href='?Action=adlist&Ad_Class=0&ID=<%=ID%>#agad<%=ID%>'" class="btn btn-dark">
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
      <td>����ƹ�����ȡ(�д���Ȩ�޵�lowunionusernameΪ�¼����˵��û���)</td>
    </tr>

    <tr>
      <td>�������:<%=Rs("AdName")%></td>
    </tr>
    <tr>
      <td>���˵��:<%=Rs("adintro")%></td>
    </tr>
    <tr>
      <td><b>��װ˵��:</b>���԰���������ص����أ�һ�㲻�ø����ļ��������Ҫ�����ļ�����ֻ�ܸ����ļ�����"_"ǰ��Ĳ��֣�������ܲ��ܼƷѣ�</td>
    </tr>

<tr>
<td>Ч��</td>
</tr>
<tr>
<td><a href="<%=SoftDownUrl%>" target="_blank"><%=SoftDownUrl%></a></td>
</tr>

    <tr class="tr_1">
      <td>���ֱ�����ص�ַ����(����������֧������)</td>
    </tr>
      <td><textarea id="ada1" cols="80" rows="2"><%=SoftDownUrl%></textarea> 

<input type="button" value="���ƴ���" id="copya1" data-clipboard-target="#ada1" data-clipboard-action="copy" class="btn btn-primary">
<script>    
    $(function(){
        var clipboard = new Clipboard('#copya1');
        clipboard.on('success', function(e) {
            e.clearSelection();
            console.log(e.clearSelection);
        });
    });
</script>	
                <input type="submit" name="submit" value="�����ء�" onclick="location.href='?Action=adlist&Ad_Class=<%=ChkStr(Request("Ad_Class"),2)%>&Ad_ID=<%=ID%>'" class="btn btn-dark"></td>
    </tr>

<tr>
<td>Ч��</td>
</tr>
<tr>
<td><a href="<%=SoftDownUrl%>" target="_blank"><img src="<%=Rs("Ad")%>" border="0"></a></td>
</tr>
	  
    <tr class="tr_1">
        <td>���ͼƬ���ص�ַ����</td>
      </tr>
      <tr>
        <td>
<textarea id="ada2" cols="80" rows="4"><a href="<%=SoftDownUrl%>" target="_blank"><img src="<%=Rs("Ad")%>" border="0"></a></textarea>

<input type="button" value="���ƴ���" id="copya2" data-clipboard-target="#ada2" data-clipboard-action="copy" class="btn btn-primary">
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
