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
'����Ϊ���ú���
Function AlertRef(ByVal AlertStr)
        Response.Write("<!DOCTYPE HTML>")
        Response.Write("<link rel='stylesheet' href='css/BeAlert.css'>")
        Response.Write("<script src='js/jquery.min.js'></script>")
        Response.Write("<script src='js/BeAlert.js'></script>")
		
        Response.Write("<link rel='stylesheet' href='../css/BeAlert.css'>")
        Response.Write("<script src='../js/jquery.min.js'></script>")
        Response.Write("<script src='../js/BeAlert.js'></script>")
		
        Response.Write("<link rel='stylesheet' href='../../css/BeAlert.css'>")
        Response.Write("<script src='../../js/jquery.min.js'></script>")
        Response.Write("<script src='../../js/BeAlert.js'></script>")

	Response.Write("<script>")
	If AlertStr = "" Then
		If Request.ServerVariables("Http_Referer") <> "" Then
			Response.Write("location.href='" & Request.ServerVariables("Http_Referer") & "';")
		Else
			Response.Write("location.href='" & HttpPath(5) & "';")
		End If
	Else
		If Request.ServerVariables("Http_Referer") <> "" Then
			Response.Write("$(function () { alert('" & AlertStr & "','', function () {location.href='" & Request.ServerVariables("Http_Referer") & "';}, {type: 'error', confirmButtonText: 'ȷ��'});});")
		Else
			Response.Write("$(function () { alert('" & AlertStr & "','', function () {location.href='" & HttpPath(5) & "';}, {type: 'error', confirmButtonText: 'ȷ��'});});")
		End If
	End If
	Response.Write("</script>")
	Response.End()
End Function

Function GoBack(ByVal Str,ByVal AlertStr) 'Ϊ��ʱ����
	If Str = "" Then
        Response.Write("<!DOCTYPE HTML>")
        Response.Write("<link rel='stylesheet' href='css/BeAlert.css'>")
        Response.Write("<script src='js/jquery.min.js'></script>")
        Response.Write("<script src='js/BeAlert.js'></script>")
		
        Response.Write("<link rel='stylesheet' href='../css/BeAlert.css'>")
        Response.Write("<script src='../js/jquery.min.js'></script>")
        Response.Write("<script src='../js/BeAlert.js'></script>")
		
        Response.Write("<link rel='stylesheet' href='../../css/BeAlert.css'>")
        Response.Write("<script src='../../js/jquery.min.js'></script>")
        Response.Write("<script src='../../js/BeAlert.js'></script>")

		Response.Write("<script>")
		If AlertStr = "" Then
			Response.Write("history.go(-1)")
		Else
			Response.Write("$(function () { alert('" & AlertStr & "','', function () {history.go(-1);}, {type: 'error', confirmButtonText: 'ȷ��'});});")
		End If
		Response.Write("</script>")
		Response.End()
	Else
		GoBack = Str
	End If
End Function

Function AlertBack(ByVal AlertStr,ByVal BackNum) 
        Response.Write("<!DOCTYPE HTML>")
        Response.Write("<link rel='stylesheet' href='css/BeAlert.css'>")
        Response.Write("<script src='js/jquery.min.js'></script>")
        Response.Write("<script src='js/BeAlert.js'></script>")
		
        Response.Write("<link rel='stylesheet' href='../css/BeAlert.css'>")
        Response.Write("<script src='../js/jquery.min.js'></script>")
        Response.Write("<script src='../js/BeAlert.js'></script>")
		
        Response.Write("<link rel='stylesheet' href='../../css/BeAlert.css'>")
        Response.Write("<script src='../../js/jquery.min.js'></script>")
        Response.Write("<script src='../../js/BeAlert.js'></script>")

        Response.Write("<script>")
        If AlertStr = "" Then
            Response.Write("history.go(-" & BackNum & ");")
        Else
            Response.Write("$(function () { alert('" & AlertStr & "','', function () {history.go(-" & BackNum & ");}, {type: 'error', confirmButtonText: 'ȷ��'});});")
        End If
        Response.Write("</script>")
        Response.End()
End Function

Function AlertUrl(ByVal AlertStr,ByVal Url) 
        Response.Write("<!DOCTYPE HTML>")
        Response.Write("<link rel='stylesheet' href='css/BeAlert.css'>")
        Response.Write("<script src='js/jquery.min.js'></script>")
        Response.Write("<script src='js/BeAlert.js'></script>")
		
        Response.Write("<link rel='stylesheet' href='../css/BeAlert.css'>")
        Response.Write("<script src='../js/jquery.min.js'></script>")
        Response.Write("<script src='../js/BeAlert.js'></script>")
		
        Response.Write("<link rel='stylesheet' href='../../css/BeAlert.css'>")
        Response.Write("<script src='../../js/jquery.min.js'></script>")
        Response.Write("<script src='../../js/BeAlert.js'></script>")

        Response.Write("<script>")
        If AlertStr = "" Then
            If Url <> "" Then
                Response.Write("location.href='" & Url & "';")
            Else
                Response.Write("location.href='" & HttpPath(5) & "';")
            End If
        Else
            If Url <> "" Then
                Response.Write("$(function () { alert('" & AlertStr & "','', function () {location.href='" & Url & "';}, {type: 'error', confirmButtonText: 'ȷ��'});});")
            Else
                Response.Write("$(function () { alert('" & AlertStr & "','', function () {location.href='" & HttpPath(5) & "';}, {type: 'error', confirmButtonText: 'ȷ��'});});")
            End If
        End If
        Response.Write("</script>")
        Response.End()
End Function

Function AlertClose(ByVal AlertStr)
        Response.Write("<!DOCTYPE HTML>")
        Response.Write("<link rel='stylesheet' href='css/BeAlert.css'>")
        Response.Write("<script src='js/jquery.min.js'></script>")
        Response.Write("<script src='js/BeAlert.js'></script>")
		
        Response.Write("<link rel='stylesheet' href='../css/BeAlert.css'>")
        Response.Write("<script src='../js/jquery.min.js'></script>")
        Response.Write("<script src='../js/BeAlert.js'></script>")
		
        Response.Write("<link rel='stylesheet' href='../../css/BeAlert.css'>")
        Response.Write("<script src='../../js/jquery.min.js'></script>")
        Response.Write("<script src='../../js/BeAlert.js'></script>")

		Response.Write("<script>")
		If AlertStr = "" Then
		 Response.Write("window.close();")
		Else
		 Response.Write("$(function () { alert('" & AlertStr & "','', function () {window.close();;}, {type: 'info', confirmButtonText: 'ȷ��'});});")
		End If
		
		Response.Write("</script>")
		Response.End() 
End Function

Function ChkStr(ByVal ParaValue,ByVal ParaType)
 If ParaType = 0 then
  ChkStr = Replace(ParaValue,"'","''")
 ElseIf ParaType = 1 then
  dim re,regex
  re="<[^>]*?>|^\+/v(8|9)|\bonmouse(over|move)=\b|\b(and|or)\b.+?(>|<|=|\bin\b|\blike\b)|/\*.+?\*/|<\s*script\b|\bEXEC\b|UNION.+?SELECT|UPDATE.+?SET|INSERT\s+INTO.+?VALUES|(SELECT|DELETE).+?FROM|(CREATE|ALTER|DROP|TRUNCATE)\s+(TABLE|DATABASE)"
  set regex = new regexp
  regex.ignorecase = true
  regex.global = true
  regex.pattern = re
  if regex.test(ParaValue) then
   Response.Write("�ַ����Ͳ������ݵ�ֵ�д���!")
   Response.end
  end if
  set regex = nothing
  ChkStr = Replace(ParaValue,"'","''")
 ElseIf ParaType = 2 then
  If ParaValue<>"" And (IsNumeric(ParaValue) = False) then
   Response.Write "��ֵ���Ͳ������ݵ�ֵ�д���!"
   Response.End
  Else
   ChkStr = ParaValue
  End If
 ElseIf ParaType = 3 then
  If ParaValue<>"" And (IsDate(ParaValue) = False) then
   Response.Write "ʱ�����Ͳ������ݵ�ֵ�д���!"
   Response.End
  Else
   ChkStr = ParaValue
  End If
 End If
End Function


Function ShowPage(ByVal TotalRs,ByVal TotalPage,ByVal Page,ByVal PageUrl,ByVal Px)
If Px<>"" Then PageUrl=PageUrl&"&Px="&Px

If totalrs>0 Then

if cint(page)>9 then 
 ks=page-5 
 js=page+5 
 if ks<1 then 
  ks=1 
  js=ks+9 
 end If
 
 if js>cint(TotalPage) then 
  js=TotalPage 
  ks=js-9 
 end if 
else 
 if cint(TotalPage)>10 then 
  ks=1 
  js=10 
 else 
  ks=1 
  js=TotalPage 
 end if 
end if 

Response.write "<div id='fenye' class='fenye'>"
if page<>1 then
 If page=2 Then'�ڶ�ҳʱ��һҳ����ҳ
  response.Write("<a href='"&PageUrl&"&Page=1' class='prev'>��һҳ</a> ") 
 Else
  response.Write("<a href='"&PageUrl&"&Page="&Page-1&"' class='prev'>��һҳ</a> ") 
 End If
 
 response.Write("<a href='"&PageUrl&"&Page=1' class='prev'>��ҳ</a> ") 

else 
 response.Write("<a href='"&PageUrl&"&Page=1' class='prev'>��ҳ</a> ") 
end if 

for i= ks to js 

  if cint(i)=cint(page) then 
   response.Write("<a href='"&PageUrl&"&Page="&i&"' class='curr'>"& i & "</a> ") 
  else 
   response.Write("<a href='"&PageUrl&"&Page="&i&"' class='num'>"& i & "</a> ") 
  end if 

Next

if cint(page)<cint(TotalPage) then 
 response.Write("<a href='"&PageUrl&"&Page="&TotalPage&"' class='next'>βҳ</a> <a href='"&PageUrl&"&Page="&Page+1&"' class='next'>��һҳ</a>") 
else 
 response.Write("<a href='"&PageUrl&"&Page="&TotalPage&"' class='next'>βҳ</a>") 
end if 

response.Write "&nbsp;&nbsp;��"&TotalRs&"����¼"

Response.write "&nbsp;&nbsp;ת����<select id='page' onChange=""window.location='"&PageUrl&"&Page='+document.getElementById('page').options[document.getElementById('page').selectedIndex].value"">"
For I=1 To TotalPage
 Response.Write "<option value="&I
 If Page=I Then Response.Write " selected"
 Response.Write ">"& I &"</option>"
Next
Response.write "</select>ҳ"
Response.write "</div>"
Response.write "<div style='clear:both;'></div>"

End If
End Function

'--����û�������ĺϷ���
Function CheckInput_Letter(ByVal InputStr)
 CheckInput_Letter = -1

 For I = 1 To Len(InputStr)
  C = LCase(Mid(InputStr, I, 1)) '------------�ָ��ÿ����ĸ������------------------
  If InStr("abcdefghijklmnopqrstuvwxyz_", C) <= 0 And Not IsNumeric(C) Then
   CheckInput_Letter = 0
   Exit For
  End If
 Next
End Function

'--����ַ�����ĺϷ���
Function CheckInput_Letter_2(ByVal InputStr)
 CheckInput_Letter_2 = -1

 For I = 1 To Len(InputStr)
  C = LCase(Mid(InputStr, I, 1)) '------------�ָ��ÿ����ĸ������------------------
  If InStr("abcdefghijklmnopqrstuvwxyz`-=\[];',./~!@#$%^&*()_+|{}:""<>?", C) <= 0 And Not IsNumeric(C) Then
   CheckInput_Letter_2 = 0
   Exit For
  End If
 Next
End Function

'--�����������ĺϷ���
Function CheckInput_Blank(ByVal InputStr) 
 For I = 1 To Len(InputStr)
  c = Lcase(Mid(InputStr, I, 1)) '------------�ָ��ÿ����ĸ������------------------
  If InStr(" ", c) > 0 Or InStr("��", c) > 0 Then
   Response.Write "<script language='javascript'>" & VbCRlf
   Response.Write "alert('�벻Ҫ����ո�!');" & VbCrlf
   Response.Write "history.go(-1);" & vbCrlf
   Response.Write "</script>" & VbCRLF
   Response.End
  End If
 Next
  CheckInput_Blank=InputStr
End Function


Function MyRate(byval snum,byval bnum)
 If isnull(snum) Then snum=0
 If bnum=0 or isnull(bnum) Then bnum=1

 MyRate=Cstr(CLng((snum/bnum)*100*100)/100)
 If Left(MyRate,1)="." Then  MyRate="0" & MyRate
  
End Function

Function MyRate2(byval snum,byval bnum)
 If isnull(snum) Then snum=0
 If bnum=0 or isnull(bnum) Then bnum=1

 MyRate2=Cstr(CLng((snum/bnum)*1000*1000)/1000)
 If Left(MyRate2,1)="." Then  MyRate2="0" & MyRate2

End Function

Function MyRateWidth(byval Ratea,byval Rateb,byval Ratec)
 If Rateb=0 Then Rateb=1
 
 MyRateWidth=CLng(Ratea/Rateb*Ratec)
End Function

Function MyRate_2(ByVal num)
 MyRate_2=num
 If Instr(MyRate_2,".")=0 Then
  MyRate_2=MyRate_2&".00"
 Else
  If Len(Mid(MyRate_2,Instr(MyRate_2,".")+1))=1 Then
   MyRate_2=MyRate_2&"0"
  Else
   MyRate_2=Left(MyRate_2,Instr(MyRate_2,".")+2)
  End If
 End If
 If Left(MyRate_2,Instr(MyRate_2,".")-1)=0 Then MyRate_2="0"&MyRate_2
End Function

'--��ȡ��ǰҳ����ַ��Ϣ
Function HttpPath(ByVal Assort)
 If Request.ServerVariables("HTTPS")="on" Then HttpStr="https://" else HttpStr="http://" end if
 If Request.ServerVariables("QUERY_STRING")<>"" Then UrlStr="?"&Request.ServerVariables("QUERY_STRING")
 
 Ser=Request.servervariables("SERVER_NAME")
 Scr=Request.servervariables("SCRIPT_NAME")
 Port=Request.Servervariables("SERVER_PORT")
 Scr_2=StrReverse(Mid(StrReverse(Scr),Instr(StrReverse(Scr),"/")))
 
 'http://www.a.com:100/b/c.asp?aa=1&bb=2
 '1.www.a.com
 '2.http://www.a.com:100/b/
 '3.http://www.a.com:100/b/c.asp
 '4.http://www.a.com:100/b/c.asp?aa=1&bb=2
 '5./b/
 '6./b/c.asp
 '7./b/c.asp?aa=1&bb=2
 If Assort=1 Then
  HttpPath=Ser 
 ElseIf Assort=2 Then
  If Port="80" or Port = "443" Then
   HttpPath=HttpStr&Ser&Scr_2
  Else   
   HttpPath=HttpStr&Ser&":"&Port&Scr_2
  End If 
 ElseIf Assort=3 Then
  If Port="80" or Port = "443" Then
   HttpPath=HttpStr&Ser&Scr
  Else
   HttpPath=HttpStr&Ser&":"&Port&Scr
  End If
 ElseIf Assort=4 Then
  If Port="80" or Port = "443" Then
   HttpPath=HttpStr&Ser&Scr&UrlStr
  Else
   HttpPath=HttpStr&Ser&":"&Port&Scr&UrlStr
  End If
 ElseIf Assort=5 Then
  HttpPath=Scr_2
 ElseIf Assort=6 Then
  HttpPath=Scr
 ElseIf Assort=7 Then 
  HttpPath=Scr&UrlStr
 End If
End Function

Function GetCurrWeb()
 Url=HttpPath(3)&"?"&Request.QueryString&"&"&Request.Form
 If Mid(Url,Len(Url))="&" Then Url=Left(Url,Len(Url)-1)
 Session("Url")=Url
End Function

'--������
Function PxFilter(ByVal px,ByVal pxok)
 px=Lcase(px)
 pxok=Lcase(pxok)

 PxArrary=Split(Pxok,",")

 For I= 0 To Ubound(PxArrary)
  If PxArrary(I)=Px Then J=1
 Next

 If J<>1 Then
  Response.write "��ֹ��������"
  Response.end
 End If
End Function


Function BreakUrl(ByVal Url,ByVal BreakType)
Url=Lcase(Url)
If Url<>"" And Instr(Url,"/")>0 Then
 UrlArrary=Split(Url,"/")
 UrlHead=UrlArrary(2)
 UrlTail=UrlArrary(Ubound(UrlArrary))


 If BreakType=1 Then
  BreakUrl=UrlHead
 ElseIf BreakType=2 Then
  If UrlTail<>"" Then
   BreakUrl=UrlTail
  Else
   BreakUrl=UrlHead
  End if
 End if
Else
 BreakUrl=Url
End if
End Function


Function GetTurnTime(byval Num)
 NumStr=Cstr(Num)
 If Len(NumStr)=1 Then NumStr="0" & NumStr
 GetTurnTime=NumStr
End Function

Function GetTurnCent(byval Num)
 NumStr = CStr (Num)
 If Instr(NumStr,"E")>0 Then
  NumStr=FormatNumber(Num,5,-1,0,0)
 ElseIf Left(NumStr,1)="." Then
  NumStr="0" & NumStr
 ElseIf Left(NumStr,2)="-." Then
  NumStr=Replace(NumStr,"-.","-0.")
 End If
 GetTurnCent = NumStr
End Function

Function FSOFileRead(ByVal filename)
Dim objFSO,objCountFile,FiletempData
Set objFSO = Server.CreateObject("Scripting.FileSystemObject")
Set objCountFile = objFSO.OpenTextFile(Server.MapPath(filename),1,True)
FSOFileRead = objCountFile.ReadAll
objCountFile.Close
Set objCountFile=Nothing
Set objFSO = Nothing
End Function

Function URLDecode(byval enStr)
  dim deStr
  dim c,i,v
  deStr=""
  for i=1 to len(enStr)
  c=Mid(enStr,i,1)
  if c="%" then
  v=eval("&h"+Mid(enStr,i+1,2))
  if v<128 then
  deStr=deStr&chr(v)
  i=i+2
  else
  if isvalidhex(mid(enstr,i,3)) then
  if isvalidhex(mid(enstr,i+3,3)) then
  v=eval("&h"+Mid(enStr,i+1,2)+Mid(enStr,i+4,2))
  deStr=deStr&chr(v)
  i=i+5
  else
  v=eval("&h"+Mid(enStr,i+1,2)+cstr(hex(asc(Mid(enStr,i+3,1)))))
  deStr=deStr&chr(v)
  i=i+3 
  end if 
  else 
  destr=destr&c
  end if
  end if
  else
  if c="+" then
  deStr=deStr&" "
  else
  deStr=deStr&c
  end if
  end if
  next
  URLDecode=deStr
  end function

  function isvalidhex(str)
  isvalidhex=true
  str=ucase(str)
  if len(str)<>3 then isvalidhex=false:exit function
  if left(str,1)<>"%" then isvalidhex=false:exit function
  c=mid(str,2,1)
  if not (((c>="0") and (c<="9")) or ((c>="A") and (c<="Z"))) then isvalidhex=false:exit function
  c=mid(str,3,1)
  if not (((c>="0") and (c<="9")) or ((c>="A") and (c<="Z"))) then isvalidhex=false:exit function
  end function
  

'�����ʼ
function UTF2GB(byval UTFStr) 
for Dig=1 to len(UTFStr) 
if mid(UTFStr,Dig,1)="%" then 
if len(UTFStr) >= Dig+8 then 
GBStr=GBStr & ConvChinese(mid(UTFStr,Dig,9)) 
Dig=Dig+8 
else 
GBStr=GBStr & mid(UTFStr,Dig,1) 
end if 
else 
GBStr=GBStr & mid(UTFStr,Dig,1) 
end if 
next 
UTF2GB=GBStr 
end function 

function ConvChinese(x) 
A=split(mid(x,2),"%") 
i=0 
j=0 

for i=0 to ubound(A) 
A(i)=c16to2(A(i)) 
next 

for i=0 to ubound(A)-1 
DigS=instr(A(i),"0") 
Unicode="" 
for j=1 to DigS-1 
if j=1 then 
A(i)=right(A(i),len(A(i))-DigS) 
Unicode=Unicode & A(i) 
else 
i=i+1 
A(i)=right(A(i),len(A(i))-2) 
Unicode=Unicode & A(i) 
end if 
next 

if len(c2to16(Unicode))=4 then 
ConvChinese=ConvChinese & chrw(int("&H" & c2to16(Unicode))) 
else 
ConvChinese=ConvChinese & chr(int("&H" & c2to16(Unicode))) 
end if 
next 
end function 

function c2to16(x) 
i=1 
for i=1 to len(x) step 4 
c2to16=c2to16 & hex(c2to10(mid(x,i,4))) 
next 
end function 

function c2to10(x) 
c2to10=0 
if x="0" then exit function 
i=0 
for i= 0 to len(x) -1 
if mid(x,len(x)-i,1)="1" then c2to10=c2to10+2^(i) 
next 
end function 

function c16to2(x) 
i=0 
for i=1 to len(trim(x)) 
tempstr= c10to2(cint(int("&h" & mid(x,i,1)))) 
do while len(tempstr)<4 
tempstr="0" & tempstr 
loop 
c16to2=c16to2 & tempstr 
next 
end function 

function c10to2(x) 
mysign=sgn(x) 
x=abs(x) 
DigS=1 
do 
if x<2^DigS then 
exit do 
else 
DigS=DigS+1 
end if 
loop 
tempnum=x 

i=0 
for i=DigS to 1 step-1 
if tempnum>=2^(i-1) then 
tempnum=tempnum-2^(i-1) 
c10to2=c10to2 & "1" 
else 
c10to2=c10to2 & "0" 
end if 
next 
if mysign=-1 then c10to2="-" & c10to2 
end function 
'�������

function GetUnicode(Str) 
  dim i 
  dim Str_one 
  dim Str_unicode 
  if(isnull(Str)) then
     exit function
  end if
  for i=1 to len(Str) 
    Str_one=Mid(Str,i,1) 
    Str_unicode=Str_unicode&chr(38) 
    Str_unicode=Str_unicode&chr(35) 
    Str_unicode=Str_unicode&chr(120) 
    Str_unicode=Str_unicode& Hex(ascw(Str_one)) 
    Str_unicode=Str_unicode&chr(59) 
  next 
  GetUnicode=Str_unicode 
end function 

Function GetAdClassName(ByVal Ad_Class) 
 If Ad_Class=1 Then
  GetAdClassName="ֱ�����"
 ElseIf Ad_Class=2 Then
  GetAdClassName="ֱͼ���"
 ElseIf Ad_Class=3 Then
  GetAdClassName="��ͨ����"
 ElseIf Ad_Class=4 Then
  GetAdClassName="��ͨͼƬ"
 ElseIf Ad_Class=5 Then
  GetAdClassName="�������"
 ElseIf Ad_Class=6 Then
  GetAdClassName="���ͼƬ"
 ElseIf Ad_Class=7 Then
  GetAdClassName="��ý��"
 ElseIf Ad_Class=8 Then
  GetAdClassName="��ѭǿ��"
 ElseIf Ad_Class=9 Then
  GetAdClassName="��ѭ�˵�"
 ElseIf Ad_Class=10 Then
  GetAdClassName="��ϱ�ǩ��"
 ElseIf Ad_Class=11 Then
  GetAdClassName="��ϸ�ý��"
 ElseIf Ad_Class=12 Then
  GetAdClassName="������ذ�װ"
 ElseIf Ad_Class=0 Then
  GetAdClassName="������"
 ElseIf Ad_Class=-1 Then
  GetAdClassName="��ѭֱ��"
 ElseIf Ad_Class=-4 Then
  GetAdClassName="��ѭͼƬ"
 ElseIf Ad_Class=-7 Then
  GetAdClassName="��ѭ��ý��"
 End If
End Function


Function GetClickFlagDesc(ByVal ClickFlag) 
 If ClickFlag=1 Then
  GetClickFlagDesc="IP��ϵͳ��������"
 ElseIf ClickFlag=2 Then
  GetClickFlagDesc="��治����Ч״̬����ƻ��Ѿ�Ͷ�����"
 ElseIf ClickFlag=3 Then
  GetClickFlagDesc="�û�������Ч״̬"
 ElseIf ClickFlag=4 Then
  GetClickFlagDesc="IP��ˢIP�ĵ��������"
 ElseIf ClickFlag=5 Then
  GetClickFlagDesc="ֻ��վ��������ʱû����Դ��ַ"
 ElseIf ClickFlag=6 Then
  GetClickFlagDesc="����ʹ���"
 ElseIf ClickFlag=7 Then
  GetClickFlagDesc="������ҳ����ʱ�����û����Դ"
 ElseIf ClickFlag=8 Then
  GetClickFlagDesc="��û�о�������Ա��˵�ϵͳ�������վ�Ϸ������"
 ElseIf ClickFlag=9 Then
  GetClickFlagDesc="��û�о�������Ա��˵��û�����վ�Ϸ������"
 ElseIf ClickFlag=10 Then
  GetClickFlagDesc="ˢIP���޸Ĺ�����"
 ElseIf ClickFlag=11 Then
  GetClickFlagDesc="α��user-agent"
 ElseIf ClickFlag=12 Then
  GetClickFlagDesc="ʱ����֤����"
 ElseIf ClickFlag=13 Then
  GetClickFlagDesc="���豸�Ѿ������"
 ElseIf ClickFlag=14 Then
  GetClickFlagDesc="��IP�Ѿ������"
 ElseIf ClickFlag=15 Then
  GetClickFlagDesc="���۵�"
 ElseIf ClickFlag=16 Then
  GetClickFlagDesc="�û��۵�"
 ElseIf ClickFlag=17 Then
  GetClickFlagDesc="�����߲���"
 ElseIf ClickFlag=18 Then
  GetClickFlagDesc="��������ƹ�ϵͳ���"
 ElseIf ClickFlag=19 Then
  GetClickFlagDesc="��������趨��IP��Χ������"
 ElseIf ClickFlag=20 Then
  GetClickFlagDesc="���ʷ�ָ���û���Χ�����û�Ͷ��"
 ElseIf ClickFlag=21 Then
  GetClickFlagDesc="ֱ�ӹ����Ҫ��֤ʱ�Զ��������һ��������������"
 ElseIf ClickFlag=22 Then
  GetClickFlagDesc="ֱ�ӹ����Ҫ��֤ʱ�Զ��������һ�������Ѿ�ʧЧ"
 ElseIf ClickFlag=23 Then
  GetClickFlagDesc="ֱ�ӹ����Ҫ��֤ʱ�Զ�������ڶ�����������ȷ"
 ElseIf ClickFlag=24 Then
  GetClickFlagDesc="ֱ�ӹ����Ҫ��֤ʱ�Զ��������ʽ����"
 ElseIf ClickFlag=25 Then
  GetClickFlagDesc="�����������ͬ"    
 ElseIf ClickFlag=26 Then
  GetClickFlagDesc="���ʱ�䳬ʱ"    
 ElseIf ClickFlag=27 Then
  GetClickFlagDesc="�����IP����Ч"    
 ElseIf ClickFlag=28 Then
  GetClickFlagDesc="ҳ���Ȳ���С����С���õĿ��"    
 ElseIf ClickFlag=29 Then
  GetClickFlagDesc="ҳ���Ȳ��ܴ���������õĿ��"    
 ElseIf ClickFlag=30 Then
  GetClickFlagDesc="ҳ��߶Ȳ���С����С���õĸ߶�"    
 ElseIf ClickFlag=31 Then
  GetClickFlagDesc="ҳ��߶Ȳ��ܴ���������õĸ߶�"    
 ElseIf ClickFlag=32 Then
  GetClickFlagDesc="ҳ���붥�����벻��С����С���õľ�����ֵ"    
 ElseIf ClickFlag=33 Then
  GetClickFlagDesc="ҳ���붥�����벻�ܴ���������õľ�����ֵ"    
 ElseIf ClickFlag=34 Then
  GetClickFlagDesc="ҳ������߾��벻��С����С���õľ�����ֵ"    
 ElseIf ClickFlag=35 Then
  GetClickFlagDesc="ҳ������߾��벻�ܴ���������õľ�����ֵ"    
 ElseIf ClickFlag=36 Then
  GetClickFlagDesc="�ڽ�ֹ��վ���ϲ��ܷ������"   
 ElseIf ClickFlag=37 Then
  GetClickFlagDesc="���Ͷ��ҳ�����Դҳ�ڱ���ֹվ����"   
 ElseIf ClickFlag=38 Then
  GetClickFlagDesc="���Ͷ��ҳ�����Դҳ���������վ����"   
 ElseIf ClickFlag=39 Then
  GetClickFlagDesc="��ͬIP�㲻ͬ���ʱ��Ч(ip�۵�)"  
 ElseIf ClickFlag=40 Then
  GetClickFlagDesc="��վ���������Ĺ�����������(����۵�)"  
 ElseIf ClickFlag=41 Then
  GetClickFlagDesc="�ڽ�ֹ���豸��Ͷ�Ź��"  
 ElseIf ClickFlag=42 Then
  GetClickFlagDesc="�������֧��Cookies"
 ElseIf ClickFlag=43 Then
  GetClickFlagDesc="����iframe�Զ���������Ч"  
 ElseIf ClickFlag=44 Then
  GetClickFlagDesc="����iframe����������Ч"  
 End If
End Function

Function GetValName(ByVal ValName)

If RsSet("AdParaShortType")=0 Then
 GetValName = ValName
Else
 if ValName="cycadget" Then
  GetValName="c"
 Elseif ValName="cycadget_popup" Then
  GetValName="cp"
 Elseif ValName="adget" Then
  GetValName="a"
 Elseif ValName="adget_2" Then
  GetValName="a2"
 Elseif ValName="mixadget" Then
  GetValName="m"
 Elseif ValName="mixadget" Then
  GetValName="mc"
 Elseif ValName="mixadget_label" Then
  GetValName="ml"
 Elseif ValName="mixadget_self" Then
  GetValName="ms"
 Else
   GetValName=ValName
 End If
End If
 
End Function

Function GetParaName(ByVal ParaName)

If RsSet("AdParaShortType")=0 Then
 GetParaName = ParaName
Else
 ParaName=Lcase(ParaName)
 
 if ParaName="ad_class" Then
  GetParaName = 1
 Elseif ParaName="userid" Then
  GetParaName = 2
 Elseif ParaName="lowunionusername" Then
  GetParaName = 3
 Elseif ParaName="clickstate" Then
  GetParaName = 4
 Elseif ParaName="adshowtype" Then
  GetParaName = 5
 Elseif ParaName="ad_size" Then
  GetParaName = 6
 Elseif ParaName="showsel" Then
  GetParaName = 7
 Elseif ParaName="newadsel" Then
  GetParaName = 8
 Elseif ParaName="maxadid" Then
  GetParaName = 9
 Elseif ParaName="prohibit" Then
  GetParaName = 10
 Elseif ParaName="starttime" Then
  GetParaName = 11
 Elseif ParaName="ly" Then
  GetParaName = 12
 Elseif ParaName="ly_2" Then
  GetParaName = 13
 Elseif ParaName="firstshowtime" Then
  GetParaName = 14
 Elseif ParaName="visittotal" Then
  GetParaName = 15
 Elseif ParaName="webwidth" Then
  GetParaName = 16
 Elseif ParaName="webheight" Then
  GetParaName = 17
 Elseif ParaName="webtop" Then
  GetParaName = 18
 Elseif ParaName="webleft" Then
  GetParaName = 19
 Elseif ParaName="screenwidth" Then
  GetParaName = 20
 Elseif ParaName="screenheight" Then
  GetParaName = 21
 Elseif ParaName="screencolordepth" Then
  GetParaName = 22
 Elseif ParaName="hislen" Then
  GetParaName = 23
 Elseif ParaName="winori" Then
  GetParaName = 24
 Elseif ParaName="hwc" Then
  GetParaName = 25
 Elseif ParaName="vendor" Then
  GetParaName = 26
 Elseif ParaName="renderer" Then
  GetParaName = 27
 Elseif ParaName="cct" Then
  GetParaName = 28
 Elseif ParaName="webtitle" Then
  GetParaName = 29
 Elseif ParaName="iframe" Then
  GetParaName = 30
 Elseif ParaName="ranstr" Then
  GetParaName = 31
 Elseif ParaName="ad_id" Then
  GetParaName = 32
 Elseif ParaName="adshowmode" Then
  GetParaName = 33
 Elseif ParaName="adwidth" Then
  GetParaName = 34
 Elseif ParaName="adheight" Then
  GetParaName = 35
 Elseif ParaName="adrow" Then
  GetParaName = 36
 Elseif ParaName="adcol" Then
  GetParaName = 37
 Elseif ParaName="adbordercolor" Then
  GetParaName = 38
 Elseif ParaName="adbgcolor" Then
  GetParaName = 39
 Elseif ParaName="adintrocolor" Then
  GetParaName = 40
 Elseif ParaName="adintrosize" Then
  GetParaName = 41
 Elseif ParaName="adtitlecolor" Then
  GetParaName = 42
 Elseif ParaName="adtitlecolor" Then
  GetParaName = 43
 Elseif ParaName="adtitlesize" Then
  GetParaName = 44
 Elseif ParaName="adtitleb" Then
  GetParaName = 45
 Elseif ParaName="adtitleu" Then
  GetParaName = 46
 Elseif ParaName="delaytime" Then
  GetParaName = 47
 Elseif ParaName="spacetime" Then
  GetParaName = 48
 Elseif ParaName="puttime" Then
  GetParaName = 49
 Else 
  GetParaName = 0
 End If
   
	If CInt(GetParaName)>0 Then
	GetParaName = RsSet("AdMainFileName") & GetParaName
	Else
	GetParaName = ParaName'--û�ж����ȡ��ԭ������
	End If  
End If

End Function

Function GetRanStr(ByVal digits)
 Dim output
 Dim Num
 Dim char_array(35)
 char_array(0) = "0"
 char_array(1) = "1"
 char_array(2) = "2"
 char_array(3) = "3"
 char_array(4) = "4"
 char_array(5) = "5"
 char_array(6) = "6"
 char_array(7) = "7"
 char_array(8) = "8"
 char_array(9) = "9"
 char_array(10) = "a"
 char_array(11) = "b"
 char_array(12) = "c"
 char_array(13) = "d"
 char_array(14) = "e"
 char_array(15) = "f"
 char_array(16) = "g"
 char_array(17) = "h"
 char_array(18) = "i"
 char_array(19) = "j"
 char_array(20) = "k"
 char_array(21) = "l"
 char_array(22) = "m"
 char_array(23) = "n"
 char_array(24) = "o"
 char_array(25) = "p"
 char_array(26) = "q"
 char_array(27) = "r"
 char_array(28) = "s"
 char_array(29) = "t"
 char_array(30) = "u"
 char_array(31) = "v"
 char_array(32) = "w"
 char_array(33) = "x"
 char_array(34) = "y"
 char_array(35) = "z"
 
 output=""
 num=""

 Randomize()
 Do While Len(output) < digits
  Num = char_array(Int(36*Rnd))
  output = output + Num
 Loop

 GetRanStr = output
End Function

Function GetRanStr_2(ByVal digits) 
 dim char_array_2(9)
 char_array_2(0) = "0"
 char_array_2(1) = "1"
 char_array_2(2) = "2"
 char_array_2(3) = "3"
 char_array_2(4) = "4"
 char_array_2(5) = "5"
 char_array_2(6) = "6"
 char_array_2(7) = "7"
 char_array_2(8) = "8"
 char_array_2(9) = "9"

 randomize
 do while len(output_2)<digits
 num_2 = char_array_2(Int(10*Rnd))
 output_2 = output_2 + num_2
 loop
 GetRanStr_2 = output_2
End Function


Function GetRanStr_3(ByVal digits)
 Dim output_3
 Dim Num_3
 Dim char_array_3(25)
 char_array_3(0) = "a"
 char_array_3(1) = "b"
 char_array_3(2) = "c"
 char_array_3(3) = "d"
 char_array_3(4) = "e"
 char_array_3(5) = "f"
 char_array_3(6) = "g"
 char_array_3(7) = "h"
 char_array_3(8) = "i"
 char_array_3(9) = "j"
 char_array_3(10) = "k"
 char_array_3(11) = "l"
 char_array_3(12) = "m"
 char_array_3(13) = "n"
 char_array_3(14) = "o"
 char_array_3(15) = "p"
 char_array_3(16) = "q"
 char_array_3(17) = "r"
 char_array_3(18) = "s"
 char_array_3(19) = "t"
 char_array_3(20) = "u"
 char_array_3(21) = "v"
 char_array_3(22) = "w"
 char_array_3(23) = "x"
 char_array_3(24) = "y"
 char_array_3(25) = "z"

 Randomize()
 Do While Len(output_3) < digits
  Num_3 = char_array_3(Int(26 * Rnd))
  output_3 = output_3 + Num_3
 Loop
 GenRanStr_3 = output_3
End Function



Function GetStr(ByVal App, ByVal MyStr)
 GetStr = ""
 MyStr_1 = "|-|" & App & "|-|"
 MyStr_2 = ""
 I_Str=0

 I_Str = InStr(LCase(MyStr_1), "|-|" & LCase(MyStr) & "=")
 If I_Str > 0 Then
  MyStr_2 = Mid(MyStr_1, I_Str + Len(MyStr) + 4)
  GetStr = Left(MyStr_2, InStr(MyStr_2, "|-|") - 1)
 End If
End Function

Function GetStrB(ByVal App, ByVal MyStr, ByVal SpanNum)
 GetStrB = ""
 I_StrB = 0
 SplitStr = ""

 For I_StrB = 1 To SpanNum
  SplitStr = SplitStr & "-"
 Next

 GetStrB = ""
 MyStr_1 = "|" & SplitStr & "|" & App & "|" & SplitStr & "|"
 MyStr_2 = ""
 
 I_StrB = 0
 I_StrB = InStr(LCase(MyStr_1), "|" & SplitStr & "|" & LCase(MyStr) & "=")
 If I_StrB > 0 Then
  MyStr_2 = Mid(MyStr_1, I_StrB + Len(MyStr) + 3 + SpanNum)
  GetStrB = Left(MyStr_2, InStr(MyStr_2, "|" & SplitStr & "|") - 1)
 End If
End Function

Function GetAllFlagSet(ByVal AppName, ByVal SetBClassFlag, ByVal SetFlag, ByVal SetName)
 If AppName="" Then
   Sql = "Select SetValue From CFWztg_SetBClass Where SetBClassFlag='" & SetBClassFlag & "'"
   Set Rs_MySet = Conn.Execute(Sql)
   SetValue = Rs_MySet("SetValue")
   Rs_MySet.Close
 Else
  If IsEmpty(Application(AppName)) Then
   Sql = "Select SetValue From CFWztg_SetBClass Where SetBClassFlag='" & SetBClassFlag & "'"
   Set Rs_MySet = Conn.Execute(Sql)
   Application(AppName) = Rs_MySet("SetValue")
   Rs_MySet.Close
  End If
  SetValue = Application(AppName)
 End If

 '--��ʽΪ"����־_�ֶ�"��ʽ
 SetName = SetFlag & "_" & SetName
 
 GetAllFlagSet=GetStr(SetValue, SetName)
End Function

Function DollarConVert(ByVal MyCent)
 MyCent=Cstr(MyCent)
 If Instr(MyCent,".")=1 Then MyCent="0"&MyCent
 If Len(MyCent)=3 Then MyCent=MyCent&"0"
 If MyCent="0" Then MyCent="0.00"
 DollarConVert=MyCent
End Function

Function GetIpArea(ByVal Ip)
 inIP=Ip
 inIPs=split(inIP,".")
 inIPnum=inips(0)*256*256*256 + inips(1)*256*256 + inips(2)*256 + inips(3)

 Sql="Select * from CFWztg_IpAddress where Ip_1<="&inIPnum&" and Ip_2>="&inIPnum
 set RsIp=conn.Execute(Sql)

 If Not RsIp.Eof Then
  If RsIp("Area")<>"" Then GetIpArea = RsIp("Area")
 Else
  GetIpArea= "-"
 End If
 RsIp.Close
End Function


Function GetSkinColor(byval SkinColor,byval Assort)
 MyArray_SkinColor=Split(SkinColor,"|")
 If Assort<=Ubound(MyArray_SkinColor) Then
  GetSkinColor=MyArray_SkinColor(Assort)
 End If
End Function

'--�����û����ĺ���λ
Function GetHiddenUserName(ByVal StrUserName)
 If Len(StrUserName)=0 Then
  GetHiddenUserName=StrUserName
 ElseIf Len(StrUserName)=1 Then
  GetHiddenUserName="*"
 ElseIf Len(StrUserName)=2 Then
  GetHiddenUserName=Left(StrUserName,1)&"*"
 ElseIf Len(StrUserName)>=3 Then
  GetHiddenUserName=Left(StrUserName,Len(StrUserName)-2)&"**"
 End If 
End Function


'==================================================
'��������GetHttpPage
'�� �ã���ȡ��ҳԴ��
'�� ����HttpUrl ------��ҳ��ַ
'==================================================
Function GetHttpPage(ByVal aspfile)
on error resume next
Dim oXMLHTTP
Dim oCategories
Dim BodyText
Dim Pos,Pos1
Set oXMLHTTP = CreateObject("Msxml2.ServerXMLHTTP")
oXMLHTTP.open "GET",aspfile,False
oXMLHTTP.send 
 BodyText=oXMLHTTP.responsebody
 BodyText=BytesToBstr(BodyText,"gb2312")
 GetHttpPage=BodyText
Set oXMLHTTP = Nothing 
if err.number<>0 then
response.write err.number&"�����ˣ�����������"&err.description & "<br>������Դ"& err.source
response.End()
end if
End Function

Function BytesToBstr(body,Cset)
        dim objstream
        set objstream = Server.CreateObject("adodb.stream")
        objstream.Type = 1
        objstream.Mode =3
        objstream.Open
        objstream.Write body
        objstream.Position = 0
        objstream.Type = 2
        objstream.Charset = Cset
        BytesToBstr = objstream.ReadText 
        objstream.Close
        set objstream = nothing
End Function


'----ȡ���ַ�ʵ�ʳ���
function strlen(str)
dim p_len
p_len=0
strlen=0
if trim(str)<>"" then
p_len=len(trim(str))
for xx=1 to p_len
if asc(mid(str,xx,1))<0 then
strlen=int(strlen) + 2
else
strlen=int(strlen) + 1
end if
next
end if
end function

function StrLeft(str,lennum)
dim p_num
dim i
if strlen(str)<=lennum then
StrLeft=str
else
p_num=0
x=0
do while not p_num > lennum-2
x=x+1
if asc(mid(str,x,1))<0 then
p_num=int(p_num) + 2
else
p_num=int(p_num) + 1
end if
StrLeft=left(trim(str),x)&"..."
loop
end if
end function 

function StrValue(str,lennum)
dim p_num
dim i
if strlen(str)<=lennum then
strvalue=str
else
p_num=0
x=0
do while not p_num > lennum-2
x=x+1
if asc(mid(str,x,1))<0 then
p_num=int(p_num) + 2
else
p_num=int(p_num) + 1
end if
strvalue=left(trim(str),x)&"..."
loop
end if
end function 


'--��ȡ����ϵͳ
Function GetOsType()

        AgentInfo = lcase(Request.ServerVariables("HTTP_USER_AGENT"))

        If InStr(AgentInfo, "micromessenger") > 0 Then
            OsType = "΢��"

        ElseIf InStr(AgentInfo, "android") > 0 Then
            OsType = "��׿"

        ElseIf InStr(AgentInfo, "iphone") > 0 Then
            OsType = "iPhone"

        ElseIf InStr(AgentInfo, "ipad") > 0 Then
            OsType = "iPad"

        ElseIf InStr(AgentInfo, "nt 10") > 0 Then
            OsType = "Windows 10"

        ElseIf InStr(AgentInfo, "nt 6.4") > 0 Then
            OsType = "Windows 10"

        ElseIf InStr(AgentInfo, "nt 6.3") > 0 Then
            OsType = "Windows 8"

        ElseIf InStr(AgentInfo, "nt 6.2") > 0 Then
            OsType = "Windows 8"

        ElseIf InStr(AgentInfo, "nt 6.1") > 0 Then
            OsType = "Windows 7"

        ElseIf InStr(AgentInfo, "nt 6.0") > 0 Then
            OsType = "Windows Vista"

        ElseIf InStr(AgentInfo, "nt 5.2") > 0 Then
            OsType = "Windows 2003"

        ElseIf InStr(AgentInfo, "nt 5.1") > 0 Then
            OsType = "Windows XP"

        ElseIf InStr(AgentInfo, "nt") > 0 Then
            OsType = "Windows"

        ElseIf InStr(AgentInfo, "mac") > 0 Then
            OsType = "mac"

        ElseIf InStr(AgentInfo, "unix") > 0 Then
            OsType = "Unix"

        ElseIf InStr(AgentInfo, "linux") > 0 Then
            OsType = "Linux"

        ElseIf InStr(AgentInfo, "sunos") > 0 Then
            OsType = "SunOS"

        Else
            OsType = "����"

        End If

        GetOsType = OsType
End Function

Function GetTopDomainName(url)
domext=".com.cn|.gov.cn|.cn|.com|.net|.org|.so|.co|.mobi|.tel|.biz|.info|.name|.me|.cc|.tv|.asiz|.hk|.xyz|.top|.vip|.club|.online|.live|.nl|.la"
GetTopDomainName="" : url=lcase(url)
if url="" or len(url)=0 then exit Function
url=replace(replace(url,"http://",""),"https://","")
s1=instr(url,":")-1
if s1 < 0 then s1=instr(url,"/")-1
if s1 > 0 then url=left(url,s1)
Set re = new RegExp
re.IgnoreCase = True : re.global = True
re.Pattern = "([a-z0-9-]){1,63}(" & domext & ")(\:\d+)?$"
Set Matches = re.Execute(url)
If Matches.count>0 Then
 GetTopDomainName = Matches(0)
Else
 GetTopDomainName = url
End If
set re=nothing
End Function

Function ConnClose()
 If IsObject(Rs)=True Then
  Rs.Close
  Set Rs=Nothing
 End If

 If IsObject(Rs2)=True Then
  Rs2.Close
  Set Rs2=Nothing
 End If

 If IsObject(RsUser)=True Then
  RsUser.Close
  Set RsUser=Nothing
 End If

 If IsObject(RsSet)=True Then
  RsSet.Close
  Set RsSet=Nothing
 End If

 If IsObject(Conn)=True Then
  Conn.Close
  Set Conn=Nothing
 End If
End Function

%>