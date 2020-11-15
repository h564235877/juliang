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
If Request("Step")="" Then Step=1 Else Step=CInt(ChkStr(Request("Step"),2))

If Request("ClickState")="" Then ClickState=1 Else ClickState=ChkStr(Request("ClickState"),2)

If Request("ShowSel")="" Then ShowSel=1 Else ShowSel=ChkStr(Request("ShowSel"),2)

If Request("ad_size")="" Then ad_size="200x200" Else ad_size=ChkStr(Request("ad_size"),1)

If Request("AdRow")="" Then AdRow=1 Else AdRow=CInt(Request("AdRow"))

If Request("AdCol")="" Then AdCol=3 Else AdCol=CInt(Request("AdCol"))

If Request("AdBorderColor")="" Then AdBorderColor="E6E6E6" Else AdBorderColor=ChkStr(Replace(Request("AdBorderColor"),"#",""),1)

If Request("AdBgColor")="" Then AdBgColor="FFFFFF" Else AdBgColor=ChkStr(Replace(Request("AdBgColor"),"#",""),1)

If Request("AdIntroColor")="" Then AdIntroColor="000000" Else AdIntroColor=ChkStr(Replace(Request("AdIntroColor"),"#",""),1)

If Request("AdIntroSize")="" Then AdIntroSize=12 Else AdIntroSize=CInt(Request("AdIntroSize"))

If Step=1 Then
	If Instr(ad_size,"x")>0 Then
	 If Request("AdWidth")="" Then AdWidth=CInt(Left(ad_size,Instr(ad_size,"x")-1)+12)*AdCol Else AdWidth=CInt(Request("AdWidth"))
	 If Request("AdHeight")="" Then AdHeight=CInt(Mid(ad_size,Instr(ad_size,"x")+1)+36)*AdRow Else AdHeight=CInt(Request("AdHeight"))
	Else
	 If Request("AdWidth")="" Then AdWidth=240*AdCol Else AdWidth=CInt(Request("AdWidth"))
	 If Request("AdHeight")="" Then AdHeight=120*AdRow Else  AdHeight=CInt(Request("AdHeight"))
	End If
Else
	AdWidth=CInt(Request("AdWidth"))
	AdHeight=CInt(Request("AdHeight"))
End If


If Request("NewAdSel")="" Or Request("NewAdSel")="1" Then
 NewAdSel=1
 maxadid=""
Else
 NewAdSel=ChkStr(Request("NewAdSel"),2)
 
 Sql="Select isnull(max(ID),0) From CFWztg_AD where AdState=2 and Ad_Class="&Ad_Class
 Set Rs=Conn.execute(Sql)
 maxadid=Rs(0)
End If

ProHibit=ChkStr(Replace(Request("ProHibit"),", ",","),1)
ProHibit2=ChkStr(Replace(Request("ProHibit2"),", ",","),1)

%>


<script src="../../js/clipboard.min.js"></script>
<script src="../../js/jscolor.min.js"></script>
<script>
$(function(){

$("#adcodeset").click(function(){
 var ad_size= $("input:radio[name='ad_size']:checked").val();
 if(ad_size==""||ad_size==undefined){alert("请选择广告尺寸");return false;}

 var prohibit =[];
 var prohibitb =[];
 $('input[name="prohibit"]:not(:checked)').each(function(){
  prohibitb.push($(this).val());
 });
 
 $("#prohibit2").val(prohibitb);

 return true;
 
});

});
</script>

<table class="tb_1">

<form action="?Action=adlist&Ad_Class=<%=Ad_Class%>&Step=2" name="form2" id="form2" method="post" >
  <tr class="tr_1"> 
    <td colspan="2">混合图片代码定制</td>
  </tr>

  <TR>
    <TD class="td_r" style="width:20%">第1步-选择广告计费方式：</TD>
    <TD>
<label class='lyear-radio radio-primary m-t-10'>
<input name="clickstate" type="radio" value="1"
<%
Response.write " onclick=""location.href='?Action="&action&"&ad_class="&ad_class&"&clickstate=1&ad_size="&ad_size&"#adnav'"""
If clickstate=1 Then Response.write " checked"%>><span>按点击计费(CPC)
<%
 Sql="Select count(1) From CFWztg_AD a inner join CFWztg_Plan b on a.Plan_ID=b.ID where a.AdState=2 And b.PlanState=2 And a.Ad_Class=" & Abs(Ad_Class)  &" And a.ClickState=1 and a.CycState=1"
 Set Rs=Conn.Execute(Sql)
 Response.write "[共"&Rs(0)&"个广告]"
 Rs.Close
%>
</span></label>

<label class='lyear-radio radio-primary m-t-10'>
<input name="clickstate" type="radio" value="2"<%
Response.write " onclick=""location.href='?Action="&action&"&ad_class="&ad_class&"&clickstate=2&ad_size="&ad_size&"#adnav'"""
If clickstate=2 Then Response.write " checked"%>><span>按显示计费(CPV)
<%
 Sql="Select count(1) From CFWztg_AD a inner join CFWztg_Plan b on a.Plan_ID=b.ID where a.AdState=2 And b.PlanState=2 And a.Ad_Class=" & Abs(Ad_Class)  &" And a.ClickState=2 and a.CycState=1"
 Set Rs=Conn.Execute(Sql)
 Response.write "[共"&Rs(0)&"个广告]"
 Rs.Close
%>
</span></label>

<label class='lyear-radio radio-primary m-t-10'>
<input name="clickstate" type="radio" value="3"<%
Response.write " onclick=""location.href='?Action="&action&"&ad_class="&ad_class&"&clickstate=3&ad_size="&ad_size&"#adnav'"""
If clickstate=3 Then Response.write " checked"%>><span>按注册计费(CPA)
<%
 Sql="Select count(1) From CFWztg_AD a inner join CFWztg_Plan b on a.Plan_ID=b.ID where a.AdState=2 And b.PlanState=2 And a.Ad_Class=" & Abs(Ad_Class)  &" And a.ClickState=3 and a.CycState=1"
 Set Rs=Conn.Execute(Sql)
 Response.write "[共"&Rs(0)&"个广告]"
 Rs.Close
%>
</span></label>

<label class='lyear-radio radio-primary m-t-10'>
<input name="clickstate" type="radio" value="4"<%
Response.write " onclick=""location.href='?Action="&action&"&ad_class="&ad_class&"&clickstate=4&ad_size="&ad_size&"#adnav'"""
If clickstate=4 Then Response.write " checked"%>><span>按订单计费(CPS)
<%
 Sql="Select count(1) From CFWztg_AD a inner join CFWztg_Plan b on a.Plan_ID=b.ID where a.AdState=2 And b.PlanState=2 And a.Ad_Class=" & Abs(Ad_Class)  &" And a.ClickState=4 and a.CycState=1"
 Set Rs=Conn.Execute(Sql)
 Response.write "[共"&Rs(0)&"个广告]"
 Rs.Close
%>
</span></label>
</TD>
  </TR>


<TR> 
<TD class="td_r">第2步-选择广告尺寸：</TD>
<TD>

<li style="clear:both;">横向</li>
<%
Sql="Select * From CFwztg_AdSize where Direction=1 Order By Direction,Width Desc,Height Desc"

Set Rs = Server.CreateObject("ADODB.Recordset")
Rs.open Sql,Conn,1,1
While Not Rs.Eof

 Sql="Select count(1) From CFWztg_AD a inner join CFWztg_Plan b on a.Plan_ID=b.ID where a.AdState=2 And b.PlanState=2 And a.Ad_Class=" & Abs(Ad_Class)  &" And a.ClickState=" & ClickState & " and convert(varchar,a.adwidth)+'x'+convert(varchar,a.adheight)='"&Rs("Width")&"x"&Rs("Height")&"'"

 Set Rs2=Conn.Execute(Sql)
 If Rs2(0)>0 Then
  Response.write "<li style='width:185px;float:left;'><label class='lyear-radio radio-primary m-t-10'><input type='radio' name='ad_size' value='"&Rs("Width")&"x"&Rs("Height")&"' id='ad_size' onclick=""location.href='?Action="&action&"&ad_class="&ad_class&"&clickstate="&clickstate&"&ad_size="&Rs("Width")&"x"&Rs("Height")&"#adnav'"""
  If Ad_Size = Rs("Width")&"x"&Rs("Height") Then Response.write " checked"
  Response.write "><span>" & Rs("Width")&"x"&Rs("Height")
  Response.write "[共"&Rs2(0)&"个广告]</span></label></li>"
 End If
 Rs2.Close

Rs.MoveNext
Wend
Rs.Close
%>
<li style="clear:both;">纵向</li>
<%
Sql="Select * From CFwztg_AdSize where Direction=2 Order By Direction,Width Desc,Height Desc"

Set Rs = Server.CreateObject("ADODB.Recordset")
Rs.open Sql,Conn,1,1
While Not Rs.Eof

 Sql="Select count(1) From CFWztg_AD a inner join CFWztg_Plan b on a.Plan_ID=b.ID where a.AdState=2 And b.PlanState=2 And a.Ad_Class=" & Abs(Ad_Class)&" And a.ClickState=" & ClickState& " and convert(varchar,a.adwidth)+'x'+convert(varchar,a.adheight)='"&Rs("Width")&"x"&Rs("Height")&"'"
 Set Rs2=Conn.Execute(Sql)
 If Rs2(0)>0 Then
  Response.write "<li style='width:185px;float:left;'><label class='lyear-radio radio-primary m-t-10'><input type='radio' name='ad_size' value='"&Rs("Width")&"x"&Rs("Height")&"' id='ad_size' onclick=""location.href='?Action="&action&"&ad_class="&ad_class&"&clickstate="&clickstate&"&ad_size="&Rs("Width")&"x"&Rs("Height")&"#adnav'"""
  If Ad_Size = Rs("Width")&"x"&Rs("Height") Then Response.write " checked"
  Response.write "><span>" & Rs("Width")&"x"&Rs("Height")
  Response.write "[共"&Rs2(0)&"个广告]</span></label></li>"
 End If
 Rs2.Close

Rs.MoveNext
Wend
Rs.Close
%>
<li style="clear:both;">方形</li>
<%
Sql="Select * From CFwztg_AdSize where Direction=3 Order By Direction,Width Desc,Height Desc"

Set Rs = Server.CreateObject("ADODB.Recordset")
Rs.open Sql,Conn,1,1
While Not Rs.Eof

 Sql="Select count(1) From CFWztg_AD a inner join CFWztg_Plan b on a.Plan_ID=b.ID where a.AdState=2 And b.PlanState=2 And a.Ad_Class=" & Abs(Ad_Class) &" And a.ClickState=" & ClickState& " and convert(varchar,a.adwidth)+'x'+convert(varchar,a.adheight)='"&Rs("Width")&"x"&Rs("Height")&"' "
 Set Rs2=Conn.Execute(Sql)
 If Rs2(0)>0 Then
  Response.write "<li style='width:185px;float:left;'><label class='lyear-radio radio-primary m-t-10'><input type='radio' name='ad_size' value='"&Rs("Width")&"x"&Rs("Height")&"' id='ad_size' onclick=""location.href='?Action="&action&"&ad_class="&ad_class&"&clickstate="&clickstate&"&ad_size="&Rs("Width")&"x"&Rs("Height")&"#adnav'"""
  If Ad_Size = Rs("Width")&"x"&Rs("Height") Then Response.write " checked"
  Response.write "><span>" & Rs("Width")&"x"&Rs("Height")
  Response.write "[共"&Rs2(0)&"个广告]</span></label></li>"
 End If
 Rs2.Close

Rs.MoveNext
Wend
Rs.Close
%>
<li style="clear:both;">其它</li>
<%
Sql="Select distinct convert(varchar,a.AdWidth)+'x'+convert(varchar,a.AdHeight) adx From CFWztg_AD a inner join CFWztg_Plan b on a.Plan_ID=b.ID where a.AdState=2 And b.PlanState=2 And a.Ad_Class=" & Abs(Ad_Class)& " And a.ClickState=" & ClickState& " and convert(varchar,a.AdWidth)+'x'+convert(varchar,a.AdHeight) not in(Select convert(varchar,c.Width)+'x'+convert(varchar,c.Height) From CFwztg_AdSize c)"

Set Rs = Server.CreateObject("ADODB.Recordset")
Rs.open Sql,Conn,1,1
While Not Rs.Eof

 Sql="Select count(1) From CFWztg_AD a inner join CFWztg_Plan b on a.Plan_ID=b.ID where a.AdState=2 And b.PlanState=2 And a.Ad_Class=" & Abs(Ad_Class) &" And a.ClickState=" & ClickState& " and a.CycState=1 and convert(varchar,a.adwidth)+'x'+convert(varchar,a.adheight)='"&Rs("adx")&"'"
 Set Rs2=Conn.Execute(Sql)
 If Rs2(0)>0 Then
  Response.write "<li style='width:185px;float:left;'><label class='lyear-radio radio-primary m-t-10'><input type='radio' name='ad_size' value='"&Rs("adx")&"' id='ad_size' onclick=""location.href='?Action="&action&"&ad_class="&ad_class&"&clickstate="&clickstate&"&adshowtype="&adshowtype&"&ad_size="&Rs("adx")&"#adnav'"""
  If Ad_Size = Rs("adx") Then Response.write " checked"
  Response.write "><span>" & Rs("adx")
  Response.write "[共"&Rs2(0)&"个广告]</span></label></li>"
 End If
 Rs2.Close

Rs.MoveNext
Wend
Rs.Close
%>

</TD>
</TR>

<TR>
<TD class="td_r">第4步-显示方式选择：</TD>
<TD>
<label class='lyear-radio radio-primary m-t-10'><input name="showsel" type="radio" value="1"<%If showsel=1 Then Response.write " checked"%>><span>按随机轮循显示(显示机率均等)</span></label>
<label class='lyear-radio radio-primary m-t-10'><input name="showsel" type="radio" value="2"<%If showsel=2 Then Response.write " checked"%>><span>按竞价随机显示(单价越高的显示机率越高)</span></label>
<label class='lyear-radio radio-primary m-t-10'><input name="showsel" type="radio" value="3"<%If showsel=3 Then Response.write " checked"%>><span>按权重随机显示(权重越高的显示机率越高)</span></label>
</TD>
</TR>

<TR>
<TD class="td_r">第5步-行列数：</TD>
<TD>
<%
If AdShowMode =1 Then
 RowHeight=80
ElseIf AdShowMode =2 Then
 RowHeight=24
End If
%>

<SELECT id=AdRow name=AdRow onChange="rowheight=<%=CInt(Mid(ad_size,Instr(ad_size,"x")+1))%>;document.getElementById('AdHeight').value=(rowheight+36) * document.getElementById('AdRow').options[document.getElementById('AdRow').selectedIndex].value">
<%
For I=1 To 10
%>
<OPTION value=<%=I%><%If AdRow=I Then Response.write " selected"%>><%=I%></OPTION>
<%Next%>
</SELECT> 行 * 

<SELECT id=AdCol  name=AdCol onChange="rowwidth=<%=CInt(Left(ad_size,Instr(ad_size,"x")-1))%>;document.getElementById('AdWidth').value=(rowwidth+12) * document.getElementById('AdCol').options[document.getElementById('AdCol').selectedIndex].value">
<%
For I=1 To 10
%>
<OPTION value=<%=I%><%If AdCol=I Then Response.write " selected"%>><%=I%></OPTION>
<%Next%>
</SELECT>列</TD>
</TR>

<TR>
<TD class="td_r">第6步-描述：</TD>
<TD>&nbsp;&nbsp;颜色 
<input name="AdIntroColor" type=text id="AdIntroColor" value="<%=AdIntroColor%>" size=7 class="jscolor">
字体
<SELECT name=AdIntroSize>
<%
For I=8 To 14
%>
<OPTION value=<%=I%><%If AdIntroSize=I Then Response.write " selected"%>><%=I%>px</OPTION>
<%Next%>
</SELECT>
</TD>
</TR>
						  


<TR>
<TD class="td_r">第7步-宽度：</TD>
<TD><input name="AdWidth" type=text id="AdWidth" value="<%=AdWidth%>" size=7  >(如果显示不正常可手工输入数值调整)</TD>
</TR>
<TR>
<TD class="td_r">第8步-高度：</TD>
<TD><input name="AdHeight" type=text id="AdHeight" value="<%=AdHeight%>" size=7  >(如果显示不正常可手工输入数值调整)</TD>
</TR>
<TR>
<TD class="td_r">第9步-选择新进广告自动加入：</TD>
<TD>
<label class='lyear-radio radio-inline radio-primary'><input name="newadsel" type="radio" value="1"<%If newadsel=1 Then Response.write " checked"%>><span>是</span></label>
<label class='lyear-radio radio-inline radio-primary'><input type="radio" name="newadsel" value="0"<%If newadsel=0 Then Response.write " checked"%>><span>否</span></label>
</TD>
</TR>
<TR>
<TD class="td_r">第10步-选择哪些的广告：<br />
</TD>
<TD>

<div>
<ul>
<%
Set Rs2=Server.CreateObject("Adodb.RecordSet")
Sql="Select a.* From CFWztg_AD a inner join CFWztg_Plan b on a.plan_id=b.id Where a.AdState=2 And a.AdListShowState=1 And a.Ad_Class=" & abs(Ad_Class) &" and clickstate="&clickstate&" and convert(varchar,a.adwidth)+'x'+convert(varchar,a.adheight)='"&ad_size&"' and b.PlanState=2 Order By a.ID Desc"
Rs2.Open Sql,Conn,1,1
While Not Rs2.Eof
%>
<li style="width:48%;float:left;"><label class='lyear-checkbox checkbox-inline checkbox-primary'> 
<input type="checkbox" name="prohibit" value="<%=Rs2("ID")%>"<%If Step=1 Or Instr(","&prohibit&",",","&Rs2("ID")&",")>0 Then Response.write " checked"%>><span>
<a href="?Action=adinfo&id=<%=Rs2("ID")%>" target="_blank"><%=Rs2("AdName")%></a>[<%=Rs2("ID")%>]
<%
Response.write "("

If ClickState=1 Then
 Response.write "CPC:"
ElseIf ClickState=2 Then
 Response.write "CPV:"
End If

Response.write GetTurnCent(cdbl(Rs2("Unit_Cent"))*1000)&"元/千次"

If Rs2("ClickSeState")=1 Then
 Response.write ",同时支持CPC:"&GetTurnCent(cdbl(Rs2("Unit_Cent"))*cdbl(Rs2("ClickSeMul"))*1000)&"元/千次"
ElseIf Rs2("ClickSeState")=2 Then
 Response.write ",同时支持CPV:"&GetTurnCent(cdbl(Rs2("Unit_Cent"))*cdbl(Rs2("ClickSeMul"))*1000)&"元/千次"
End If

Response.write ")"
%></span></label>
</li>
<%
Rs2.MoveNext
Wend
%>
</ul>
</div>
</TD>

</tr>

<tr> 
<TD align=right></TD>
<td>
<input name="prohibit2" id="prohibit2" type="hidden" value="" />

<input type="submit" name="adcodeset" id="adcodeset" value="生成以上配置代码" class="btn btn-primary"></td>
</tr>
</form>

<%
JsUrl=AdPath&RsSet("AdMainFileName")&".aspx?action="&GetValName("mixadget")&"&"&GetParaName("ad_class")&"="&Ad_Class&"&"&GetParaName("userid")&"=" & userid & "&"&GetParaName("lowunionusername")&"=&"&GetParaName("clickstate")&"="&clickstate&"&"&GetParaName("showsel")&"="&showsel&"&"&GetParaName("ad_size")&"="&ad_size&"&"&GetParaName("adwidth")&"=" & adwidth & "&"&GetParaName("adheight")&"=" & adheight & "&"&GetParaName("adrow")&"=" & adrow &"&"&GetParaName("adcol")&"=" & adcol & "&"&GetParaName("adbordercolor")&"="&adbordercolor&"&"&GetParaName("adbgcolor")&"="&adbgcolor&"&"&GetParaName("adintrocolor")&"="&adintrocolor&"&"&GetParaName("adintrosize")&"="&adintrosize&"&"&GetParaName("newadsel")&"="&newadsel&"&"&GetParaName("maxadid")&"="&maxadid&"&"&GetParaName("prohibit")&"="&ProHibit2

AdCode="<script src="""&JsUrl&"""></script>"

AdCodeJs="document.write('<scr'+'ipt src="""&JsUrl&"""></scr'+'ipt>');"
%>

<tr class="tr_1"> 
<td colspan="2">效果：</td>
</tr>
<tr> 
<td colspan="2"><%=AdCode%></td>
</tr>

<tr class="tr_1"> 
<td colspan="2">iframe代码-Html调用(不会影响网站打开速度)</td>
</tr>
<tr>
<%
JsUrl=AdPath&RsSet("AdMainFileName")&".aspx?action="&GetValName("mixadget")&"&"&GetParaName("ad_class")&"="&Ad_Class&"&"&GetParaName("userid")&"=" & userid & "&"&GetParaName("lowunionusername")&"=&"&GetParaName("clickstate")&"="&clickstate&"&"&GetParaName("showsel")&"="&showsel&"&"&GetParaName("ad_size")&"="&ad_size&"&"&GetParaName("adwidth")&"=" & adwidth & "&"&GetParaName("adheight")&"=" & adheight & "&"&GetParaName("adrow")&"=" & adrow &"&"&GetParaName("adcol")&"=" & adcol & "&"&GetParaName("adbordercolor")&"="&adbordercolor&"&"&GetParaName("adbgcolor")&"="&adbgcolor&"&"&GetParaName("adintrocolor")&"="&adintrocolor&"&"&GetParaName("adintrosize")&"="&adintrosize&"&"&GetParaName("newadsel")&"="&newadsel&"&"&GetParaName("maxadid")&"="&maxadid&"&"&GetParaName("prohibit")&"="&ProHibit2
%>
    <td colspan="2"><textarea id="ada1" cols="80" rows="5"><script>
var webwidth,webheight;if(document.documentElement.clientWidth&&document.documentElement.clientHeight){webwidth=document.documentElement.clientWidth;webheight=document.documentElement.clientHeight;}else if(document.body){webwidth=document.body.clientWidth;webheight=document.body.clientHeight;}document.write("<iframe src='<%=JsUrl%>&<%=GetParaName("ly")%>="+escape(document.referrer)+"&<%=GetParaName("webwidth")%>="+webwidth+"&<%=GetParaName("webheight")%>="+webheight+"&<%=GetParaName("webtitle")%>="+escape(document.title)+"&<%=GetParaName("iframe")%>=1' frameborder=0 width=<%=adwidth%> height=<%=adheight%> marginheight=0 marginwidth=0 scrolling=no></iframe>");
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

    </td>
  </tr>

  <tr class="tr_1"> 
    <td colspan="2">iframe代码-Js文件调用(不会影响网站打开速度)</td>
  </tr>
  <tr>
    <td colspan="2"><textarea id="ada2" cols="80" rows="5">var webwidth,webheight;if(document.documentElement.clientWidth&&document.documentElement.clientHeight){webwidth=document.documentElement.clientWidth;webheight=document.documentElement.clientHeight;}else if(document.body){webwidth=document.body.clientWidth;webheight=document.body.clientHeight;}document.write("<iframe src='<%=AdPath&RsSet("AdMainFileName")&".aspx?action="&JsUrl%>&<%=GetParaName("ly")%>="+escape(document.referrer)+"&<%=GetParaName("webwidth")%>="+webwidth+"&<%=GetParaName("webheight")%>="+webheight+"&<%=GetParaName("webtitle")%>="+escape(document.title)+"&<%=GetParaName("iframe")%>=1' frameborder=0 width=<%=adwidth%> height=<%=adheight%> marginheight=0 marginwidth=0 scrolling=no></iframe>");</textarea> 

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
  
  <tr class="tr_1"> 
    <td colspan="2">Js代码-Html调用</td>
  </tr>
  <tr>
    <td colspan="2">

<textarea id="adb1" cols="80" rows="5"><%=AdCode%></textarea>

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
    <td colspan="2">Js代码-Js文件调用</td>
  </tr>
  <tr>
    <td colspan="2">

<textarea id="adb2" cols="80" rows="5"><%=AdCodeJs%></textarea>

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
