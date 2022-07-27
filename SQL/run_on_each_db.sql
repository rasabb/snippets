EXEC sp_msforeachdb'
USE [?]
--IF ''?'' LIKE ''myDbName%'' --Only run on dbname(s)
BEGIN
PRINT ''*****Running below on each database *****''
...
END
'
PRINT 'Done!'