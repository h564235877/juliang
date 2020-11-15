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

If Request("adshowtype")="" Then adshowtype="AdCode_sjdb" Else adshowtype=ChkStr(Request("adshowtype"),1)

If Request("ad_size")="" Then ad_size="360x60" Else ad_size=ChkStr(Request("ad_size"),1)

If Request("ShowSel")="" Then ShowSel=1 Else ShowSel=ChkStr(Request("ShowSel"),2)

If Request("NewAdSel")="" Then NewAdSel=1 Else NewAdSel=ChkStr(Request("NewAdSel"),2)

ProHibit=ChkStr(Replace(Request("ProHibit"),", ",","),1)

Sql="Select isnull(max(a.ID),0) From CFWztg_AD a inner join CFWztg_Plan b on a.plan_id=b.id Where a.CycState=1 and a.AdState=2 And a.AdListShowState=1 And a.Ad_Class=" & abs(Ad_Class) &" And a.ClickState=" & ClickState & " and b.PlanState=2"
Set Rs=Conn.execute(Sql)
maxadid=Rs(0)
%>

<script src="../../js/clipboard.min.js"></script>

<script>
$(function(){

$("#adcodeset").click(function(){
 var maxadid=""
 
 var clickstate= $("input:radio[name='clickstate']:checked").val();

 var adshowtype= $("input:radio[name='adshowtype']:checked").val();
 if(adshowtype==""||adshowtype==undefined){alert("请先选择富媒体广告效果");return false;}
 
 var ad_size= $("input:radio[name='ad_size']:checked").val();
 if(ad_size==""||ad_size==undefined){alert("请再选择广告尺寸");return false;}
 
 var pos = ad_size.indexOf("x");
 var adwidth=ad_size.substring(0,pos);
 var adheight=ad_size.substring(pos+1,ad_size.length);
 
 var showsel= $("input:radio[name='showsel']:checked").val();
  
 var newadsel= $("input:radio[name='newadsel']:checked").val();
 if(newadsel==0){maxadid=<%=maxadid%>}

 var prohibit =[];
 $('input[name="prohibit"]:not(:checked)').each(function(){
  prohibit.push($(this).val());
 });

<%
JsUrlA=AdPath&RsSet("AdMainFileName")&".aspx?action="&GetValName("cycadget")&"&"&GetParaName("ad_class")&"="&abs(ad_class)&"&"&GetParaName("userid")&"="&userid&"&"&GetParaName("lowunionusername")&"=&"&GetParaName("clickstate")&"=""+clickstate+""&"&GetParaName("adshowtype")&"=""+adshowtype+""&"&GetParaName("ad_size")&"=""+ad_size+""&"&GetParaName("showsel")&"=""+showsel+""&"&GetParaName("newadsel")&"=""+newadsel+""&"&GetParaName("maxadid")&"=""+maxadid+""&"&GetParaName("prohibit")&"=""+prohibit+""&ly=\""+escape(document.referrer)+\""&webwidth=\""+webwidth+\""&webheight=\""+webheight+\""&webtitle=\""+escape(document.title)+\""&iframe=1"

JsUrlB=AdPath&RsSet("AdMainFileName")&".aspx?action="&GetValName("cycadget")&"&"&GetParaName("ad_class")&"="&abs(ad_class)&"&"&GetParaName("userid")&"="&userid&"&"&GetParaName("lowunionusername")&"=&"&GetParaName("clickstate")&"=""+clickstate+""&"&GetParaName("adshowtype")&"=""+adshowtype+""&"&GetParaName("ad_size")&"=""+ad_size+""&"&GetParaName("showsel")&"=""+showsel+""&"&GetParaName("newadsel")&"=""+newadsel+""&"&GetParaName("maxadid")&"=""+maxadid+""&"&GetParaName("prohibit")&"=""+prohibit+"""
%>

$("#ada1").val("<scr"+"ipt>var webwidth,webheight;if(document.documentElement.clientWidth&&document.documentElement.clientHeight){webwidth=document.documentElement.clientWidth;webheight=document.documentElement.clientHeight;}else if(document.body){webwidth=document.body.clientWidth;webheight=document.body.clientHeight;};document.write(\"<iframe src='<%=JsUrlA%>' frameborder=0 width="+adwidth+" height="+adheight+" marginheight=0 marginwidth=0 scrolling=no><\/iframe>\");<\/script>");
 
 $("#ada2").val("var webwidth,webheight,webtitle;if(document.documentElement.clientWidth&&document.documentElement.clientHeight){webwidth=document.documentElement.clientWidth;webheight=document.documentElement.clientHeight;}else if(document.body){webwidth=document.body.clientWidth;webheight=document.body.clientHeight;}webtitle=document.title;document.write(\"<iframe src='<%=JsUrlA%>' frameborder=0 width="+adwidth+" height="+adheight+" marginheight=0 marginwidth=0 scrolling=no><\/iframe>\");");
 
 $("#adb1").val("<script src=\"<%=JsUrlB%>\"></scr"+"ipt>");
 
 $("#adb2").val("document.write('<scr'+'ipt src=\"<%=JsUrlB%>\"></scr'+'ipt>');");
 
});

});
</script>


				  
<table class="tb_1">

  <tr class="tr_1"> 
    <td colspan="2">轮循富媒体广告代码定制</td>
  </tr>

  <TR>
    <TD class="td_r" style="width:20%">第1步-选择广告计费方式：</TD>
    <TD>

<label class="lyear-radio radio-primary">
<input name="clickstate" type="radio" value="1"
<%
Response.write " onclick=""location.href='?Action="&action&"&ad_class="&ad_class&"&clickstate=1&ad_size="&ad_size&"#adnav'"""
If clickstate=1 Then Response.write " checked"%>><span>按点击计费(CPC)</span>
<%
 Sql="Select count(1) From CFWztg_AD a inner join CFWztg_Plan b on a.Plan_ID=b.ID where a.AdState=2 And b.PlanState=2 And a.Ad_Class=" & Abs(Ad_Class)  &" And a.ClickState=1 and a.CycState=1"
 Set Rs=Conn.Execute(Sql)
 Response.write "[共"&Rs(0)&"个广告]"
 Rs.Close
%>
</label>

<label class="lyear-radio radio-primary m-t-10">
<input name="clickstate" type="radio" value="2"<%
Response.write " onclick=""location.href='?Action="&action&"&ad_class="&ad_class&"&clickstate=2&ad_size="&ad_size&"#adnav'"""
If clickstate=2 Then Response.write " checked"%>><span>按显示计费(CPV)</span>
<%
 Sql="Select count(1) From CFWztg_AD a inner join CFWztg_Plan b on a.Plan_ID=b.ID where a.AdState=2 And b.PlanState=2 And a.Ad_Class=" & Abs(Ad_Class)  &" And a.ClickState=2 and a.CycState=1"
 Set Rs=Conn.Execute(Sql)
 Response.write "[共"&Rs(0)&"个广告]"
 Rs.Close
%>
</label>

<label class="lyear-radio radio-primary m-t-10">
<input name="clickstate" type="radio" value="3"<%
Response.write " onclick=""location.href='?Action="&action&"&ad_class="&ad_class&"&clickstate=3&ad_size="&ad_size&"#adnav'"""
If clickstate=3 Then Response.write " checked"%>><span>按注册计费(CPA)</span>
<%
 Sql="Select count(1) From CFWztg_AD a inner join CFWztg_Plan b on a.Plan_ID=b.ID where a.AdState=2 And b.PlanState=2 And a.Ad_Class=" & Abs(Ad_Class)  &" And a.ClickState=3 and a.CycState=1"
 Set Rs=Conn.Execute(Sql)
 Response.write "[共"&Rs(0)&"个广告]"
 Rs.Close
%>
</label>

<label class="lyear-radio radio-primary m-t-10">
<input name="clickstate" type="radio" value="4"<%
Response.write " onclick=""location.href='?Action="&action&"&ad_class="&ad_class&"&clickstate=4&ad_size="&ad_size&"#adnav'"""
If clickstate=4 Then Response.write " checked"%>><span>按订单计费(CPS)</span>
<%
 Sql="Select count(1) From CFWztg_AD a inner join CFWztg_Plan b on a.Plan_ID=b.ID where a.AdState=2 And b.PlanState=2 And a.Ad_Class=" & Abs(Ad_Class)  &" And a.ClickState=4 and a.CycState=1"
 Set Rs=Conn.Execute(Sql)
 Response.write "[共"&Rs(0)&"个广告]"
 Rs.Close
%>
</label>
</TD>
  </TR>
  
<TR>
<TD class="td_r">第2步-选择富媒体效果：</TD>
<TD>
<div style="width:680px;">
<ul>
<%
Sql="Select * From CFWztg_SetContent Where SetBClassFlag='AdminTemplet' And SetSClassFlag='AdminTemplet_AdCode' And SetState=1 Order By SetTaxis"
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
<TD class="td_r">第3步-选择广告尺寸：</TD>
<TD>

<li style="clear:both;">横向</li>
<%
Sql="Select * From CFwztg_AdSize where Direction=1 Order By Direction,Width Desc,Height Desc"

Set Rs = Server.CreateObject("ADODB.Recordset")
Rs.open Sql,Conn,1,1
While Not Rs.Eof
If adshowtype<>"" Then
 Sql="Select count(1) From CFWztg_AD a inner join CFWztg_Plan b on a.Plan_ID=b.ID where a.AdState=2 And b.PlanState=2 And a.Ad_Class=" & Abs(Ad_Class)  &" And a.ClickState=" & ClickState & " and a.CycState=1 and convert(varchar,a.adwidth)+'x'+convert(varchar,a.adheight)='"&Rs("Width")&"x"&Rs("Height")&"' and a.adshowtype='"&adshowtype&"'"

 Set Rs2=Conn.Execute(Sql)
 If Rs2(0)>0 Then
  Response.write "<li style='width:185px;float:left;'><label class='lyear-radio radio-primary m-t-10'><input type='radio' name='ad_size' value='"&Rs("Width")&"x"&Rs("Height")&"' id='ad_size' onclick=""location.href='?Action="&action&"&ad_class="&ad_class&"&clickstate="&clickstate&"&adshowtype="&adshowtype&"&ad_size="&Rs("Width")&"x"&Rs("Height")&"#adnav'"""
  If Ad_Size = Rs("Width")&"x"&Rs("Height") Then Response.write " checked"
  Response.write "><span>" & Rs("Width")&"x"&Rs("Height")
  Response.write "[共"&Rs2(0)&"个广告]</span></label></li>"
 End If
 Rs2.Close
Else
 Response.write "<label class='lyear-radio radio-primary m-t-10'><input type='radio' name='ad_size' value='"&Rs("Width")&"x"&Rs("Height")&"' id='ad_size' onclick=""location.href='?Action="&action&"&ad_class="&ad_class&"&clickstate="&clickstate&"&adshowtype="&adshowtype&"&ad_size="&Rs("Width")&"x"&Rs("Height")&"#adnav'"""
 If Ad_Size = Rs("Width")&"x"&Rs("Height") Then Response.write " checked"
 Response.write "><span>" & Rs("Width")&"x"&Rs("Height") & "</span></label>"
End If

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
If adshowtype<>"" Then
 Sql="Select count(1) From CFWztg_AD a inner join CFWztg_Plan b on a.Plan_ID=b.ID where a.AdState=2 And b.PlanState=2 And a.Ad_Class=" & Abs(Ad_Class)&" And a.ClickState=" & ClickState& " and a.CycState=1 and convert(varchar,a.adwidth)+'x'+convert(varchar,a.adheight)='"&Rs("Width")&"x"&Rs("Height")&"' and a.adshowtype='"&adshowtype&"'"
 Set Rs2=Conn.Execute(Sql)
 If Rs2(0)>0 Then
  Response.write "<li style='width:185px;float:left;'><label class='lyear-radio radio-primary m-t-10'><input type='radio' name='ad_size' value='"&Rs("Width")&"x"&Rs("Height")&"' id='ad_size' onclick=""location.href='?Action="&action&"&ad_class="&ad_class&"&clickstate="&clickstate&"&adshowtype="&adshowtype&"&ad_size="&Rs("Width")&"x"&Rs("Height")&"#adnav'"""
  If Ad_Size = Rs("Width")&"x"&Rs("Height") Then Response.write " checked"
  Response.write "><span>" & Rs("Width")&"x"&Rs("Height")
  Response.write "[共"&Rs2(0)&"个广告]</span></label></li>"
 End If
 Rs2.Close
Else
 Response.write "<label class='lyear-radio radio-primary m-t-10'><input type='radio' name='ad_size' value='"&Rs("Width")&"x"&Rs("Height")&"' id='ad_size' onclick=""location.href='?Action="&action&"&ad_class="&ad_class&"&clickstate="&clickstate&"&adshowtype="&adshowtype&"&ad_size="&Rs("Width")&"x"&Rs("Height")&"#adnav'"""
 If Ad_Size = Rs("Width")&"x"&Rs("Height") Then Response.write " checked"
 Response.write "><span>" & Rs("Width")&"x"&Rs("Height") & "</span></label>"
End If

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
If adshowtype<>"" Then
 Sql="Select count(1) From CFWztg_AD a inner join CFWztg_Plan b on a.Plan_ID=b.ID where a.AdState=2 And b.PlanState=2 And a.Ad_Class=" & Abs(Ad_Class) &" And a.ClickState=" & ClickState& " and a.CycState=1 and convert(varchar,a.adwidth)+'x'+convert(varchar,a.adheight)='"&Rs("Width")&"x"&Rs("Height")&"' and a.adshowtype='"&adshowtype&"'"
 Set Rs2=Conn.Execute(Sql)
 If Rs2(0)>0 Then
  Response.write "<li style='width:185px;float:left;'><label class='lyear-radio radio-primary m-t-10'><input type='radio' name='ad_size' value='"&Rs("Width")&"x"&Rs("Height")&"' id='ad_size' onclick=""location.href='?Action="&action&"&ad_class="&ad_class&"&clickstate="&clickstate&"&adshowtype="&adshowtype&"&ad_size="&Rs("Width")&"x"&Rs("Height")&"#adnav'"""
  If Ad_Size = Rs("Width")&"x"&Rs("Height") Then Response.write " checked"
  Response.write "><span>" & Rs("Width")&"x"&Rs("Height")
  Response.write "[共"&Rs2(0)&"个广告]</span></label></li>"
 End If
 Rs2.Close
Else
 Response.write "<label class='lyear-radio radio-primary m-t-10'><input type='radio' name='ad_size' value='"&Rs("Width")&"x"&Rs("Height")&"' id='ad_size' onclick=""location.href='?Action="&action&"&ad_class="&ad_class&"&clickstate="&clickstate&"&adshowtype="&adshowtype&"&ad_size="&Rs("Width")&"x"&Rs("Height")&"#adnav'"""
 If Ad_Size = Rs("Width")&"x"&Rs("Height") Then Response.write " checked"
 Response.write "><span>" & Rs("Width")&"x"&Rs("Height") & "</span></label>"
End If

Rs.MoveNext
Wend
Rs.Close
%>
<li style="clear:both;">其它</li>
<%
Sql="Select distinct convert(varchar,a.AdWidth)+'x'+convert(varchar,a.AdHeight) adx From CFWztg_AD a inner join CFWztg_Plan b on a.Plan_ID=b.ID where a.AdState=2 And b.PlanState=2 And a.Ad_Class=" & Abs(Ad_Class)& " And a.ClickState=" & ClickState& " and a.CycState=1 and  a.adshowtype='"&adshowtype&"' and convert(varchar,a.AdWidth)+'x'+convert(varchar,a.AdHeight) not in(Select convert(varchar,c.Width)+'x'+convert(varchar,c.Height) From CFwztg_AdSize c)"

Set Rs = Server.CreateObject("ADODB.Recordset")
Rs.open Sql,Conn,1,1
While Not Rs.Eof
If adshowtype<>"" Then
 Sql="Select count(1) From CFWztg_AD a inner join CFWztg_Plan b on a.Plan_ID=b.ID where a.AdState=2 And b.PlanState=2 And a.Ad_Class=" & Abs(Ad_Class) &" And a.ClickState=" & ClickState& " and a.CycState=1 and convert(varchar,a.adwidth)+'x'+convert(varchar,a.adheight)='"&Rs("adx")&"' and a.adshowtype='"&adshowtype&"'"
 Set Rs2=Conn.Execute(Sql)
 If Rs2(0)>0 Then
  Response.write "<li style='width:185px;float:left;'><label class='lyear-radio radio-primary m-t-10'><input type='radio' name='ad_size' value='"&Rs("adx")&"' id='ad_size' onclick=""location.href='?Action="&action&"&ad_class="&ad_class&"&clickstate="&clickstate&"&adshowtype="&adshowtype&"&ad_size="&Rs("adx")&"#adnav'"""
  If Ad_Size = Rs("adx") Then Response.write " checked"
  Response.write "><span>" & Rs("adx")
  Response.write "[共"&Rs2(0)&"个广告]</span></label></li>"
 End If
 Rs2.Close
Else
 Response.write "<label class='lyear-radio radio-primary m-t-10'><input type='radio' name='ad_size' value='"&Rs("adx")&"' id='ad_size' onclick=""location.href='?Action="&action&"&ad_class="&ad_class&"&clickstate="&clickstate&"&adshowtype="&adshowtype&"&ad_size="&Rs("adx")&"#adnav'"""
 If Ad_Size = Rs("Width")&"x"&Rs("Height") Then Response.write " checked"
 Response.write "><span>" & Rs("Width")&"x"&Rs("Height") & "</span></label>"
End If

Rs.MoveNext
Wend
Rs.Close
%>

</TD>
</TR>

<TR>
<TD class="td_r">第4步-选择方式：</TD>
<TD>
<label class='lyear-radio radio-primary m-t-10'><input name="showsel" type="radio" value="1"<%If showsel=1 Then Response.write " checked"%>><span>按顺序轮循显示广告(广告显示机率均等)</span></label>
<label class='lyear-radio radio-primary m-t-10'><input name="showsel" type="radio" value="2"<%If showsel=2 Then Response.write " checked"%>><span>按竞价随机显示广告(单价越高的广告显示机率越高)</span></label>
<label class='lyear-radio radio-primary m-t-10'><input name="showsel" type="radio" value="3"<%If showsel=3 Then Response.write " checked"%>><span>按权重随机显示广告(权重越高的机率越高)</span></label>
</TD>
</TR>

<TR>
<TD class="td_r">第5步-选择新进广告自动加入：</TD>
<TD>
<label class='lyear-radio radio-inline radio-primary'><input name="newadsel" type="radio" value="1"<%If newadsel=1 Then Response.write " checked"%>><span>是</span></label>
<label class='lyear-radio radio-inline radio-primary'><input type="radio" name="newadsel" value="0"<%If newadsel=0 Then Response.write " checked"%>><span>否</span></label>
</TD>
</TR>
<TR>
<TD class="td_r">第6步-选择哪些的广告：<br />
</TD>
<TD>
<div>
<ul>
<%
Set Rs2=Server.CreateObject("Adodb.RecordSet")
Sql="Select a.* From CFWztg_AD a inner join CFWztg_Plan b on a.plan_id=b.id Where a.CycState=1 And a.AdState=2 And a.AdListShowState=1 And a.Ad_Class=" & abs(Ad_Class) &" and clickstate="&clickstate&" and convert(varchar,a.adwidth)+'x'+convert(varchar,a.adheight)='"&ad_size&"' and adshowtype='"&adshowtype&"' and b.PlanState=2 Order By a.ID Desc"
Rs2.Open Sql,Conn,1,1
While Not Rs2.Eof
%>
<li style="width:48%;float:left;"><label class='lyear-checkbox checkbox-inline checkbox-primary'>
<input type="checkbox" name="prohibit" value="<%=Rs2("ID")%>"<%If Instr(","&prohibit&",",","&Rs2("ID")&",")>0 Then Response.write " " Else Response.write " checked"%>>
<span><a href="?Action=adinfo&id=<%=Rs2("ID")%>" target="_blank"><%=Rs2("AdName")%></a>[<%=Rs2("ID")%>]
<%
Response.write "("

If ClickState=1 Then
 Response.write "CPC:"
ElseIf ClickState=2 Then
 Response.write "CPV:"
End If

Response.write GetTurnCent(cdbl(Rs2("Unit_Cent"))*Rs2("AllowClickTotal")*1000)&"元/千次"

If Rs2("ClickSeState")=1 Then
 Response.write ",同时支持CPC:"&GetTurnCent(cdbl(Rs2("Unit_Cent"))*cdbl(Rs2("ClickSeMul"))*Rs2("AllowClickTotal")*1000)&"元/千次"
ElseIf Rs2("ClickSeState")=2 Then
 Response.write ",同时支持CPV:"&GetTurnCent(cdbl(Rs2("Unit_Cent"))*cdbl(Rs2("ClickSeMul"))*Rs2("AllowClickTotal")*1000)&"元/千次"
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
<td><input type="submit" name="Submit4" value="生成以上配置的代码" id="adcodeset" class="btn btn-primary"></td>
</tr>


<%If adshowtype<>"" And ad_size<>"" Then%>
<tr class="tr_1"> 
 <td colspan="2">效果：</td>
</tr>
<tr> 
<td colspan="2"><script src="<%=AdPath%><%=RsSet("AdMainFileName")%>.aspx?action=<%=GetValName("cycadget")%>&<%=GetParaName("ad_class")%>=<%=abs(ad_class)%>&<%=GetParaName("userid")%>=<%=userid%>&<%=GetParaName("lowunionusername")%>=&<%=GetParaName("clickstate")%>=<%=clickstate%>&<%=GetParaName("adshowtype")%>=<%=adshowtype%>&<%=GetParaName("ad_size")%>=<%=ad_size%>&<%=GetParaName("showsel")%>=1&<%=GetParaName("newadsel")%>=1&<%=GetParaName("maxadid")%>=&<%=GetParaName("prohibit")%>="></script></td>
</tr>
<%End If%>


<%
'--自己定义HMTL代码或普通图片轮循时
If adshowtype = "AdCode_ptxs" Or adshowtype = "AdCode_tplx" Then
%>

<tr class="tr_1"> 
<td colspan="2">iframe代码-Html调用(不会影响网站打开速度)</td>
</tr>
<tr>
<td colspan="2">
<textarea name="ada1" id="ada1" cols="70" rows="5"><%=ada1%></textarea>

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

