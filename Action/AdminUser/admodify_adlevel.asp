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

function viplevelopen_0(){
$("#t_viplevelopen_1,#t_viplevelopen_2,#t_viplevelopen_3,#t_viplevelopen_4,#t_viplevelopen_5,#t_viplevelopen_6,#t_viplevelopen_7").hide();
}

function viplevelopen_1(){
$("#t_viplevelopen_1,#t_viplevelopen_2,#t_viplevelopen_3,#t_viplevelopen_4,#t_viplevelopen_5,#t_viplevelopen_6,#t_viplevelopen_7").show();
}

function viplevelopen_2(){viplevelopen_1();}
function viplevelopen_3(){viplevelopen_1();}
function viplevelopen_4(){viplevelopen_1();}
function viplevelopen_5(){viplevelopen_1();}
function viplevelopen_6(){viplevelopen_1();}
function viplevelopen_7(){viplevelopen_1();}

viplevelopen_<%=Rs("viplevelopen")%>();

$("#viplevelopen_0").click(function(){
viplevelopen_0();
});

$("#viplevelopen_1,#viplevelopen_2,#viplevelopen_3").click(function(){
viplevelopen_1();
});


});
</script>

<table class="tb_1" id="tbu">
<tr class="tr_1">
<td colspan="2">��ͬ�����Ļ�Ա���ò�ͬ�Ĺ��۸�</td>
</tr>
<TR> 
<TD width="100" class="td_r">�˹��ܿ��أ�</TD>
<TD>
<input name="VipLevelOpen" id="viplevelopen_0" type="radio" value="0"<%if Rs("VipLevelOpen")=0 Then Response.write " checked"%>>�ر�<br /> 
<input name="VipLevelOpen" id="viplevelopen_1" type="radio"  value="1"<%if Rs("VipLevelOpen")=1 Then Response.write " checked"%>>����һ��Ĵ˹��CPV,CPC,CPA���ֵȼ�<br />
<input name="VipLevelOpen" id="viplevelopen_2" type="radio"  value="2"<%if Rs("VipLevelOpen")=2 Then Response.write " checked"%>>���û�CPV,CPC,CPA�����ֵȼ�<br />
<input name="VipLevelOpen" id="viplevelopen_3" type="radio"  value="3"<%if Rs("VipLevelOpen")=3 Then Response.write " checked"%>>������Ա��̨�趨���û��ȼ�
</TD>
</TR>

<TR id="t_viplevelopen_1"> 
<TD class="td_r">VipLevel_1��</TD>
<TD><input name="VipLevel1_Num" type="text" id="VipLevel1_Num" value="<%=Rs("VipLevel1_Num")%>">
����ʱ�ĵ���<input name="VipLevel1_Mul" type="text" id="VipLevel1_Mul" value="<%=GetTurnCent(Rs("VipLevel1_Mul"))%>">��</TD>
</TR>

<TR id="t_viplevelopen_2"> 
<TD class="td_r">VipLevel_2��</TD>
<TD><input name="VipLevel2_Num" type="text" id="VipLevel2_Num" value="<%=Rs("VipLevel2_Num")%>">
����ʱ�ĵ���<input name="VipLevel2_Mul" type="text" id="VipLevel2_Mul" value="<%=GetTurnCent(Rs("VipLevel2_Mul"))%>">��</TD>
</TR>

<TR id="t_viplevelopen_3"> 
<TD class="td_r">VipLevel_3��</TD>
<TD><input name="VipLevel3_Num" type="text" id="VipLevel3_Num" value="<%=Rs("VipLevel3_Num")%>">
����ʱ�ĵ���<input name="VipLevel3_Mul" type="text" id="VipLevel3_Mul" value="<%=GetTurnCent(Rs("VipLevel3_Mul"))%>">��</TD>
</TR>

<TR id="t_viplevelopen_4"> 
<TD class="td_r">VipLevel_4��</TD>
<TD><input name="VipLevel4_Num" type="text" id="VipLevel4_Num" value="<%=Rs("VipLevel4_Num")%>">
����ʱ�ĵ���<input name="VipLevel4_Mul" type="text" id="VipLevel4_Mul" value="<%=GetTurnCent(Rs("VipLevel4_Mul"))%>">��</TD>
</TR>

<TR id="t_viplevelopen_5"> 
<TD class="td_r">VipLevel_5��</TD>
<TD><input name="VipLevel5_Num" type="text" id="VipLevel5_Num" value="<%=Rs("VipLevel5_Num")%>">
����ʱ�ĵ���<input name="VipLevel5_Mul" type="text" id="VipLevel5_Mul" value="<%=GetTurnCent(Rs("VipLevel5_Mul"))%>">��</TD>
</TR>

<TR id="t_viplevelopen_6"> 
<TD class="td_r">VipLevel_6��</TD>
<TD>�ﵽVipLevel_5����ʱ�ĵ���
<input name="VipLevel6_Mul" type="text" id="VipLevel6_Mul" value="<%=GetTurnCent(Rs("VipLevel6_Mul"))%>">��</TD>
</TR>
	
<TR id="t_viplevelopen_7"> 
<TD></TD>
<TD>1-6�����ͼ۸���д��С���󶼱�����д����</TD>
</TR>

<tr> 
<td></td>
<td>
<input type="submit" name="adlevelbtn" id="adlevelbtn" value="�޸�" class="btn btn-primary">
</td>
</tr>
</table>
