<%
'�˷�������ϵͳ Sql��
'����QQ��178575
'����EMail��yliangcf@163.com
'������վ��http://www.qqcf.com
'��ϸ��飺http://www.qqcf.com/cfwztg.htm
'�����г���������ʾ����װ��ʾ��ʹ�����ѽ�����°汾���ص�����
'��Ϊ��Щ���ݿ���ʱ�����£���û�з��ڳ�������Լ�����վ�鿴
%>

<table class="tb_1" id="tbu">
<tr class="tr_1">
<td colspan="2">���Ͷ�ŵ���</td>
</tr>

<tr> 
<td width="220" class="td_r">���Ͷ�ŵ�����</td>
<td><input name="AdPutArea" type="text" value="<%=Rs("AdPutArea")%>" style="width:400px;"> 
<br>(��������м���Ӣ��,�ָ���������Ϊȫ������)</td>
</tr>

<tr class="tr_1">
<td colspan="2">������վ����������վ��Ͷ��</td>
</tr>
<TR> 
<TD class="td_r">�������������͵���վ�ϣ�</TD>
<TD>
<%If (Rs("PutObj")=1 And Rs("PutRange")=4) Or (Rs("PutObj")=2 And Rs("PutRange_2")=5) Then%>
<script>
$(function(){

function siteclass_1(){
$("#t_siteclass").hide();
}

function siteclass_2(){
$("#t_siteclass").show();
}

<%If Rs("PutSiteClassID")="" Then%>
siteclass_1();
<%Else%>
siteclass_2();
<%End If%>

$("#siteclass_1").click(function(){
siteclass_1();
});

$("#siteclass_2").click(function(){
siteclass_2();
});

});
</script>

<input name="siteclass" id="siteclass_1" type="radio" value="1"<%if Rs("PutSiteClassID")="" Then Response.write " checked"%>>
ȫ���� 
<input name="siteclass" id="siteclass_2" type="radio"  value="2"<%if Rs("PutSiteClassID")<>"" Then Response.write " checked"%>>
����ѡ��
<%
Else
Response.Write "<script>"
Response.Write "$(function(){"
Response.Write "$(""#t_siteclass"").hide();"
Response.Write "});"
Response.Write "</script>"

Response.Write "��淢���ķ�Χ��ѡ���û���������Ա���ѡ�����ܲ���������Ч"
End If
%>
</TD>
    </TR>
    <TR id="t_siteclass"> 
      <TD>&nbsp;</TD>
      <TD>
	  

	  <table border="0" cellpadding="0" cellspacing="0">
          <%
Set Rs2=Server.CreateObject("Adodb.RecordSet")
Sql="Select * From CFWztg_SiteClass Order By SiteClassName"
Rs2.Open Sql,Conn,1,1
linenum=5
tdwidth=int(100/linenum)&"%"
jishu=1
While Not Rs2.Eof
If jishu mod linenum=1 or linenum=1 Then
Response.Write "<tr>"
End If%>
          <td width="<%=tdwidth%>"> 
            <input type="checkbox" name="PutSiteClassID" value="<%=Rs2("ID")%>"<%if Instr(Rs("PutSiteClassID"),","&Rs2("ID")&",")>0 Then Response.write " checked"%>> 
            <%=Rs2("SiteClassName")%></td>
          <%
If jishu mod linenum=0 Then
 Response.write "</tr>"
End If
jishu=jishu+1
Rs2.MoveNext
Wend 'дtr��td,jishu mod ����Ϊ1ʱ��ʼtr,Ϊ0ʱ����tr

jishu=jishu-1
If jishu Mod linenum <> 0 Then
For i= 1 to linenum-(jishu mod linenum)
	response.write "<td width='"&tdwidth&"'>&nbsp;</td>"
	If  i = linenum-(jishu mod linenum) Then response.write "</tr>"
Next
End If '�ж����һ��tr�Ƿ����ñպ�,��������td,��������ո�
%>
        </table>
		
		</TD>
    </TR>
    
 

    <tr class="tr_1">
      <td colspan="2">Ͷ��ҳ��ָ��</td>
    </tr>
    <tr> 
      <td class="td_r">��淢������</td>
      <td>
<%If Rs("Ad_Class") = 1 Or Rs("Ad_Class") = 2 Then 'ֱ�����ֻ�ͼƬ����%>
<script>
$(function(){

function putrange_1(){
$("#t_putsite").hide();
$("#t_putsite_forbit").show();
}

function putrange_2(){
$("#t_putsite").hide();
$("#t_putsite_forbit").show();
}

function putrange_3(){
$("#t_putsite_forbit").hide();
$("#t_putsite").show();
}

function putrange_4(){
$("#t_putsite,#t_putsite_forbit").hide();
}


putrange_<%=Rs("PutRange")%>();

$("#putrange_1").click(function(){
putrange_1();
});

$("#putrange_2").click(function(){
putrange_2();
});

$("#putrange_3").click(function(){
putrange_3();
});

$("#putrange_4").click(function(){
putrange_4();
});

});

</script>

<input name="PutObj" id="putobj_1" type="radio" value="1"<%If Rs("PutObj")=1 Then Response.Write " Checked"%>>�����˶��������� 


<%Else'ֱ�����ֻ�ͼƬ�������%>

<script>
$(function(){

function putrange_1(){
$("#t_putsite").hide();
$("#t_putsite_forbit").show();
}

function putrange_2(){
$("#t_putsite,#t_putsite_forbit").hide();
}

function putrange_3(){
$("#t_putsite_forbit").hide();
$("#t_putsite").show();
}


putrange_<%=Rs("PutRange_2")%>();

$("#putrange_2_1").click(function(){
putrange_1();
});

$("#putrange_2_2").click(function(){
putrange_2();
});

$("#putrange_2_3").click(function(){
putrange_3();
});


});

</script>

<input type="radio" id="putobj_2" name="PutObj" value="2"<%If Rs("PutObj")=2 Then Response.Write " Checked"%>>ֻ������վ��վ���ſ������� 
<%End If%>
</td>
</tr>

<%If Rs("Ad_Class") = 1 Or Rs("Ad_Class") = 2 Then 'ֱ�����ֻ�ͼƬ����%>
<tr id="t_putrange_1"> 
<td class="td_r">��淢���ķ�Χ(������������)��</td>
<td>
<input type="radio" name="PutRange" id="putrange_1" value="1"<%If Rs("PutRange")=1 Then Response.Write " checked"%>>�������κεط�������վ����̳���ѣ���<br>
<input type="radio" name="PutRange" id="putrange_2" value="2"<%If Rs("PutRange")=2 Then Response.Write " checked"%>>ֻ�ܷ�������ҳ�ϣ�����վ����̳�������ܷ����ڣѣ���<br>
<input type="radio" name="PutRange" id="putrange_3" value="3"<%If Rs("PutRange")=3 Then Response.Write " checked"%>>ֻ�ܷ���������ϵͳ�����վ����<br>
<input type="radio" name="PutRange" id="putrange_4" value="4"<%If Rs("PutRange")=4 Then Response.Write " checked"%>>ֻ�ܷ������Լ������ͨ������Ա��˵���վ��<br>
</td>
</tr>
<%End If%>

<%If Not(Rs("Ad_Class") = 1 Or Rs("Ad_Class") = 2) Then 'ֱ�����ֻ�ͼƬ�������%>
<tr id="t_putrange_2"> 
<td class="td_r">��淢���ķ�Χ(������վ��)��</td>
<td>
<input type="radio" name="PutRange_2" id="putrange_2_1" value="1"<%If Rs("PutRange_2")=1 Then Response.Write " Checked"%>>���Է������κ���ҳ��<br>
<input type="radio" name="PutRange_2" id="putrange_2_2" value="2"<%If Rs("PutRange_2")=2 Then Response.Write " Checked"%>>ֻ�ܷ������Լ������ͨ������Ա��˵���վ��<br>
<input type="radio" name="PutRange_2" id="putrange_2_3" value="3"<%If Rs("PutRange_2")=3 Then Response.Write " checked"%>>ֻ�ܷ���������ϵͳ�����վ����<br>
</td>
</tr>
<%End If%>
	
    <tr id="t_putsite"> 
      <td class="td_r">ֻ�������ڵ�վ�㣺</td>
      <td><input name="PutSite" type="text" id="PutSite" value="<%=Rs("PutSite")%>" style="width:400px;">
        ���վ������Ӣ��&quot;,&quot;�ָ�</td>
    </tr>

    <tr id="t_putsite_forbit"> 
      <td class="td_r">��ֹͶ�ŵ�վ�㣺</td>
      <td><input name="PutSite_Forbit" type="text" id="PutSite_Forbit" value="<%=Rs("PutSite_Forbit")%>" style="width:400px;">
        �����������Ӣ��&quot;,&quot;�ָ�</td>
    </tr>


<script>
$(function(){

function userlimitopen_0(){
$("#t_userlimitlist").hide();
}

function userlimitopen_1(){
$("#t_userlimitlist").show();
}

function userlimitopen_2(){
$("#t_userlimitlist").show();
}

function userlimitopen_3(){
$("#t_userlimitlist").show();
}

userlimitopen_<%=Rs("userlimitopen")%>();

$("#userlimitopen_0").click(function(){
userlimitopen_0();
});

$("#userlimitopen_1").click(function(){
userlimitopen_1();
});

$("#userlimitopen_2").click(function(){
userlimitopen_2();
});

$("#userlimitopen_3").click(function(){
userlimitopen_3();
});

});
</script>

    <tr class="tr_1">
      <td colspan="2">Ͷ���û�ָ��</td>
    </tr>
    
<TR> 
<TD class="td_r"><span  id="t3">�û����ƣ�</span></TD>
<TD>
<input type="radio" name="userlimitopen" id="userlimitopen_0" value="0"<%If Rs("userlimitopen")=0 Then Response.Write " Checked"%>/>����
<input type="radio" name="userlimitopen" id="userlimitopen_1" value="1"<%If Rs("userlimitopen")=1 Then Response.Write " Checked"%>/>ֻ���������û�
<input type="radio" name="userlimitopen" id="userlimitopen_2" value="2"<%If Rs("userlimitopen")=2 Then Response.Write " Checked"%>/>���������û�
<input type="radio" name="userlimitopen" id="userlimitopen_3" value="3"<%If Rs("userlimitopen")=3 Then Response.Write " Checked"%>/>ֻ�������·�����û�
</TD>
</TR>


<tr id="t_userlimitlist">
<td class="td_r">��д�û�������飺</td>
<td>
<input name="userlimitlist" type="text" id="userlimitlist" value="<%=Rs("userlimitlist")%>" size="30" style="width:400px;">����û����������������á�,�����Ÿ���
</td>
</tr>
</TR>

	
<%If Not(Rs("Ad_Class") = 1 Or Rs("Ad_Class") = 2) Then 'ֱ�����ֻ�ͼƬ�������%>
<tr class="tr_1">
<td colspan="2">CPC���Ͷ��ҳ�����Դҳָ��(������)</td>
</tr>

<tr> 
<td class="td_r">������д��Դҳ����������Ч��</td>
<td><input name="AllowLyDomain" type="text" id="AllowLyDomain" value="<%=Rs("AllowLyDomain")%>" style="width:400px;">
<br />����������������Ч,������ԴΪ��,һ����д��������a.com,�������µ������������������������,�����������Ӣ��&quot;,&quot;�ָ�</td>
</tr>
	
<tr> 
<td class="td_r">������д��Դҳ��������Ч��</td>
<td><input name="ForbidLyDomain" type="text" id="ForbidLyDomain" value="<%=Rs("ForbidLyDomain")%>" style="width:400px;">
<br />һ����д��������a.com,�������µ������������������������,�����������Ӣ��&quot;,&quot;�ָ�</td>
</tr>
<%End If%>


<tr class="tr_1">
<td colspan="2">Iframe��Cookies</td>
</tr>

    <%
	
	If Rs("Ad_Class") = 1 Then 'ֱ��������������%>
    <tr> 
      <td class="td_r">ֱ�����ֹ�����Iframe���Ƿ���Ч��</td>
      <td><input type="radio" name="DirectTextAdIframe" value="1"<%If Rs("DirectTextAdIframe")=1 Then Response.write " checked"%>>
        �� 
        <input type="radio" name="DirectTextAdIframe" value="0"<%If Rs("DirectTextAdIframe")=0 Then Response.write " checked"%>>
        ��*Ĭ��Ϊ��</td>
    </tr>
    <tr> 
      <td class="td_r">ֱ�����ֹ�����Iframeʱ�Զ�������</td>
      <td><input type="radio" name="DirectTextAdIframeOpen" value="1"<%If Rs("DirectTextAdIframeOpen")=1 Then Response.write " checked"%>>
        �� 
        <input type="radio" name="DirectTextAdIframeOpen" value="0"<%If Rs("DirectTextAdIframeOpen")=0 Then Response.write " checked"%>>
        ��*Ĭ��Ϊ��</td>
    </tr>

    <tr> 
      <td class="td_r">ֱ�����ֹ���������֧��Cookies���Ҳ��Ч��</td>
      <td><input type="radio" name="DirectTextCookieAllYes" value="1"<%If Rs("DirectTextCookieAllYes")=1 Then Response.write " checked"%>>
        �� 
        <input type="radio" name="DirectTextCookieAllYes" value="0"<%If Rs("DirectTextCookieAllYes")=0 Then Response.write " checked"%>>
        ��*Ĭ��Ϊ��</td>
    </tr>
	
	<%End If%>


	<%
	
	If Rs("Ad_Class") = 3 Or Rs("Ad_Class") = 4 Or Rs("Ad_Class") = 5 Or Rs("Ad_Class") = 6 Or Rs("Ad_Class") = 7 Then '��ͨ����,��ͨͼƬ,������棬���������ý����%>
     <tr> 
      <td class="td_r">������Iframeʱ�Զ�������</td>
      <td><input type="radio" name="WebAdIframeOpen" value="1"<%If Rs("WebAdIframeOpen")=1 Then Response.write " checked"%>>
        �� 
        <input type="radio" name="WebAdIframeOpen" value="0"<%If Rs("WebAdIframeOpen")=0 Then Response.write " checked"%>>
        ��*Ĭ��Ϊ��</td>
    </tr>
	<%End If%>

<tr> 
<td>&nbsp;</td>
<td>
<input type="submit" name="adrunsitebtn" id="adrunsitebtn" value="�޸�" class="btn btn-primary">
</td>
</tr>

</table>

