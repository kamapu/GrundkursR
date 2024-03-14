# Daten herunterladen...

# Paketen laden

library(ggplot2)
library(tidyr)
library(dplyr)

# Daten laden
Bevoelkerung <- readRDS("BonnBevoelkerung.rds")
Bezirke <- readRDS("BonnBezirke.rds")

Bevoelkerung <- merge(Bevoelkerung, Bezirke)

rm(Bezirke)

# Boxplot
Bevoelkerung %>%
  ggplot(aes(x = StadtBezirk, y = Gesamt,
             fill = StadtBezirk)) +
  geom_boxplot()

# Boxplot für nur ein Jahr
Bevoelkerung %>% filter(Jahr == 2021) %>%
  ggplot(aes(x = StadtBezirk, y = Gesamt,
             fill = StadtBezirk)) +
  geom_boxplot()

# Boxplots gruppiert pro Jahr
Bevoelkerung %>%
  ggplot(aes(x = factor(Jahr), y = Gesamt,
             fill = StadtBezirk)) +
  geom_boxplot()

# Nutzung des plots als Objekt
my_boxp <- Bevoelkerung %>%
  ggplot(aes(x = factor(Jahr), y = Gesamt,
             fill = StadtBezirk)) +
  geom_boxplot()

my_boxp +
  geom_jitter(size = 0.4, alpha = 0.5)

# Ganzes Comand
Bevoelkerung %>%
  ggplot(aes(x = factor(Jahr), y = Gesamt,
             fill = StadtBezirk)) +
  geom_boxplot() +
  geom_jitter(size = 0.4, alpha = 0.5)

# Linien zeigen
Bevoelkerung %>%
  ggplot(aes(x = factor(Jahr), y = Gesamt,
             group = BezirkName,
             color = StadtBezirk)) +
  geom_line()

# Linien zeigen und Panelle erzeugen
Bevoelkerung %>%
  ggplot(aes(x = factor(Jahr), y = Gesamt,
             group = BezirkName,
             color = StadtBezirk)) +
  geom_line() +
  facet_wrap(~StadtBezirk)

# Histogramme
Bevoelkerung %>% filter(Jahr == 2021) %>%
  ggplot(aes(x = Gesamt)) +
  geom_histogram()

# Histogramme für alle Jahre
Bevoelkerung %>%
  ggplot(aes(x = Gesamt)) +
  geom_histogram() +
  facet_wrap(~Jahr)

# Jetzt nach Gender
GenderTab <- pivot_longer(Bevoelkerung[c(
  "BezirkNr",
  "BezirkName",
  "StadtBezirk",
  "Jahr",
  "Maenner",
  "Frauen")],
  cols = c("Frauen", "Maenner"),
  names_to = "Gender",
  values_to = "Anzahl")

head(GenderTab)

# Histogram für Jahr 2021 nach Gender
GenderTab %>% filter(Jahr == 2021) %>%
  ggplot(aes(x = Anzahl, fill = Gender)) +
  geom_histogram()

# Histogramme nach Jahren gezeigt
GenderTab %>%
  ggplot(aes(x = Anzahl, fill = Gender)) +
  geom_histogram() +
  facet_wrap(~Jahr)
