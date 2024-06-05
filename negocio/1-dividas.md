# Dívidas

Aplicação que permite o usuário cadastrar dívidas e visualizar todas as dívidas cadastradas.
Para isso serão implementadas as seguintes funcionalidades:
* Cadastro de dívidas
* Informar que uma dívida foi paga
* Listagem de dívidas
* Relatório de dívidas pagas e não pagas

## Cadastro de dívidas
O usuário poderá cadastrar uma dívida informando os seguintes campos:
* Descrição da dívida
* Valor da dívida
* Parcelas à pagar
* Parcelas pagas

Ao realizar o cadastro a aplicação irá gerar algumas informações automaticamente:
* Data e hora de cadastro : será a data corrente da operação
* Data início de pagamento: será calculado a partir da data de cadastro menos os meses ja pagos a partir da quantidade de parcelas pagas
  * Exemplo: Se a dívida foi cadastrada em 01/01/2021 e o usuário informou que já pagou 3 parcelas, a data de início de pagamento será 01/10/2020
* Data fim de pagamento: será calculado a partir da data de início de pagamento (calculado anteriormente) mais a quantidade de parcelas cadastradas
  * Exemplo: Se a dívida data de início for em 01/01/2021 e o usuário informou que a dívida será paga em 12 parcelas, a data fim de pagamento será 01/01/2022
* Será gerado um registro de historico de dívida com os seguintes campos:
  * Data e hora de cadastro do historico: será a data corrente da operação
  * FK Divida (chave estrangeira para a dívida cadastrada)
  * Ação: C (Cadastro)
* Caso o campo Parcelas Pagas seja maior que 0, será gerado um registro de historico de dívida (para cada parcela paga)com os seguintes campos:
  * Data e hora de cadastro do historico: será a data corrente da operação
  * FK Divida (chave estrangeira para a dívida cadastrada)
  * Ação: P (Pagamento)
* Caso o campo Parcelas Paga for igual ao campo Parcelas à pagar, será gerado um registro de historico de dívida com os seguintes campos:
  * Data e hora de cadastro do historico: será a data corrente da operação
  * FK Divida (chave estrangeira para a dívida cadastrada)
  * Ação: D (Dívida paga)

## Informar que uma dívida foi paga
O usuário poderá informar que uma dívida foi paga.

Ao realizar a operação a aplicação irá gerar algumas informações automaticamente:
* Parcelas Pagas: será incrementado a quantidade de parcelas pagas
* Será gerado um registro de historico de dívida com os seguintes campos:
  * Data e hora de cadastro do historico: será a data corrente da operação
  * FK Divida (chave estrangeira para a dívida cadastrada)
  * Ação: P (Pagamento)
* Caso essa seja a ultima parcela a pagar será gerado um registro de historico de dívida com os seguintes campos:
  * Data e hora de cadastro do historico: será a data corrente da operação
  * FK Divida (chave estrangeira para a dívida cadastrada)
  * Ação: D (Dívida paga)
