<%
'�˷�������ϵͳ Sql��
'����QQ��178575
'����EMail��yliangcf@163.com
'������վ��http://www.qqcf.com
'��ϸ��飺http://www.qqcf.com/cfwztg.htm
'�����г���������ʾ����װ��ʾ��ʹ�����ѽ�����°汾���ص�����
'��Ϊ��Щ���ݿ���ʱ�����£���û�з��ڳ�������Լ�����վ�鿴
%>
<!--#Include File="../Conn.asp"-->
<!--#include FILE="MyFunction.asp"-->
<!--#Include File="GetCookie.asp"-->
<!--#include FILE="UpFile_Class.asp"-->
<%
RootPath = HttpPath(2)
RootPath = Mid(RootPath,1,InStrRev(RootPath,"/")-1)
RootPath = Mid(RootPath,1,InStrRev(RootPath,"/"))

UserType=ChkStr(Request("UserType"),1)
Site=ChkStr(Request("Site"),1)


If UserType="aduser" Then'
 If Session("CFWztgAdUser")="" Then  Response.Write "�����µ�¼�����":Response.End
 
 AdUserName=Session("CFWztgAdUser")'--������ϴ��û����̶�
End If

If UserType="adminuser" Then'
 If Session("CFWztgAdmin")="" Then  Response.Write "�����µ�¼����Ա":Response.End

 AdUserName=ChkStr(Request("AdUserName"),1)
End If


If Action="" Then
%>
<style type="text/css">
.btn{
background: #0072C6;
height: 30px;
padding: 0px 17px;
line-height: 28px;
color: #fff;
font-size: 14px;
font-weight: bold;
cursor: pointer;
border: none;
font-family: microsoft yahei;
border-radius: 3px;
}
</style>
<META content="text/html; charset=gbk" http-equiv=Content-Type>
<body style="margin:0px;font-size:12px;background-color:transparent">

<form name="form1" method="post" action="?Action=upsave&UserType=<%=UserType%>&Site=<%=Site%>&AdUserName=<%=AdUserName%>" enctype="multipart/form-data">
<input type=file name="img">
<input type=submit name="submit" value="�ϴ�" class="btn"> 
</form>
<%End If%>


<%If Request("Action")="upsave" Then%>
<%


If RsSet("UploadType")=1 Then
 UpFileType="jpg|gif|swf|exe|apk|ipa" '������ϴ��ļ�����
 MaxFileSize=200*1024 '���������ϴ��ļ������ֽ�
 FormName="img"'�ϴ��ı�����
 SavePath="../upload"   '����ϴ��ļ���Ŀ¼
 If Right(SavePath,1)<>"/" Then SavePath=SavePath&"/" '��Ŀ¼���(/)


 set upfile=new upfile_class ''�����ϴ�����
 upfile.NoAllowExt="asp;htm;html;aspx;cs;vb;js;"	'�����ϴ����͵ĺ�����
 upfile.GetData (10240000)   'ȡ���ϴ�����,��������ϴ�10M

 Set File=UpFile.File(FormName)    
 If file.filesize<100 Then
  Response.Write "<script language='javascript'>" & VbCRlf
  Response.Write "alert('�ļ�̫С�ˣ�');" & VbCrlf
  Response.Write "history.go(-1);" & vbCrlf
  Response.Write "</script>" & VbCRLF
  Response.End
 End If
 If File.filesize>(MaxFileSize) Then
  Response.Write "<script language='javascript'>" & VbCRlf
  Response.Write "alert('�ϴ����ļ���С�������ƣ�');" & VbCrlf
  Response.Write "history.go(-1);" & vbCrlf
  Response.Write "</script>" & VbCRLF
  Response.End
 End If
		
 FileExt=Lcase(File.FileExt)
 FileSizeNum=File.filesize
 ForumUpload=Split(UpFileType,"|")
 For I=0 To Ubound(ForumUpload)
  If fileEXT=Trim(Forumupload(i)) Then
   EnableUpload=True
   Exit For
  End If
 Next
 If FileExt="asp" Or FileExt="asa" or FileExt="aspx" Then EnableUpload=False
 If EnableUpload=False Then
  Response.Write "<script language='javascript'>" & VbCRlf
  Response.Write "alert('�Բ���,��֧�������ļ��ϴ�!');" & VbCrlf
  Response.Write "history.go(-1);" & vbCrlf
  Response.Write "</script>" & VbCRLF
  Response.End
 End If
		

  FileName=year(now)&Right("0"&month(now),2)&Right("0"&day(now),2)&Right("0"&hour(now),2)&Right("0"&minute(now),2)&Right("0"&second(now),2)
  FilePath=SavePath&FileName&"."&FileExt
  FileName_2=FileName&"."&FileExt




 UpFile.SaveToFile FormName,Server.MapPath(FilePath)
 Set UpFile=nothing


End If


If RsSet("UploadType")=2 Then
 Dim Count
 on Error Resume Next
 Set Upload = Server.CreateObject("Persits.Upload") 
 Upload.OverwriteFiles = False   '���ܸ���
 Upload.IgnoreNoPost = True
 Upload.SetMaxSize 10*1024*1024, True	 '���������ϴ��ļ������ֽ�
 Count = Upload.Save
 If Err.Number = 8 Then 
  Response.Write "<script language='javascript'>" & VbCRlf
  Response.Write "alert('�ϴ����ļ���С�������ƣ�');" & VbCrlf
  Response.Write "history.go(-1);" & vbCrlf
  Response.Write "</script>" & VbCRLF
 Else 
  If Err <> 0 Then 
   Response.Write "������Ϣ: " & Err.Description 
  Else
   If Count < 1 Then 
    Response.Write "<script language='javascript'>" & VbCRlf
    Response.Write "alert('����ѡ����Ҫ�ϴ����ļ�!');" & VbCrlf
    Response.Write "history.go(-1);" & vbCrlf
    Response.Write "</script>" & VbCRLF
    Response.End
   End If
   For Each file in Upload.Files	'�г������ϴ��ļ�
	FileExt = Replace(File.ext,".","")
	FileSizeNum=File.Size
	
    If  CheckFileExt(FileExt)=False Then
     Response.Write "<script language='javascript'>" & VbCRlf
     Response.Write "alert('�ļ���ʽ����ȷ!');" & VbCrlf
     Response.Write "history.go(-1);" & vbCrlf
     Response.Write "</script>" & VbCRLF
	 Response.End
    End If
    '�ļ�������ֵ


     FileName_2=year(now)&Right("0"&month(now),2)&Right("0"&day(now),2)&Right("0"&hour(now),2)&Right("0"&minute(now),2)&Right("0"&second(now),2)&"."&FileExt
     FileName="../upload/"&FileName_2

    File.saveas Server.MapPath(FileName)	'�ϴ������ļ�

   Next
  End If 
 End If
 Set Upload =Nothing
End If


  Set Rs=server.createobject("adodb.recordset")
  Sql="Select Top 1 * From CFWztg_Upfile Where AdUserName='"&AdUserName&"' And FileName='"&FileName_2&"'"
  rs.open sql,conn,3,2
  If Rs.Eof Then rs.addnew
  rs("AdUserName")=AdUserName
  rs("FileName")=FileName_2
  rs("FileSizeNum")=FileSizeNum
  rs("AddTime")=Now
  rs.update


    Response.Write "<script language='javascript'>" & VbCRlf

	  If UserType="aduser" Then
		If Site="adadd" Then
		 Response.Write "parent.document.form_adadd.ad_2.value='" & RootPath & "upload/"&FileName_2 & "';" & vbcrlf
		 Response.Write "alert('�ϴ��ɹ�!');" & VbCrlf
		 Response.Write "history.go(-1);" & vbCrlf
		ElseIf Site="imglist" Then
		 Response.Write "parent.location='../"&AdUserManagePath&"/?Action=imglist';" & vbcrlf
		 Response.Write "alert('�ϴ��ɹ�!');" & VbCrlf
		End If
	 End If
	 
	  If UserType="adminuser" Then
		If Site="adadd" Then
		 Response.Write "parent.document.form_adadd.ad_2.value='" & RootPath & "upload/"&FileName_2 & "';" & vbcrlf
		 Response.Write "alert('�ϴ��ɹ�!');" & VbCrlf
		 Response.Write "history.go(-1);" & vbCrlf
		ElseIf Site="imglist" Then
		 Response.Write "parent.location='../"&AdminUserManagePath&"/?Action=imglist&AdUserName="&AdUserName&"';" & vbcrlf
		 Response.Write "alert('�ϴ��ɹ�!');" & VbCrlf
		End If
	 End If    

    Response.Write "</script>" & VbCRLF


Function FixName(UpFileExt)
	If IsEmpty(UpFileExt) Then Exit Function
	FixName = Lcase(UpFileExt)
	FixName = Replace(FixName,Chr(0),"")
	FixName = Replace(FixName,".","")
	FixName = Replace(FixName,"asp","")
	FixName = Replace(FixName,"asa","")
	FixName = Replace(FixName,"aspx","")
	FixName = Replace(FixName,"cer","")
	FixName = Replace(FixName,"cdx","")
	FixName = Replace(FixName,"htr","")
End Function

Function CheckFileExt(FileExt)
	Dim ForumUpload,i
	ForumUpload="jpg,gif,swf,exe"
	ForumUpload=Split(ForumUpload,",")
	CheckFileExt=False
	For i=0 to UBound(ForumUpload)
		If LCase(FileExt)=Lcase(Trim(ForumUpload(i))) Then
			CheckFileExt=True
			Exit Function
		End If
	Next
End Function
%>
<%End If%>