# BashScripting

No dia-a-dia do testador de softwares, muitas ferramentas podem ser utilizadas para otimização do tempo e maior assertividade dos resultados. Um exemplo é o uso de programas e scripts simples, que podem realizar funções repetitivas, compreendendo desde o preenchimento de dados, até o envio de solicitações para APIs. Abaixo, um exemplo de como isso pode ser útil.

## Arquivo "comando-para-recarga.sh":
<br>Script simples, feito para o envio de requisições para uma API no formato SOAP.  

Esse script tem como entradas do usuário o número de telefone e um valor a ser inserido. Ele então cria uma requisição SOAP com essas informações, realiza o envio para o endpoint e exibe a resposta.

**Funcionamento**
Entrada de Dados:

O script solicita o número de telefone e o valor em centavos.
Essas informações são armazenadas nas variáveis telefone e valor.

**Geração de Timestamp:**

Um timestamp é gerado usando o comando date, armazenado na variável data_hora, e usado como o valor para MessageSeq na requisição SOAP.

**Construção da Requisição SOAP:**

A requisição SOAP é montada em um formato XML, incorporando o número de telefone, o valor, e o timestamp.

**Envio da Requisição:**

A requisição é enviada para o endpoint especificado (http://12345) usando o comando curl.
O cabeçalho Content-Type: text/xml é utilizado para definir o tipo de conteúdo da requisição.

**Exibição da Resposta:**

A resposta do servidor é capturada e formatada usando o comando xmllint para facilitar a leitura.

**Variáveis:**

telefone: Número de telefone inserido pelo usuário.
valor: Valor em centavos inserido pelo usuário.
data_hora: Timestamp gerado para o campo MessageSeq.
messageseq: Valor do timestamp utilizado como sequência de mensagem.
endpoint: URL do servidor para onde a requisição SOAP será enviada.
request_body: Corpo da requisição SOAP, montado dinamicamente com base nas entradas do usuário.
response: Resposta do servidor, capturada e formatada.
