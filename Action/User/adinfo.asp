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
ID=CLng(ChkStr(Request("ID"),2))

'--�ǲ鿴ʱ���������б�includeʱ
If ID>0 Then
 Sql="Select * From CFWztg_Ad Where ID="&ID
 Set Rs = Server.CreateObject("ADODB.Recordset")
 Rs.open Sql,Conn,1,1
End If
%>

<table class="tb_1">
<tr>
<td class="td_r">����ţ�<a name="ad<%=Rs("ID")%>"></a></td>
<td>
<%=Rs("ID")%>
<%If Ad_Class=1 Or Ad_Class=2 Or Ad_Class=3 Or Ad_Class=4 Or Ad_Class=7 Then%> 
<a href='?Action=adcodeget&Ad_Class=<%=Ad_Class%>&ID=<%=Rs("ID")%>&ClickState=<%=ClickState%>' class="btn btn-primary" style="vertical-align:middle"><span>��ȡ�˹����벢Ԥ�����</span></a>
<%End If%>
</td>
<td class="td_r">�������</td>
<td colspan="3"><%=Rs("AdUserName")%>

</td>
</tr>


<tr>
<td class="td_r">������ƣ�</td>
<td><%=Rs("AdName")%></td>
<td class="td_r">������ҵ��</td>
<td colspan="3">
<%
Sql="Select SiteClassName From CFWztg_SiteClass Where ID="&Rs("SiteClassID")
Set Rs2=Conn.Execute(Sql)
Response.write Rs2("SiteClassName")
Rs2.Close
%>
</td>
</tr>

<%If Rs("Ad_Class")<>1 or Rs("AdShowType")<>"" Then%>
<tr>

<%If Rs("Ad_Class")<>1 Then%>
<td class="td_r">���ߴ磺</td>
<td><%=Rs("adwidth")&"x"&Rs("adheight")%></td>
<%
Else
 Response.write "<td class='td_r'>&nbsp;</td><td>&nbsp;</td>"
End If
%>

<%If Rs("AdShowType")<>"" Then%>
<td class="td_r">��ý����Ч����</td>
<td colspan="3">
<%
 GGXG = ""
 Sql="Select SetDesc From CFWztg_SetContent Where SetFlag='"&Rs("AdShowType")&"'"
 Set Rs2=Conn.Execute(Sql)
 GGXG = Rs2("SetDesc")
 Response.write GGXG
 Rs2.Close
%>
</td>
<%
Else
 Response.write "<td class='td_r'>&nbsp;</td><td>&nbsp;</td>"
End If
%>

</tr>
<%End If%>


<tr>
<td style="width:15%;" class="td_r">
��Ҫ�Ʒ�ģʽ:
</td>
<td style="width:35%;">
<%
If Rs("ClickState")=1 Then
 If Rs("Ad_Class")=8 Or Rs("Ad_Class")=9 Then
  Response.Write "��������"
 ElseIf Rs("Ad_Class")=7 Then
  If Instr(GGXG,"����")>0 Then
   Response.Write "��������"
  Else
   Response.Write "�������(CPC)"
  End If
 ElseIf Rs("Ad_Class")=1 Then
   Response.Write "����򵯳�����"
 Else
  Response.Write "�������(CPC)"
 End If
ElseIf Rs("ClickState")=2 Then
 Response.Write "��ʾ����(CPV)"
ElseIf Rs("ClickState")=3 Then
 Response.Write "ע�����(CPA)"
ElseIf Rs("ClickState")=4 Then
 Response.Write "��Ʒ����(CPS)"
End If

%>
</td>

<td style="width:15%;" class="td_r">��Ҫ�Ʒ�ģʽ��</td>
<td style="width:35%;">
<%
If Rs("ClickSeState")=0 Then
  Response.Write "�ر�"
ElseIf Rs("ClickSeState")=1 Then
  Response.Write "ͬʱ֧��CPC�Ʒѣ�"
ElseIf Rs("ClickSeState")=2 Then
 Response.Write "ͬʱ֧��CPV�Ʒѣ�"
End If

If Rs("ClickSeState")>0 Then Response.write "Ϊ�������۵� "&GetTurnCent(Rs("clicksemul"))&" ��"
%>
</td>

</tr>
<tr>
<td style="width:15%;" class="td_r">
����:
</td>
<td style="width:35%;">
<%
If Rs("VipLevelOpen")=0 Then
 Response.write GetTurnCent(CDBL(Rs("Unit_Cent"))*Rs("AllowClickTotal")*1000) & "Ԫ/ǧ��"
Else
 Response.write "��������:"&GetTurnCent(CDBL(Rs("Unit_Cent"))*Rs("AllowClickTotal")*1000) & "Ԫ/ǧ��,"
 
 If Rs("VipLevelOpen")=1 Then
  Response.write "�˹���������һ��Ͷ�Ŵ˹��ĳɼ���ͬ�����۲�ͬ"
  Sql = "Select Top 1 Display_Counter,Click_Counter,Reg_Counter From CFWztg_AD_Counter_Day Where UserName='" & UserName & "' And Ad_ID=" & Rs("ID") & " And DateDiff(d,getdate(),AddDate)<>0 Order By AddDate Desc"
  Set Rs2=Conn.Execute(Sql)
  If Not Rs2.Eof Then
   UserLastDayShowTotal = Rs2("Display_Counter")
   UserLastDayClickTotal = Rs2("Click_Counter")
   UserLastDayRegTotal = Rs2("Reg_Counter")
  Else
   UserLastDayShowTotal = 0
   UserLastDayClickTotal = 0
   UserLastDayRegTotal = 0
  End If

  If Rs("ClickState")=1 Then
   CurrTotal = UserLastDayClickTotal
  ElseIf Rs("ClickState")=2 Then
   CurrTotal = UserLastDayShowTotal
  ElseIf Rs("ClickState")=3 Then
   CurrTotal = UserLastDayRegTotal
  End If
 End If
 
 If Rs("VipLevelOpen")=2 Then 
  Response.write "�˹�������Ͷ�����й�������ĳɼ���ͬ�����۲�ͬ"
  If Rs("ClickState")=1 Then
   CurrTotal = UserClickTotal
  ElseIf Rs("ClickState")=2 Then
   CurrTotal = UserShowTotal
  ElseIf Rs("ClickState")=3 Then
   CurrTotal = UserRegTotal
  End If
 End If
 
 
 If Rs("VipLevelOpen")=3 Then 
  Response.write "�˹����������û��ȼ���ͬ�����۲�ͬ"
  Sql = "Select UserLevel From CFWztg_User Where UserName='" & UserName & "'"
  Set Rs2=Conn.Execute(Sql)
  CurrTotal = Rs2("UserLevel")
  
  Rs2.Close
  
  Response.write "<br>Ŀǰ�����û��ȼ���"& CurrTotal &"��������"
 Else
  Response.write "<br>Ŀǰ��������"& CurrTotal &"��������"
 End If
 


 If CurrTotal <= Rs("VipLevel1_Num") Then
  Response.write "<b>��1�ȼ�</b>���ǻ����۵�<b>" & GetTurnCent(Rs("VipLevel1_Mul")) & "</b>��"
 ElseIf CurrTotal <= Rs("VipLevel2_Num") Then
  Response.write "<b>��2�ȼ�</b>���ǻ����۵�<b>" & GetTurnCent(Rs("VipLevel2_Mul")) & "</b>��"
 ElseIf CurrTotal <= Rs("VipLevel3_Num") Then
  Response.write "<b>��3�ȼ�</b>���ǻ����۵�<b>" & GetTurnCent(Rs("VipLevel3_Mul")) & "</b>��"
 ElseIf CurrTotal <= Rs("VipLevel4_Num") Then
  Response.write "<b>��4�ȼ�</b>���ǻ����۵�<b>" & GetTurnCent(Rs("VipLevel4_Mul")) & "</b>��"
 ElseIf CurrTotal <= Rs("VipLevel5_Num") Then
  Response.write "<b>��5�ȼ�</b>���ǻ����۵�<b>" & GetTurnCent(Rs("VipLevel5_Mul")) & "</b>��"
 Else
  Response.write "<b>��6�ȼ�</b>,�ǻ����۵�<b>" & GetTurnCent(Rs("VipLevel6_Mul")) & "</b>��"
 End If

 
 Response.write "<br>��1�ȼ���" & Rs("VipLevel1_Num") & " ���ڣ����ۣ�" & GetTurnCent(Rs("VipLevel1_Mul")) & " ��"
 Response.write "<br>��2�ȼ���" & Rs("VipLevel2_Num") & " ���ڣ����ۣ�" & GetTurnCent(Rs("VipLevel2_Mul")) & " ��"
 Response.write "<br>��3�ȼ���" & Rs("VipLevel3_Num") & " ���ڣ����ۣ�" & GetTurnCent(Rs("VipLevel3_Mul")) & " ��"
 Response.write "<br>��4�ȼ���" & Rs("VipLevel4_Num") & " ���ڣ����ۣ�" & GetTurnCent(Rs("VipLevel4_Mul")) & " ��"
 Response.write "<br>��5�ȼ���" & Rs("VipLevel5_Num") & " ���ڣ����ۣ�" & GetTurnCent(Rs("VipLevel5_Mul")) & " ��"
 Response.write "<br>��6�ȼ���" & Rs("VipLevel5_Num") & " ���ϣ����ۣ�" & GetTurnCent(Rs("VipLevel6_Mul")) & " ��"
  
 '--CPS�۸���ʾ
 If Rs("ClickState")=4 Then
  Response.write "<br>��Ʒ����(CPS)������۸���ָʵ��CPSǰ��ÿ��ע��CPA�ļ۸�CPS������ͨ��������Ʒ������������ɵģ����ڲ˵����[<a href='?Action=orderview'>CPS��������</a>]��鿴"
 End If
End If
%>
</td>

<td style="width:15%;" class="td_r">�ƶ��豸���ۣ�</td>
<td style="width:35%;">
<%
Response.write "Ϊ������ȼ����۵� "&GetTurnCent(Rs("Moblie_Mul"))&" ��"
%>
</td>

</tr>


<tr>
  <td class="td_r">����Ͷ�ŵ��豸��</td>
  <td>
<%
If Rs("sitetypeset")=0 Then
 Response.write "ȫ���豸"
Else
 If Instr(Rs("sitetype"),"pc")>0 Then Response.Write "������� "
 If Instr(Rs("sitetype"),"ios")>0 Then Response.Write "ƻ��IOS "
 If Instr(Rs("sitetype"),"android")>0 Then Response.Write "Android "
 If Instr(Rs("sitetype"),"΢��WP")>0 Then Response.Write "΢��WP "
 If Instr(Rs("sitetype"),"΢��")>0 Then Response.Write "΢�� "
End If
%>  
</td>
  <td class="td_r">�����վ�����ͣ�</td>
  <td><%		
If Rs("PutSiteClassID")="" Then
 Response.write "ȫ��"
Else
 Response.write Rs("PutSiteClassID")
End If
%></td>
</tr>


<tr>
<td class="td_r">������Χ��</td>
<td>
<%
If Ad_Class=1 Or Ad_Class=2 Then
 If Rs("PutRange")=1 Then
  Response.Write "�������κεط��ñ��˵�����ɻ���������վ����̳��QQ"
 ElseIf Rs("PutRange")=2 Then
  Response.Write "���κ���ҳ�ñ��˵�����ɻ���������վ����̳��������QQ����Ч)"
 ElseIf Rs("PutRange")=3 Then
  Response.Write "���ֻ�ܷ����ڹ涨��վ�ϲ���Ч��<a href='?Action=putsiteview&ID="&Rs("ID")&"'>�鿴�涨��վ�б�</a>"
 ElseIf Rs("PutRange")=4 Then
  Response.Write "���ֻ�ܷ������Լ���˵�ͨ������վ�ϲ���Ч)"
 ElseIf Rs("PutRange")=5 Then
  Response.Write "ֻ����ָ����Ա���룬<a href='?Action=putuserview&ID="&Rs("ID")&"'>�鿴����Ͷ�ŵĻ�Ա����</a>"
 End If
Else
 If Rs("PutRange_2")=1 Then
  Response.Write"ֻ��������վ��վ��������"
 ElseIf Rs("PutRange_2")=2 Then
  Response.Write"ֻ��������վ��վ�������룬��ֻ�ܷ�����վ��������˺���˳ɹ�����վ��"
 ElseIf Rs("PutRange_2")=3 Then
  Response.Write "���ֻ�ܷ����ڹ涨��վ�ϲ���Ч��<a href='?Action=putsiteview&ID="&Rs("ID")&"'>�鿴�涨��վ�б�</a>"
 ElseIf Rs("PutRange_2")=4 Then
  Response.Write "ֻ����ָ����Ա���룬<a href='?Action=putuserview&ID="&Rs("ID")&"'>�鿴����Ͷ�ŵĻ�Ա����</a>"
 End If
End If
%>
</td>


<td class="td_r">�����ȷ�ϵĴ�����</td>
<td>
<%
If Rs("AdAffirmTotal")=0 Then
 Response.write "����ȷ��"
Else
 Response.write Rs("AdAffirmTotal")&"��"
End If
%></td>
</tr>



<%If Rs("AdDesc")<>"" Then%>
<tr>
<td class="td_r">���˵����</td>
<td colspan="3">
<%
Response.write  Rs("AdDesc")
%>
</td>
</tr>
<%End If%>


</table>