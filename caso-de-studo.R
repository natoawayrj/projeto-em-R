library(ggplot2)
library(tidyverse)
Games <- read.csv("Games.csv")

View(Games)
library(dplyr)#manipulando os dados
library(tidyr)#com este pacote podemos transformar dados(dividir colunas)

#separando os tipos de consoles na coluna Console

plataforma <- Games %>%
  select(-Review) %>%
  mutate(
    PC = ifelse(grepl("PC", Console), GameName, NA),
    PS4 = ifelse(grepl("PS4", Console), GameName, NA),
    XONE = ifelse(grepl("XONE", Console), GameName, NA),
    NS = ifelse(grepl("NS", Console), GameName, NA)
  )%>%
  select(-Console)

View(plataforma)

# Contar quantos jogos existem em cada plataforma
plataforma_long <- plataforma %>%
  pivot_longer(cols = c(PC, PS4, XONE, NS), names_to = "Plataforma", values_to = "Jogo") %>%
  filter(!is.na(Jogo)) %>%
  group_by(Plataforma) %>%
  summarise(Quantidade = n())
view(plataforma_long)

# Criar o gráfico de barras
ggplot(plataforma_long, aes(x = Plataforma, y = Quantidade, fill = Plataforma)) +
  geom_bar(stat = "identity") +
  theme_minimal() +
  labs(title = "Quantidade de Jogos por Plataforma", x = "Plataforma", y = "Número de Jogos") +
  theme(legend.position = "none")

# gráfico em forma de pizza

ggplot(plataforma_long, aes(x = "", y = Quantidade, fill = Plataforma)) +
  geom_bar(stat = "identity", width = 1) +
  coord_polar("y") +
  theme_void() +
  labs(title = "Distribuição de Jogos por Plataforma")


plataforma_long <- Games %>%
  select(GameName, Console, Score) %>%
  separate_rows(Console, sep = ", ") %>%  # Separar múltiplos consoles em linhas separadas
  group_by(Console) %>%  # Agrupar por plataforma
  summarise(Media_Score = mean(Score, na.rm = TRUE)) %>%  # Calcular a média das notas
  arrange(desc(Media_Score))  # Ordenar da maior para a menor

# Criar o gráfico de barras com as médias das notas por plataforma
ggplot(plataforma_long, aes(x = reorder(Console, Media_Score), y = Media_Score, fill = Console)) +
  geom_bar(stat = "identity") +
  coord_flip() +  # Inverter o eixo para melhor visualização
  theme_minimal() +
  labs(title = "Média das Notas por Plataforma", x = "Plataforma", y = "Média das Notas") +
  theme(legend.position = "none")

ggplot(plataforma_long, aes(x = Console, y = Media_Score, fill = Console)) +
  geom_bar(stat = "identity") +
  theme_minimal() +
  labs(title = "Média das Notas por Plataforma", x = "Plataforma", y = "Média das Notas") +
  theme(legend.position = "none") +
  ylim(0,10)


# Criar o gráfico de barras com as médias das notas por plataforma
ggplot(plataforma_long, aes(x = Console, y = Media_Score, fill = Console)) +
  geom_bar(stat = "identity") +
  theme_minimal() +
  labs(title = "Média das Notas por Plataforma", x = "Plataforma", y = "Média das Notas") +
  theme(legend.position = "none", axis.text.x = element_text(angle = 45, hjust = 1)) + # Rotaciona os rótulos em 45 graus
  ylim(0,10)



# Filtrar e preparar os dados
plataforma_long <- Games %>%
  separate_rows(Console, sep = ", ") %>%
  filter(Console %in% c("PC", "PS4", "XONE", "NS")) %>%
  group_by(Console) %>%
  summarise(Media_Score = mean(Score, na.rm = TRUE))



# Criar o gráfico de barras horizontais
ggplot(plataforma_long, aes(x = reorder(Console, Media_Score), y = Media_Score, fill = Console)) +
  geom_bar(stat = "identity") +
  coord_flip() + # Inverte os eixos
  theme_minimal() +
  labs(title = "Média das Notas por Plataforma (PC, PS4, XONE, NS)", 
       x = "Plataforma", y = "Média das Notas") +
  theme(legend.position = "none") +
  ylim(0, 10) # Garante que o eixo y esteja na mesma escala
