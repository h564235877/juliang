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
If Request("ClickState")="" Then ClickState=1 Else ClickState=ChkStr(Request("ClickState"),2)

If Request("ShowSel")="" Then ShowSel=1 Else ShowSel=ChkStr(Request("ShowSel"),2)

If Request("NewAdSel")="" Then NewAdSel=1 Else NewAdSel=ChkStr(Request("NewAdSel"),2)

If Request("ProHibit")="" Then ProHibit=0 Else ProHibit=ChkStr(Replace(Request("ProHibit"),", ",","),1)

Sql="Select isnull(max(ID),0) From CFWztg_AD where AdState=2 and Ad_Class="&abs(ad_class)&" and CycState=1"
Set Rs=Conn.execute(Sql)
maxadid=Rs(0)

AdCode=AdPath_2&"cf.aspx?action=cycadget&ad_class="&abs(ad_class)&"&userid=" & userid &"&lowunionusername=&clickstate=" & clickstate &"&showsel=1&newadsel="&newadsel&"&prohibit="&prohibit
%>

<script src="../../js/clipboard.min.js"></script>

<script>
$(function(){

$("#adcodeset").click(function(){
 var maxadid=""
 var clickstate= $("input:radio[name='clickstate']:checked").val();
 var showsel= $("input:radio[name='showsel']:checked").val();
 var newadsel= $("input:radio[name='newadsel']:checked").val();
 if(newadsel==0){maxadid=<%=maxadid%>}

 var prohibit =[];
 $('input[name="prohibit"]:not(:checked)').each(function(){
  prohibit.push($(this).val());
 });

 
 
 $("#adcode").val("<%=AdPath_2%>cf.aspx?action=cycadget&ad_class=<%=abs(ad_class)%>&userid=<%=userid%>&lowunionusername=&clickstate="+clickstate+"&showsel="+showsel+"&newadsel="+newadsel+"&maxadid="+maxadid+"&prohibit="+prohibit);
 
});

});
</script>
<table class="tb_1">

<tr class="tr_1"> 
<td colspan="2">ֱ����ѭ���붨��</td>
</tr>

<TR>

</TR>

  <TR>
    <TD class="td_r" style="width:20%">��1��-ѡ����Ʒѷ�ʽ��</TD>
    <TD>
<label class='lyear-radio radio-primary m-t-10'>
<input name="clickstate" type="radio" value="1"
<%
Response.write " onclick=""location.href='?Action="&action&"&ad_class="&ad_class&"&clickstate=1#adnav'"""
If clickstate=1 Then Response.write " checked"%>><span>������Ʒ�(CPC)
<%
 Sql="Select count(1) From CFWztg_AD a inner join CFWztg_Plan b on a.Plan_ID=b.ID where a.AdState=2 And b.PlanState=2 And a.Ad_Class=" & Abs(Ad_Class)  &" And a.ClickState=1 and a.CycState=1"
 Set Rs=Conn.Execute(Sql)
 Response.write "[��"&Rs(0)&"�����]"
 Rs.Close
%>
</span></label>

<label class='lyear-radio radio-primary m-t-10'>
<input name="clickstate" type="radio" value="3"<%
Response.write " onclick=""location.href='?Action="&action&"&ad_class="&ad_class&"&clickstate=3#adnav'"""
If clickstate=3 Then Response.write " checked"%>><span>��ע��Ʒ�(CPA)
<%
 Sql="Select count(1) From CFWztg_AD a inner join CFWztg_Plan b on a.Plan_ID=b.ID where a.AdState=2 And b.PlanState=2 And a.Ad_Class=" & Abs(Ad_Class)  &" And a.ClickState=3 and a.CycState=1"
 Set Rs=Conn.Execute(Sql)
 Response.write "[��"&Rs(0)&"�����]"
 Rs.Close
%>
</span></label>

<label class='lyear-radio radio-primary m-t-10'>
<input name="clickstate" type="radio" value="4"<%
Response.write " onclick=""location.href='?Action="&action&"&ad_class="&ad_class&"&clickstate=4#adnav'"""
If clickstate=4 Then Response.write " checked"%>><span>���ɽ��Ʒ�(CPS)
<%
 Sql="Select count(1) From CFWztg_AD a inner join CFWztg_Plan b on a.Plan_ID=b.ID where a.AdState=2 And b.PlanState=2 And a.Ad_Class=" & Abs(Ad_Class)  &" And a.ClickState=4 and a.CycState=1"
 Set Rs=Conn.Execute(Sql)
 Response.write "[��"&Rs(0)&"�����]"
 Rs.Close
%>
</span></label>
</TD>
  </TR>
  
<TR>
<TD class="td_r">��2��-ѡ��ʽ��</TD>
<TD>
<label class='lyear-radio radio-primary m-t-10'><input name="showsel" type="radio" value="1"<%If showsel=1 Then Response.write " checked"%>><span>��˳����ѭ��ʾ���(�����ʾ���ʾ���)</span></label>
<label class='lyear-radio radio-primary m-t-10'><input name="showsel" type="radio" value="2"<%If showsel=2 Then Response.write " checked"%>><span>�����������ʾ���(����Խ�ߵĹ����ʾ����Խ��)</span></label>
<label class='lyear-radio radio-primary m-t-10'><input name="showsel" type="radio" value="3"<%If showsel=3 Then Response.write " checked"%>><span>��Ȩ�������ʾ���(Ȩ��Խ�ߵĻ���Խ��)</span></label>
</TD>
</TR>


<TR>
<TD class="td_r">��3��-ѡ���½�����Զ����룺</TD>
<TD>
<label class='lyear-radio radio-inline radio-primary'><input type="radio" name="newadsel" value="1"<%If newadsel=1 Then Response.write " checked"%>><span>��</span></label>
<label class='lyear-radio radio-inline radio-primary'><input type="radio" name="newadsel" value="0"<%If newadsel=0 Then Response.write " checked"%>><span>��</span></label>
</TD>
</TR>
<TR>
<TD class="td_r">��4��-ѡ��Ͷ����Щ��棺<br />
</TD>
<TD>
<div>
<ul>
<%
Set Rs2=Server.CreateObject("Adodb.RecordSet")
Sql="Select a.* From CFWztg_AD a inner join CFWztg_Plan b on a.plan_id=b.id Where a.CycState=1 And a.AdState=2 And a.AdListShowState=1 And a.Ad_Class=" & abs(Ad_Class) &" and clickstate="&clickstate&" and b.PlanState=2 Order By a.ID Desc"
Rs2.Open Sql,Conn,1,1
While Not Rs2.Eof
%>
<li style="width:48%;float:left;"><label class='lyear-checkbox checkbox-inline checkbox-primary'>
<input type="checkbox" name="prohibit" value="<%=Rs2("ID")%>"<%If Instr(","&prohibit&",",","&Rs2("ID")&",")>0 Then Response.write " " Else Response.write " checked"%>><span><a href="?Action=adinfo&id=<%=Rs2("ID")%>" target="_blank"><%=Rs2("AdName")%></a>[<%=Rs2("ID")%>][<%=GetTurnCent(cdbl(Rs2("Unit_Cent"))*1000)%>Ԫ/ǧ��]</span></label>
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
<td></TD>
    <td><input type="submit" name="submit" value="�����������õĴ���" id="adcodeset" class="btn btn-primary"></td>
  </tr>

<tr class="tr_1"> 
    <td colspan="2">����</td>
  </tr>
  <tr>
    <td colspan="2">
<textarea id="adcode" cols="70" rows="5"><%=AdCode%></textarea> 

<input type="button" value="���ƴ���" id="copya1" data-clipboard-target="#adcode" data-clipboard-action="copy" class="btn btn-primary">
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


</table>


