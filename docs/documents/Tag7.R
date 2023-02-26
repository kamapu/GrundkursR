# Ein neuer Tag ----
download.file(
  url = "https://kamapu.github.io/RKurs-VHS-2022/documents/KursDateien.zip",
  destfile = "KursDateien.zip", method = "curl")
unzip("KursDateien.zip", overwrite = TRUE)
unlink("KursDateien.zip")

# Dateien in der Sitzung laden
Bonn <- readRDS("BonnBevoelkerung.rds")
Bezirke <- readRDS("BonnBezirke.rds")

Bonn <- merge (Bonn, Bezirke)
rm(Bezirke)

# Cross-check auf Konsistenz ----
with(Bonn, all(Frauen + Maenner == Gesamt))
subset(Bonn, Frauen + Maenner != Gesamt)
1509+1578

# Tabellen umstellen ---
Bonn$Eing <- with(Bonn, Gesamt - Auslaender)

library(tidyr)

Bonn_long <- pivot_longer(Bonn, cols = c("Eing", "Auslaender"),
                   names_to = "Herkunft", values_to = "Anzahl")
head(Bonn_long)

Bonn_aggr <- aggregate(Anzahl ~ StadtBezirk + Herkunft,
                       data = subset(Bonn_long, Jahr == 2020),
                       FUN = sum)

Bonn_aggr <- split(Bonn_aggr, Bonn_aggr$StadtBezirk)

# Loop
par_old <- par(no.readonly = TRUE)

par(par_old)

names(Bonn_aggr)

par(mfrow = c(2, 2))
for(i in names(Bonn_aggr)) {
  x <- Bonn_aggr[[i]]$Anzahl
  names(x) <- Bonn_aggr[[i]]$Herkunft
  pie(x, main = i)
}

# ggplot 2 ----
# Schau mal das Inhaltsverzeichnis

## boxplots ----

### ein Beispiel ----

library(ggplot2)

par(par_old)

meinGrafik <- Bonn %>%
  ggplot(aes(x = StadtBezirk, y = Gesamt,
             fill = StadtBezirk)) +
  geom_boxplot()
meinGrafik

meinGrafik <- ggplot(Bonn, aes(x = StadtBezirk, y = Gesamt,
           fill = StadtBezirk)) +
  geom_boxplot()

# Neue Schichten auf gespeicherte Grafik
meinGrafik +
  facet_wrap(~Jahr)

# Automatisieren ----
# Loops
# Funktionen
# Quellcode
# Paket

## Loop ----
for (i in names(Bonn)) {
  if (is.numeric(Bonn[[i]])) {
    print(paste(i, mean(Bonn[[i]])))
  } else {
    next
  }
}

Mittelwert <-list()
for (i in names(Bonn)) {
  if (is.numeric(Bonn[[i]])) {
    Mittelwert[[i]] <- mean(Bonn[[i]])
  }
}
Mittelwert

Mittelwert <- do.call(c, Mittelwert)
Mittelwert

## Funktionen ----
BonnStats <- function(x) {
  out <- c(mean(x), sd(x))
  names(out) <- c("Mittelwert", "Standardabweichung")
  return(out)
}

BonnStats(Bonn$Gesamt)
BonnStats(Bonn$Frauen)

x <- Bonn$Gesamt
x[c(5, 15)] <- NA
summary(x)

BonnStats(x)

?mean
?sd

BonnStats <- function(x, ...) {
  out <- c(mean(x, ...), sd(x, ...))
  names(out) <- c("Mittelwert", "Standardabweichung")
  return(out)
}

BonnStats(x)
BonnStats(x, na.rm = TRUE)

BonnStats(Bonn$BezirkName)

BonnStats <- function(x, ...) {
  if (!is.numeric(x))
    stop("Der Wert 'x' muss numerisch sein!")
  out <- c(mean(x, ...), sd(x, ...))
  names(out) <- c("Mittelwert", "Standardabweichung")
  return(out)
}

BonnStats(Bonn$BezirkName)

## Quellcode ----
# Check in Skript 'MeineFunktionen.R'

# Löschen der Funktion
rm(BonnStats)
BonnStats(Bonn$BezirkName)

# Lade die Funktion auf den Quellcode
source("MeineFunktionen.R")

# Lade und in die Konsole zeigen
rm(BonnStats)
source("MeineFunktionen.R", echo = TRUE)
