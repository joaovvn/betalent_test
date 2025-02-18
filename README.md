# BeTalent Mobile

Aplicativo Flutter para visualização de funcionários.

## Funcionalidades

- ### Listagem

  Listagem de funcionários, com dados como foto, nome, telefone, cargo e data de admissão.

- ### Pesquisa

  Pesquisa de funcionários através de nome, telefone e cargo.

## Tecnologias

- **Mobile:** [Flutter](https://docs.flutter.dev/).

- **API:** [Local - Json-Server](https://www.npmjs.com/package/json-server/).

## Bibliotecas Externas

- **_Gerenciamento de Estado:_** [GetX](https://pub.dev/packages/get).

- **_Conexão HTTP:_** [HTTP](https://pub.dev/packages/http).

## Rodando

1. Clone o repositório:

   ```bash
   git clone https://github.com/joaovvn/betalent_test.git
   ```

2. Instale as dependências:

   ```bash
   dart pub get
   ```

3. Escolha o seu emulador:

   O emulador **deve** usar API Android 21 ou acima, preferencialmente acima da 35.

4. Rode a aplicação:

   ```bash
   flutter run
   ```

## Estrutura do projeto

- ### lib/core

  Essenciais para o funcionamento do aplicativo.

  - #### lib/core/constants

    Constantes.

  - #### lib/core/services

    Serviços como a conexão com a API.

  - #### lib/core/utils

    Utilitários.

- ### lib/features

  Implementação das telas.

  - #### lib/features/####/view

    Contém a interface.

  - #### lib/features/####/view_model

    Contém o ViewModel da tela, que é toda a conexão entre os objetos e a interface.

  - #### lib/features/####/widgets

    Contém widgets específicos da tela.

- ### lib/shared

  Conteúdo compartilhado do aplicativo

  - #### lib/shared/models

    Objetos.

  - #### lib/shared/repositories

    Conexão entre a API e os ViewModels.
