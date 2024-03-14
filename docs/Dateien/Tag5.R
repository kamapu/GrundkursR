# Dateien laden
download.file(url = "https://kamapu.github.io/GrundkursR/Dateien/KursDateien.zip",
              destfile = "KursDateien.zip", method = "curl")
unzip("KursDateien.zip", overwrite = TRUE)
unlink("KursDateien.zip")

# Bevölkerungsdaten
Bevoelkerung <- readRDS("BonnBevoelkerung.rds")
Bezirke <- readRDS("BonnBezirke.rds")

Bevoelkerung <- merge(Bevoelkerung, Bezirke,
                      all = TRUE)

# Jahren
unique(Bevoelkerung$Jahr)
summary(as.factor(Bevoelkerung$Jahr))

boxplot(Gesamt ~ Jahr, data = Bevoelkerung)
boxplot(Gesamt ~ StadtBezirk, data = Bevoelkerung)
boxplot(Gesamt ~ StadtBezirk + Jahr, data = Bevoelkerung)


par(las = 2, mar = c(10, 5, 1, 1))
boxplot(Gesamt ~ StadtBezirk + Jahr, data = Bevoelkerung,
        xlab = "",
        col = c("orange", "blue", "grey", "brown"))

# Variablen Berechnen
Tabelle2021 <- subset(Bevoelkerung, Jahr == 2021)

boxplot(Frauen ~ StadtBezirk, data = Tabelle2021,
        xlab = "")

Tabelle2021$FrauenProzent <- with(Tabelle2021,
                                  Frauen/Gesamt*100)
summary(Tabelle2021$FrauenProzent)

boxplot(FrauenProzent ~ StadtBezirk, data = Tabelle2021,
        xlab = "")


# Daten Restrukturieren
# Schaue mal ins reshape2
library(tidyr)

TabelleWeit <- pivot_wider(Bevoelkerung[c("BezirkNr",
                                        "Jahr", "Gesamt")],
                           id_cols = BezirkNr,
                           names_from = Jahr,
                           values_from = Gesamt) 

head(TabelleWeit)

TabelleWeit$Trend <- with(TabelleWeit,
                          get("2021") - get("2019"))
summary(TabelleWeit$Trend)

TabelleWeit$Trend <- TabelleWeit$"2021" - TabelleWeit$"2019"
summary(TabelleWeit$Trend)

subset(TabelleWeit, Trend == max(Trend))
subset(Bevoelkerung, BezirkNr == 265)

iris
"iris"
get("iris")

TabelleWeit <- merge(TabelleWeit, Bezirke)
boxplot(Trend ~ StadtBezirk, data = TabelleWeit,
        xlab = "")

# Laengere Tabelle
TabelleLang <- pivot_longer(Bevoelkerung[c("BezirkNr",
                                           "BezirkName",
                                           "StadtBezirk",
                                           "Jahr",
                                           "Maenner",
                                           "Frauen")],
                            cols = c("Frauen", "Maenner"),
                            names_to = "Gender",
                            values_to = "Anzahl")
head(TabelleLang)

boxplot(Anzahl ~ Gender, data = TabelleLang)

boxplot(Anzahl ~ Gender + StadtBezirk + Jahr,
        data = TabelleLang, xlab = "",
        col = c("pink", "blue"))

# ggplots -----
library(ggplot2)

Plot1 <- Bevoelkerung %>%
  ggplot(aes(x = StadtBezirk, y = Gesamt,
             fill = StadtBezirk)) +
  geom_boxplot()

Plot1
