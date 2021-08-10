Comando abaixo ilustra como efetuar o cálculo de diferença entre duas datas, mostrando a diferença em horas, minutos e segundos.

SELECT DATEDIFF(HOUR, dt_inicial, COALESCE(dt_final,dt_inicial))|| ' HR ' || CAST(( (CAST (DATEDIFF(MINUTE, dt_inicial, COALESCE(dt_final,dt_inicial)) AS DECIMAL (18,2)) / 60)  - (DATEDIFF(HOUR, dt_inicial, COALESCE(dt_final,dt_inicial)))   ) * 60 AS INTEGER )||' MIN' AS TEMPO_GASTO
FROM dual;

Abaixo segue explicação de cada parte do comando SQL:

DATEDIFF(HOUR, dt_inicial, COALESCE(dt_final,dt_inicial))
Quantidade de horas inteiras entre o horário de entrada e saída
Exemplo:
Dt Inicial: 25/09/2020 13:24:00
Dt Final: 25/09/2020 15:23:45
Consulta irá retornar o valor 1

COALESCE(dt_final,dt_inicial)
Caso algum registro esteja sem a coluna dt_final preenchida, irá utilizar a dt_inicial

DATEDIFF(MINUTE, dt_inicial, COALESCE(dt_final,dt_inicial))
Quantidade em minutos entre o horário de entrada e saída
Exemplo:
Dt Inicial: 25/09/2020 13:24:00
Dt Final: 25/09/2020 15:23:45
Consulta irá retornar o valor 119

CAST (DATEDIFF(MINUTE, dt_inicial, COALESCE(dt_final,dt_inicial)) AS DECIMAL (18,2)) 
Diferença em minutos é convertida para o formato decimal, com precisão de duas casas decimais.
Exemplo:
Dt Inicial: 25/09/2020 13:24:00
Dt Final: 25/09/2020 15:23:45
Consulta irá retornar o valor 119,00

(CAST (DATEDIFF(MINUTE, dt_inicial, COALESCE(dt_final,dt_inicial)) AS DECIMAL (18,2)) / 60)
Em seguida, o resultado é divido por 60. Esta operação obtem a quantidade de horas inteiras + horas fracionadas
Exemplo:
Dt Inicial: 25/09/2020 13:24:00
Dt Final: 25/09/2020 15:23:45
Consulta irá retornar o valor 1,983

( (CAST (DATEDIFF(MINUTE, dt_inicial, COALESCE(dt_final,dt_inicial)) AS DECIMAL (18,2)) / 60)  - 
(datediff(HOUR, dt_inicial, COALESCE(dt_final,dt_inicial)))   )
Quantidade total de horas (inteiras e fracionadas) menos a quantidade de horas inteiras. Com isto obtém-se a quantidade de horas fracionadas.
Exemplo:
Dt Inicial: 25/09/2020 13:24:00
Dt Final: 25/09/2020 15:23:45
Horas inteiras + fracionadas: 1,983
Horas inteiras: 1
Consulta irá retornar 0,983

( (CAST (DATEDIFF(MINUTE, dt_inicial, COALESCE(dt_final,dt_inicial)) AS DECIMAL (18,2)) / 60)  - 
(DATEDIFF(HOUR, dt_inicial, COALESCE(dt_final,dt_inicial)))   ) * 60
Quantidade de horas fracionadas é multiplicado por 60 para encontrar o valor equivalente em minutos
Exemplo:
Dt Inicial: 25/09/2020 13:24:00
Dt Final: 25/09/2020 15:23:45
Consulta irá retornar: 59,0000

CAST(( (CAST (DATEDIFF(MINUTE, dt_inicial, COALESCE(dt_final,dt_inicial)) AS DECIMAL (18,2)) / 60)  - 
(DATEDIFF(HOUR, dt_inicial, COALESCE(dt_final,dt_inicial)))   ) * 60 AS INTEGER )
Utiliza o comando CAST para converter e arredondar a quantidade de minutos obtidos em inteiro.
Exemplo:
Dt Inicial: 25/09/2020 13:24:00
Dt Final: 25/09/2020 15:23:45
Consulta irá retornar: 58
