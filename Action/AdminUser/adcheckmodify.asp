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
Ad_ID=ChkStr(Request("Ad_ID"),2)

Set Rs = Server.CreateObject("ADODB.Recordset")
Sql="Select a.Ad_ID,a.CheckState,a.Unit_Cent_First as Unit_Cent_First_New,b.* From CFWztg_AD_Check a inner join CFWztg_AD b on a.ad_id=b.id where a.Ad_ID="&Ad_ID
Rs.open Sql,Conn,1,1
If Not(Rs.Eof) Then
 Ad_ID=Rs("Ad_ID")
 CheckState=Rs("CheckState")
 Unit_Cent_First_New=Rs("Unit_Cent_First_New")
   

 Ad_Class=Rs("Ad_Class")
 AdName=Rs("AdName")
 Ad=Rs("Ad")
 AdIntro=Rs("AdIntro")
 Ad_Url=Rs("Ad_Url")
 Ad_Url_TypeSet=Rs("Ad_Url_TypeSet")
 Ad_Url_Android=Rs("Ad_Url_Android")
 Ad_Url_Iphone=Rs("Ad_Url_Iphone")
 AdSimpleUrl=Rs("AdSimpleUrl")
 Unit_Cent_First=Rs("Unit_Cent_First")

 CheckDesc="���ͼ۸���Ҫ��ˣ���߼۸���޸ķǼ۸�����޸�������˼�ʱ��Ч!"
Else
 Response.write "��Ϣ������"
 Response.end
End If
Rs.Close


%>


<script>
$(function(){


$("#admodifysave").click(function(){


if($("#unit_cent_first_new").val()==""){
 alert('�������µ���', '', function () {$("#unit_cent_first_new").focus();});
 return false;
}

if($("#CheckState option:selected").val()==""){
 alert('��ѡ�����״̬', '', function () {$("#CheckState").focus();});
 return false;
}


if($("#CheckState option:selected").val()=="2"){
 return confirm('ȷ��Ҫ��˳ɹ���?');
}


});

});
</script>


<a href="<%=ChkStr(Request.ServerVariables("Http_Referer"),1)%>" class="actionBtn"><i class="mdi mdi-keyboard-return"></i>�����б�</a>

  <form name="form1" method="post" action="../../AdminUser.aspx?Action=adcheckmodifysave&Ad_ID=<%=Ad_ID%>&RefUrl=<%=Server.URLEncode(Request.ServerVariables("Http_Referer"))%>">

<table class="tb_1">

   <tr class="tr_1"> 
      <td colspan="2">�����Ϣ</td>
  </tr>
  
   <tr>
     <td class="td_r">&nbsp;</td>
     <td><font color="#FF0000">(ע:<%=CheckDesc%>)</font></td>
   </tr>
   <tr>
  <td class="td_r">������ƣ�</td>
<td><input name="adname" id="adname" type="text"  value="<%=adname%>" readonly style="width:300px;background-color:#eeeeee"></td>
</tr>


 <%If Ad_Class=1 Or Ad_Class=3 Or Ad_Class=5  Or Ad_Class=6 Or Ad_Class=7 Then%>

    <tr> 
      <td class="td_r">������֣�</td>
      <td><textarea name="ad" id="ad" rows="5" readonly style="width:300px;background-color:#eeeeee"><%=ad%></textarea>
      <a href="?Action=imglist" target="_blank">�ϴ��ļ�</a></td>
      </tr>
    <%ElseIf Ad_Class=2 Or Ad_Class=4 Then%>
    <tr> 
      <td class="td_r">���ͼƬ��</td>
      <td><input name="ad" id="ad" type="text" value="<%=ad%>" readonly style="width:300px;background-color:#eeeeee">
  <a href="?Action=imglist" target="_blank">�ϴ��ļ�</a>
      </td>
    </tr>
    <%End If%>
   <%If Ad_Class=5 Or Ad_Class=6 Then%>
    <tr> 
      <td class="td_r">��������֣�</td>
      <td><input name="AdIntro" id="AdIntro" type="text" value="<%=AdIntro%>" readonly style="width:300px;background-color:#eeeeee"></td>
    </tr>
    <%End If%>
	
	<TR> 
      <TD class="td_r">������ӣ�</TD>
      <TD><input name="ad_url" id="ad_url" type="text" value="<%=Ad_Url%>" readonly style="width:300px;background-color:#eeeeee"></TD>
    </TR>

<TR> 
<TD class="td_r">�ƶ��豸������ӣ�</TD>
<TD><input type="radio" name="ad_url_typeset" id="ad_url_typeset_0" value="0"<%If Ad_Url_TypeSet=0 Then Response.write " checked"%> disabled />��PC���������ͬ
  <input type="radio" name="ad_url_typeset" id="ad_url_typeset_1" value="1"<%If Ad_Url_TypeSet=1 Then Response.write " checked"%> disabled />��PC������Ӳ�ͬ,�ֱ�ָ��
  
<%If Ad_Url_TypeSet=1 Then%>
  <div id="t_ad_url_android">
  <br />
    ��׿�ֻ�������ӣ�<input name="ad_url_android" type="text" id="ad_url_android" value="<%=ad_url_android%>" readonly  style="width:300px;background-color:#eeeeee">
  </div>
  
  <div id="t_ad_url_iphone">
  <br />
    ƻ���ֻ�������ӣ�<input name="ad_url_iphone" type="text" id="ad_url_iphone" value="<%=ad_url_iphone%>" readonly  style="width:300px;background-color:#eeeeee">
  </div>
<%End If%>
  
  
</TD>
</TR>



   <%If Ad_Class=5 Then%>
    <tr> 
      <td class="td_r">���������</td>
      <td><input name="adsimpleurl" id="adsimpleurl" type="text" value="<%=AdSimpleUrl%>" readonly style='width:300px;background-color:#eeeeee'></td>
    </tr>
    <%End If%>



    
    <tr> 
      <td class="td_r">�ƶ��豸���۱�����</td>
      <td><input name="Moblie_Mul_First" type="text" value="<%=Moblie_Mul_First%>" readonly style='width:300px;background-color:#eeeeee'>��</td>
    </tr>
    <tr>
      <td class="td_r">Ͷ���豸��</td>
      <td><input type="radio" name="sitetypeset" id="sitetypeset_1" value="0" disabled <%If Ad_Url_TypeSet=0 Then Response.write " checked"%>/>����
        <input type="radio" name="sitetypeset" id="sitetypeset_2" value="1" disabled <%If Ad_Url_TypeSet=1 Then Response.write " checked"%>/>ָ���ն�
  <%If Ad_Url_TypeSet=1 Then%>  
  <br />
<input type="checkbox" name="sitetype" id="sitetype" value="pc" disabled<%If Instr(Rs("sitetype"),"pc")>0 Then Response.Write " Checked"%>>�������&nbsp;&nbsp;&nbsp;&nbsp;

<input type="checkbox" name="sitetype" id="sitetype" value="android" disabled<%If Instr(Rs("sitetype"),"android")>0 Then Response.Write " Checked"%>>��׿�ֻ�&nbsp;&nbsp;&nbsp;&nbsp;
<input type="checkbox" name="sitetype" id="sitetype" value="apad" disabled<%If Instr(Rs("sitetype"),"apad")>0 Then Response.Write " Checked"%>>��׿ƽ��&nbsp;&nbsp;&nbsp;&nbsp;

<input type="checkbox" name="sitetype" id="sitetype" value="ios" disabled<%If Instr(Rs("sitetype"),"ios")>0 Then Response.Write " Checked"%>>ƻ���ֻ�&nbsp;&nbsp;&nbsp;&nbsp;
<input type="checkbox" name="sitetype" id="sitetype" value="ipad" disabled<%If Instr(Rs("sitetype"),"ipad")>0 Then Response.Write " Checked"%>>ƻ��ƽ��&nbsp;&nbsp;&nbsp;&nbsp;

<input type="checkbox" name="sitetype" id="sitetype" value="windows phone"<%If Instr(Rs("sitetype"),"windows phone")>0 Then Response.Write " Checked"%>>΢��WP

  <%End If%></td>
    </tr>



<tr class="tr_1"> 
<td colspan="2">���</td>
</tr>
  
<tr> 
<td class="td_r">��浥�ۣ�</td>
<td>
��ǰ����<input name="unit_cent_first" id="unit_cent_first" type="text" value="<%=GetTurnCent(unit_cent_first)%>" readonly style='width:100px;background-color:#eeeeee'>Ԫ
--->�޸�Ϊ
<input name="unit_cent_first_new" id="unit_cent_first_new" type="text" value="<%=GetTurnCent(unit_cent_first_new)%>"
<%
If CheckState=1 Then
 Response.write " style='width:100px;'"
Else
 Response.write " readonly style='width:100px;background-color:#eeeeee'"
End If
%>

>Ԫ
</td>
    </tr>
    
<TR> 
<TD class="td_r">��ǰ״̬��</TD>
<TD>
<%
If CheckState=1 Then
 Response.write "�����  --->  �޸�Ϊ��"
 Response.write "<select name='CheckState' id='CheckState'>"
 Response.write "<option value=''>��ѡ��</option>"
 Response.write "<option value='1'>�����</option>"
 Response.write "<option value='2'>��˳ɹ�</option>"
 Response.write "<option value='3'>���ʧ��</option>"
 Response.write "</select>"
ElseIf CheckState=2 Then
 Response.write "��˳ɹ�"
ElseIf CheckState=3 Then
 Response.write "���ʧ��"
End If
%>

</TD>
</TR>
<%
If CheckState=1 Then
%> 
    <tr>
      <td class="td_r">&nbsp;</td>
      <td><input type="submit" name="submit" value="�޸�" id="admodifysave" class="btn btn-primary"></td>
    </tr>
<%
End If
%>


</table>

</form>