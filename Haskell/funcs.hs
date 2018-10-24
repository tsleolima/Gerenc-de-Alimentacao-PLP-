module Main where
-- Metodos para Funcionalidade 2 (avaliacoes de refeicoes) 
--Calcula o valor de gramas consumidas ate o momento
--Parametros: lista de porcoes = valor acumulado de gramas
acumulaGramas :: [Float] -> Float
acumulaGramas [] = 0
acumulaGramas (x:xs) = x + acumulaGramas xs

-- Calcula limite de gramas para o resto das refeicoes
-- Parametros: gramas max, valor acumulado nas refeicoes
limiteGramas :: Float -> Float -> Float
limiteGramas max soma = max - soma

-- Avalia uma porcao de proteina de uma dieta tipo 1
-- Parametros: prot, pesoAtual = string de avaliacao
avalProteina_1 :: Float -> Float -> String
avalProteina_1 prot pesoAtual
	| prot >= (1.4 * pesoAtual)/5 && prot <= (2 * pesoAtual)/5 = "Sua refeição tem a quantidade: IDEAL DE PROTEÍNA!"
	| prot < (1.4 * pesoAtual)/5 = "Sua refeição tem a quantidade: MENOR QUE A IDEAL DE PROTEÍNA!"
	| prot >(2 * pesoAtual)/5 = "Sua refeição tem a quantidade: SUPERIOR QUE A NECESSÁRIA DE PROTEÍNA! \nLembre-se que o nosso corpo tem um limite máximo de absorção."

-- Avalia uma porcao de proteina de uma dieta tipo 2
-- Parametros: prot, pesoAtual = string de avaliacao
avalProteina_2 :: Float -> Float -> String
avalProteina_2 prot pesoAtual
	| prot >= (0.8 * pesoAtual)/5 && prot <= (1.4 * pesoAtual)/5 = "Sua refeição tem a quantidade: IDEAL DE PROTEÍNA!"
	| prot < (0.8 * pesoAtual)/5 = "Sua refeição tem a quantidade: MENOR QUE A IDEAL DE PROTEÍNA!"
	| prot >(1.4 * pesoAtual)/5 = "Sua refeição tem a quantidade: SUPERIOR QUE A NECESSÁRIA DE PROTEÍNA! \nLembre-se que o nosso corpo tem um limite máximo de absorção."

-- Avalia uma porcao de carboidratos de uma dieta tipo 1
-- Parametros: carb = string de avaliacao
avalCarboidrato_1 :: Float -> String
avalCarboidrato_1 carb
	| carb >= 25 && carb <= 80 = "Sua refeição tem a quantidade: IDEAL DE CARBOIDRATOS!"
	| carb < 25 ="Sua refeição tem a quantidade: MENOR QUE A IDEAL DE CARBOIDRATOS!"
	| carb > 80 =  "Sua refeição tem a quantidade: SUPERIOR QUE A NECESSÁRIA DE CARBOIDRATOS! \nLembre-se que um alto consumo de carboitrados pode engordar."
	 
-- Avalia uma porcao de carboidratos de uma dieta tipo 2
-- Parametros: carb = string de avaliacao
avalCarboidrato_2 :: Float -> String
avalCarboidrato_2 carb
	| carb >= 10 && carb <= 30 = "Sua refeição tem a quantidade: IDEAL DE CARBOIDRATOS!"
	| carb < 10 ="Sua refeição tem a quantidade: MENOR QUE A IDEAL DE CARBOIDRATOS!"
	| carb > 30 =  "Sua refeição tem a quantidade: SUPERIOR QUE A NECESSÁRIA DE CARBOIDRATOS! \nLembre-se que um alto consumo de carboitrados pode engordar."

-- Avalia uma porcao de gordura das dietas do tipo 1 e 2
-- Parametros: gord = string de avaliacao
avalGordura :: Float -> String
avalGordura gord
	| gord >= 5.6 && gord <= 16.8 = "Sua refeição tem a quantidade: IDEAL DE GORDURAS!"
	| gord < 5.6 ="Sua refeição tem a quantidade: MENOR QUE A IDEAL DE GORDURAS!"
	| gord > 16.8 =  "Sua refeição tem a quantidade: SUPERIOR QUE A NECESSÁRIA DE GORDURAS! \nLembre-se que um alto consumo de gorduras faz mal à saúde."

-- Avalia uma refeicao baseada em pontos da dieta tipo 3
-- Paramentros: pontos = string de avaliacao
avalPontos :: Int -> String
avalPontos pontos
	| pontos == 6 = "Sua refeição tem a quantidade: IDEAL DE PONTOS! (para 5 refeições diárias)"
	| pontos < 6 = "Sua refeição tem a quantidade: MENOR QUE A IDEAL DE PONTOS! \nLembre-se em consumir seus pontos de forma equilibrada."
	| pontos > 6 = "Sua refeição tem a quantidade: MAIOR QUE A IDEAL DE PONTOS! \nLembre-se em consumir seus pontos de forma equilibrada."
	
-- Calcula limite de gramas para consumo
-- Parametros: peso, lista de porcoes, dieta, porcao = string de avaliacao
-- dieta (1) massa (2) emagrescimento (3) pontos
-- porcao: (1) proteina (2) carboidrato (3) gordura
avalConsumo :: Float -> [Float] -> Int -> Int -> String
avalConsumo pesoAtual (x:xs) dieta porcao
	| dieta == 1 && porcao == 1 = "Tente consumir em média " ++ show((pesoAtual * 2) / 5) ++ " gramas de PROTEÍNA por refeição. \nSeu limite de PROTEÍNAS no dia é " ++ show(limiteGramas (pesoAtual * 2) (acumulaGramas xs)) ++ " gramas." 
	| dieta == 1 && porcao == 2 = "Tente consumir em média " ++ show(200 / 5) ++ " gramas de CARBOITRADOS por refeição. \nSeu limite de CARBOITRADOS no dia é " ++ show(limiteGramas 200 (acumulaGramas xs)) ++ " gramas."
	
	| dieta == 2 && porcao == 1 = "Tente consumir em média " ++ show((pesoAtual * 1.4) / 5) ++ " gramas de PROTEÍNA por refeição. \nSeu limite de PROTEÍNAS no dia é " ++ show(limiteGramas (pesoAtual * 1.4) (acumulaGramas xs)) ++ " gramas." 
	| dieta == 2 && porcao == 2 = "Tente consumir em média " ++ show(100 / 5) ++ " gramas de CARBOITRADOS por refeição. \nSeu limite de CARBOITRADOS no dia é " ++ show(limiteGramas 100 (acumulaGramas xs)) ++ " gramas."
	
	| (dieta == 1 || dieta == 2)  && porcao == 3 = "Tente consumir em média " ++ show(22.2 / 5) ++ " gramas de GORDURAS por refeição. \nSeu limite de GORDURAS no dia é " ++ show(limiteGramas 22.2 (acumulaGramas xs)) ++ " gramas." 
	| dieta == 3 = "Tente consumir em média 6 pontos por refeição. \nSeu limite de PONTOS no dia é " ++ show(limiteGramas 30 (acumulaGramas xs))

-- Metodos para Funcionalidade 3 (calculo de indices e relatorios)

-- Calcula o IMC de um usuario com o pesoAtual
-- Paramentros: pesoAtual, altura = IMC 
calculaIMC :: Float -> Float -> Float
calculaIMC pesoAtual altura = pesoAtual / (altura^2)

-- Calcula o RCQ de um usuario a partir das medidas atuais da cintura e quadril
-- Paramentros: cintura, quadril = RCQ 
calculaRCQ :: Float -> Float -> Float
calculaRCQ cintura quadril = cintura / quadril

-- Avalia um resultado de IMC
-- Parametros: imc = string de avaliacao
avalIMC :: Float -> String
avalIMC imc
	| imc < 17.0 = "MUITO ABAIXO DO PESO"
	| imc >= 17.0 && imc < 18.5 = "ABAIXO DO PESO"
	| imc >= 18.5 && imc < 24.5 = "PESO NORMAL"
	| imc >= 24.5 && imc < 30.0 = "ACIMA DO PESO"
	| imc >= 30.0 && imc < 35.0 = "OBESIDADE I"
	| imc >= 35.0 && imc < 40.0 = "OBESIDADE II (severa)"
	| imc >= 40.0 = "OBESIDADE III (mórbida)" 

-- Avalia um resulta de RCQ
-- Parametros: rcq, sexo = string de avaliacao
avalRCQ :: Float -> String -> String
avalRCQ rcq sexo
	| (rcq < 0.80 && sexo == "F") || (rcq < 0.95 && sexo == "M") = "BAIXO RISCO DE SAUDE"
	| (rcq >= 0.80 && rcq <= 0.85 && sexo == "F") || (rcq >= 0.95 && rcq <= 1.0 && sexo == "M") = "MODERADO RISCO DE SAUDE"
	| (rcq > 0.85 && sexo == "F") || (rcq > 1.0 && sexo == "M") = "ALTO RISCO DE SAUDE"


main :: IO()
main = do
 x <- getLine
 y <- getLine
 z <- getLine
 aux <- getLine
 let peso = (read x :: Float)
 let prots = (read y :: Float)
 let carb = (read z :: Float)
 let lista = (read aux :: [Float])
 --putStrLn(show(maxGramasProt peso 1))
 --putStrLn(show(maxGramasProt peso 2))
 --putStrLn(show(acumulaGramas prots))
 --putStrLn(show(limiteGramas (maxGramasProt peso 1) (acumulaGramas prots)))
 putStrLn(avalProteina_1 prots peso)
 putStrLn(avalProteina_2 prots peso)
 putStrLn(avalCarboidrato_1 carb)
 putStrLn(avalCarboidrato_2 carb)
 putStrLn(avalConsumo peso lista 2 3)