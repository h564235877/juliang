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

$("#hostset").click(function(){

 var AdScriptShowDomain = $('#AdScriptShowDomain').val();
 var AdScriptClickDomain = $('#AdScriptClickDomain').val();
 var AdZlDomain = $('#AdZlDomain').val();
 var AdSysWebDomain = $('#AdSysWebDomain').val();

 if(AdScriptShowDomain!=""&&((AdScriptShowDomain.substr(0,2)!="//"&&AdScriptShowDomain.substr(0,7)!="http://"&&AdScriptShowDomain.substr(0,8)!="https://")||AdScriptShowDomain.substr(AdScriptShowDomain.length-1)!="/")){
  alert('Script������ʾ������Ȩ������ʽ����', '', function () {$("#AdScriptShowDomain").focus();});
  return false;
 }
 
 if(AdScriptShowDomain!=""&&AdScriptClickDomain==""){
  alert('��д�� Script������ʾ������Ȩ���� �����ͬʱ��д���� Script������������Ȩ����!', '', function () {$("#AdScriptClickDomain").focus();});
  return false;
 }
 
 if(AdScriptClickDomain!=""&&((AdScriptClickDomain.substr(0,7)!="http://"&&AdScriptClickDomain.substr(0,8)!="https://")||AdScriptClickDomain.substr(AdScriptClickDomain.length-1)!="/")){
  alert('Script������������Ȩ������ʽ����', '', function () {$("#AdScriptClickDomain").focus();});
  return false;
 }
 
 if(AdZlDomain!=""&&((AdZlDomain.substr(0,7)!="http://"&&AdZlDomain.substr(0,8)!="https://")||AdZlDomain.substr(AdZlDomain.length-1)!="/")){
  alert('ֱ��������������Ȩ������ʽ����', '', function () {$("#AdZlDomain").focus();});
  return false;
 }

 if(AdScriptShowDomain!=""&&AdSysWebDomain==""){
  alert('��д��Script������ʾ������Ȩ���������ͬʱ��д���� ����ǰ̨���ʵ���Ȩ����', '', function () {$("#AdSysWebDomain").focus();});
  return false;
 }
 
 if(AdSysWebDomain!=""){
  if(isDomain(AdSysWebDomain)==false){
   alert('������ʽ����ȷ����д��a.com������������', '', function () {$("#AdSysWebDomain").focus();});
   return false;
  }
  
  if(AdSysWebDomain.substring(0,4)=="www."){
   alert('������Ҫ��www.��ͷ', '', function () {$("#AdSysWebDomain").focus();});
   return false;
  }
 }

});

});
</script>
   

<table class="tb_1">
<form name="formhost" method="post" action="../../AdminUser.aspx?Action=sysmodifysave&Label=<%=Label%>" onsubmit="return hostsetcheck();">
 <tr class="tr_1">
      <td colspan="2">��ȡ������ʱ����������</td>
    </tr>
    <tr>
      <td class="td_r" width="260">Script�����ȡ����������</td>
      <td><input name="AdScriptShowDomain" type="text" id="AdScriptShowDomain" value="<%=rs("AdScriptShowDomain")%>" size="70">
	  <br />(Ĭ��Ϊ�����ǰ̨����һ������������������д������Ȩ������//����Ӧ��ʽ��http://��https://��ͷ����/��β)</td>
    </tr>
    <tr>
      <td class="td_r">Script�����������������Ȩ������</td>
      <td><input name="AdScriptClickDomain" type="text" id="AdScriptClickDomain" value="<%=rs("AdScriptClickDomain")%>" size="70">
	  <br />(Ĭ��Ϊ�գ���������Script��ʾ������д�ˣ��˴�Ӧ����д����Ȩ����������http://��https://��ͷ����/��β)</td>
    </tr>
    <tr>
      <td class="td_r">ֱ��������������Ȩ������</td>
      <td><input name="AdZlDomain" type="text" id="AdZlDomain" value="<%=rs("AdZlDomain")%>" size="70">
	  <br />(Ĭ��Ϊ�����ǰ̨����һ���������д������Ȩ����������http://��https://��ͷ����/��β)</td>
    </tr>
	
    <tr>
      <td class="td_r">����ǰ̨���ʵ���Ȩ������</td>
      <td><input name="AdSysWebDomain" type="text" id="AdSysWebDomain" value="<%=rs("AdSysWebDomain")%>" size="70">
	  <br />(Ĭ��Ϊ�գ���������Script��ʾ������д�ˣ�����ҲӦ����д����Ȩ�������������������www.a.com��a.com������дa.com�Ϳ��ԣ�����������������ʵ����д)</td>
    </tr>


 <tr class="tr_1">
      <td colspan="2">���ؾ������������</td>
    </tr>
    <tr>
      <td class="td_r">���ؾ�����������ʵ�ַ��</td>
      <td>
<input name="CacheServer" type="text" id="CacheServer" value="<%=rs("CacheServer")%>" size="70">
<br />
ע:Ĭ��Ϊ�գ����ֻ��һ��WEBվ�㻺�����������Ҫͬ�������ռ��ɡ�
<br />
����ж��WEBվ������дÿ��վ��(������̨������)����ҳ���ʵ�ַ����http://��https://��ͷ,��/��β��ÿ���м���Ӣ�Ķ���,�ָ�
<br />
��д�˶��������ʱ������Ļ�ȡ������ʱ���������"Script�����ȡ��������"Ҫ��д����ֹ��ȡ���Ĺ���������˿ںź��ϴ����ļ����Ƶĵ�ַ���˿ں�
      </td>
    </tr>
    
<%
CacheServer=RsSet("CacheServer")
CheckTime  = DateDiff("s", "1970-1-1", Now)
CheckCode  = Md5(CheckTime & RsSet("SysCode"), 2)
If CacheServer <> "" Then
%>
<tr>
  <td class="td_r">���ؾ���վ�����м������</td>
  <td>
<%
MyArray = Split(CacheServer, ",")

Response.Write("��" & UBound(MyArray) + 1 & "��վ��<br>")
 For I = 0 To UBound(MyArray)
 Response.Write("��" & I + 1 & "��:<iframe scrolling='no' width='450' height='16' src='" & MyArray(I) & "cf.aspx?Action=cachecheck&CacheServer=" & MyArray(I) & "&CheckTime=" & CheckTime & "&CheckCode=" & CheckCode & "' frameborder='0' marginheight=0 marginwidth=0></iframe><br>")
 Next
%>
</td>
</tr>
<%end if%>
    
    
    <tr> 
	<td></td>
      <td>  
          <input type="submit" name="hostset" id="hostset" value="�޸�" class="btn btn-primary">
     </td>
    </tr>
</form>


</table>
