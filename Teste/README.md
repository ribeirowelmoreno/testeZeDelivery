# Projeto de teste para Analista de Qualidade Zé Delivery
 
 Esse é um prjeto de automação feito em Ruby com Selenium Webdriver para automatizar alguns cenários da aplicação Web do Zé Delivery.
 Esse projeto está preparado para rodar através do google chrome e firefox, mas só tem o driver do chrome no projeto.

 ## Iniciando

 Essas instruções ajudarão na execução do projeto em uma máquina local

 ### Pré-requisitos

 Esse projeto requer uma versão 2.4.4 ou superior do Ruby, com essa versão, você conseguirá rodar os testes corretamente.

 Depois do Ruby instalado você deve instalar a biblioteca "bundler" através do comando abaixo:
```
 gem install bundler
```

Também, instale o binstubs, ele ajudará a rodar os testes cucumber, com o seguinte comando:
```
bundle install --binstubs
```

### Instalação

Para instalar todas as dependências do projeto, rode o comando abaixo:
```
bundle install
```

## Rodando o projeto

Para rodar um cenário de teste específico, rode o comando abaixo:
```
cucumber -t @tag-especifica
```

Para rodar toda a suite de testes, rode o comando abaixo:
```
cucumber -t @rodar-tudo
```





