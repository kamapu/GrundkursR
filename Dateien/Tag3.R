# Daten Importieren
Bevoelkerung <- read.csv("Bevoelkerung-2021.csv")

# Cross-check
Bevoelkerung$Maenner + Bevoelkerung$Frauen
Bevoelkerung$Maenner + Bevoelkerung$Frauen ==
  Bevoelkerung$Gesamt

all(Bevoelkerung$Maenner + Bevoelkerung$Frauen ==
      Bevoelkerung$Gesamt)

Maenner

attach(Bevoelkerung)
Maenner
detach(Bevoelkerung)

with(Bevoelkerung, {
  Maenner
})

with(Bevoelkerung, {
  Maenner + Frauen == Gesamt
})

subset(Bevoelkerung, Maenner + Frauen != Gesamt)

# Daten Schreiben
data("iris")

write.csv(iris, "iris.csv")
write.csv2(iris, "iris2.csv")

save(iris, file = "iris.rda") # Mehrere Objekten
saveRDS(iris, file = "iris.rds") # Nur ein Objekt

load("iris.rda")

iris <- "Mein Name ist Miguel"
iris

load("iris.rda")
flowers <- readRDS("iris.rds")

# Deskriptive Statistiken
rm(list = ls())

Bevoelkerung <- readRDS("BonnBevoelkerung.rds")
summary(Bevoelkerung)

hist(Bevoelkerung$Gesamt)
abline(v = mean(Bevoelkerung$Gesamt),
       lty = "dashed", col = "blue")
abline(v = median(Bevoelkerung$Gesamt),
       lty = "dashed", col = "red")

boxplot(Bevoelkerung$Gesamt)
text(1, 6000, labels = "Das ist ein Boxplot",
     col = "orange")

boxplot(Bevoelkerung$Gesamt, col = "orange")
text(1, 6000, labels = "Das ist ein Boxplot",
     col = "blue")

boxplot(Gesamt ~ Jahr, data = Bevoelkerung)

# Daten aus nur 2021
Bevoelkerung <- subset(Bevoelkerung, Jahr == 2021)
any(duplicated(Bevoelkerung$BezirkNr))

# Histogram
hist(Bevoelkerung$Gesamt)

plot(Frauen ~ Maenner, data = Bevoelkerung)
abline(a = 0, b = 1, lty = 2, col = "red")

# Korrelation
cor(Bevoelkerung[c("Gesamt", "DichteKm2",
                   "Maenner", "Frauen",
                   "Zuwanderer", "Auslaender")])

pairs(Bevoelkerung[c("Gesamt", "DichteKm2",
                   "Maenner", "Frauen",
                   "Zuwanderer", "Auslaender")])

# Streuung

## Standardabweichung
sd(Bevoelkerung$Gesamt)

## Varianz
var(Bevoelkerung$Gesamt)
var(Bevoelkerung$DichteKm2)

## Varianzkoeffizient
sd(Bevoelkerung$Gesamt)/mean(Bevoelkerung$Gesamt)
sd(Bevoelkerung$DichteKm2)/mean(Bevoelkerung$DichteKm2)

cv <- function(x) {
  sd(x)/mean(x)
}

cv(Bevoelkerung$Gesamt)

# Standardfehler
se <- function(x) sd(x)/sqrt(length(x))
se(Bevoelkerung$Gesamt)

# Lineare Regression
Model <- lm(Frauen ~ Maenner, data = Bevoelkerung)
summary(Model)

plot(Frauen ~ Maenner, data = Bevoelkerung)
abline(a = 0, b = 1, lty = 2, col = "red")
abline(Model, lty = 2, col = "blue")
