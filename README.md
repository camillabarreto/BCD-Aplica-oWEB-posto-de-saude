# 2020-02-projeto-pratico-02-camillabarreto
![Diagrama ER](/diagramaER.png)


## Como executar o programa

Abra o terminal no diretório projeto-bcd-02 e digite:
`python3 app.py`

## Como usar a aplicação

Abra um navegador e acesse o link http://127.0.0.1:5000/ . Na barra superior da página existe a aba Paciente, nela é possível ir para a página Buscar ou Cadastrar.

### Cadastrar

A página exibirá um formulário com os dados necessários para registrar um novo paciente. Os campos possuem dicas e exemplos de como fazer o preenchimento daqueles dados.

### Buscar

Nessa página é solicidado o CPF do paciente que deseja consultar os dados. O campo possui dica e exemplo de como fazer o preenchimento.
Veja alguns registros para utilizar.

Nome   | CPF
--------- | ------
Camilla Barreto | 11122233344
Gabriela Barreto | 99988899988

Ao acessar um paciente válido o programa direciona para a página da caderneta de vacinação do paciente. Nessa página é possível ver as vacinas que o paciente já tomou e as vacinas que precisa tomar, segundo o calendário do ano atual. Para as vacinas que ainda não foram aplicadas é possível registrar uma nova aplicação e a página é recarregada mostrando a caderneta atualizada.
