@ECHO ON

IF EXIST C:\temp\MyScript.txt DEL /F /Q C:\temp\MyScript.txt
ECHO DELETE FROM telemispublisherdb.patient WHERE name='AZ970532^^AURELIEN'; > C:\temp\MyScript.txt
ECHO DELETE FROM telemispublisherdb.personidentifier WHERE value='CTAB970532'; >> C:\temp\MyScript.txt

CD /D C:\VER498TMP1\telemis\mysql\bin
mysql.exe --user=root --password=tastouk telemispublisherdb < "C:\temp\MyScript.txt"

EXIT