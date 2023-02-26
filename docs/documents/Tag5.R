# Kursdateien herunterladen ----
download.file(url = "https://kamapu.github.io/RKurs-VHS-2022/documents/KursDateien.zip",
              destfile = "KursDateien.zip", method = "curl")
unzip("KursDateien.zip", overwrite = TRUE)
unlink("KursDateien.zip")

# Dateien Lesen ----
library(readODS)

Bonn2019 <- read_ods("Bevoelkerung.ods", sheet = "2019")
Bonn2020 <- read_ods("Bevoelkerung.ods", sheet = "2020")

Bonn <- list()
Bonn$"2019" <- read_ods("Bevoelkerung.ods", sheet = "2019")
Bonn[["2019"]] <- read_ods("Bevoelkerung.ods", sheet = "2019")

Bonn <- list()
for (i in as.character(2019:2021))
  Bonn[[i]] <- read_ods("Bevoelkerung.ods", sheet = i)

names(Bonn)

Bonn <- readRDS("BonnBevoelkerung.rds")
str(Bonn)
head(Bonn)
tail(Bonn)

summary(Bonn)

Bezirke <- readRDS("BonnBezirke.rds")

# Zusammenfügen von Datensätze ----
names(Bezirke)
names(Bonn)

Bonn <- merge(Bezirke, Bonn)
head(Bonn)

# Aggregieren ----
aggregate(Gesamt ~ StadtBezirk, FUN = sum, data = Bonn)
aggregate(Gesamt ~ StadtBezirk, FUN = sum, data = subset(Bonn, Jahr == 2019))
aggregate(Gesamt ~ StadtBezirk + Jahr, FUN = sum, data = Bonn)
aggregate(Gesamt ~ Jahr + StadtBezirk, FUN = sum, data = Bonn)

# Graphiken ----
Bonn2020 <- subset(Bonn, Jahr == 2020)

old_par <- par()
#par(old_par)

# Plot
plot(Bonn2020[ , c("Frauen", "Maenner")], xlim = c(0, 7000),
     ylim = c(0, 7000), main = "Maenner vs. Frauen",
     xlab = "Anzahl von Frauen pro Statistisches Bezirk",
     ylab = "Anzahl von Frauen pro Statistisches Bezirk")
abline(0, 1, col = "red", lty = "dashed")

?par

par(mar = c(5, 4, 1, 1) + 0.1)

# Plot
plot(Bonn2020[ , c("Frauen", "Maenner")], xlim = c(0, 7000),
     ylim = c(0, 7000),
     xlab = "Anzahl von Frauen pro Statistisches Bezirk",
     ylab = "Anzahl von Frauen pro Statistisches Bezirk",
     type = "n")
abline(0, 1, col = "red", lty = "dashed")
points(Bonn2020[ , c("Frauen", "Maenner")], pch = 21,
       bg = c("orange", "red", "green", "blue")[unclass(Bonn2020$StadtBezirk)],
       cex = 1.5)
text(Bonn2020[ , c("Frauen", "Maenner")], labels = Bonn2020$BezirkName,
     cex = 0.7, pos = 2)
legend("bottomright", pch = 21, pt.bg = c("orange", "red", "green", "blue"),
       legend = levels(Bonn2020$StadtBezirk))

summary(Bonn2020$StadtBezirk)
