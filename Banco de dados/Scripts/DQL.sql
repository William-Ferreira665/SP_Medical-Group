USE SPMED_GROUP;
GO

--retornar a quantidade de m�dicos de uma certa especialidade
SELECT COUNT(IdMedico)
FROM Medico
WHERE IdEspecialidade = 17
GO

--Criou uma fun��o para retornar a quantidade de m�dicos de uma certa especialidade
ALTER PROCEDURE P_Idade
AS  
SELECT  NomeUsuario, DATEDIFF(YEAR, (DataNascimento), GETDATE()) AS 'Idade'
FROM Paciente
INNER JOIN Usuario 
ON Paciente.IdUsuario = Usuario.IdUsuario
GO

EXEC P_Idade;
GO

SELECT * FROM Paciente