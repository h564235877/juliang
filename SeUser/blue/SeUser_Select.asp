<%
'�˷�������ϵͳ Sql��
'����QQ��178575
'����EMail��yliangcf@163.com
'������վ��http://www.qqcf.com
'��ϸ��飺http://www.qqcf.com/cfwztg.htm
'�����г���������ʾ����װ��ʾ��ʹ�����ѽ�����°汾���ص�����
'��Ϊ��Щ���ݿ���ʱ�����£���û�з��ڳ�������Լ�����վ�鿴
%>
<%If Action="main" Then%>
<!--#include file="../../Action/SeUser_Blue/main.asp"-->
<%End If%>

<%If Action="lowview" Then%>
<!--#include file="../../Action/SeUser/lowview.asp"-->
<%end if%>

<%If Action="daytj" Then%>
<!--#include file="../../Action/SeUser/daytj.asp"-->
<%end if%>

<%If Action="daytjdetail" Then%>
<!--#include file="../../Action/SeUser/daytjdetail.asp"-->
<%end if%>

<%If Action="spendlist" Then%>
<!--#include file="../../Action/SeUser/spendlist.asp"-->
<%End If%>

<%If Action="spendadd" Then%>
<!--#include file="../../Action/SeUser/spendadd.asp"-->
<%End If%> 


<%If Action="pwdmodify" Or Action="pwdanswermodify" Or Action="userpaymodify" Or Action="datamodify" Or Action="bindusermodify" Then%>

<ul class="tab">
<li><a href="?Action=pwdmodify"<%If Action="pwdmodify" Then Response.write " class='selected'"%>><span>�޸�����</span></a></li>
<li><a href="?Action=pwdanswermodify"<%If Action="pwdanswermodify" Then Response.write " class='selected'"%>><span>�޸����뱣��</span></a></li>
<li><a href="?Action=userpaymodify"<%If Action="userpaymodify" Then Response.write " class='selected'"%>><span>�޸Ļ�ʽ</span></a></li>
<li><a href="?Action=datamodify"<%If Action="datamodify" Then Response.write " class='selected'"%>><span>�޸�����</span></a></li>
<li><a href="?Action=bindusermodify"<%If Action="bindusermodify" Then Response.write " class='selected'"%>><span>���������޸�</span></a></li>
</ul>


<%End If%>

<%If Action="pwdmodify" Then%>
<!--#include file="../../Action/SeUser/pwdmodify.asp"-->
<%End if%>

<%If Action="pwdanswermodify" Then%>
<!--#include file="../../Action/SeUser/pwdanswermodify.asp"-->
<%End if%>
		
<%If Action="userpaymodify" then%>
<!--#include file="../../Action/SeUser/userpaymodify.asp"-->
<%End If%>

<%If Action="datamodify" Then%>
<!--#include file="../../Action/SeUser/datamodify.asp"-->
<%End If%>

<%If Action="bindusermodify" Then%>
<!--#include file="../../Action/SeUser/bindusermodify.asp"-->
<%End If%>


<%If Action="sysinfolist" Then%>
<!--#include file="../../Action/SeUser/sysinfolist.asp"-->
<%End If%>

<%If Action="sysinfoshow" Then%>
 <!--#include file="../../Action/SeUser/sysinfoshow.asp"-->
<%End If%>
	
<%If Action="gbooklist" Then%> 
 <!--#include file="../../Action/SeUser/gbooklist.asp"-->
<%End IF%>

<%If Action="gbookadd" Then%> 
 <!--#include file="../../Action/SeUser/gbookadd.asp"-->
<%End IF%>
