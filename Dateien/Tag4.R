# Dateien laden
download.file(url = "https://kamapu.github.io/GrundkursR/Dateien/KursDateien.zip",
              destfile = "KursDateien.zip", method = "curl")
unzip("KursDateien.zip", overwrite = TRUE)
unlink("KursDateien.zip")

# Daten aus Bonn
Bevoelkerung <- readRDS("BonnBevoelkerung.rds")
rownames(Bevoelkerung) <- NULL

head(Bevoelkerung)
tail(Bevoelkerung)

boxplot(Gesamt ~ Jahr, data = Bevoelkerung)
boxplot(Zuwanderer ~ Jahr, data = Bevoelkerung)

Bevoelkerung <- subset(Bevoelkerung, Jahr == 2021)

# Daten aus den Bezirken
Bezirke <- readRDS("BonnBezirke.rds")
head(Bezirke)

# Bezirke
plot(Y ~ X, data = Bezirke)
text(Y ~ X, labels = BezirkName, data = Bezirke)

plot(Y ~ X, data = Bezirke, type = "n")
text(Y ~ X, labels = BezirkName, data = Bezirke, cex = 0.5)

plot(Y ~ X, data = Bezirke, type = "n")
text(Y ~ X, labels = StadtBezirk, data = Bezirke, cex = 0.5)

# Beide Tabellen in einem
Bevoelkerung <- merge(Bevoelkerung, Bezirke)

boxplot(Gesamt ~ StadtBezirk, data = Bevoelkerung)

summary(Bevoelkerung$StadtBezirk)

# Daten aggregieren

# Einwohner pro Stadtbezirk
aggregate(Gesamt ~ StadtBezirk, FUN = sum,
          data = Bevoelkerung)

# Durchschnittliche Diche pro Stadtbezirk
aggregate(DichteKm2 ~ StadtBezirk, FUN = mean,
          data = Bevoelkerung)

# Flächengröße
aggregate(FlaecheKm2 ~ StadtBezirk, FUN = sum,
          data = Bevoelkerung)

# Zuwanderer pro Stadtbezirk
aggregate(Zuwanderer ~ StadtBezirk, FUN = sum,
          data = Bevoelkerung)

# Bezirke pro Stadtbezirk
# (vorausgesetzt taucht jeder Bezirk nur einmal)
aggregate(BezirkName ~ StadtBezirk, FUN = length,
          data = Bevoelkerung)

# Bezirke pro Stadtbezirk (sicherer Variante)
aggregate(BezirkName ~ StadtBezirk,
          FUN = function(x) length(unique(x)),
          data = Bevoelkerung)

# Histogramme
hist(Bevoelkerung$Gesamt)

# Normalen Verteilungen
curve(x^2)
curve(x^3, col = "red", add = TRUE)

curve(dnorm(x, mean = mean(Bevoelkerung$Gesamt),
            sd = sd(Bevoelkerung$Gesamt)),
      xlim = range(Bevoelkerung$Gesamt))

# Alles zusammen (Histogram und normale Verteilung)
hist(Bevoelkerung$Gesamt, freq = FALSE)
curve(dnorm(x, mean = mean(Bevoelkerung$Gesamt),
            sd = sd(Bevoelkerung$Gesamt)),
      add = TRUE, col = "red")

# Zwei Alternativen um die Grenzen der Balken
# zu definieren (beide sind equivalent)
breaks <- c(0:14)*1000
breaks <- seq(from = 0, to = 14000, by = 1000)

# Graphische Parametern werden mit par festgelegt
par(las = 1, mar = c(5, 7, 1, 2))

hist(Bevoelkerung$Gesamt, freq = FALSE, breaks = breaks,
     main = "", ylab = "", xlab = "Bevölkerungsgröße")
curve(dnorm(x, mean = mean(Bevoelkerung$Gesamt),
            sd = sd(Bevoelkerung$Gesamt)),
      add = TRUE, col = "red", lwd = 2, lty = "dotted")

# Zusätzliche Infos (Mittelwert und Mediane)
abline(v = mean(Bevoelkerung$Gesamt), col = "blue",
       lty = "dashed")
abline(v = median(Bevoelkerung$Gesamt), col = "orange",
       lty = "dashed")


