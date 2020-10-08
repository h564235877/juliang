<%
'乘风广告联盟系统 Sql版
'作者QQ：178575
'作者EMail：yliangcf@163.com
'作者网站：http://www.qqcf.com
'详细简介：http://www.qqcf.com/cfwztg.htm
'上面有程序在线演示，安装演示，使用疑难解答，最新版本下载等内容
'因为这些内容可能时常更新，就没有放在程序里，请自己上网站查看
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
<td colspan="2">不同流量的会员设置不同的广告价格</td>
</tr>
<TR> 
<TD width="100" class="td_r">此功能开关：</TD>
<TD>
<input name="VipLevelOpen" id="viplevelopen_0" type="radio" value="0"<%if Rs("VipLevelOpen")=0 Then Response.write " checked"%>>关闭<br /> 
<input name="VipLevelOpen" id="viplevelopen_1" type="radio"  value="1"<%if Rs("VipLevelOpen")=1 Then Response.write " checked"%>>按上一天的此广告CPV,CPC,CPA量分等级<br />
<input name="VipLevelOpen" id="viplevelopen_2" type="radio"  value="2"<%if Rs("VipLevelOpen")=2 Then Response.write " checked"%>>按用户CPV,CPC,CPA总量分等级<br />
<input name="VipLevelOpen" id="viplevelopen_3" type="radio"  value="3"<%if Rs("VipLevelOpen")=3 Then Response.write " checked"%>>按管理员后台设定的用户等级
</TD>
</TR>

<TR id="t_viplevelopen_1"> 
<TD class="td_r">VipLevel_1：</TD>
<TD><input name="VipLevel1_Num" type="text" id="VipLevel1_Num" value="<%=Rs("VipLevel1_Num")%>">
以内时的单价<input name="VipLevel1_Mul" type="text" id="VipLevel1_Mul" value="<%=GetTurnCent(Rs("VipLevel1_Mul"))%>">倍</TD>
</TR>

<TR id="t_viplevelopen_2"> 
<TD class="td_r">VipLevel_2：</TD>
<TD><input name="VipLevel2_Num" type="text" id="VipLevel2_Num" value="<%=Rs("VipLevel2_Num")%>">
以内时的单价<input name="VipLevel2_Mul" type="text" id="VipLevel2_Mul" value="<%=GetTurnCent(Rs("VipLevel2_Mul"))%>">倍</TD>
</TR>

<TR id="t_viplevelopen_3"> 
<TD class="td_r">VipLevel_3：</TD>
<TD><input name="VipLevel3_Num" type="text" id="VipLevel3_Num" value="<%=Rs("VipLevel3_Num")%>">
以内时的单价<input name="VipLevel3_Mul" type="text" id="VipLevel3_Mul" value="<%=GetTurnCent(Rs("VipLevel3_Mul"))%>">倍</TD>
</TR>

<TR id="t_viplevelopen_4"> 
<TD class="td_r">VipLevel_4：</TD>
<TD><input name="VipLevel4_Num" type="text" id="VipLevel4_Num" value="<%=Rs("VipLevel4_Num")%>">
以内时的单价<input name="VipLevel4_Mul" type="text" id="VipLevel4_Mul" value="<%=GetTurnCent(Rs("VipLevel4_Mul"))%>">倍</TD>
</TR>

<TR id="t_viplevelopen_5"> 
<TD class="td_r">VipLevel_5：</TD>
<TD><input name="VipLevel5_Num" type="text" id="VipLevel5_Num" value="<%=Rs("VipLevel5_Num")%>">
以内时的单价<input name="VipLevel5_Mul" type="text" id="VipLevel5_Mul" value="<%=GetTurnCent(Rs("VipLevel5_Mul"))%>">倍</TD>
</TR>

<TR id="t_viplevelopen_6"> 
<TD class="td_r">VipLevel_6：</TD>
<TD>达到VipLevel_5以上时的单价
<input name="VipLevel6_Mul" type="text" id="VipLevel6_Mul" value="<%=GetTurnCent(Rs("VipLevel6_Mul"))%>">倍</TD>
</TR>
	
<TR id="t_viplevelopen_7"> 
<TD></TD>
<TD>1-6点数和价格填写由小到大都必须填写完整</TD>
</TR>

<tr> 
<td></td>
<td>
<input type="submit" name="adlevelbtn" id="adlevelbtn" value="修改" class="btn btn-primary">
</td>
</tr>
</table>
