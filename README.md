# Análise de Dados de Jogos por Plataforma

Este projeto analisa dados de jogos para comparar a quantidade e a média de notas entre diferentes plataformas (PC, PS4, XONE, NS). Os dados foram processados e visualizados utilizando R e as bibliotecas `ggplot2`, `dplyr` e `tidyr`.

## Conteúdo

* **`Games.csv`**: Arquivo CSV contendo os dados dos jogos.
* **`analise_jogos.R`**: Script R contendo o código de análise e visualização dos dados.
* **`README.md`**: Este arquivo, explicando o projeto e como executá-lo.

## Pré-requisitos

* R (versão 4.0 ou superior)
* RStudio (opcional, mas recomendado)
* Bibliotecas R: `ggplot2`, `dplyr`, `tidyr`, `tidyverse`

## Como Executar

1.  **Instale as bibliotecas R necessárias**:
    ```R
    install.packages(c("ggplot2", "dplyr", "tidyr", "tidyverse"))
    ```
2.  **Clone o repositório ou baixe os arquivos**.
3.  **Abra o arquivo `analise_jogos.R` no RStudio ou em outro editor de R**.
4.  **Certifique-se de que o arquivo `Games.csv` esteja no mesmo diretório que o script R**.
5.  **Execute o script `analise_jogos.R` linha por linha ou inteiro, para gerar os gráficos e as análises**.

## Descrição do Código

O script `analise_jogos.R` realiza as seguintes etapas:

1.  **Carrega as bibliotecas necessárias**:
    * `ggplot2`: Para visualização de dados.
    * `dplyr`: Para manipulação de dados.
    * `tidyr`: Para transformação de dados.
    * `tidyverse`: Para simplificar o carregamento de muitos pacotes.
2.  **Carrega os dados do arquivo `Games.csv` em um dataframe chamado `Games`**.
3.  **Realiza transformações nos dados**:
    * Separa os consoles em colunas individuais (PC, PS4, XONE, NS).
    * Calcula a quantidade de jogos por plataforma.
    * Calcula a média das notas por plataforma.
4.  **Gera gráficos**:
    * Gráfico de barras mostrando a quantidade de jogos por plataforma.
    * Gráfico de pizza mostrando a distribuição de jogos por plataforma.
    * Gráfico de barras mostrando a média das notas por plataforma (horizontal e vertical).
5.  **Gera gráficos de barras horizontais com as médias das notas por plataforma, com dados filtrados**.

## Resultados

Os gráficos gerados mostram:

* A quantidade de jogos em cada plataforma.
* A distribuição dos jogos entre as plataformas.
* A média das notas dos jogos em cada plataforma.
* A média das notas dos jogos em cada plataforma com dados filtrados.

## Observações

* O arquivo `Games.csv` deve estar no mesmo diretório que o script R.
* Os gráficos são gerados na janela de gráficos do RStudio ou em um dispositivo gráfico padrão.
* Os gráficos gerados podem ser modificados com o pacote ggplot2.

## Contribuição

Contribuições são bem-vindas! Se você encontrar algum problema ou tiver sugestões de melhorias, por favor, abra um issue ou envie um pull request.
