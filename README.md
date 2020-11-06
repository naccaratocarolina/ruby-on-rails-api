# CRUD Básica em Ruby on Rails
## Índice
* [Informacoes Gerais](#informacoes-gerais)
* [Tecnologias](#tecnologias)
* [Setup](#setup)
  * [Linux](#linux)
  * [Windows](#windows)
* [Servir o projeto](#servir-o-projeto)

# Informações Gerais
Esse é o trabalho final do Processo Seletivo interno da EJCM para Tech Lead, onde tínhamos que construir uma CRUD básica com entidades que se relacionam em uma tecnologia que não dominamos. Escolhi fazer uma API usando <b>Ruby on Rails</b>. Esse é um projetinho bem simples que gera fatos aleatórios sobre gatos. As entidades são <b>Owner</b>, <b>Cat</b>, <b>Fact</b> e <b>Address</b>.<br />
### Relações
* Owner & Address: 1-1 <br />
Owner pode ter 1 Address <br />
Address é associado a 1 Owner <br />
* Owner & Cat: 1-n <br />
Owner pode ter n Cats <br />
Cat pode ter 1 Owner <br />
* Cat & Fact: 1-n <br />
Cat pode ter n Facts <br />
Fact é associado a 1 Cat <br />
### Rotas
Na Controller de cada entidade, está especificado como cada rota pode ser chamada. Esse projeto segue as regras API Rest, de forma que existe uma hierarquia de rotas. Então, no arquivo ```/config/routes.rb``` existe um encadeamento de rotas. Isso significa que, por exemplo, um gatinho só pode existir através de um dono. Ou seja, as rotas de cat sempre começam com ```/owners/:owner_id/cats```. <br />
É importante mencionar também que, por conta das relações, para criar um objeto cat (por exemplo), é necessário passar o owner_id como parametro. Para não precisar passar manualmente o id do owner sempre que um cat for criado, foi implementada uma lógica nas controllers para fazer isso automaticamente. Isso foi implementado em todas as entidades, exceto owner, em que não foi necessário.<br /><br />
Para testar as rotas, a URL é ```localhost:3000/nome-da-rota```. Em caso de dúvida, para ter uma visão geral das rotas dessa aplicação, rode o seguinte comando:
```
rake routes
```

# Tecnologias
* [Ruby](https://guides.rubyonrails.org/v3.2/)
* Rails

# Setup
Nessa seção, é possível encontrar o processo de instalação da linguagem Ruby e da framework Rails nos sistemas operacionais Linux e Windows.
## Linux
### 1. Instalar o rbenv e suas dependências
Ruby depende de vários pacotes que você pode instalar através do seu gerenciador de pacotes. Depois de instalados, você pode instalar o rbenv e usá-lo para instalar o Ruby, sendo este, portanto, o primeiro passo.<br />
Instale as dependências necessárias para o Ruby:
```
sudo apt install autoconf bison build-essential libssl-dev libyaml-dev libreadline6-dev zlib1g-dev libncurses5-dev libffi-dev libgdbm5 libgdbm-dev
```
Uma vez que as dependências foram instaladas, instale o próprio rbenv. Para isso, iremos clonar o repositório do rbenv e salvar em uma pasta na sua home chamada ```rbenv```
```
git clone https://github.com/rbenv/rbenv.git ~/.rbenv
```
Em seguida, adicione ```~/.rbenv/bin``` ao ```$PATH``` para que você possa usar o utilitário de linha de comando rbenv. Faremos isso alterando o arquivo ```~/.bashrc```, para que afete futuras sessões de login:
```
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
```
Em seguida, adicione o comando ```eval "$ (rbenv init -)"``` ao seu arquivo ```~/.bashrc``` para que o rbenv seja carregado automaticamente:
```echo 'eval "$(rbenv init -)"' >> ~/.bashrc```
Para aplicar essas mudanças ao arquivo ```~/.bashrc```:
```
source ~/.bashrc
```
Para verificar se o rbenv foi instalado corretamente, digite no seu terminal:
```
type rbenv
```
Em seguida, instale o plugin ruby-build. Este plug-in adiciona o comando ```rbenv install```, que simplifica o processo de instalação para novas versões do Ruby:
```
git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
```
Tudo dando certo até agora, temos o ```rbenv``` e o ```ruby-build``` instalados. O próximo passo é instalar o Ruby.

### 2. Instalando o Ruby com o ruby-build
Com o plugin ruby-build agora instalado, você pode instalar as versões do Ruby que você pode precisar através de um comando simples. Iremos instalar a versão 2.7.2 do Ruby:
```
rbenv install 2.7.2
```
Uma vez que o processo de instalacao concluir, é importante setar a versão recém instalada do Ruby como versão default:
```
rbenv global 2.7.2
```
Para checar que deu tudo certo, digite:
```
ruby -v
```

### 3. Trabalhando com Gems
Gems são a forma como as bibliotecas Ruby são distribuídas. Você usa o comando gem para gerenciar essas gems. Usaremos este comando para instalar o Rails. <br />
Quando você instala uma gem, o processo de instalação gera uma documentação local. Isso pode adicionar uma quantidade significativa de tempo ao processo de instalação de cada gem, então desative a geração de documentação local criando um arquivo chamado ```~/.gemrc``` que contém uma definição de configuração para desativar esse recurso:
```
echo "gem: --no-document" > ~/.gemrc
```
Bundler é uma ferramenta que gerencia dependências de gems para projetos. Em seguida, instale a gem Bundler, pois o Rails depende disso.
```
gem install bundler
```
Com as gems instaladas, você pode instalar o Rails.

### 4. Instalando o Rails
Para instalar o Rails, use o comando gem install, junto com a flag -v para especificar a versão:
```
gem install rails -v 5.2.0
```
Rails é uma framework de desenvolvimento web complexa e tem muitas dependências, então o processo levará algum tempo para ser concluído. Eventualmente, você verá uma mensagem informando que o Rails está instalado, junto com suas dependências.<br />
Para verificar se ocorreu tudo certo na instalação, digite:
```
rails -v 
```

### 5. Instalando o yarn
Yarn é um gerenciador de pacotes que ajuda a automatizar o processo de instalação, atualização, configuração e remoção de pacotes npm. Ou seja, ter o Node.js instalado é um pré-requisito nesse caso. Usaremos ele para instalar um projeto em Ruby on Rails que foi clonado.<br />
Importe a chave GPG do repositório e adicione o repositório Yarn APT ao seu sistema executando os seguintes comandos:
```
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
```
Assim que o repositório estiver habilitado, instale o Yarn:
```
sudo apt install yarn
```
Para verificar se deu tudo certo:
```
yarn --version
```
Com isso, teremos todas as ferramentas instaladas e podemos servir o projeto.

## Windows
### 1. Instalando o Ruby
No Windows, voce pode usar o [RubyInstaller](https://rubyinstaller.org) para setar rapidamente o ambiente do Ruby. Você pode instalar o Devkit com o [Ruby na versão 2.7.2](https://github.com/oneclick/rubyinstaller2/releases/download/RubyInstaller-2.7.2-1/rubyinstaller-devkit-2.7.2-1-x64.exe), ou visitar o site para escolher a versão desejada.<br />
<i>Observação:</i> Se você está planejando desenvolver aplicativos Rails no Windows 10, o interpretador Ruby instalado no Windows Subsystem for Linux (WSL) pode ser uma escolha melhor. Saiba mais [nesse link](https://www.jetbrains.com/help/ruby/configuring-remote-interpreters-using-wsl.html?gclid=Cj0KCQiAhZT9BRDmARIsAN2E-J2ZeDUR4iZ7lqSJ6C5_dZPK2qSTfcA1s2WT04TU5o8cpYVsLawt1EYaAurgEALw_wcB#wsl_remote).<br />
Para verificar se o Ruby foi instalado com sucesso, abra o prompt e execute o comando:
```
ruby -v
```

### 2. Trabalhando com Gems
O interpretador Ruby instalado é fornecido com um conjunto de bibliotecas de terceiros. A maioria dessas bibliotecas é distribuída como uma gem - uma biblioteca ou aplicativo empacotado que pode ser instalado com uma ferramenta chamada RubyGems. Essa ferramenta vem embutida com o [RubyInstaller](https://rubyinstaller.org), então você provavelmente não vai precisar instalar a mesma manualmente. Para verificar que esse comando foi instalado corretamente, rode o comando:
```
gem --version
```

### 3. Instalando o Bundler
A próxima biblioteca importante que você precisa instalar em seu interpretador Ruby é o Bundler. Esta ferramenta permite que você gerencie as dependências do seu projeto e instale gems nas versões exatas que são necessárias. Para realizar a sua instalação, basta:
```
gem install bundler
```

### 4. Instalando o Rails
Para trabalhar com projetos Rails, você precisa instalar a gem 'rails' no interpretador Ruby.
```
gem install rails
```

### 5. Instalando o yarn
É importante dizer que ter o Node.js é um pré-requisito para a instalação do yarn. Dito isto, você pode baixar o [instalador .msi](https://classic.yarnpkg.com/latest.msi) do [Site Oficial da Yarn](https://classic.yarnpkg.com/en/docs/install#windows-stable) e executá-lo.

# Servir o projeto
### 1. Clonar o projeto e instalar dependências
O primeiro passo é clonar esse repositório.
```
git clone https://github.com/naccaratocarolina/ruby-on-rails-cat-facts-api.git
```
Em seguida, temos que instalar todos os pacotes e dependências que não são uppadas no github:
```
yarn install
```
Em uma das controllers usamos a dependência ```uri```, usada para se conectar com endpoints de apis, e a ```sqlite3```, que vai gerenciar as migrations. Ao criar um projeto com Ruby on Rails, é importante colocar a chamada de todas as gems utilizadas no arquivo ```Gemfile```. Assim, permite que as pessoas que instalem esse projeto realizem a instalação dessas gems automaticamente usando o bundle:
```
bundle install
```

### 2. Migrations & Seeders
Para migrar as tabelas desse projeto, junto da Seeder em que alguns objetos foram criados, digite no seu terminal:
```
rake db:migrate db:seed
```

### 3. Servindo o projeto
Com todas as configurações feitas, podemos servir o projeto
```
rails server
```
Para testar as rotas, a URL é ```localhost:3000/nome-da-rota```.
