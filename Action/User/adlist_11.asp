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
If Request("ClickState")="" Then ClickState=1 Else ClickState=ChkStr(Request("ClickState"),2)

adshowtype=ChkStr(Request("adshowtype"),1):If adshowtype="" Then adshowtype="MixCode_sjdbimg"

If Request("ShowSel")="" Then ShowSel=1 Else ShowSel=ChkStr(Request("ShowSel"),2)

If Request("NewAdSel")="" Then NewAdSel=1 Else NewAdSel=ChkStr(Request("NewAdSel"),2)

ProHibit=ChkStr(Replace(Request("ProHibit"),", ",","),1)


if adshowtype<>"" Then
Sql="Select SetIsIframe,SetWidth,SetHeight From CFWztg_SetContent Where SetFlag='"&adshowtype&"'"
Set Rs=Conn.Execute(Sql)
SetIsIframe=Rs("SetIsIframe")
SetWidth=Rs("SetWidth")
SetHeight=Rs("SetHeight")
End If
Rs.Close

Sql="Select isnull(max(a.ID),0) From CFWztg_AD a inner join CFWztg_Plan b on a.plan_id=b.id Where a.CycState=1 and a.AdState=2 And a.AdListShowState=1 And a.Ad_Class=" & abs(Ad_Class) &" And a.ClickState=" & ClickState & " and b.PlanState=2"
Set Rs=Conn.execute(Sql)
maxadid=Rs(0)
%>

<script src="../../js/clipboard.min.js"></script>

<script>
$(function(){

$("#adcodeset").click(function(){
 var maxadid=""
 var adwidth=<%=SetWidth%>;
 var adheight=<%=SetHeight%>;
 
 var clickstate= $("input:radio[name='clickstate']:checked").val();

 var adshowtype= $("input:radio[name='adshowtype']:checked").val();
 if(adshowtype==""||adshowtype==undefined){alert("请先选择富媒体广告效果");return false;}
 

 var showsel= $("input:radio[name='showsel']:checked").val();
  
 var newadsel= $("input:radio[name='newadsel']:checked").val();
 if(newadsel==0){maxadid=<%=maxadid%>}

 var prohibit =[];
 $('input[name="prohibit"]:not(:checked)').each(function(){
  prohibit.push($(this).val());
 });

<%
JsUrlA=AdPath&RsSet("AdMainFileName")&".aspx?action="&GetValName("mixadget")&"&"&GetParaName("ad_class")&"="&abs(ad_class)&"&"&GetParaName("userid")&"="&userid&"&"&GetParaName("lowunionusername")&"=&"&GetParaName("clickstate")&"=""+clickstate+""&"&GetParaName("adshowtype")&"=""+adshowtype+""&"&GetParaName("showsel")&"=""+showsel+""&"&GetParaName("newadsel")&"=""+newadsel+""&"&GetParaName("maxadid")&"=""+maxadid+""&"&GetParaName("prohibit")&"=""+prohibit+""&ly=\""+escape(document.referrer)+\""&webwidth=\""+webwidth+\""&webheight=\""+webheight+\""&webtitle=\""+escape(document.title)+\""&iframe=1"

JsUrlB=AdPath&RsSet("AdMainFileName")&".aspx?action="&GetValName("mixadget")&"&"&GetParaName("ad_class")&"="&abs(ad_class)&"&"&GetParaName("userid")&"="&userid&"&"&GetParaName("lowunionusername")&"=&"&GetParaName("clickstate")&"=""+clickstate+""&"&GetParaName("adshowtype")&"=""+adshowtype+""&"&GetParaName("showsel")&"=""+showsel+""&"&GetParaName("newadsel")&"=""+newadsel+""&"&GetParaName("maxadid")&"=""+maxadid+""&"&GetParaName("prohibit")&"=""+prohibit+"""
%>
$("#ada1").val("<scr"+"ipt>var webwidth,webheight;if(document.documentElement.clientWidth&&document.documentElement.clientHeight){webwidth=document.documentElement.clientWidth;webheight=document.documentElement.clientHeight;}else if(document.body){webwidth=document.body.clientWidth;webheight=document.body.clientHeight;}document.write(\"<iframe src='<%=JsUrlA%>' frameborder=0 width="+adwidth+" height="+adheight+" marginheight=0 marginwidth=0 scrolling=no><\/iframe>\");<\/script>");
 
 $("#ada2").val("var webwidth,webheight;if(document.documentElement.clientWidth&&document.documentElement.clientHeight){webwidth=document.documentElement.clientWidth;webheight=document.documentElement.clientHeight;}else if(document.body){webwidth=document.body.clientWidth;webheight=document.body.clientHeight;}document.write(\"<iframe src='<%=AdPath%><%=RsSet("AdMainFileName")%>.aspx?action=<%=GetValName("mixadget")%>&<%=GetParaName("ad_class")%>=<%=abs(ad_class)%>&<%=GetParaName("userid")%>=<%=userid%>&<%=GetParaName("lowunionusername")%>=&<%=GetParaName("clickstate")%>="+clickstate+"&<%=GetParaName("adshowtype")%>="+adshowtype+"&<%=GetParaName("showsel")%>="+showsel+"&<%=GetParaName("newadsel")%>="+newadsel+"&<%=GetParaName("maxadid")%>="+maxadid+"&<%=GetParaName("prohibit")%>="+prohibit+"&ly=\"+escape(document.referrer)+\"&webwidth=\"+webwidth+\"&webheight=\"+webheight+\"&webtitle=\"+escape(document.title)+\"&iframe=1' frameborder=0 width="+adwidth+" height="+adheight+" marginheight=0 marginwidth=0 scrolling=no><\/iframe>\");");
 
 $("#adb1").val("<script src=\"<%=JsUrlB%>\"></scr"+"ipt>");
 
 $("#adb2").val("document.write('<scr'+'ipt src=\"<%=JsUrlB%>\"></scr'+'ipt>');");
 
});

});
</script>
<table class="tb_1">
  <tr class="tr_1"> 
    <td colspan="2">混合富媒体广告代码定制</td>
  </tr>

  <TR>
    <TD class="td_r" style="width:20%">第1步-选择广告计费方式：</TD>
    <TD>
<label class='lyear-radio radio-primary m-t-10'>
<input name="clickstate" type="radio" value="1"
<%
Response.write " onclick=""location.href='?Action="&action&"&ad_class="&ad_class&"&clickstate=1&adshowtype="&adshowtype&"#adnav'"""
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
Response.write " onclick=""location.href='?Action="&action&"&ad_class="&ad_class&"&clickstate=2&adshowtype="&adshowtype&"#adnav'"""
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
Response.write " onclick=""location.href='?Action="&action&"&ad_class="&ad_class&"&clickstate=3&adshowtype="&adshowtype&"#adnav'"""
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
Response.write " onclick=""location.href='?Action="&action&"&ad_class="&ad_class&"&clickstate=4&adshowtype="&adshowtype&"#adnav'"""
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
<TD class="td_r">第2步-选择混合富媒体广告效果：</TD>
<TD><div style="width:720px;">
<ul>
<%
Sql="Select * From CFWztg_SetContent Where SetBClassFlag='AdminTemplet' And SetSClassFlag='AdminTemplet_MixCode' And SetState=1 Order By SetTaxis"
Set Rs=Conn.Execute(Sql)

While Not Rs.Eof

 Sql="Select count(1) From CFWztg_AD a inner join CFWztg_Plan b on a.Plan_ID=b.ID where a.AdState=2 And b.PlanState=2 And a.Ad_Class=" & Abs(Ad_Class)  &" And a.ClickState=" & ClickState & " and a.CycState=1 and a.AdShowType='"&Rs("SetFlag")&"'"
 Set Rs2=Conn.Execute(Sql)

 If Rs2(0)>0 Then'--此类型下有广告才出现
  Response.write "<li style='width:48%;float:left;'><label class='lyear-radio radio-primary m-t-10'><input type='radio' name='adshowtype' value='"&Rs("SetFlag")&"' id='adshowtype' onclick=""location.href='?Action="&action&"&ad_class="&ad_class&"&clickstate="&clickstate&"&adshowtype="&Rs("SetFlag")&"&ad_size="&ad_size&"#adnav'"""
  If adshowtype = Rs("SetFlag") Then Response.write " checked"
  Response.write "><span>"&Rs("SetDesc")


  Response.write "[共"&Rs2(0)&"个广告]"&"</span></label></li>"
 End If
 Rs2.Close
Rs.MoveNext
Wend
Rs.Close
%>
</ul>
</div>
</TD>
</TR>


<TR>
<TD class="td_r">第3步-选择方式：</TD>
<TD>
<label class='lyear-radio radio-primary m-t-10'><input name="showsel" type="radio" value="1"<%If showsel=1 Then Response.write " checked"%>><span>按随机轮循显示(广告显示机率均等)</span></label>
<label class='lyear-radio radio-primary m-t-10'><input name="showsel" type="radio" value="2"<%If showsel=2 Then Response.write " checked"%>><span>按竞价随机显示广告(单价越高的广告显示机率越高)</span></label>
<label class='lyear-radio radio-primary m-t-10'><input name="showsel" type="radio" value="3"<%If showsel=3 Then Response.write " checked"%>><span>按权重随机显示广告(权重越高的机率越高)</span></label>
</TD>
</TR>

<TR>
<TD class="td_r">第4步-选择新进广告自动加入：</TD>
<TD>
<label class='lyear-radio radio-inline radio-primary'><input name="newadsel" type="radio" value="1"<%If newadsel=1 Then Response.write " checked"%>><span>是</span></label>
<label class='lyear-radio radio-inline radio-primary'><input type="radio" name="newadsel" value="0"<%If newadsel=0 Then Response.write " checked"%>><span>否</span></label>
</TD>
</TR>
<TR>
<TD class="td_r">第5步-选择哪些的广告：<br />
</TD>
<TD>
<div>
<ul>
<%
Set Rs2=Server.CreateObject("Adodb.RecordSet")
Sql="Select a.* From CFWztg_AD a inner join CFWztg_Plan b on a.plan_id=b.id Where a.CycState=1 And a.AdState=2 And a.AdListShowState=1 And a.Ad_Class=" & abs(Ad_Class) &" and clickstate="&clickstate&" and adshowtype='"&adshowtype&"' and b.PlanState=2 Order By a.ID Desc"
Rs2.Open Sql,Conn,1,1
While Not Rs2.Eof
%>
<li style="width:48%;float:left;"><label class='lyear-checkbox checkbox-inline checkbox-primary'> 
<input type="checkbox" name="prohibit" value="<%=Rs2("ID")%>"<%If Instr(","&prohibit&",",","&Rs2("ID")&",")>0 Then Response.write " " Else Response.write " checked"%>><span>
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
<td><input type="submit" name="submit" value="生成以上配置的代码" id="adcodeset" class="btn btn-primary"></td>
</tr>

  

<%If adshowtype<>"" Then%>
<tr class="tr_1"> 
 <td colspan="2">效果：</td>
</tr>
<tr> 
<td colspan="2"><script src="<%=AdPath%><%=RsSet("AdMainFileName")%>.aspx?action=<%=GetValName("mixadget")%>&<%=GetParaName("ad_class")%>=<%=abs(ad_class)%>&<%=GetParaName("userid")%>=<%=userid%>&<%=GetParaName("lowunionusername")%>=&<%=GetParaName("clickstate")%>=<%=clickstate%>&<%=GetParaName("adshowtype")%>=<%=adshowtype%>&<%=GetParaName("showsel")%>=1&<%=GetParaName("newadsel")%>=1&<%=GetParaName("maxadid")%>=&<%=GetParaName("prohibit")%>="></script></td>
</tr>
<%End If%>



<%
'--支持iframe代码时
If SetIsIframe=1 Then
%>

<tr class="tr_1"> 
<td colspan="2">iframe代码-Html调用(不会影响网站打开速度)</td>
</tr>
<tr>
<td colspan="2">
<textarea id="ada1" cols="70" rows="5"><%=ada1%></textarea>

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
<td colspan="2">
<textarea id="ada2" cols="70" rows="5"><%=ada2%></textarea>

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
end If
%>


<tr class="tr_1"> 
<td colspan="2">Js代码-Html调用<%=tfts%></td>
</tr>
<tr>
<td colspan="2">
<textarea id="adb1" cols="70" rows="5"><%=adb1%></textarea>

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
<td colspan="2">Js代码-Js文件调用<%=tfts%></td>
</tr>
<tr>
<td colspan="2">
<textarea id="adb2" cols="70" rows="5"><%=adb2%></textarea>

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

