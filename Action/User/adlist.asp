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
Ad_ID=CLng(ChkStr(Request("Ad_ID"),2))

If Request("Ad_Class")<>"" Then Ad_Class=CInt(ChkStr(Request("Ad_Class"),2)) Else Ad_Class = RsSet("AdListDefaultClass")

AdShowType=ChkStr(Request("AdShowType"),1)

ClickState=CInt(ChkStr(Request("ClickState"),2))

Ad_Size=ChkStr(Request("Ad_Size"),1)

If Ad_Size<>"" Then
 AdWidth=ChkStr(Left(Ad_Size,Instr(Ad_Size,"x")-1),2)
 AdHeight=ChkStr(Mid(Ad_Size,Instr(Ad_Size,"x")+1),2)
End If


Sql = "Select ID,AdShowNum,ComVisit,ComReg,UserLevel From CFWztg_User Where UserName='" & UserName & "'"
Set Rs=Conn.Execute(Sql)
UserID = Rs("ID")
UserShowTotal = Rs("AdShowNum")
UserClickTotal = Rs("ComVisit")
UserRegTotal = Rs("ComReg")
UserLevel = Rs("UserLevel")
Rs.Close

%>


<div class="explain">
1."[]"�ڵ����ִ�����������ʽ�������������涼�����ڵ��Ժ��ֻ���Ͷ�ţ�ֻҪ�ߴ��������<br>
2.ֱ������������صĹ�����һ����������ַ���ӣ��ɷ������κεط���û����ʾ��<br>
3.ֱͼ�����ͼƬ��һ�����ӵ���ϣ��ɷ���������ط���������ͨ��ҳ��H5��ҳ��APPӦ�õ��ڣ�����ʾ��<br>
4.��ѭ�����ÿ�ε���һ����棬ˢ�»���һ����棬������JS�������һֱ�̶�����<br>
5.�����Ĺ���Ƕ��������湲��һ�����룬һ��ͬʱ��ʾ������������JS�������һֱ�̶����䣬�������ͼƬ��ǩ�������Լ����ù�����Ŀ�ߡ�<br>
6.��ý����Ĺ��������ֹ��Ч�������½ǣ��������ƶ��豸����
</div>


        
<%If Ad_Class=1 Or Ad_Class=2 Or Ad_Class=3 Or Ad_Class=4 Or Ad_Class=7 Then'--ֱ�����֣�ֱ��ͼƬ����ͨ���֣���ͨͼƬ����ý��%>
<!--#Include File="adlist_common.asp"-->
<%End If%>

<%If Ad_Class=5 Then'--�������%>
<!--#Include File="adlist_5.asp"-->
<%End If%>

<%If Ad_Class=6 Then'--���ͼƬ%>
<!--#Include File="adlist_6.asp"-->
<%End If%>

<%If Ad_Class=8 Or Ad_Class=9 Then'--ǿ�����˵�Then%>
<!--#Include File="adlist_popup.asp"-->
<%End If%>

<%If Ad_Class=10 Then'--��ϱ�ǩ��%>
<!--#Include File="adlist_10.asp"-->
<%End If%>

<%If Ad_Class=0 Then'--������%>
<!--#Include File="adlist_0.asp"-->
<%End If%>

<%If Ad_Class = -1 Then'--��ѭֱ��%>
<!--#Include File="adlist_1.asp"-->
<%End If%>

<%If Ad_Class = -4 Then'--��ѭͼƬ%>
<!--#Include File="adlist_4.asp"-->
<%End If%>

<%If Ad_Class = -7 Then'--��ѭ��ý��%>
<!--#Include File="adlist_7.asp"-->
<%End If%>

<%If Ad_Class = 11 Then'--��ϸ�ý��%>
<!--#Include File="adlist_11.asp"-->
<%End If%>

<%If Ad_Class=12 Then'--������ذ�װ%>
<!--#Include File="adlist_12.asp"-->
<%End If%>

