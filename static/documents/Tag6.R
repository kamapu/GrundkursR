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

# subset
Bonn2019 <- subset(Bonn, Jahr == 2019)

# attach()
summary(Gesamt)
summary(Bonn$Gesamt)

attach(Bonn)
summary(Gesamt)
detach(Bonn)

summary(Gesamt)

attach(Bonn)
plot(FlaecheKm2, Gesamt)
detach(Bonn)

with(Bonn, {
  plot(FlaecheKm2[Jahr == 2020], Gesamt[Jahr == 2020])
})

# Histogram
hist(Bonn$Gesamt, freq = FALSE)

# Boxplots
boxplot(Bonn$Gesamt)
summary(Bonn$Gesamt)

# Histogram + Boxplot
par(mfrow = c(2, 1))
boxplot(Bonn$Gesamt, horizontal = TRUE)
hist(Bonn$Gesamt, freq = FALSE)

# 
par(mfrow = c(1,1))
hist(Bonn$Gesamt, freq = FALSE)

# Kuchendiagram
Bonn2020 <- aggregate(Gesamt ~ StadtBezirk,
      data = subset(Bonn, Jahr == 2020),
      FUN = sum)
Bonn2020

pie(Bonn2020$Gesamt, labels = Bonn2020$StadtBezirk)

barplot(Bonn2020$Gesamt)

tmp_vector <- Bonn2020$Gesamt
names(tmp_vector) <- Bonn2020$StadtBezirk
tmp_vector

barplot(tmp_vector, col = c("white", "black"))

Bonn_agg <- aggregate(Gesamt ~ StadtBezirk + Jahr,
                      data = Bonn, FUN = sum)
barplot(Gesamt ~ StadtBezirk + Jahr, data = Bonn_agg,
        beside = TRUE,
        legend.text = levels(Bonn_agg$StadtBezirk),
        col = c("darkgreen", "red", "blue", "orange"))

# Boxplot mit Formula
boxplot(Gesamt ~ StadtBezirk, data = Bonn)
boxplot(Gesamt ~ StadtBezirk + Jahr, data = Bonn)

text(2, 12000, labels = "Ich sehe keine Unterschied!",
     cex = 2, col = "red", pos = 4)

# Parametrische Statistiken -------------------

rm(list =ls())
Afrika <- read.csv("Africa.env.csv")

summary(Afrika$EC)
boxplot(EC ~ Country, data = Afrika)
boxplot(EC ~ Locality, data = Afrika)

# Normalverteilung
hist(Afrika$EC)

hist(Afrika$EC[Afrika$Locality == "Rumuruti"])

ANOVA <- aov(EC ~ Country, data = Afrika)
summary(ANOVA)

Residuals <- resid(ANOVA)
hist(Residuals, freq = FALSE)
curve(dnorm(x, mean = mean(Residuals), sd = sd(Residuals)),
      col = "red", add = TRUE)

shapiro.test(Residuals)

str(ANOVA)
str(summary(ANOVA))
