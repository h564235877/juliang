<%
'�˷�������ϵͳ Sql��
'����QQ��178575
'����EMail��yliangcf@163.com
'������վ��http://www.qqcf.com
'��ϸ��飺http://www.qqcf.com/cfwztg.htm
'�����г���������ʾ����װ��ʾ��ʹ�����ѽ�����°汾���ص�����
'��Ϊ��Щ���ݿ���ʱ�����£���û�з��ڳ�������Լ�����վ�鿴
%>

 
<form name="form2" method="post" action="../../AdminUser.aspx?Action=sysmodifysave&Label=<%=Label%>">
<table class="tb_1">
<tr class="tr_1"> 
<td colspan="2">��������</td>
</tr>

<tr>
<td class="td_r" width="280">ǰ̨����ϵͳ���������Ĺ����ʾ����</td>
<td><input name="WebDataShow" type="text" value="<%=Rs("WebDataShow")%>"><br />
(ע��ֵΪ-1�ر���ʾ��0������Ϊ������ʾ������Ϊ��ʵ����ʾ���ϼ��ϵ���)</td>
</tr>

<tr>
<td class="td_r">ǰ̨������ʾ�����¼��ʱ�䣺</td>
<td><input name="WebDataSpaceTime" type="text" value="<%=Rs("WebDataSpaceTime")%>">
����(Ĭ�ϣ�30���ӣ�0Ϊ��ʱ)</td>
</tr>

<tr>
<td class="td_r">��Ϲ�汣��IP���ٷ��ӣ�</td>
<td>
<input name="MixAdEffectTime" type="text" id="MixAdEffectTime" value="<%=rs("MixAdEffectTime")%>">
</td>
</tr>
 
<tr>
<td class="td_r">��Ϲ�����Iframe���Զ�������</td>
<td>
<input name="MixAdIframeOpen" type="radio" value="1"<%If Rs("MixAdIframeOpen")=1 Then Response.Write " checked"%>>�� 
<input name="MixAdIframeOpen" type="radio" value="0"<%If Rs("MixAdIframeOpen")=0 Then Response.Write " checked"%>>��
</td>
</tr>

<tr>
<td class="td_r">�Ƿ�����תҳ����ʾ�۵���Ϣ��</td>
<td>
<input name="DeductClickInfo" type="radio" value="1"<%If Rs("DeductClickInfo")=1 Then Response.Write " checked"%>>�� 
<input name="DeductClickInfo" type="radio" value="0"<%If Rs("DeductClickInfo")=0 Then Response.Write " checked"%>>��
</td>
</tr>

<tr>
<td class="td_r">�������漰������ʶ���ã�</td>
<td>
<input name="AllSearch" type="text" id="AllSearch" value="<%=rs("AllSearch")%>">
</td>
</tr>

<tr>
<td class="td_r">��ͨ�û�ע��ʱ�Ƿ����ѡ��ͨ�����ܣ�</td>
<td>
<input name="UseAgentReg" type="radio" value="1"<%If Rs("UseAgentReg")=1 Then Response.Write " checked"%>>�� 
<input name="UseAgentReg" type="radio" value="0"<%If Rs("UseAgentReg")=0 Then Response.Write " checked"%>>��
</td>
</tr>


<tr class="tr_1"> 
<td colspan="2">��վ����ȡ����б�</td>
</tr>
<tr>
<td class="td_r">��վ���б��ʱĬ����ʾ���</td>
<td>
<select name="AdListDefaultClass" id="AdListDefaultClass">
<option value="-7"<%If Rs("AdListDefaultClass")=-7 Then Response.write " selected"%>>��ѭ��ý��</option>
<option value="-1"<%If Rs("AdListDefaultClass")=-1 Then Response.write " selected"%>>��ѭֱ��</option>
<option value="-4"<%If Rs("AdListDefaultClass")=-4 Then Response.write " selected"%>>��ѭ��ͨͼƬ</option>
<option value="8"<%If Rs("AdListDefaultClass")=8 Then Response.write " selected"%>>ǿ����ѭ</option>
<option value="9"<%If Rs("AdListDefaultClass")=9 Then Response.write " selected"%>>�˵���ѭ</option>

<option value="5"<%If Rs("AdListDefaultClass")=5 Then Response.write " selected"%>>�������</option>
<option value="6"<%If Rs("AdListDefaultClass")=6 Then Response.write " selected"%>>���ͼƬ</option>
<option value="10"<%If Rs("AdListDefaultClass")=10 Then Response.write " selected"%>>��ϱ�ǩ��</option>
<option value="11"<%If Rs("AdListDefaultClass")=11 Then Response.write " selected"%>>��ϸ�ý��</option>

<option value="1"<%If Rs("AdListDefaultClass")=1 Then Response.write " selected"%>>ֱ�����</option>
<option value="2"<%If Rs("AdListDefaultClass")=2 Then Response.write " selected"%>>ֱͼ���</option>
<option value="3"<%If Rs("AdListDefaultClass")=3 Then Response.write " selected"%>>��ͨ����</option>
<option value="4"<%If Rs("AdListDefaultClass")=4 Then Response.write " selected"%>>��ͨͼƬ</option>
<option value="7"<%If Rs("AdListDefaultClass")=7 Then Response.write " selected"%>>��ý��</option>
<option value="12"<%If Rs("AdListDefaultClass")=12 Then Response.write " selected"%>>������ذ�װ</option>
<option value="0"<%If Rs("AdListDefaultClass")=0 Then Response.write " selected"%>>������</option>
</select>
</td>
</tr>

<tr>
<td class="td_r">��վ���б���Ҫ�򿪵ķ������֣�</td>
<td>
<input type="checkbox" name="AdListOpenClass" value="-7"<%if Instr(Rs("AdListOpenClass"),",-7,")>0 Then Response.write " checked"%>>��ѭ��ý��
<input type="checkbox" name="AdListOpenClass" value="-1"<%if Instr(Rs("AdListOpenClass"),",-1,")>0 Then Response.write " checked"%>>��ѭֱ��
<input type="checkbox" name="AdListOpenClass" value="-4"<%if Instr(Rs("AdListOpenClass"),",-4,")>0 Then Response.write " checked"%>>��ѭ��ͨͼƬ
<input type="checkbox" name="AdListOpenClass" value="8"<%if Instr(Rs("AdListOpenClass"),",8,")>0 Then Response.write " checked"%>>��ѭǿ��
<input type="checkbox" name="AdListOpenClass" value="9"<%if Instr(Rs("AdListOpenClass"),",9,")>0 Then Response.write " checked"%>>��ѭ�˵�

<br>
<input type="checkbox" name="AdListOpenClass" value="11"<%if Instr(Rs("AdListOpenClass"),",11,")>0 Then Response.write " checked"%>>��ϸ�ý��
<input type="checkbox" name="AdListOpenClass" value="5"<%if Instr(Rs("AdListOpenClass"),",5,")>0 Then Response.write " checked"%>>�������
<input type="checkbox" name="AdListOpenClass" value="6"<%if Instr(Rs("AdListOpenClass"),",6,")>0 Then Response.write " checked"%>>���ͼƬ
<input type="checkbox" name="AdListOpenClass" value="10"<%if Instr(Rs("AdListOpenClass"),",10,")>0 Then Response.write " checked"%>>��ϱ�ǩ��

<br>
<input type="checkbox" name="AdListOpenClass" value="1"<%if Instr(Rs("AdListOpenClass"),",1,")>0 Then Response.write " checked"%>>ֱ�����
<input type="checkbox" name="AdListOpenClass" value="2"<%if Instr(Rs("AdListOpenClass"),",2,")>0 Then Response.write " checked"%>>ֱͼ���
<input type="checkbox" name="AdListOpenClass" value="3"<%if Instr(Rs("AdListOpenClass"),",3,")>0 Then Response.write " checked"%>>��ͨ����
<input type="checkbox" name="AdListOpenClass" value="4"<%if Instr(Rs("AdListOpenClass"),",4,")>0 Then Response.write " checked"%>>��ͨͼƬ
<input type="checkbox" name="AdListOpenClass" value="7"<%if Instr(Rs("AdListOpenClass"),",7,")>0 Then Response.write " checked"%>>��ý��
<input type="checkbox" name="AdListOpenClass" value="12"<%if Instr(Rs("AdListOpenClass"),",12,")>0 Then Response.write " checked"%>>������ذ�װ
<input type="checkbox" name="AdListOpenClass" value="0"<%if Instr(Rs("AdListOpenClass"),",0,")>0 Then Response.write " checked"%>>������
</td>
</tr>


<tr class="tr_1"> 
<td colspan="2">��վ��������ǰ̨��ʾ��ͳ�ƹ��ܣ�</td>
</tr>
<tr>
<td class="td_r">ͳ�ƹ��ܣ�</td>
<td>
<input type="checkbox" name="UserOpenShow" value="daytj"<%if Instr(Rs("UserOpenShow"),",daytj,")>0 Then Response.write " checked"%>>ÿ��ͳ��
<input type="checkbox" name="UserOpenShow" value="hourtj"<%if Instr(Rs("UserOpenShow"),",hourtj,")>0 Then Response.write " checked"%>>ÿСʱͳ��
<input type="checkbox" name="UserOpenShow" value="iplist"<%if Instr(Rs("UserOpenShow"),",iplist,")>0 Then Response.write " checked"%>>��Ч���IP
<input type="checkbox" name="UserOpenShow" value="invalidiplist"<%if Instr(Rs("UserOpenShow"),",invalidiplist,")>0 Then Response.write " checked"%>>��Ч���IP
<input type="checkbox" name="UserOpenShow" value="showlist"<%if Instr(Rs("UserOpenShow"),",showlist,")>0 Then Response.write " checked"%>>�����ʾ

<input type="checkbox" name="UserOpenShow" value="searchkeywordtj"<%if Instr(Rs("UserOpenShow"),",searchkeywordtj,")>0 Then Response.write " checked"%>>�����ؼ���
<input type="checkbox" name="UserOpenShow" value="lylist"<%if Instr(Rs("UserOpenShow"),",lylist,")>0 Then Response.write " checked"%>>�����Դ
<input type="checkbox" name="UserOpenShow" value="ipareatj"<%if Instr(Rs("UserOpenShow"),",ipareatj,")>0 Then Response.write " checked"%>>IP����
<input type="checkbox" name="UserOpenShow" value="webwidthtj"<%if Instr(Rs("UserOpenShow"),",webwidthtj,")>0 Then Response.write " checked"%>>��ҳ���

<input type="checkbox" name="UserOpenShow" value="othertj"<%if Instr(Rs("UserOpenShow"),",othertj,")>0 Then Response.write " checked"%>>����ͳ��

<br>



<input type="checkbox" name="UserOpenShow" value="lowview"<%if Instr(Rs("UserOpenShow"),",lowview,")>0 Then Response.write " checked"%>>CPA�б�
<input type="checkbox" name="UserOpenShow" value="lowdaytj"<%if Instr(Rs("UserOpenShow"),",lowdaytj,")>0 Then Response.write " checked"%>>CPAͳ��
<input type="checkbox" name="UserOpenShow" value="orderview"<%if Instr(Rs("UserOpenShow"),",orderview,")>0 Then Response.write " checked"%>>CPS����
<input type="checkbox" name="UserOpenShow" value="orderdaytj"<%if Instr(Rs("UserOpenShow"),",orderdaytj,")>0 Then Response.write " checked"%>>CPS����[������ʱ��]
<input type="checkbox" name="UserOpenShow" value="orderdaytjgoodstime"<%if Instr(Rs("UserOpenShow"),",orderdaytjgoodstime,")>0 Then Response.write " checked"%>>CPS������[������ʱ��]
<input type="checkbox" name="UserOpenShow" value="lowuniondaytj"<%if Instr(Rs("UserOpenShow"),",lowuniondaytj,")>0 Then Response.write " checked"%>>�¼�����
<input type="checkbox" name="UserOpenShow" value="lowuniondatarecview"<%if Instr(Rs("UserOpenShow"),",lowuniondatarecview,")>0 Then Response.write " checked"%>>�¼��������ݵ���
<input type="checkbox" name="UserOpenShow" value="agentaddaytj"<%if Instr(Rs("UserOpenShow"),",agentaddaytj,")>0 Then Response.write " checked"%>>����������ͳ��
</td>
</tr>


<tr class="tr_1"> 
<td colspan="2">���Logo����</td>
</tr>

<tr>
<td class="td_r">��ͨͼƬ�ͻ���������Ƿ�������logo���ܣ�</td>
<td>
<input name="AdLogoOpen" type="radio" value="0"<%If Rs("AdLogoOpen")=0 Then Response.Write " checked"%>>�ر�
<input name="AdLogoOpen" type="radio" value="1"<%If Rs("AdLogoOpen")=1 Then Response.Write " checked"%>>��������Сlogo������ȥ��ɴ�logo
<input name="AdLogoOpen" type="radio" value="2"<%If Rs("AdLogoOpen")=2 Then Response.Write " checked"%>>������ʼ�մ�logo
<input name="AdLogoOpen" type="radio" value="3"<%If Rs("AdLogoOpen")=3 Then Response.Write " checked"%>>������ʼ��Сlogo
</td>
</tr>

<tr>
<td class="td_r">����Сlogo�Ŀ�ȶ������أ�</td>
<td>
<input name="AdLogoSmallWidth" type="text" id="AdLogoSmallWidth" value="<%=rs("AdLogoSmallWidth")%>">
</td>
</tr>

<tr>
<td class="td_r">����Сlogo�ĸ߶ȶ������أ�</td>
<td>
<input name="AdLogoSmallHeight" type="text" id="AdLogoSmallHeight" value="<%=rs("AdLogoSmallHeight")%>">
</td>
</tr>

<tr>
<td class="td_r">���˴�logo�Ŀ�ȶ������أ�</td>
<td>
<input name="AdLogoLargeWidth" type="text" id="AdLogoLargeWidth" value="<%=rs("AdLogoLargeWidth")%>">
</td>
</tr>

<tr>
<td class="td_r">���˴�logo�ĸ߶ȶ������أ�</td>
<td>
<input name="AdLogoLargeHeight" type="text" id="AdLogoLargeHeight" value="<%=rs("AdLogoLargeHeight")%>">
</td>
</tr>


      <tr> 
        <td>&nbsp;</td>
        <td>

<input type="submit" name="submit" value="�޸�" class="btn btn-primary">
          ���� 
 </td>
      </tr>
</table></form>
