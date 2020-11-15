
IF (OBJECT_ID('tempdb..#Databases') IS NOT NULL) DROP TABLE #Databases
SELECT [name], [dbid], IDENTITY(INT, 1, 1) AS Ordem
INTO #Databases
FROM sys.sysdatabases    WITH(NOLOCK)
ORDER BY name
 
 
DECLARE
@Qt_Databases INT = (SELECT COUNT(*) FROM #Databases),
@Contador INT = 1,
@Ds_Database SYSNAME,
@Ds_Query VARCHAR(MAX) = '  SELECT DB_NAME(),CodigoUnidade, ban_co_banco FROM ban_rel_conta_financeiro WHERE   ban_co_banco =''341'' ',
@Cmd VARCHAR(MAX)
 
    
WHILE(@Contador <= @Qt_Databases)
BEGIN
        
SELECT @Ds_Database = name
FROM #Databases
WHERE Ordem = @Contador
 
SET @Cmd = 'USE [' + @Ds_Database + ']; ' + CHAR(10) + @Ds_Query
EXEC(@Cmd)
        
SET @Contador = @Contador + 1
 
END




DECLARE @banco AS VARCHAR(255) = '341'

/*

SELECT *
FROM   ban_rel_conta_financeiro
WHERE  CodigoBanco = @banco


SELECT *
FROM   ban_banco AS bb

SELECT *
FROM   ban_agencia AS ba

SELECT *
FROM   ban_conta_corrente AS bcc

*/


       
       
    --   UPDATE ban_carteira_cobrancaSET cac_numero_caracteres_nosso_numero = '8'
       
