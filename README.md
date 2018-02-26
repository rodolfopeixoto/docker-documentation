# Docker

Listar os containers que estão ativos no momento

```
  docker ps
```
Listar todos os containers que já foram criados (os parados também)

```
  docker ps -a
```

Cria um outro container baseado na imagem que deseja.

```
  docker run [nome da imagem ]
  
  docker run ubuntu
```

Para executar algo, basta digitar o comando na frente da imagem, por exemplo:

```
 docker run ubuntu echo "Criei o container"

 # Criei o container
```

Para dar um bind(linkar, conectar o terminal do container e o terminal da sistema operacional) basta iterar adicionando as tags **-it**

```sh
  docker run -it ubuntu
```

O comando acima funciona para conectar o terminal que utilizamos com o container, basta digitar:

```
  docker run -it [NOME DA IMAGEM]
```

Para sair do container basta pressionar CTRL + D e o docker pausará seu container. Caso, deseje start(iniciar, novamente). Porém, você
vai precisar do código do container ou o nome dele, basta então digitar.

```sh
  docker ps -a
```

Listará todos os containters e basta pegar o CONTAINER ID ou NAMES daquele determinado container que deseja iniciar.

```sh
  docker start [ CONTAINER ID OU NAMES]
```

Porém, com o **docker start** você só iniciar e não tem iteração nenhuma com o terminal. Basta você parar o containter

```sh
  docker stop [ CONTAINER ID OU NAMES ]
```

Para iterar o terminal e iniciar o container, precisamos passar a frag -a (attach) -i (iterative)

```sh
  docker start -a -i [ CONTAINER ID ou NAMES ]
```

Para parar todos os containers basta digitar o comando abaixo:

```sh
  docker stop $( docker ps -aq )
```


Para remover todos os containers basta utilizar o comando abaixo:

```sh
  docker rm $( docker ps -aq)
```

Para remover todos os containers que estão parados, basta digitar:

```
  docker container prune
```

Para remover a imagem passada como parametro

```
 docker rmi [NOME DA IMAGEM]
```

Para dar um nome ao container você pode digitar

```sh
  docker run -d -P --name NOME [IMAGEM]
```

O docker por parâmetro "mata" o container por padrão em 10 segundos, caso queira "matar" em 0 segundos basta digitar o comando abaixo:

```sh
  docker stop -t 0 [hash do container ou CONTAINER_NOME]
``` 

Caso você queira desatrelar o terminal do container ao seu terminal basta utilizar a flag -d e para gerar portas aleatórias no container coloque a flag -P:

```sh
  docker run -d -P [IMAGEM por exemplo: ubuntu]
```

```sh
  docker run -d -P --name rodolfoContainer ubuntu
```

Para verificar a porta que o docker está usando basta digitar:

```sh
  docker port [CONTAINER ID]
```

Para definir uma porta específica para ser atribuída à porta 80 do container, neste caso 12345:

```sh
  docker run -d -p 12345:80 ubuntu
```

Para definir uma variável de ambiente AUTHOR com o valor Fulano no container criado.

```sh
  docker run -d -e AUTHOR="Fulano" ubuntu
```

O docker trabalha com diversas camadas o que nos da diversas vantagens, tendo em vista que essas camadas poderão ser reaproveitdas por outras imagens, fazendo com que
 a gente faça o download de menos arquivos.

 - Layered Filesystem
 - Algumas camadas são bloqueadas para escrita ( read only ). O que ocorrer é que quando a escrevemos algo no docker, ele cria uma nova layer que permite read/write Layer.


 ### Volumes

 Quando criamos um **data volume** que específica que essa pasta é uma volume de dados e com isso ela aponta para uma pasta do Docker Host
 
 Para criar um volume, basta digitar a flag -v, pasta e imagem:

```sh
  docker run -v "/var/www" ubuntu
```