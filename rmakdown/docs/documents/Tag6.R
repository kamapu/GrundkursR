# Datenverarbeitung ----
download.file(
  url = "https://kamapu.github.io/GrundkursR/documents/KursDateien.zip",
  destfile = "KursDateien.zip", method = "curl")
unzip("KursDateien.zip", overwrite = TRUE)
unlink("KursDateien.zip")

Bevoelkerung <- readRDS("BonnBevoelkerung.rds")

head(Bevoelkerung)
tail(Bevoelkerung)

str(Bevoelkerung)
summary(Bevoelkerung)

Bezirke <- readRDS("BonnBezirke.rds")
head(Bezirke)

unique(Bezirke$StadtBezirk)

Bevoelkerung <- merge(Bevoelkerung, Bezirke)
head(Bevoelkerung)

Bevoelkerung$Dichte_2 <- with(Bevoelkerung, {
  Gesamt/FlaecheKm2
})

plot(Bevoelkerung[ ,
              c("DichteKm2", "Dichte_2")])
abline(a = 0, b = 1, lty = 2, col = "red")

subset(Bevoelkerung, Dichte_2 != DichteKm2)

with(subset(Bevoelkerung, Jahr == 2019), {
  plot(DichteKm2, Dichte_2)
  abline(a = 0, b = 1, lty = "dashed",
         col = "red")
  text(DichteKm2, Dichte_2,
       col = "darkolivegreen4",
       labels = BezirkName, cex = 0.5,
       pos = 4)
})

text(5000, 10000, labels = "Cooles Graphik!")



Bonn <- aggregate(Gesamt ~ Jahr,
                  data = Bevoelkerung,
                  FUN = sum)

barplot(Bonn$Gesamt, names.arg = Bonn$Jahr,
        ylim = c(336000, 0))

Bonn <- aggregate(Gesamt ~ Jahr + StadtBezirk,
                  data = Bevoelkerung,
                  FUN = sum)
Bonn

Bonn2019 <- subset(Bevoelkerung, Jahr == 2019)
Bonn2019_summ <- aggregate(Gesamt ~ StadtBezirk,
                    data = Bonn2019,
                    FUN = sum)
Bonn2019_summ

pie(Bonn2019_summ$Gesamt,
    labels = Bonn2019_summ$StadtBezirk)

with(Bonn2019_summ, {
  pie(Gesamt, labels = Gesamt)
})

with(Bonn2019_summ, {
  pie(Gesamt,
      labels = paste0(StadtBezirk,
                      "\n(", Gesamt, ")"))
})

install.packages("tidyr")

library(tidyr)

Gender <- pivot_longer(data = Bonn2019,
            cols = c("Frauen", "Maenner"),
            values_to = "Anzahl",
            names_to = "Geschlecht")

Gender_summ <- aggregate(Anzahl ~ Geschlecht,
                data = Gender, FUN = sum)

with(Gender_summ, {
  pie(Anzahl, labels = Geschlecht)
})



