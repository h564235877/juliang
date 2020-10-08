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
If Ad_Class=8 Then
 Title="强弹代码定制"
ElseIf Ad_Class=9 Then
 Title="退弹代码定制"
End If

If Request("ShowSel")="" Then ShowSel=1 Else ShowSel=ChkStr(Request("ShowSel"),2)

If Request("DelayTime")="" Then DelayTime=0 Else DelayTime=ChkStr(Request("DelayTime"),2)

If Request("SpaceTime")="" Then SpaceTime=0 Else SpaceTime=ChkStr(Request("SpaceTime"),2)

PutTime=ChkStr(Replace(ChkStr(Request("PutTime"),1),", ",","),1)

If Request("NewAdSel")="" Then NewAdSel=1 Else NewAdSel=ChkStr(Request("NewAdSel"),2)

ProHibit=ChkStr(Replace(Request("ProHibit"),", ",","),1)

Sql="Select isnull(max(ID),0) From CFWztg_AD where AdState=2 and Ad_Class="&Ad_Class
Set Rs=Conn.execute(Sql)
maxadid=Rs(0)

adcode="<script src="""&AdPath&"cf.aspx?action=cycadget&ad_class="&Ad_Class&"&userid=" & userid &"&lowunionusername=&clickstate=1&showsel="&showsel&"&delaytime=" & delaytime &"&spacetime=" & spacetime &"&puttime="&puttime&"&newadsel="&newadsel&"&maxadid=&prohibit="&prohibit&"""></script>"

adcode_js="document.write('<scr'+'ipt src="""&AdPath&"cf.aspx?action=cycadget&ad_class="&Ad_Class&"&userid=" & userid &"&lowunionusername=&clickstate=1&showsel="&showsel&"&delaytime=" & delaytime &"&spacetime=" & spacetime &"&puttime="&puttime&"&newadsel="&newadsel&"&maxadid=&prohibit="&prohibit&"""></scr'+'ipt>');"
%>

<script src="../../js/clipboard.min.js"></script>

<script>
$(function(){

$("#adcodeset").click(function(){
 var maxadid=""
 var showsel= $("input:radio[name='showsel']:checked").val();
 var delaytime= $("#delaytime").val();
 var spacetime= $("#spacetime").val();
 var puttime =[];
 $('input[name="puttime"]:checked').each(function(){
  puttime.push($(this).val());
 });
 var newadsel= $("input:radio[name='newadsel']:checked").val();
 if(newadsel==0){maxadid=<%=maxadid%>}

 var prohibit =[];
 $('input[name="prohibit"]:not(:checked)').each(function(){
  prohibit.push($(this).val());
 });
 

 
 location.href="?Action=<%=Action%>&ad_class=<%=Ad_Class%>&userid=<%=userid%>&lowunionusername=&clickstate=1&showsel="+showsel+"&delaytime="+delaytime+"&spacetime="+spacetime+"&puttime="+puttime+"&newadsel="+newadsel+"&maxadid="+maxadid+"&prohibit="+prohibit+"#adnav";
 
});

});
</script>

<table class="tb_1">

<tr class="tr_1"> 
<td colspan="2"><%=Title%></td>
</tr>

<TR>
<TD class="td_r" width="210" >第1步-弹出方式选择：</TD>
<TD>
<label class='lyear-radio radio-primary m-t-10'><input name="showsel" type="radio" value="1"<%If showsel=1 Then Response.write " checked"%>><span>按顺序轮循弹出(弹出机率均等)</span></label>
<label class='lyear-radio radio-primary m-t-10'><input name="showsel" type="radio" value="2"<%If showsel=2 Then Response.write " checked"%>><span>按竞价随机弹出(单价越高的机率越高)</span></label>
<label class='lyear-radio radio-primary m-t-10'><input name="showsel" type="radio" value="3"<%If showsel=3 Then Response.write " checked"%>><span>按权重随机弹出(权重越高的机率越高)</span></label>
</TD>
</TR>
<TR>
<TD class="td_r">第2步-弹出延时：</TD>
<TD><input name="DelayTime" type=text id="delaytime" value="<%=delaytime%>" size=10 >秒钟</TD>
</TR>
<TR>
<TD class="td_r">第3步-弹出间隔：</TD>
<TD><input name="SpaceTime" type=text id="spacetime" value="<%=spacetime%>" size=10 >分钟</TD>
</TR>
<TR>
<TD class="td_r">第4步-弹出时段：<br />
(不选则默认所有时段有效)</TD>
<TD>
<%For I=0 To 23%>
<label class='lyear-checkbox checkbox-inline checkbox-primary'><input type="checkbox" name="puttime" value="<%=I%>"<%If Instr(","&puttime&",",","&I&",")>0 Then Response.write " checked"%>><span><%=Right("0"&I,2)&"-"&Right("0"&I+1,2)%></span></label>
<%If I=7 Or I=15 Then Response.write "<br>"%>
<%Next%></TD>
  </TR>
<TR>
<TD class="td_r">第5步-新进广告自动加入选择：</TD>
<TD>
<label class='lyear-radio radio-inline radio-primary'><input name="newadsel" type="radio" value="1"<%If newadsel=1 Then Response.write " checked"%>><span>是</span></label>
<label class='lyear-radio radio-inline radio-primary'><input name="newadsel" type="radio" value="0"<%If newadsel=0 Then Response.write " checked"%>><span>否</span></label>
</TD>
</TR>
<TR>
<TD class="td_r">第6步-选择投放哪些广告：<br />
</TD>
<TD>
<div>
<ul>
<%
Set Rs2=Server.CreateObject("Adodb.RecordSet")
Sql="Select a.* From CFWztg_AD a inner join CFWztg_Plan b on a.plan_id=b.id Where a.AdState=2 And a.AdListShowState=1 And a.Ad_Class=" & Ad_Class &" and b.PlanState=2 Order By a.ID Desc"
Rs2.Open Sql,Conn,1,1
While Not Rs2.Eof
%>
<li style="width:48%;float:left;">
<label class='lyear-checkbox checkbox-inline checkbox-primary'>
<input type="checkbox" name="prohibit" value="<%=Rs2("ID")%>"<%If Instr(","&prohibit&",",","&Rs2("ID")&",")>0 Then Response.write " " Else Response.write " checked"%>><span><a href="?Action=adinfo&id=<%=Rs2("ID")%>" target="_blank"><%=Rs2("AdName")%></a>[<%=Rs2("ID")%>][<%=GetTurnCent(cdbl(Rs2("Unit_Cent"))*1000)%>元/千次]
</span></label>
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
<td><input type="submit" name="submit" value="生成以上配置的代码" id="adcodeset" class="btn btn-primary">

</td>
</tr>

  
<tr> 
<TD>
<%
AdViewLink ="?Action=adlist&adview=1&ad_class="&Ad_Class&"&userid=" & userid &"&lowunionusername=&showsel="&showsel&"&delaytime=" & delaytime &"&spacetime=" & spacetime &"&puttime="&puttime&"&newadsel="&newadsel&"&maxadid=&prohibit="&prohibit
%>
&nbsp;&nbsp;<a href="<%=AdViewLink%>">点击查看设置的广告效果</a>
</td>
</tr>
  
<%If CInt(Request("adview"))=1 Then%>
<tr> 
<td colspan="2">
<%
If Ad_Class=8 Then
 Response.write "弹出窗口"
ElseIf Ad_Class=9 Then
  Response.write "关闭浏览器或点浏览器上的刷新弹出窗口"
End If
%>
<%=adcode%>
</td>
</tr>
<%End If%>

  <tr class="tr_1"> 
    <td colspan="2">Js代码-Html调用(尽量放在&lt;/body&gt;上一行或网页底部，不会影响网站打开速度)</td>
  </tr>
  <tr>
    <td colspan="2"><textarea id="ada1" cols="80" rows="5"><%=adcode%></textarea>

<input type="button" value="复制Js代码-Html调用" id="copya1" data-clipboard-target="#ada1" data-clipboard-action="copy" class="btn btn-primary">
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
    <td colspan="2">Js代码-Js文件调用(尽量放在&lt;/body&gt;上一行或网页底部，不会影响网站打开速度)</td>
  </tr>
  <tr>
    <td colspan="2"><textarea id="ada2" cols="80" rows="5"><%=adcode_js%></textarea>

<input type="button" value="复制Js代码-Js文件调用" id="copya2" data-clipboard-target="#ada2" data-clipboard-action="copy" class="btn btn-primary">
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

