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
SetFlag=ChkStr(Trim(Request("SetFlag")),1)

Sql="Select * From CFWztg_SetContent Where SetFlag='"&SetFlag&"'"
Set Rs=Conn.Execute(Sql)

If Rs.Eof Then Call AlertUrl("û���ҵ���Ӧ������",Request.ServerVariables("Http_Referer"))
%>

<script>
$(function(){

function SetSiteTypeSet_0(){
$("#t_SetSiteType").hide();
}

function SetSiteTypeSet_1(){
$("#t_SetSiteType").show();
}

SetSiteTypeSet_<%=Rs("SetSiteTypeSet")%>();

$("#SetSiteTypeSet_0").click(function(){
SetSiteTypeSet_0();
});

$("#SetSiteTypeSet_1").click(function(){
SetSiteTypeSet_1();
});

});
</script>



<table class="tb_1">

<tr>
<td class="td_1">


<%
Response.write "<select name='setsite' id='setsite' onChange=""window.location=document.getElementById('setsite').options[document.getElementById('setsite').selectedIndex].value"">"

Response.write "<option value='?Action=setbclasslist'>����ѡ����Ҫ���õ�ѡ��</option>"


Sql="Select * From CFWztg_SetBClass where SetBClassFlag<>'AdminPower' Order By SetTaxis"
Set Rs1=Conn.Execute(Sql)
While Not Rs1.Eof

Response.write "<option value='?Action=setsclasslist&SetBclassFlag="&Rs1("SetBClassFlag")&"'"
If Action="setsclasslist" And Chkstr(Request("SetBclassFlag"),1)=Rs1("SetBClassFlag") Then Response.write " selected"
Response.write ">"&Rs1("SetBClassDesc")&"["&Rs1("SetBClassFlag")&"]</option>"

Sql="Select * From CFWztg_SetSClass Where SetBClassFlag='"&Rs1("SetBClassFlag")&"' Order By SetTaxis"
Set Rs2=Conn.Execute(Sql)
While Not Rs2.Eof
 Response.write "<option value='?Action=setcontentlist&SetBClassFlag="&Rs1("SetBClassFlag")&"&SetSClassFlag="&Rs2("SetSClassFlag")&"'"
 If Action="setcontentlist" And Chkstr(Request("SetBclassFlag"),1)=Rs1("SetBClassFlag") And Chkstr(Request("SetSClassFlag"),1)=Rs2("SetSClassFlag") Then Response.write " selected"
 Response.write ">----"&Rs2("SetSClassDesc")&"["&Rs2("SetSClassFlag")&"]</option>"
 
Sql="Select * From CFWztg_SetContent Where SetBClassFlag='"&Rs1("SetBClassFlag")&"' and SetSClassFlag='"&Rs2("SetSClassFlag")&"' Order By SetTaxis"
Set Rs3=Conn.Execute(Sql)
While Not Rs3.Eof
 Response.write "<option value='?Action=setcontentmodify&SetFlag="&Rs3("SetFlag")&"'"
  If Action="setcontentmodify" And Chkstr(Request("SetFlag"),1)=Rs3("SetFlag") Then Response.write " selected"
 Response.write ">--------"&Rs3("SetDesc")&"["&Rs3("SetFlag")&"]</option>"
Rs3.movenext
Wend
Rs3.Close

Rs2.movenext
Wend
Rs2.Close


Rs1.movenext
Wend
Rs1.Close
Response.write "</select>"
%>

<a href="?Action=setbclasslist" class="actionBtn"><i class="mdi mdi-keyboard-return"></i><span>����һ�����������б�</span></a>
<a href="?Action=setsclasslist&SetBClassFlag=<%=Rs("SetBClassFlag")%>" class="actionBtn" style="margin-right:10px;"><i class="mdi mdi-keyboard-return"></i><span>���ض������������б�</span></a>
<a href="?Action=setcontentlist&SetBClassFlag=<%=Rs("SetBClassFlag")%>&SetSClassFlag=<%=Rs("SetSClassFlag")%>" class="actionBtn" style="margin-right:10px;"><span>�������������б�</span></a>


</td>

</tr>
</table>


    <form name="form1" method="post" action="../../AdminUser.aspx?Action=setcontentmodifysave&SetFlag=<%=SetFlag%>&SetBClassFlag=<%=Rs("SetBClassFlag")%>&SetSClassFlag=<%=Rs("SetSClassFlag")%>&CurrUrl=<%=Server.URLEncode(HttpPath(7))%>">
  <table class="tb_1">



    <tr class="tr_1">
      <td colspan="2">�����޸�</td>
    </tr>
      <tr>
        <td width="160" class="td_r">λ�ã�</td>
        <td>����Ա-��������-<%=Rs("SetBClassFlag")%>����-<%=Rs("SetSClassFlag")%>����-<%=SetFlag%>�޸�</td>
      </tr>
      <tr>
        <td class="td_r">���ñ�ʶ��</td>
        <td><%=Rs("SetFlag")%></td>
      </tr>
      <tr>
        <td class="td_r">���ø���ʶ��</td>
        <td><%=Rs("SetFlag_2")%></td>
      </tr>
	  <tr>
        <td class="td_r">����������</td>
        <td><input name="SetDesc" type="text" id="SetDesc" value="<%=Rs("SetDesc")%>" size="80"<%If Rs("SetType")=1 Then Response.write " readonly style='background-color:#eeeeee'"%>>*</td>
      </tr>
	  <tr>
        <td class="td_r">��������2��</td>
        <td><input name="SetDesc_2" type="text" id="SetDesc_2" value="<%=Rs("SetDesc_2")%>" size="80"<%If Rs("SetType")=1 Then Response.write " readonly style='background-color:#eeeeee'"%>>*</td>
      </tr>
      
      <tr>
        <td class="td_r">����ֵ��</td>
        <td>
<%
If Rs("SetContentType")=1 Then
 Response.write "<textarea name='SetValue' cols='78' rows='12'>"&Rs("SetValue")&"</textarea>"
ElseIf Rs("SetContentType")=3 Then
 Response.write "<input name='SetValue' type='text' id='SetValue'value='"&Rs("SetValue")&"' size='80'>"
Else
 Response.write "<input type='hidden' id='SetValue' name='SetValue' value='"&server.HTMLEncode(Rs("SetValue"))&"' style='display:none' /><input type='hidden' id='FCKeditor1___Config' value='' style='display:none' /><iframe id='FCKeditor1___Frame' src='../../js/FckEditor/editor/fckeditor.html?InstanceName=SetValue&amp;Toolbar=Default' width='580' height='350' frameborder='0' scrolling='no'></iframe>"
End If
%>
</td>
      </tr>
      
      <tr>
        <td class="td_r">������ֵ�ı��ݣ�</td>
        <td><textarea name="SetRemark" cols="78" rows="12"<%If Rs("SetType")=1 Then Response.write " readonly style='background-color:#eeeeee'"%>><%=Rs("SetRemark")%></textarea>		</td>
      </tr>
      
 
<%If Rs("SetIsIframe")=2 Then'--��������js��ifrmae����ʱ����ֵ��дjs���룬����ֵ2��дiframe��html����%>    
      <tr>
        <td class="td_r">����ֵ2��</td>
        <td>
<%
If Rs("SetContentType")=1 Then
 Response.write "<textarea name='SetValue_2' cols='78' rows='12'>"&Rs("SetValue_2")&"</textarea>"
ElseIf Rs("SetContentType")=3 Then
 Response.write "<input name='SetValue_2' type='text' id='SetValue_2' value='"&Rs("SetValue_2")&"' size='80'>"
End If
%>
</td>
      </tr>

      <tr>
        <td class="td_r">������ֵ2�ı��ݣ�</td>
        <td><textarea name="SetRemark_2" cols="78" rows="12"<%If Rs("SetType")=1 Then Response.write " readonly style='background-color:#eeeeee'"%>><%=Rs("SetRemark_2")%></textarea>		</td>
      </tr>
<%End If%>
      
	  <tr>
	    <td class="td_r">���õ����ͣ�</td>
	    <td><input type="radio" name="SetType" value="1"<%If Rs("SetType")=1 Then Response.write " checked"%>>�ڲ�
        <input type="radio" name="SetType" value="2"<%If Rs("SetType")=2 Then Response.write " checked"%>>�ⲿ
(ע������Ϊ�ڲ�ʱ���ò���ɾ������ɫ����޸�)
</td>
      </tr>
	  <tr>
	    <td class="td_r">���õ����ݱ༭��ʽ��</td>
	    <td>
<input type="radio" name="SetContentType" value="1"<%If Rs("SetContentType")=1 Then Response.write " checked"%>>���д��뷽ʽ
<input type="radio" name="SetContentType" value="2"<%If Rs("SetContentType")=2 Then Response.write " checked"%>>���ݷ�ʽ
<input type="radio" name="SetContentType" value="3"<%If Rs("SetContentType")=3 Then Response.write " checked"%>>���д��뷽ʽ
        </td>
      </tr>
	  <tr>
	    <td class="td_r">�������֣�</td>
	    <td><input name="SetTaxis" type="text" id="SetTaxis" value="<%=Rs("SetTaxis")%>" size="20">*</td>
      </tr>

<%If Rs("SetBClassFlag")="AdminTemplet" And (Rs("SetSClassFlag")="AdminTemplet_AdCode" Or Rs("SetSClassFlag")="AdminTemplet_MixCode") Then%>
<tr class="tr_1">
<td colspan="2">������������״̬</td>
</tr>
    
<tr>
<td class="td_r">����״̬:</td>
<td><input type="radio" name="SetState" value="1"<%If Rs("SetState")=1 Then Response.write " checked"%>>��Ч
<input type="radio" name="SetState" value="0"<%If Rs("SetState")=0 Then Response.write " checked"%>>��Ч</td>
</tr>


<%If Rs("SetSClassFlag")="AdminTemplet_AdCode" Then%>
<script>
$(function(){
	
$("#puttimeallopen1").click(function () {
 $("[name='PutTime1']").prop("checked", true);
});
	
$("#puttimeallclose1").click(function () {
 $("[name='PutTime1']").prop("checked", false);
});


function ExtraAdState1_0(){$("#t_LimitList1,#t_PutTime1,#t_ExtraAdCode1").hide();}
function ExtraAdState1_1(){$("#t_LimitList1").hide();$("#t_PutTime1,#t_ExtraAdCode1").show();}
function ExtraAdState1_2(){$("#t_LimitList1,#t_PutTime1,#t_ExtraAdCode1").show();}
function ExtraAdState1_3(){ExtraAdState1_2();}
function ExtraAdState1_4(){ExtraAdState1_2();}

ExtraAdState1_<%=Rs("ExtraAdState1")%>();

$("#ExtraAdState1_0").click(function(){ExtraAdState1_0();});
$("#ExtraAdState1_1").click(function(){ExtraAdState1_1();});
$("#ExtraAdState1_2").click(function(){ExtraAdState1_2();});
$("#ExtraAdState1_3").click(function(){ExtraAdState1_3();});
$("#ExtraAdState1_4").click(function(){ExtraAdState1_4();});

});
</script>
<tr class="tr_1">
<td colspan="2">��һ���ع�����</td>
</tr>
    
<tr>
<td class="td_r">����״̬:</td>
<td>
<input type="radio" name="ExtraAdState1" id="ExtraAdState1_0" value="0"<%If Rs("ExtraAdState1")=0 Then Response.write " checked"%>>�ر�
<input type="radio" name="ExtraAdState1" id="ExtraAdState1_1"value="1"<%If Rs("ExtraAdState1")=1 Then Response.write " checked"%>>ȫ���û���Ч
<input type="radio" name="ExtraAdState1" id="ExtraAdState1_2"value="2"<%If Rs("ExtraAdState1")=2 Then Response.write " checked"%>>��д���û���������Ч
<input type="radio" name="ExtraAdState1" id="ExtraAdState1_3"value="3"<%If Rs("ExtraAdState1")=3 Then Response.write " checked"%>>��д���û���������Ч
<input type="radio" name="ExtraAdState1" id="ExtraAdState1_4"value="4"<%If Rs("ExtraAdState1")=4 Then Response.write " checked"%>>��д���û���������Ч
</td>
</tr>

<tr id="t_LimitList1">
<td class="td_r">��д�û�������飺</td>
<td>
<input name="LimitList1" type="text" id="LimitList1" value="<%=Rs("LimitList1")%>" size="80">����û����������������á�,�����Ÿ���
</td>
</tr>

<tr id="t_PutTime1">
<td class="td_r">��ʱ��Σ�</td>
<td>


<a href="javascript:" id="puttimeallopen1">ȫ��ѡ��</a>&nbsp;&nbsp;<a href="javascript:" id="puttimeallclose1">ȫ��ȡ��</a><br />
<%For I=0 To 23%>
<li style="width:60px;float:left;">
<input type="checkbox" name="PutTime1" id="PutTime1" value="<%=I%>"<%If Instr(","&Rs("PutTime1")&",",","&I&",")>0 Then Response.write " checked"%>><%=I&"-"&I+1%>
</li>
<%If I=7 Or I=15 Then Response.write "<li style='clear:both;'></li>"%>
<%Next%>
</td>
</tr>

<tr id="t_ExtraAdCode1">
<td class="td_r">���ӹ�����1��</td>
<td><textarea name="ExtraAdCode1" cols="78" rows="10"><%=Rs("ExtraAdCode1")%></textarea></td>
</tr>


<script>
$(function(){
	
$("#puttimeallopen2").click(function () {
 $("[name='PutTime2']").prop("checked", true);
});
	
$("#puttimeallclose2").click(function () {
 $("[name='PutTime2']").prop("checked", false);
});


function ExtraAdState2_0(){$("#t_LimitList2,#t_PutTime2,#t_ExtraAdCode2").hide();}
function ExtraAdState2_1(){$("#t_LimitList2").hide();$("#t_PutTime2,#t_ExtraAdCode2").show();}
function ExtraAdState2_2(){$("#t_LimitList2,#t_PutTime2,#t_ExtraAdCode2").show();}
function ExtraAdState2_3(){ExtraAdState2_2();}
function ExtraAdState2_4(){ExtraAdState2_2();}

ExtraAdState2_<%=Rs("ExtraAdState2")%>();

$("#ExtraAdState2_0").click(function(){ExtraAdState2_0();});
$("#ExtraAdState2_1").click(function(){ExtraAdState2_1();});
$("#ExtraAdState2_2").click(function(){ExtraAdState2_2();});
$("#ExtraAdState2_3").click(function(){ExtraAdState2_3();});
$("#ExtraAdState2_4").click(function(){ExtraAdState2_4();});

});
</script>
<tr class="tr_1">
<td colspan="2">�ڶ����ع�����</td>
</tr>
    
<tr>
<td class="td_r">����״̬:</td>
<td>
<input type="radio" name="ExtraAdState2" id="ExtraAdState2_0" value="0"<%If Rs("ExtraAdState2")=0 Then Response.write " checked"%>>�ر�
<input type="radio" name="ExtraAdState2" id="ExtraAdState2_1"value="1"<%If Rs("ExtraAdState2")=1 Then Response.write " checked"%>>ȫ���û���Ч
<input type="radio" name="ExtraAdState2" id="ExtraAdState2_2"value="2"<%If Rs("ExtraAdState2")=2 Then Response.write " checked"%>>��д���û���������Ч
<input type="radio" name="ExtraAdState2" id="ExtraAdState2_3"value="3"<%If Rs("ExtraAdState2")=3 Then Response.write " checked"%>>��д���û���������Ч
<input type="radio" name="ExtraAdState2" id="ExtraAdState2_4"value="4"<%If Rs("ExtraAdState2")=4 Then Response.write " checked"%>>��д���û���������Ч
</td>
</tr>

<tr id="t_LimitList2">
<td class="td_r">��д�û�������飺</td>
<td>
<input name="LimitList2" type="text" id="LimitList2" value="<%=Rs("LimitList2")%>" size="80">����û����������������á�,�����Ÿ���
</td>
</tr>

<tr id="t_PutTime2">
<td class="td_r">��ʱ��Σ�</td>
<td>


<a href="javascript:" id="puttimeallopen2">ȫ��ѡ��</a>&nbsp;&nbsp;<a href="javascript:" id="puttimeallclose2">ȫ��ȡ��</a><br />
<%For I=0 To 23%>
<li style="width:60px;float:left;">
<input type="checkbox" name="PutTime2" id="PutTime2" value="<%=I%>"<%If Instr(","&Rs("PutTime2")&",",","&I&",")>0 Then Response.write " checked"%>><%=I&"-"&I+1%>
</li>
<%If I=7 Or I=15 Then Response.write "<li style='clear:both;'></li>"%>
<%Next%>
</td>
</tr>

<tr id="t_ExtraAdCode2">
<td class="td_r">���ӹ�����2��</td>
<td><textarea name="ExtraAdCode2" cols="78" rows="10"><%=Rs("ExtraAdCode2")%></textarea></td>
</tr>


<script>
$(function(){
	
$("#puttimeallopen3").click(function () {
 $("[name='PutTime3']").prop("checked", true);
});
	
$("#puttimeallclose3").click(function () {
 $("[name='PutTime3']").prop("checked", false);
});


function ExtraAdState3_0(){$("#t_LimitList3,#t_PutTime3,#t_ExtraAdCode3").hide();}
function ExtraAdState3_1(){$("#t_LimitList3").hide();$("#t_PutTime3,#t_ExtraAdCode3").show();}
function ExtraAdState3_2(){$("#t_LimitList3,#t_PutTime3,#t_ExtraAdCode3").show();}
function ExtraAdState3_3(){ExtraAdState3_2();}
function ExtraAdState3_4(){ExtraAdState3_2();}

ExtraAdState3_<%=Rs("ExtraAdState3")%>();

$("#ExtraAdState3_0").click(function(){ExtraAdState3_0();});
$("#ExtraAdState3_1").click(function(){ExtraAdState3_1();});
$("#ExtraAdState3_2").click(function(){ExtraAdState3_2();});
$("#ExtraAdState3_3").click(function(){ExtraAdState3_3();});
$("#ExtraAdState3_4").click(function(){ExtraAdState3_4();});

});
</script>
<tr class="tr_1">
<td colspan="2">�������ع�����</td>
</tr>
    
<tr>
<td class="td_r">����״̬:</td>
<td>
<input type="radio" name="ExtraAdState3" id="ExtraAdState3_0" value="0"<%If Rs("ExtraAdState3")=0 Then Response.write " checked"%>>�ر�
<input type="radio" name="ExtraAdState3" id="ExtraAdState3_1"value="1"<%If Rs("ExtraAdState3")=1 Then Response.write " checked"%>>ȫ���û���Ч
<input type="radio" name="ExtraAdState3" id="ExtraAdState3_2"value="2"<%If Rs("ExtraAdState3")=2 Then Response.write " checked"%>>��д���û���������Ч
<input type="radio" name="ExtraAdState3" id="ExtraAdState3_3"value="3"<%If Rs("ExtraAdState3")=3 Then Response.write " checked"%>>��д���û���������Ч
<input type="radio" name="ExtraAdState3" id="ExtraAdState3_4"value="4"<%If Rs("ExtraAdState3")=4 Then Response.write " checked"%>>��д���û���������Ч
</td>
</tr>

<tr id="t_LimitList3">
<td class="td_r">��д�û�������飺</td>
<td>
<input name="LimitList3" type="text" id="LimitList3" value="<%=Rs("LimitList3")%>" size="80">����û����������������á�,�����Ÿ���
</td>
</tr>

<tr id="t_PutTime3">
<td class="td_r">��ʱ��Σ�</td>
<td>


<a href="javascript:" id="puttimeallopen3">ȫ��ѡ��</a>&nbsp;&nbsp;<a href="javascript:" id="puttimeallclose3">ȫ��ȡ��</a><br />
<%For I=0 To 23%>
<li style="width:60px;float:left;">
<input type="checkbox" name="PutTime3" id="PutTime3" value="<%=I%>"<%If Instr(","&Rs("PutTime3")&",",","&I&",")>0 Then Response.write " checked"%>><%=I&"-"&I+1%>
</li>
<%If I=7 Or I=15 Then Response.write "<li style='clear:both;'></li>"%>
<%Next%>
</td>
</tr>

<tr id="t_ExtraAdCode3">
<td class="td_r">���ӹ�����3��</td>
<td><textarea name="ExtraAdCode3" cols="78" rows="10"><%=Rs("ExtraAdCode3")%></textarea></td>
</tr>




<script>
$(function(){
	
$("#puttimeallopen4").click(function () {
 $("[name='PutTime4']").prop("checked", true);
});
	
$("#puttimeallclose4").click(function () {
 $("[name='PutTime4']").prop("checked", false);
});


function ExtraAdState4_0(){$("#t_LimitList4,#t_PutTime4,#t_ExtraAdCode4").hide();}
function ExtraAdState4_1(){$("#t_LimitList4").hide();$("#t_PutTime4,#t_ExtraAdCode4").show();}
function ExtraAdState4_2(){$("#t_LimitList4,#t_PutTime4,#t_ExtraAdCode4").show();}
function ExtraAdState4_3(){ExtraAdState4_2();}
function ExtraAdState4_4(){ExtraAdState4_2();}

ExtraAdState4_<%=Rs("ExtraAdState4")%>();

$("#ExtraAdState4_0").click(function(){ExtraAdState4_0();});
$("#ExtraAdState4_1").click(function(){ExtraAdState4_1();});
$("#ExtraAdState4_2").click(function(){ExtraAdState4_2();});
$("#ExtraAdState4_3").click(function(){ExtraAdState4_3();});
$("#ExtraAdState4_4").click(function(){ExtraAdState4_4();});

});
</script>
<tr class="tr_1">
<td colspan="2">���İ��ع�����</td>
</tr>
    
<tr>
<td class="td_r">����״̬:</td>
<td>
<input type="radio" name="ExtraAdState4" id="ExtraAdState4_0" value="0"<%If Rs("ExtraAdState4")=0 Then Response.write " checked"%>>�ر�
<input type="radio" name="ExtraAdState4" id="ExtraAdState4_1"value="1"<%If Rs("ExtraAdState4")=1 Then Response.write " checked"%>>ȫ���û���Ч
<input type="radio" name="ExtraAdState4" id="ExtraAdState4_2"value="2"<%If Rs("ExtraAdState4")=2 Then Response.write " checked"%>>��д���û���������Ч
<input type="radio" name="ExtraAdState4" id="ExtraAdState4_3"value="3"<%If Rs("ExtraAdState4")=3 Then Response.write " checked"%>>��д���û���������Ч
<input type="radio" name="ExtraAdState4" id="ExtraAdState4_4"value="4"<%If Rs("ExtraAdState4")=4 Then Response.write " checked"%>>��д���û���������Ч
</td>
</tr>

<tr id="t_LimitList4">
<td class="td_r">��д�û�������飺</td>
<td>
<input name="LimitList4" type="text" id="LimitList4" value="<%=Rs("LimitList4")%>" size="80">����û����������������á�,�����Ÿ���
</td>
</tr>

<tr id="t_PutTime4">
<td class="td_r">��ʱ��Σ�</td>
<td>


<a href="javascript:" id="puttimeallopen4">ȫ��ѡ��</a>&nbsp;&nbsp;<a href="javascript:" id="puttimeallclose4">ȫ��ȡ��</a><br />
<%For I=0 To 23%>
<li style="width:60px;float:left;">
<input type="checkbox" name="PutTime4" id="PutTime4" value="<%=I%>"<%If Instr(","&Rs("PutTime4")&",",","&I&",")>0 Then Response.write " checked"%>><%=I&"-"&I+1%>
</li>
<%If I=7 Or I=15 Then Response.write "<li style='clear:both;'></li>"%>
<%Next%>
</td>
</tr>

<tr id="t_ExtraAdCode4">
<td class="td_r">���ӹ�����4��</td>
<td><textarea name="ExtraAdCode4" cols="78" rows="10"><%=Rs("ExtraAdCode4")%></textarea></td>
</tr>
<%End If%>


<%If Rs("SetSClassFlag")="AdminTemplet_MixCode" Then%>
<tr class="tr_1">
<td colspan="2">��Ϲ����������</td>
</tr>
    
<tr>
<td class="td_r">���ɹ������:</td>
<td><input name="SetAdTotal" type="text" id="SetAdTotal" value="<%=Rs("SetAdTotal")%>" size="20">��</td>
</tr>
<tr>
<td class="td_r">�Ƿ�֧��iframe��ʽ:</td>
<td>
<input type="radio" name="SetIsIframe" value="0"<%If Rs("SetIsIframe")=0 Then Response.write " checked"%>>��֧��Iframe (���ݴ���ʵ����дJs����)
<br />
<input type="radio" name="SetIsIframe" value="1"<%If Rs("SetIsIframe")=1 Then Response.write " checked"%>>֧��Iframe (���ݴ���ʵ����дHtml����)
<br />
<input type="radio" name="SetIsIframe" value="2"<%If Rs("SetIsIframe")=2 Then Response.write " checked"%>>��֧��Js�ٵ���Iframe (�����޸ĺ�������ֵ����дJs���룬����ֵ2����дHtml����)
</td>
</tr>
<tr>
<td class="td_r">�����:</td>
<td><input name="SetWidth" type="text" id="SetWidth" value="<%=Rs("SetWidth")%>" size="20">(��Ϊ�������ֻ��������Զ���ȣ�������Ϊ�����ľ���ֵʵ�ʿ��)</td>
</tr>

<tr>
<td class="td_r">���߶�:</td>
<td><input name="SetHeight" type="text" id="SetHeight" value="<%=Rs("SetHeight")%>" size="20">(��Ϊ�������ֻ��������Զ��߶ȣ�������Ϊ�����ľ���ֵʵ�ʸ߶�)</td>
</tr>


	  <tr>
	    <td class="td_r">Ͷ���豸��</td>
	    <td><input type="radio" name="SetSiteTypeSet" id="SetSiteTypeSet_0" value="0"<%If Rs("SetSiteTypeSet")=0 Then Response.Write " Checked"%>/>����
  <input type="radio" name="SetSiteTypeSet" id="SetSiteTypeSet_1" value="1"<%If Rs("SetSiteTypeSet")=1 Then Response.Write " Checked"%>/>ָ���ն�</td>
    </tr>
	  <tr id="t_SetSiteType">
	    <td>&nbsp;</td>
	    <td><input type="checkbox" name="SetSiteType" id="SetSiteType" value="pc"<%If Instr(Rs("SetSiteType"),"pc")>0 Then Response.Write " Checked"%>>�������&nbsp;&nbsp;&nbsp;&nbsp;

<input type="checkbox" name="SetSiteType" id="SetSiteType" value="android"<%If Instr(Rs("SetSiteType"),"android")>0 Then Response.Write " Checked"%>>��׿�ֻ�&nbsp;&nbsp;&nbsp;&nbsp;
<input type="checkbox" name="SetSiteType" id="SetSiteType" value="apad"<%If Instr(Rs("SetSiteType"),"apad")>0 Then Response.Write " Checked"%>>��׿ƽ��&nbsp;&nbsp;&nbsp;&nbsp;

<input type="checkbox" name="SetSiteType" id="SetSiteType" value="ios"<%If Instr(Rs("SetSiteType"),"ios")>0 Then Response.Write " Checked"%>>ƻ���ֻ�&nbsp;&nbsp;&nbsp;&nbsp;
<input type="checkbox" name="SetSiteType" id="SetSiteType" value="ipad"<%If Instr(Rs("SetSiteType"),"ipad")>0 Then Response.Write " Checked"%>>ƻ��ƽ��&nbsp;&nbsp;&nbsp;&nbsp;

<input type="checkbox" name="SetSiteType" id="SetSiteType" value="windows phone"<%If Instr(Rs("SetSiteType"),"windows phone")>0 Then Response.Write " Checked"%>>΢��WP</td>
    </tr>
    
<%End If%>

<%End If%>
  
	  <tr>
        <td>&nbsp;</td>
        <td><input type="submit" name="submit" value="�޸�" class="btn btn-primary"></td>
      </tr>
</table>
</form>


<br /><br />

<script src="../../js/clipboard.min.js"></script>

<table class="tb_1">
<tr class="tr_1">
  <td>���´������õ�Sql���</td>
</tr>
<tr>
<td class="td_1">
<textarea id="SetOutSqla" cols="100" rows="5">
update cfwztg_setcontent set 
setbclassflag='<%=Rs("setbclassflag")%>',
setsclassflag='<%=Rs("setsclassflag")%>',
setflag_2='<%=Rs("setflag_2")%>',
setdesc='<%=ChkStr(Rs("setdesc"),1)%>',
setdesc_2='<%=ChkStr(Rs("setdesc_2"),1)%>',
setvalue='<%=ChkStr(Rs("setvalue"),0)%>',
setremark='<%=ChkStr(Rs("setremark"),0)%>',
settype=<%=Rs("settype")%>,
setcontenttype=<%=Rs("setcontenttype")%>,
settaxis=<%=Rs("settaxis")%>,
setstate=<%=Rs("setstate")%>,
extraadstate1=<%=Rs("extraadstate1")%>,
limitlist1='<%=ChkStr(Rs("limitlist1"),1)%>',
puttime1='<%=ChkStr(Rs("puttime1"),1)%>',
extraadcode1='<%=ChkStr(Rs("extraadcode1"),0)%>',
extraadstate2=<%=Rs("extraadstate2")%>,
limitlist2='<%=ChkStr(Rs("limitlist2"),1)%>',
puttime2='<%=ChkStr(Rs("puttime2"),1)%>',
extraadcode2='<%=ChkStr(Rs("extraadcode2"),0)%>',
extraadstate3=<%=Rs("extraadstate3")%>,
limitlist3='<%=ChkStr(Rs("limitlist3"),1)%>',
puttime3='<%=ChkStr(Rs("puttime3"),1)%>',
extraadcode3='<%=ChkStr(Rs("extraadcode3"),0)%>',
extraadstate4=<%=Rs("extraadstate4")%>,
limitlist4='<%=ChkStr(Rs("limitlist4"),1)%>',
puttime4='<%=ChkStr(Rs("puttime4"),1)%>',
extraadcode4='<%=ChkStr(Rs("extraadcode4"),0)%>',
setadtotal=<%=Rs("setadtotal")%>,
setisiframe=<%=Rs("setisiframe")%>,
setwidth=<%=Rs("setwidth")%>,
setheight=<%=Rs("setheight")%>,
setsitetypeset=<%=rs("setsitetypeset")%>,
setsitetype='<%=ChkStr(rs("setsitetype"),1)%>'
where setflag='<%=Rs("setflag")%>'
</textarea>

<input type="button" value="����" data-clipboard-action='copy' id="copy_btna" data-clipboard-target="#SetOutSqla" class="btn btn-primary">
<script>    
    $(function(){
        var clipboard = new Clipboard('#copy_btna');
        clipboard.on('success', function(e) {
            e.clearSelection();
            console.log(e.clearSelection);
        });
    });
</script>   

</td>
</tr>

<tr class="tr_1">
  <td>�����������õ�Sql���</td>
</tr>
<tr>
<td class="td_1">
<textarea id="SetOutSqlb" cols="100" rows="5">insert into cfwztg_setcontent(
setbclassflag,setsclassflag,setflag,setflag_2,setdesc,setdesc_2,setvalue,setremark,settype,setcontenttype,settaxis,setstate,extraadstate1,limitlist1,puttime1,extraadcode1,extraadstate2,limitlist2,puttime2,extraadcode2,extraadstate3,limitlist3,puttime3,extraadcode3,extraadstate4,limitlist4,puttime4,extraadcode4,setadtotal,setisiframe,setwidth,setheight,setsitetypeset,setsitetype
)
select 
'<%=Rs("setbclassflag")%>','<%=Rs("setsclassflag")%>','<%=Rs("setflag")%>','<%=Rs("setflag_2")%>','<%=ChkStr(Rs("setdesc"),1)%>','<%=ChkStr(Rs("setdesc_2"),1)%>','<%=ChkStr(Rs("setvalue"),0)%>','<%=ChkStr(Rs("setremark"),0)%>',<%=Rs("settype")%>,<%=Rs("setcontenttype")%>,<%=Rs("settaxis")%>,<%=Rs("setstate")%>,<%=Rs("extraadstate1")%>,'<%=Rs("limitlist1")%>','<%=Rs("puttime1")%>','<%=Rs("extraadcode1")%>',<%=Rs("extraadstate2")%>,'<%=Rs("limitlist2")%>','<%=Rs("puttime2")%>','<%=Rs("extraadcode2")%>',<%=Rs("extraadstate3")%>,'<%=Rs("limitlist3")%>','<%=Rs("puttime3")%>','<%=Rs("extraadcode3")%>',<%=Rs("extraadstate4")%>,'<%=Rs("limitlist4")%>','<%=Rs("puttime4")%>','<%=Rs("extraadcode4")%>',<%=Rs("setadtotal")%>,<%=Rs("setisiframe")%>,<%=Rs("setwidth")%>,<%=Rs("setheight")%>,<%=Rs("setsitetypeset")%>,'<%=Rs("setsitetype")%>'</textarea>

<input type="button" value="����" data-clipboard-action='copy' id="copy_btnb" data-clipboard-target="#SetOutSqlb" class="btn btn-primary">
<script>
    $(function(){
        var clipboard = new Clipboard('#copy_btnb');
        clipboard.on('success', function(e) {
            e.clearSelection();
            console.log(e.clearSelection);
        });
    });
</script>  

</td>
</tr>
</table>
