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
ID=ChkStr(Request("ID"),2)

If Request("Label")="" Then Label="admodify" Else Label=ChkStr(Request("Label"),1)

If Request("RefUrl")="" Then
 RefUrl=ChkStr(Request.ServerVariables("Http_Referer"),1) 
 CurrUrl= HttpPath(5) & "?"&Request.ServerVariables("QUERY_STRING") & "&RefUrl=" & Server.URLEncode(RefUrl)
Else
 RefUrl=ChkStr(Request("RefUrl"),1)
 CurrUrl= HttpPath(5) & "?"&Request.ServerVariables("QUERY_STRING")
End If


Set Rs = Server.CreateObject("ADODB.Recordset")
Sql="Select * From CFWztg_AD where ID="&ID
Rs.open Sql,Conn,1,1
%>


<table class="tb_2">
<tr>
<td><span class="title">�����޸Ĺ��<%=ID%></span></td>
</tr>
</table>

<div class="tabs_header">
<ul class="tabs">
<li <%If Label="admodify" Then Response.write " class='active'"%>><a href="?Action=<%=Action%>&ID=<%=ID%>&Label=admodify&RefUrl=<%=Server.URLEncode(RefUrl)%>"><span>��������</span></a></li>
<li <%If Label="adprice" Then Response.write " class='active'"%>><a href="?Action=<%=Action%>&ID=<%=ID%>&Label=adprice&RefUrl=<%=Server.URLEncode(RefUrl)%>"><span>���ۺͿ۵�</span></a></li>
<li <%If Label="adguardcheat" Then Response.write " class='active'"%>><a href="?Action=<%=Action%>&ID=<%=ID%>&Label=adguardcheat&RefUrl=<%=Server.URLEncode(RefUrl)%>"><span>������</span></a></li>
<li <%If Label="adrunsite" Then Response.write " class='active'"%>><a href="?Action=<%=Action%>&ID=<%=ID%>&Label=adrunsite&RefUrl=<%=Server.URLEncode(RefUrl)%>"><span>Ͷ��λ��</span></a></li>
<li <%If Label="adsitetype" Then Response.write " class='active'"%>><a href="?Action=<%=Action%>&ID=<%=ID%>&Label=adsitetype&RefUrl=<%=Server.URLEncode(RefUrl)%>"><span>Ͷ���豸</span></a></li>
<li <%If Label="adlevel" Then Response.write " class='active'"%>><a href="?Action=<%=Action%>&ID=<%=ID%>&Label=adlevel&RefUrl=<%=Server.URLEncode(RefUrl)%>"><span>���ȼ�</span></a></li>
<li <%If Label="adother" Then Response.write " class='active'"%>><a href="?Action=<%=Action%>&ID=<%=ID%>&Label=adother&RefUrl=<%=Server.URLEncode(RefUrl)%>"><span>��������</span></a></li>

<a href="<%=RefUrl%>" class="actionBtn"><i class="mdi mdi-keyboard-return"></i>�����б�</a>
</ul>
</div>

<form name="form1" method="post" action="../../AdminUser.aspx?Action=admodifysave&ID=<%=ID%>&Label=<%=Label%>&Ad_Class=<%=Rs("Ad_Class")%>&CurrUrl=<%=Server.URLEncode(CurrUrl)%>">
<%If Label="admodify" Then%>
<table class="tb_1" id="tbu">
<tr class="tr_1"> 
<td colspan="2">������Ϣ</td>
</tr>

<tr> 
<td class="td_r">������ƣ�</td>
<td><input name="AdName" type="text" value="<%=Rs("AdName")%>"></td>
</tr>

<tr> 
<td width="220" class="td_r">������ͣ�</td>
<td><%=GetAdClassName(Rs("Ad_Class"))%></td>
</tr>

<TR id="hangp">
<TD class="td_r">������ѭ��</TD>
<TD>
<%
If Rs("Ad_Class")=1 Or Rs("Ad_Class")=4 Or Rs("Ad_Class")=7 Then
 Response.write "<input name='cycstate' type='radio' value='1'"
 If Rs("cycstate")=1 Then Response.write " checked"
 Response.write ">��"
 
 Response.write "<input name='cycstate' type='radio' value='0'"
 If Rs("cycstate")=0 Then Response.write " checked"
 Response.write ">��"
 
ElseIf Rs("Ad_Class")=2 Or Rs("Ad_Class")=3 Or Rs("Ad_Class")=12 Then
 Response.write "<input name='cycstate' type='radio' value='0'"
 If Rs("cycstate")=0 Then Response.write " checked"
 Response.write ">��"
 
ElseIf Rs("Ad_Class")=5 Or Rs("Ad_Class")=6 Or Rs("Ad_Class")=8 Or Rs("Ad_Class")=9 Or Rs("Ad_Class")=10 Or Rs("Ad_Class")=11 Then
 Response.write "<input name='cycstate' type='radio' value='1'"
 If Rs("cycstate")=1 Then Response.write " checked"
 Response.write ">��"
End If
%>
</TD>
</TR>

<tr> 
<td class="td_r">���Ȩ�أ�</td>
<td><input name="Weight" type="text" value="<%=Rs("Weight")%>">(Ĭ��Ϊ1����Χ1-10����ֵԽ�����ڰ�Ȩ�صĹ���������ʾ����Խ��)</td>
</tr>

<TR> 
<TD class="td_r">������ʽ��</TD>
<TD>
<%
If Rs("ClickState")=1 Then
 Response.write "�������(CPC)"
ElseIf Rs("ClickState")=2 Then
 Response.write "��ʾ����(CPV)"
ElseIf Rs("ClickState")=3 Then
 Response.write "ע�����(CPA)"
ElseIf Rs("ClickState")=4 Then
 Response.write "��Ʒ����(CPS)"
End If

If Rs("ClickSeState")=0 Then
 Response.Write "<br>[��Ҫ�Ʒ�:��]"
 
ElseIf Rs("ClickSeState")=1 Then
 Response.Write "<br>[��Ҫ�Ʒ�:CPC]"
 
ElseIf Rs("ClickSeState")=2 Then
 Response.Write "<br>[��Ҫ�Ʒ�:CPV]"
 
End If

%></TD>
</TR>

	
<TR> 
<TD class="td_r">���״̬��</TD>
<TD>
<%
If Rs("AdState")=1 Then 
Response.Write "�����"
ElseIf Rs("AdState")=2 Then
Response.Write "��˳ɹ�"
ElseIf Rs("AdState")=3 Then
Response.Write "���ʧ��"
ElseIf Rs("AdState")=4 Then
Response.Write "��ɵ��"
ElseIf Rs("AdState")=5 Then
Response.Write "�Ѿ���ˣ�����ͣͶ��"
End If
%></TD>
</TR>

<TR> 
<TD class="td_r">����ʱ�䣺</TD>
<TD>
<%=Rs("AddTime")%></TD>
</TR>

<tr class="tr_1">
<td colspan="2">������ݺ�����</td>
</tr>
<%If Rs("ad_class")=1 Or Rs("ad_class")=3 Or Rs("ad_class")=7 Then%>
<tr> 
<td class="td_r">������ֻ�ͼƬ��</td>
<td><textarea name="Ad" cols="50" rows="5" style="width:400px"><%=Rs("Ad")%></textarea>
<br>
֧�ֵĲ�����{username},{userid},{ad_id},{clickurl},{clickurl_2}����֧�ֶ��ͼƬ��ѭ֮����,�ָ�</td>
</tr>

<%ElseIf Rs("ad_class")=2 Or Rs("ad_class")=4 Or Rs("ad_class")=6 Or Rs("ad_class")=11 Then%>
<tr> 
<td class="td_r">���ͼƬ��</td>
<td><input type="text" name="Ad" value="<%=Rs("Ad")%>" style="width:400px;">
<br>
(ע:��дhttp://��https://��ͷ��ͼƬ����������ͼƬ����uploadĿ¼��֮��)</td>
</tr>
<%End If%>
	
<%If Rs("ad_class")=5 Or Rs("ad_class")=6 Or Rs("ad_class")=10 Or Rs("ad_class")=11 Then%>
<tr> 
<td class="td_r">�����⣺</td>
<td><input name="AdTitle" type="text" value="<%=Rs("AdTitle")%>" style="width:400px;"></td>
</tr>
<%End If%>
    
<%If Rs("ad_class")=5 Or Rs("ad_class")=11 Then%>
<tr> 
<td class="td_r">��������֣�</td>
<td><input name="AdIntro" type="text" value="<%=Rs("AdIntro")%>" style="width:400px;"></td>
</tr>
<%End If%>

<TR> 
<TD class="td_r">PC������ӣ�</TD>
<TD><input name="Ad_Url" type="text" value="<%=Rs("Ad_Url")%>" style="width:400px;"> 
<br> <font color="#FF0000">*</font> ע����������http://��https://��ͷ��֧�ֱ�ǩ�����û�id:{userid}���û���:{username},���id:{ad_id},ֱ�����Զ���:{selfvar}����֧�ֶ��������ѭ֮����,�ָ�</TD>
</TR>

<script>
$(function(){

function ad_url_typeset_0(){
 $("#t_ad_url_android,#t_ad_url_iphone").hide();
}

function ad_url_typeset_1(){
 $("#t_ad_url_android,#t_ad_url_iphone").show();
}

ad_url_typeset_<%=Rs("Ad_Url_TypeSet")%>()

$("#ad_url_typeset_0").click(function(){
 ad_url_typeset_0();
});

$("#ad_url_typeset_1").click(function(){
 ad_url_typeset_1();
});

});

</script>
<TR> 
<TD class="td_r">�ƶ��豸������ӣ�</TD>
<TD>
<input type="radio" name="ad_url_typeset" id="ad_url_typeset_0" value="0"<%If Rs("Ad_Url_TypeSet")=0 Then Response.write " checked"%> />��PC���������ͬ
<input type="radio" name="ad_url_typeset" id="ad_url_typeset_1" value="1"<%If Rs("Ad_Url_TypeSet")=1 Then Response.write " checked"%> />��PC������Ӳ�ͬ,�ֱ�ָ��</TD>
</TR>


<TR id="t_ad_url_android"> 
<TD class="td_r">��׿�豸������ӣ�</TD>
<TD><input name="ad_url_android" type="text" id="ad_url_android"  value="<%=Rs("ad_url_android")%>" style="width:400px"></TD>
</TR>

<TR id="t_ad_url_iphone"> 
<TD class="td_r">ƻ���豸������ӣ�</TD>
<TD><input name="ad_url_iphone" type="text" id="ad_url_iphone"  value="<%=Rs("ad_url_iphone")%>" style="width:400px"></TD>
</TR>


<%If Rs("ad_class")=5 Then%>
<tr> 
<td class="td_r">���������</td>
<td><input name="AdSimpleUrl" type="text" value="<%=Rs("AdSimpleUrl")%>" style="width:400px"></td>
</tr>
<%End If%>


<%
'--Ϊ������ذ�װ���ʱ
If Rs("ad_class")=12 Then%>
<TR>
<TD class="td_r">�����װ�����������ƣ�</TD>
<TD><input name="softexename" type="text" id="softexename" value="<%=Rs("softexename")%>" style="width:400px">����д�����չ�������������ж��Ƿ��������Ƿ����</TD>
</TR>

<TR>
<TD class="td_r">�����װ��ʱ�żƷ�</TD>
<TD>
<input type="radio" name="softtctype" value="1"<%If Rs("softtctype")=1 Then Response.write " checked"%>>��װ�󼴼Ʒ�
<input type="radio" name="softtctype" value="2"<%If Rs("softtctype")=2 Then Response.write " checked"%>>��װ����ȴ�����һ������ȷ��
<input type="radio" name="softtctype" value="3"<%If Rs("softtctype")=3 Then Response.write " checked"%>>��װ����ٷ�����ж����Ч
</TD>
</TR>
<%end If%>
	
<%If Rs("ad_class")=3 Or Rs("ad_class")=4 Or Rs("ad_class")=6 Or Rs("ad_class")=7 Then%>
<%
AdSizeInlist=0
AdSize=Rs("AdWidth")&"x"&Rs("AdHeight")
%>

<TR> 
<TD class="td_r">�޸Ĺ��ߴ磺</TD>
<TD>

<li style="clear:both;">����</li>
<%
Sql="Select * From CFwztg_AdSize where Direction=1 Order By Direction,Width Desc,Height Desc"

Set Rs2 = Server.CreateObject("ADODB.Recordset")
Rs2.open Sql,Conn,1,1
While Not Rs2.Eof
 Response.write "<li style='width:100px;float:left;'><input type='radio' name='adsize' value='"&Rs2("Width")&"x"&Rs2("Height")&"' id='adsize' onclick=""document.getElementById('AdWidth').value="&Rs2("Width")&";document.getElementById('AdHeight').value="&Rs2("Height")&";"""
 If AdSize = Rs2("Width")&"x"&Rs2("Height") Then
  Response.write " checked"
 End If
 Response.write ">" & Rs2("Width")&"x"&Rs2("Height") & "</li>"
Rs2.MoveNext
Wend
Rs2.Close
%>
<li style="clear:both;">����</li>
<%
Sql="Select * From CFwztg_AdSize where Direction=2 Order By Direction,Width Desc,Height Desc"

Set Rs2 = Server.CreateObject("ADODB.Recordset")
Rs2.open Sql,Conn,1,1
While Not Rs2.Eof
 Response.write "<li style='width:100px;float:left;'><input type='radio' name='adsize' value='"&Rs2("Width")&"x"&Rs2("Height")&"' id='adsize' onclick=""document.getElementById('AdWidth').value="&Rs2("Width")&";document.getElementById('AdHeight').value="&Rs2("Height")&";"""
 If AdSize = Rs2("Width")&"x"&Rs2("Height") Then
  Response.write " checked"
 End If
 Response.write ">" & Rs2("Width")&"x"&Rs2("Height") & "</li>"
Rs2.MoveNext
Wend
Rs2.Close
%>
<li style="clear:both;">����</li>
<%
Sql="Select * From CFwztg_AdSize where Direction=3 Order By Direction,Width Desc,Height Desc"

Set Rs2 = Server.CreateObject("ADODB.Recordset")
Rs2.open Sql,Conn,1,1
While Not Rs2.Eof
 Response.write "<li style='width:100px;float:left;'><input type='radio' name='adsize' value='"&Rs2("Width")&"x"&Rs2("Height")&"' id='adsize' onclick=""document.getElementById('AdWidth').value="&Rs2("Width")&";document.getElementById('AdHeight').value="&Rs2("Height")&";"""
 If AdSize = Rs2("Width")&"x"&Rs2("Height") Then
  Response.write " checked"
 End If
 Response.write ">" & Rs2("Width")&"x"&Rs2("Height") & "</li>"
Rs2.MoveNext
Wend
Rs2.Close
%>

<br /><br />�����ϳߴ��б�û����Ҫʹ�ù��ߴ磬���Զ�������д�����ߴ�
<br />��ȣ�<input name="AdWidth" type="text" id="AdWidth" value="<%=Rs("AdWidth")%>">
<br />�߶ȣ�<input name="AdHeight" type="text" id="AdHeight" value="<%=Rs("AdHeight")%>">

</TD>
</TR>
    <%End If%>

<%If Rs("ad_class")=7 Or Rs("ad_class")=11 Then%>
<TR> 
<TD class="td_r">���Ч����</TD>
<TD>
<%If Rs("ad_class")=7 Then%>
<%
Sql="Select SetFlag From CFWztg_SetContent Where SetBClassFlag='AdminTemplet' And SetSClassFlag='AdminTemplet_AdCode' Order By SetTaxis"
Set Rs2=Conn.Execute(Sql)
%>
<select name="AdShowType" id="AdShowType">
<%
Sql="Select SetFlag,SetDesc From CFWztg_SetContent Where SetBClassFlag='AdminTemplet' And SetSClassFlag='AdminTemplet_AdCode' Order By SetTaxis"
Set Rs2=Conn.Execute(Sql)
While Not Rs2.Eof
%>
<option value="<%=Trim(Rs2("SetFlag"))%>"<%If Rs("AdShowType")=Rs2("SetFlag") Then Response.write " selected"%>><%=Trim(Rs2("SetDesc"))%></option>
<%
Rs2.MoveNext
Wend
%>
<%ElseIf Rs("ad_class")=11 Then%>
<%
Sql="Select SetFlag From CFWztg_SetContent Where SetBClassFlag='AdminTemplet' And SetSClassFlag='AdminTemplet_MixCode' Order By SetTaxis"
Set Rs2=Conn.Execute(Sql)
%>
<select name="AdShowType" id="AdShowType">
<%
Sql="Select SetFlag,SetDesc From CFWztg_SetContent Where SetBClassFlag='AdminTemplet' And SetSClassFlag='AdminTemplet_MixCode' Order By SetTaxis"
Set Rs2=Conn.Execute(Sql)
While Not Rs2.Eof
%>
<option value="<%=Trim(Rs2("SetFlag"))%>"<%If Rs("AdShowType")=Rs2("SetFlag") Then Response.write " selected"%>><%=Trim(Rs2("SetDesc"))%></option>
<%
Rs2.MoveNext
Wend
%>
<%End If%>
</select>
</TD>
</TR>
<%End If%>	



<tr class="tr_1">
<td colspan="2">��վ����ȡ����ʱ����ʾ</td>
</tr>

<TR> 
<TD class="td_r">����ͨ�û���ʾ�������룺</TD>
<td>
<input type="radio" name="AdListShowState" value="1"<%If Rs("AdListShowState")=1 Then Response.Write " checked"%>>��
<input type="radio" name="AdListShowState" value="0"<%If Rs("AdListShowState")=0 Then Response.Write " checked"%>>��
</TD>
</TR>
	


<TR> 
<TD class="td_r">��ͨ�û����������ʾ��</TD>
<td>
<input type="radio" name="AdSpareShowState" value="1"<%If Rs("AdSpareShowState")=1 Then Response.Write " checked"%>>
ʵ����Ŀ��ʾ 
<input type="radio" name="AdSpareShowState" value="0"<%If Rs("AdSpareShowState")=0 Then Response.Write " checked"%>>
���޶�<br>
(ע��������ָ��ͨ�û��ڻ�ù�����ҳ���ϣ������ʾ���������ʣ�����)</TD>
</TR>

<tr class="tr_1">
<td colspan="2">CPA���ʱ��֤����</td>
</tr>
<TR> 
<TD class="td_r">�����û�ע���ύ����MD5��֤��</TD>
<TD> 
<input type="radio" name="AdRegUserCheck" value="0"<%If Rs("AdRegUserCheck")=0 Then Response.write " checked"%>>
��
<input type="radio" name="AdRegUserCheck" value="1"<%If Rs("AdRegUserCheck")=1 Then Response.write " checked"%>>
ϵͳ�ⲿ�û�ע����֤
<input type="radio" name="AdRegUserCheck" value="2"<%If Rs("AdRegUserCheck")=2 Then Response.write " checked"%>>
ϵͳ�ڲ��û�ע����֤
<br />*Ĭ��Ϊ�� ��֤��ʽ:�Ƽ��û���|Md5(�Ƽ��û���&�������ȫ��)</TD>
</TR>
    
<%If Rs("ad_class")=1 or Rs("ad_class")=2 Then%>
<SCRIPT>
$(function(){
function selfvartype_1(){
$("#t_selfvardomain").hide();
}

function selfvartype_2(){
selfvartype_1();
}

function selfvartype_3(){
$("#t_selfvardomain").show();
}

function selfvartype_4(){
selfvartype_3();
}

selfvartype_<%=Rs("SelfVarType")%>();

$("#selfvartype_1,#selfvartype_2").click(function(){
selfvartype_1();
});

$("#selfvartype_3,#selfvartype_4").click(function(){
selfvartype_3();
});

});
</script>

<tr class="tr_1">
<td colspan="2">ֱ�����ֻ�ֱ��ͼƬ�����ĸ��Զ������������</td>
</tr>
<TR>
<TD class="td_r">���ĸ��������ͣ�</TD>
<TD>
<input type="radio" name="selfvartype" id="selfvartype_1" value="1"<%If Rs("SelfVarType")=1 Then Response.write " checked"%>>��ͨ�ַ�<br />
<input type="radio" name="selfvartype" id="selfvartype_2" value="2"<%If Rs("SelfVarType")=2 Then Response.write " checked"%>>��֤�ַ�����ʽ:����1970-1-1����|Md5(���ڱ���ʱ���UTCʱ���������1970-1-1����&�������ȫ��)<br />
<input type="radio" name="selfvartype" id="selfvartype_3" value="3"<%If Rs("SelfVarType")=3 Then Response.write " checked"%>>ת����ַ<br />
<input type="radio" name="selfvartype" id="selfvartype_4" value="4"<%If Rs("SelfVarType")=4 Then Response.write " checked"%>>ת����ַ(ϵͳ������ַ���Զ�����userid=�û�id��username=�û�������)
<br />*Ĭ��Ϊ��ͨ�ַ�,ת����ַʱΪ�򻯿��Բ���http://��ͷ,cf.aspx?�������ַ�֧��base64����</TD>
</TR>

<TR id="t_selfvardomain">
<TD class="td_r">ת����ַʱ������ַ��д����������</TD>
<TD> 
<input name="selfvardomain" type="text" value="<%=Rs("SelfVarDomain")%>">
<br />����ת����ַʱ������Ч�����������գ��޶���д�����Ϳ��ԣ����������Ӣ��״̬�Ķ��ŷָ��磺a.com,b.com�����Ϲ淶��ת��Ĭ�Ϲ������</TD>
</TR>
<%End If%>

<tr class="tr_1">
<td colspan="2">��վ����ȡ����ʱ��Ĺ��˵������</td>
</tr>
<TR> 
<TD class="td_r">���˵����</TD>
<td><input name="AdDesc" type="text" value="<%=Server.HTMLEncode(Rs("AdDesc"))%>"> 
<br>(����˵�����ĳ��Ⱥ͸߶ȣ�Ͷ�ŵ�����)</TD>
</TR>


	
<tr class="tr_1">
<td colspan="2">������</td>
</tr>
<tr> 
<td class="td_r">�����ࣺ</td>
<td>
<select name="SiteClassID" id="SiteClassID">
<option selected value="">��ѡ�����</option>
<%

Sql="Select * From CFWztg_SiteClass Order By SiteClassName"
Set Rs2= Server.CreateObject("ADODB.Recordset")
Rs2.open Sql,Conn,1,1
While Not Rs2.Eof
%>
<option value="<%=Rs2("ID")%>"<%If Rs("SiteClassID")=Rs2("ID") Then Response.write " selected"%>><%=Rs2("SiteClassName")%></option>
<%
Rs2.MoveNext
Wend
%>
</select></td>
</tr>


<tr class="tr_1">
<td colspan="2">���״̬</td>
</tr>
<tr> 
<td class="td_r">���״̬��</td>
<td>
<%
If Rs("AdState")=2 Or Rs("AdState")=5 Or Rs("AdState")=6 Then'ֻ���Ѿ���˻���ͣ�еĹ������޸�

Response.write "<input type='radio' name='AdState' value='2'"
If Rs("AdState")=2 Then Response.write " checked"
Response.write ">�Ѿ���ˣ�Ͷ����"

Response.write "<input type='radio' name='AdState' value='5'"
If Rs("AdState")=5 Then Response.write " checked"
Response.write ">�Ѿ���ˣ�����ͣͶ��(����Ա����)"

Response.write "<input type='radio' name='AdState' value='6'"
If Rs("AdState")=6 Then Response.write " checked"
Response.write ">�Ѿ���ˣ�����ͣͶ��(���������)"

Else

if Rs("AdState")=1 Then
Response.write "<input type='radio' name='AdState' value='1'"
If Rs("AdState")=1 Then Response.write " checked"
Response.write ">�ȴ���˵Ĺ��"
  
elseif Rs("AdState")=3 Then
Response.write "<input type='radio' name='AdState' value='3'"
If Rs("AdState")=3 Then Response.write " checked"
Response.write ">�ܾ�ͨ����˵Ĺ��"

elseif Rs("AdState")=4 Then
Response.write "<input type='radio' name='AdState' value='4'"
If Rs("AdState")=4 Then Response.write " checked"
Response.write ">�Ѿ���ɵĹ��"
End If

End If
%>
</td>
</tr>


<tr> 
<td>&nbsp;</td>
<td>
<input type="submit" name="admodifybtn" id="admodifybtn" value="�޸�" class="btn btn-primary">
 </td>
</tr>

</table>

<%End If%>

<%If Label="adprice" Then%>
<!--#Include File="admodify_adprice.asp"-->
<%End If%>

<%If Label="adguardcheat" Then%>
<!--#Include File="admodify_adguardcheat.asp"-->
<%End If%>

<%If Label="adrunsite" Then%>
<!--#Include File="admodify_adrunsite.asp"-->
<%End If%>

<%If Label="adsitetype" Then%>
<!--#Include File="admodify_adsitetype.asp"-->
<%End If%>

<%If Label="adlevel" Then%>
<!--#Include File="admodify_adlevel.asp"-->
<%End If%>

<%If Label="adother" Then%>
<!--#Include File="admodify_adother.asp"-->
<%End If%>
</form>
  
<%Rs.Close%>

