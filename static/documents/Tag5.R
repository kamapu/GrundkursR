# Datensätze laden ----
download.file(
  url = "https://kamapu.github.io/GrundkursR/documents/KursDateien.zip",
  destfile = "KursDateien.zip", method = "curl")
unzip("KursDateien.zip", overwrite = TRUE)
unlink("KursDateien.zip")

library(readODS)

Bonn2019 <- read_ods(
  path = "Bevoelkerung.ods",
  sheet = "2019")

summary(Bonn2019$BezirkNr)
head(Bonn2019)
tail(Bonn2019)

Bonn2019 <- subset(Bonn2019, !is.na(BezirkNr))
tail(Bonn2019)

Auswahl <- c("BezirkNr", "BezirkName", "Maenner",
          "Frauen")
Bonn2019 <- Bonn2019[,Auswahl]

# Alternative 2
Bonn2019 <- read_ods(
  path = "Bevoelkerung.ods",
  sheet = "2019")
Auswahl <- c("BezirkNr", "BezirkName", "Maenner",
             "Frauen")
Bonn2019 <- Bonn2019[!is.na(Bonn2019$BezirkNr),
                     Auswahl]

# Gesamter Datensatz
Bevoelkerung <- readRDS("BonnBevoelkerung.rds")
head(Bevoelkerung)

# Spalten los werden
Bevoelkerung <- Bevoelkerung[ , -3]
head(Bevoelkerung)

Wegtun <- c("Maenner", "Frauen")
Bevoelkerung <- Bevoelkerung[,
 !names(Bevoelkerung) %in% Wegtun]

Auswahl <- c("Auslaender", "Jahr")
head(Bevoelkerung[,Auswahl])
head(Bevoelkerung[
  names(Bevoelkerung) %in% Auswahl])

Auswahl <- c("Auslaender", "Jahr", "Katze")
head(Bevoelkerung[,Auswahl])
head(Bevoelkerung[
  names(Bevoelkerung) %in% Auswahl])

# Datenverarbeitung 
rm(list = ls())
Bevoelkerung <-
  readRDS("BonnBevoelkerung.rds")

comment(Bevoelkerung$DichteKm2) <-
  "Anzahl gesamte Einwohner pro Km2"
comment(Bevoelkerung$DichteKm2)

# Umwandlung
iris$Sepal.Length
iris$Sepal.Length <- iris$Sepal.Length * 10
iris$Sepal.Length

# Variablen Bilden
Bevoelkerung$FrauenAnteil <-
  Bevoelkerung$Frauen/(Bevoelkerung$Frauen +
                         Bevoelkerung$Maenner)

hist(Bevoelkerung$FrauenAnteil)
summary(Bevoelkerung$FrauenAnteil)
boxplot(Bevoelkerung$FrauenAnteil)

attach(Bevoelkerung)
unique(Bevoelkerung$Jahr)
unique(Jahr)
detach(Bevoelkerung)

unique(Bevoelkerung$Jahr)
unique(Jahr)

with(Bevoelkerung, {
  print(summary(Gesamt))
  print(mean(Gesamt))
})

with(Bevoelkerung, {
  plot(Gesamt, Maenner + Frauen)
  abline(a = 0, b = 1, lty = 2, col = "red")
})

with(Bevoelkerung, {
  all(Gesamt == Maenner + Frauen)
})

subset(Bevoelkerung, Gesamt != Maenner + Frauen)
1509 + 1578

B2020 <- subset(Bevoelkerung, Jahr == 2020)

mean(B2020$Gesamt)
sum(B2020$Gesamt)

# Aggregate
aggregate(Gesamt ~ Jahr, data = Bevoelkerung,
          FUN = sum)
