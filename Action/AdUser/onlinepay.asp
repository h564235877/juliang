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
OrderCode=Left(DateDiff("s","1970-1-1",Now())&GenRanStr_2(16),16)
%>

<script>
  let rate=6.9;
  $(function(){
   $("#submit").click(function(){
    PayMoney=$('#PayMoney').val();
    if(PayMoney==""){
     alert('����д��Ҫ����Ľ��', '', function () {$("#PayMoney").focus();});
     return false;
    }

    if(PayMoney <= 0){
     alert('����д��ȷ�ĳ�ֵ�Ľ��', '', function () {$("#PayMoney").focus();});
     return false;
    }
    
    if(!/^\d{1,10}(\.\d{1,2})?$/.test(PayMoney)){
     alert('��������������ֻ����д��С����2λ', '', function () {$("#PayMoney").focus();});
     return false;
    }
    
    if(PayMoney < <%=RsSet("Pay_LowCent")%>){
     alert('������ֵ<%=RsSet("Pay_LowCent")%>Ԫ', '', function () {$("#PayMoney").focus();});
     return false;
    }
    
   })


  });


function getRate(el){
  let rmb=$(el).val();
  if(rate){
    $("#ustd").val(rmb/rate);
    $("#submit").attr("disabled", false);
  }
  console.log($("#ustd").val());
}
</script>

<a href="<%=ChkStr(Request.ServerVariables("Http_Referer"),1)%>" class="actionBtn" style="margin-top:10px;"><i class="mdi mdi-keyboard-return"></i>�����б�</a>


<form name="f" method="post" action="../../action/aduser/onlinepay_send.asp" target="_blank">
<table class="tb_1">
  <tr class="tr_1"> 
    <td colspan="2">���߳�ֵ</td>
  </tr>
  <tr> 
      <td width="80" class="td_r">�������</td>
      <td><%=AdUserName%><input type="hidden" name="AdUserName" id="AdUserName" value="<%=AdUserName%>">
      </td>
    </tr>
  <tr> 
      <td class="td_r">�����ţ�</td>
      <td><%=OrderCode%><input type="hidden" name="OrderCode" id="OrderCode" value="<%=OrderCode%>">
      </td>
    </tr>

    <tr> 
      <td class="td_r">֧�ֽӿڣ�</td>
      <td><%
If RsSet("Pay_Default")="alipay" Then
 Response.write "֧����"
 
ElseIf RsSet("Pay_Default")="tenpay" Then
 Response.write "����Ǯ��"
 
ElseIf RsSet("Pay_Default")="99bill" Then
 Response.write "��Ǯ"
 
ElseIf RsSet("Pay_Default")="chinabank" Then
 Response.write "��������"
ElseIf RsSet("Pay_Default")="" Then
 Response.write "���߳�ֵ�ӿ�û�п�ͨ���޷���ֵ"
End If

%> </td>
    </tr>
    
    <tr> 
      <td class="td_r">������</td>
      <td><input  id='PayMoney' name='PayMoney' type='text' > Ԫ
        <span style="color: #999">(��ͳ�ֵ���<%=RsSet("Pay_LowCent") %>Ԫ)</sapn>
      </td>
    </tr>
    
    <tr> 
	<td></td>
      <td>
        <input type="submit" name="submit" id="submit" value="��ֵ" class="btn btn-primary">

      </td>
    </tr>
</table>
</form>