<%
'�˷�������ϵͳ Sql��
'����QQ��178575
'����EMail��yliangcf@163.com
'������վ��http://www.qqcf.com
'��ϸ��飺http://www.qqcf.com/cfwztg.htm
'�����г���������ʾ����װ��ʾ��ʹ�����ѽ�����°汾���ص�����
'��Ϊ��Щ���ݿ���ʱ�����£���û�з��ڳ�������Լ�����վ�鿴
%>


<script>
$(function(){

function sitetypeset_0(){
$("#t_sitetype_1").hide();
$("#t_sitetype_2").hide();
$("#t_sitetype_3").hide();
}

function sitetypeset_1(){
$("#t_sitetype_1").show();
$("#t_sitetype_2").hide();
$("#t_sitetype_3").hide();
}

function sitetypeset_2(){
$("#t_sitetype_1").hide();
$("#t_sitetype_2").show();
$("#t_sitetype_3").hide();
}

function sitetypeset_3(){
$("#t_sitetype_1").hide();
$("#t_sitetype_2").hide();
$("#t_sitetype_3").show();
}

sitetypeset_<%=Rs("sitetypeset")%>();

$("#sitetypeset_0").click(function(){
sitetypeset_0();
});

$("#sitetypeset_1").click(function(){
sitetypeset_1();
});

$("#sitetypeset_2").click(function(){
sitetypeset_2();
});

$("#sitetypeset_3").click(function(){
sitetypeset_3();
});

});
</script>

<table class="tb_1" id="tbu">
<tr class="tr_1">
<td colspan="2">Ͷ���豸</td>
</tr>
<tr> 
<td width="90" class="td_r"><span  id="t3">Ͷ���豸��</span></td>
<td><input type="radio" name="sitetypeset" id="sitetypeset_0" value="0"<%If Rs("sitetypeset")=0 Then Response.Write " Checked"%>/>����<br>
<input type="radio" name="sitetypeset" id="sitetypeset_1" value="1"<%If Rs("sitetypeset")=1 Then Response.Write " Checked"%>/>ָ���ն�(����΢��)<br>
<input type="radio" name="sitetypeset" id="sitetypeset_2" value="2"<%If Rs("sitetypeset")=2 Then Response.Write " Checked"%>/>ֻͶ΢��<br>
<input type="radio" name="sitetypeset" id="sitetypeset_3" value="3"<%If Rs("sitetypeset")=3 Then Response.Write " Checked"%>/>ָ���ն�(�ų�΢��)
</td>
</tr>

<tr id="t_sitetype_1">
<td></td>
<td>
<input type="checkbox" name="sitetype1" id="sitetype" value="pc,pcwx"<%If Instr(Rs("sitetype"),"pc,pcwx")>0 Then Response.Write " Checked"%>>�������&nbsp;&nbsp;&nbsp;&nbsp;

<input type="checkbox" name="sitetype1" id="sitetype" value="android,androidwx"<%If Instr(Rs("sitetype"),"android,androidwx")>0 Then Response.Write " Checked"%>>��׿�ֻ�&nbsp;&nbsp;&nbsp;&nbsp;
<input type="checkbox" name="sitetype1" id="sitetype" value="apad,apadwx"<%If Instr(Rs("sitetype"),"apad,apadwx")>0 Then Response.Write " Checked"%>>��׿ƽ��&nbsp;&nbsp;&nbsp;&nbsp;

<input type="checkbox" name="sitetype1" id="sitetype" value="ios,ioswx"<%If Instr(Rs("sitetype"),"ios,ioswx")>0 Then Response.Write " Checked"%>>ƻ���ֻ�&nbsp;&nbsp;&nbsp;&nbsp;
<input type="checkbox" name="sitetype1" id="sitetype" value="ipad,ipadwx"<%If Instr(Rs("sitetype"),"ipad,ipadwx")>0 Then Response.Write " Checked"%>>ƻ��ƽ��&nbsp;&nbsp;&nbsp;&nbsp;

<input type="checkbox" name="sitetype1" id="sitetype" value="winphone,winphonewx"<%If Instr(Rs("sitetype"),"winphone,winphonewx")>0 Then Response.Write " Checked"%>>΢��WP
</td>
</tr>

<tr id="t_sitetype_2">
<td></td>
<td>
<input type="checkbox" name="sitetype2" id="sitetype" value="pcwx"<%If Instr(Rs("sitetype"),"pcwx,")>0 Then Response.Write " Checked"%>>�������΢��&nbsp;&nbsp;&nbsp;&nbsp;

<input type="checkbox" name="sitetype2" id="sitetype" value="androidwx"<%If Instr(Rs("sitetype"),"androidwx,")>0 Then Response.Write " Checked"%>>��׿�ֻ�΢��&nbsp;&nbsp;&nbsp;&nbsp;
<input type="checkbox" name="sitetype2" id="sitetype" value="apadwx"<%If Instr(Rs("sitetype"),"apadwx,")>0 Then Response.Write " Checked"%>>��׿ƽ��΢��&nbsp;&nbsp;&nbsp;&nbsp;

<input type="checkbox" name="sitetype2" id="sitetype" value="ioswx"<%If Instr(Rs("sitetype"),"ioswx,")>0 Then Response.Write " Checked"%>>ƻ���ֻ�΢��&nbsp;&nbsp;&nbsp;&nbsp;
<input type="checkbox" name="sitetype2" id="sitetype" value="ipadwx"<%If Instr(Rs("sitetype"),"ipadwx,")>0 Then Response.Write " Checked"%>>ƻ��ƽ��΢��&nbsp;&nbsp;&nbsp;&nbsp;

<input type="checkbox" name="sitetype2" id="sitetype" value="winphonewx"<%If Instr(Rs("sitetype"),"winphonewx,")>0 Then Response.Write " Checked"%>>΢��WP΢��
</td>
</tr>

<tr id="t_sitetype_3">
<td></td>
<td>
<input type="checkbox" name="sitetype3" id="sitetype" value="pc"<%If Instr(Rs("sitetype"),"pc,")>0 Then Response.Write " Checked"%>>�������&nbsp;&nbsp;&nbsp;&nbsp;

<input type="checkbox" name="sitetype3" id="sitetype" value="android"<%If Instr(Rs("sitetype"),"android,")>0 Then Response.Write " Checked"%>>��׿�ֻ�&nbsp;&nbsp;&nbsp;&nbsp;
<input type="checkbox" name="sitetype3" id="sitetype" value="apad"<%If Instr(Rs("sitetype"),"apad,")>0 Then Response.Write " Checked"%>>��׿ƽ��&nbsp;&nbsp;&nbsp;&nbsp;

<input type="checkbox" name="sitetype3" id="sitetype" value="ios"<%If Instr(Rs("sitetype"),"ios,")>0 Then Response.Write " Checked"%>>ƻ���ֻ�&nbsp;&nbsp;&nbsp;&nbsp;
<input type="checkbox" name="sitetype3" id="sitetype" value="ipad"<%If Instr(Rs("sitetype"),"ipad,")>0 Then Response.Write " Checked"%>>ƻ��ƽ��&nbsp;&nbsp;&nbsp;&nbsp;

<input type="checkbox" name="sitetype3" id="sitetype" value="winphone"<%If Instr(Rs("sitetype"),"winphone,")>0 Then Response.Write " Checked"%>>΢��WP
</td>
</tr>

<tr> 
<td></td>
<td>
<input type="submit" name="adrunsitebtn" id="adrunsitebtn" value="�޸�" class="btn btn-primary">
</td>
</tr>
</table>