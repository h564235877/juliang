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
If Request("RecCodeType")="" Then RecCodeType=1 Else RecCodeType=CInt(ChkStr(Request("RecCodeType"),2))
%>

<script src="../../js/clipboard.min.js"></script>
<ul class="tab">
<li><a href="?Action=<%=Action%>&RecCodeType=1"<%If RecCodeType=1 Then Response.write " class='selected'"%>><span>CPAע��ӿ�</span></a></li>
<li><a href="?Action=<%=Action%>&RecCodeType=2"<%If RecCodeType=2 Then Response.write " class='selected'"%>><span>CPS�����ӿ�</span></a></li>
<li><a href="?Action=<%=Action%>&RecCodeType=3"<%If RecCodeType=3 Then Response.write " class='selected'"%>><span>CPS������ѯ�ӿ�</span></a></li>
<li><a href="?Action=<%=Action%>&RecCodeType=4"<%If RecCodeType=4 Then Response.write " class='selected'"%>><span>CPS����ȷ�Ͻӿ�</span></a></li>
<li><a href="?Action=<%=Action%>&RecCodeType=5"<%If RecCodeType=5 Then Response.write " class='selected'"%>><span>���ȷ�ϼ�����PV����</span></a></li>
</ul>


<%If RecCodeType=1 Then%>
<table class="tb_1">
<tr class="tr_1"> 
<td>CPAע��ӿ�</td>
</tr>
<tr> 
<td>
checkcode:�����ӿ���֤�룬��ʽ��md5(lowusername&�ӿ���Կ)������&Ϊasp���ַ������кͲ��ķ��ţ�PHP��Ϊ.�ţ���濪����URL��֤���ֵ�����</td>
</tr>

<tr> 
<td>����1:(Iframe��ʽ���� ,�޸�����վ���û�ע��ҳ��,ע��ɹ���ִ�д˴���,��ת��ע��ɹ����ҳ��,����Ϊ�Ƽ�ע����û�Ϊ�����û���������Ϊusername(����),checkcode(�������￪����Url��֤���Ҳ����))</td>
</tr>
<tr> 
<td><textarea id="rec1" cols="80" rows="3"><iframe src='<%=AdPath%>cf.aspx?action=lowreg&lowusername=&checkcode=' frameBorder=0 width=0 height=0 marginheight=0 marginwidth=0 scrolling=no></iframe></textarea> 
<input type="button" value="����" id="copy1" data-clipboard-target="#rec1" data-clipboard-action="copy" class="btn btn-primary">
<script>    
    $(function(){
        var clipboard = new Clipboard('#copy1');
        clipboard.on('success', function(e) {
            e.clearSelection();
            console.log(e.clearSelection);
        });
    });
</script>

</td>
</tr>
  
<tr>
<td>����2:url��ʽ���� ,�û���ע��ҳ��ע����ڽ����ҳ��Ͷ������Ĵ��룬�����ҳ���url����û������û���������Ϊusername(����),checkcode(�������￪����Url��֤���Ҳ����)</td>
</tr>
<tr> 
<td>
<textarea id="rec2" cols="80" rows="10">
<script> 
var lowusername="";
var checkcode="";
myurl = window.location.href; 
pos = myurl.indexOf("?")
if(pos>0){
 parastr = myurl.substring(pos+1);
 if (myurl.indexOf("&")==-1){ 
   pos = parastr.indexOf("="); 
   if(parastr.substring(0,pos).toLowerCase()=="username"){
    lowusername=parastr.substring(pos+1); 
   }
 }
 else{
  para = parastr.split("&"); 
  for(i=0;i<para.length;i++){ 
   mystr = para[i];
   pos = mystr.indexOf("="); 
   if(mystr.substring(0,pos).toLowerCase()=="username"){
    lowusername=mystr.substring(pos+1); 
   }
   if(mystr.substring(0,pos).toLowerCase()=="checkcode"){
    checkcode=mystr.substring(pos+1); 
   }
  } 
 }
}
if(lowusername!=""){
 document.write("<iframe src='<%=AdPath%>cf.aspx?action=lowreg&lowusername="+lowusername+"&checkcode="+checkcode+"' frameBorder=0 width=0 height=0 marginheight=0 marginwidth=0 scrolling=no></iframe>");
}
</script></textarea>

<input type="button" value="����" id="copy2" data-clipboard-target="#rec2" data-clipboard-action="copy" class="btn btn-primary">
<script>    
    $(function(){
        var clipboard = new Clipboard('#copy2');
        clipboard.on('success', function(e) {
            e.clearSelection();
            console.log(e.clearSelection);
        });
    });
</script>

</td>
</tr>
</table>
<%End If%>


<%If RecCodeType=2 Then%>
<table class="tb_1">
<tr class="tr_1"> 
<td>CPS�����ӿ�</td>
</tr>
<tr>
<td><p>��ѳɹ��������ѵĶ����ò������ݵ����½ӿڣ�<br>
<textarea id="rec1" cols="80" rows="6"><iframe src='<%=AdPath%>cf.aspx?action=orderadd&adusername=<%=AdUserName%>&ad_id=&ordercode=&orderuser=&orderusertype=&ordercent=&ordertcrate=&tcobject=&tctype=&checkcode=&goodsname=&goodstotal=&goodstime=&goodstime=&exname=&excode=&exstate=&excontent=&orderdesc=' frameBorder=0 width=350 height=12 marginheight=0 marginwidth=0 scrolling=no></iframe></textarea>

<input type="button" value="����" id="copy1" data-clipboard-target="rec1" class="btn btn-primary">
<script type="text/javascript">
var clip = new ZeroClipboard( document.getElementById("copy1") );
</script>

<p>����˵����<br>
1.ad_id:���뵽�ĸ�CPS����ID��<br>
2.ordercode:��������<br>
3.orderuser:�����û����û���<br>
4.orderusertype:�����û����û������ͣ�1ΪӢ���û�����2Ϊ����ID<br>
5.ordercent:���������֣���ԪΪ��λ<br>
6.ordertcrate:������ɱ��������֣�0-100֮��Ϊ��ʱ��ΪϵͳĬ����ɱ���<%=RsSet("UserOrderTcRate")%>%<br>
7.tcobject:������ɸ�˭��1�����˵��Ƽ��ˣ�2�������Լ�<br>
8.tctype:����������ͣ�1��ʱ��ɣ�2�ȴ�ȷ��<br>
9.checkcode:�����ӿ���֤�룬��ʽ����<br />
asp��asp.net��ʽ��md5(ad_id&ordercode&orderuser&orderusertype&ordercent&ordertcrate&tcobject&tctype&�ӿ���Կ)<br />
php��ʽ��md5($ad_id.$ordercode.$orderuser.$orderusertype.$ordercent.$ordertcrate.$tcobject.$tctype.$�ӿ���Կ)<br /><br />
����1-9Ϊ����д������md5�����������˳���ܻ��ң�����Ϊ��ѡ����������������<br><br />
10.goodsname:��Ʒ����<br>
11.goodstotal:��Ʒ�ܹ�������<br>
12.goodstime:��Ʒ����ʱ��,��д�Ļ���ʽ��:1970-1-1 0:0:0<br>
13.exname:�������<br>
14.excode:��ݵ���<br>
15.exstate:���״̬<br>
16.excontent:��ݽ���<br>
17.orderdesc:������������<br>
</td>
</tr>
</table>
<%End If%>

<%If RecCodeType=3 Then%>
<table class="tb_1">
<tr class="tr_1"> 
<td>CPS������ѯ�ӿ�</td>
</tr>
<tr>
<td><p>��ѯ�����Ƿ����ƹ�ϵͳ����ڣ�<br>
<textarea id="rec1" cols="80" rows="5"><iframe src='<%=AdPath%>cf.aspx?action=orderquery&adusername=<%=adusername%>&orderuser=&orderusertype=&ordercode=&ordercent=&ordertcrate=&tcobject=&tctype=&goodsname=&goodstime=' frameBorder=0 width=170 height=12 marginheight=0 marginwidth=0 scrolling=no></iframe></textarea>

<input type="button" value="����" id="copy1" data-clipboard-target="rec1" class="btn btn-primary">
<script type="text/javascript">
var clip = new ZeroClipboard( document.getElementById("copy1") );
</script>
          
<p>����˵����<br>
1.ordercode:��������<br>
2.orderusertype:�����û����û������ͣ�1ΪӢ���û�����2Ϊ����ID
<br>	
<br>
</td>
</tr>

</table>
<%End If%>


<%If RecCodeType=4 Then%>
<table class="tb_1">
<tr class="tr_1"> 
<td>CPS����ȷ�Ͻӿ�</td>
</tr>
<tr>
<td><p>�ȴ�ȷ�ϵĶ�������������ӿ�ȷ�ϣ�<br>
<textarea id="rec1" cols="80" rows="5"><iframe src='<%=AdPath%>cf.aspx?action=orderaffirm&ordercode=&checkcode=' frameBorder=0 width=170 height=12 marginheight=0 marginwidth=0 scrolling=no></iframe></textarea>

<input type="button" value="����" id="copy1" data-clipboard-target="rec1" class="btn btn-primary">
<script type="text/javascript">
var clip = new ZeroClipboard( document.getElementById("copy1") );
</script>
          
<p>����˵����<br>
1.ordercode:��������<br>
2.checkcode:�����ӿ���֤�룬��ʽ��md5(ordercode&�ӿ���Կ)������&Ϊasp���ַ������кͲ��ķ��ţ�PHP��Ϊ.�ţ�������˳���ܻ���<br>		
<br>
</td>
</tr>

</table>
<%End If%>


<%If RecCodeType=5 Then%>
<table class="tb_1">
<tr class="tr_1"> 
<td>���ȷ�ϼ�����PV�����ӿڴ���</td>
</tr>
<tr> 
<td>���÷���1���������ҳ�������������Ĵ��룬javascript���÷�ʽ,�ܲ���PV����PV�����ӿڴ��룬��Ӧ��������Ҫȷ�ϵĹ��Ĺ�����ӱ������ad_id={ad_id}�Ĳ�����ǩ</td>
</tr>
<tr>
<td>
<textarea id="rec1" cols="80" rows="10"><script> 
var ad_id="";
myurl = window.location.href; 
pos = myurl.indexOf("?")
if(pos>0){
 parastr = myurl.substring(pos+1);
 if (myurl.indexOf("&")==-1){ 
   pos = parastr.indexOf("="); 
   if(parastr.substring(0,pos).toLowerCase()=="ad_id"){
    ad_id=parastr.substring(pos+1); 
   }
 }
 else{
  para = parastr.split("&"); 
  for(i=0;i<para.length;i++){ 
   mystr = para[i];
   pos = mystr.indexOf("="); 
   if(mystr.substring(0,pos).toLowerCase()=="ad_id"){
    ad_id=mystr.substring(pos+1); 
   }
  } 
 }
}
if(ad_id!=""){
 document.write("<scr"+"ipt src='<%=AdPath%>cf.aspx?action=adaffirm&adusername=<%=adusername%>&ad_id="+ad_id+"&delaytime=&adaffirmstep=&adaffirmselfstr=&adaffirmtime=&adaffirmcheckcode=&otherclass=&otherflag=' charset='gbk'></scr"+"ipt>");
}
</script></textarea>

<input type="button" value="����" id="copy1" data-clipboard-target="rec1" class="btn btn-primary">
<script type="text/javascript">
var clip = new ZeroClipboard( document.getElementById("copy1") );
</script>
          
<p>����˵����<br>
1.adusername�����������<br>
2.ad_id�����ID(�Զ���ȡurl���ad_id����ֵ������д)<br>
3.delaytime:��ʱȷ�ϵ�������Ϊ��ʱ����ʱ��ʱȷ�ϵ�����Ǳ�ѡ��<br>
4.adaffirmstep:��ǰ�ǵڼ���ȷ�� ,Ϊ��ʱ������������֤�����֧��3��˳��ȷ�ϲ��裬�Ǳ�ѡ��<br>
5.adaffirmselfstr:�Լ�����Ĳ������Ǳ�ѡ��<br>
6.adaffirmtime:����1970-1-1������Ϊ��ʱΪ����֤���Ǳ�ѡ��<br>
7.adaffirmcheckcode:��֤��,Md5(AdUserName & AD_ID & DelayTime & AdAffirmStep & AdAffirmSelfStr & AdAffirmTime & �û�IP & �������Կ)���Ǳ�ѡ��<br>
8.otherclass:����ͳ�Ʒ��������Ǳ�ѡ��<br>
9.otherflag:����ͳ�Ƶı�ʶ���Ǳ�ѡ��<br>

</td>
</tr>
<tr> 
<td>���÷���2���ڹ��ҳ��������ϰ����淽���������ܲ���PV��</td>
</tr>

<tr>
<td>
<textarea id="rec2" cols="80" rows="5"><%=AdPath%>cf.aspx?action=adaffirmdo&adusername=<%=adusername%>&ad_id=&delaytime=&adaffirmstep=&adaffirmselfstr=&adaffirmtime=&adaffirmcheckcode=&otherclass=&otherflag=&reurl=</textarea>

<input type="button" value="����" id="copy2" data-clipboard-target="rec2" class="btn btn-primary">
<script type="text/javascript">
var clip = new ZeroClipboard( document.getElementById("copy2") );
</script>
          
<p>����˵����<br>
1.reurl:ȷ�ϵ����ת���ĸ�URL��������ת�򣬱�ѡ��<br>
</td>
</tr>
</table>
<%End If%>