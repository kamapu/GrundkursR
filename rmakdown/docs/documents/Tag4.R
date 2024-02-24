# Pakete ----
update.packages(ask = FALSE)

library("ade4")
install.packages("ade4")

data(ecomor)
?taxo2phylog

library("ade4")

data(ecomor)
?taxo2phylog

sessionInfo()

# Lesen und Schreiben ----
download.file(url = "https://kamapu.github.io/GrundkursR/documents/KursDateien.zip",
              destfile = "KursDateien.zip", method = "curl")
unzip("KursDateien.zip", overwrite = TRUE)
unlink("KursDateien.zip")

Afrika <- read.csv("Africa.env.csv")
#Afrika2 <- read.csv2("Africa.env.csv")

write.csv2(Afrika, file = "Afrika.de.csv")

Bonn2019 <- read.csv("Bevoelkerung-2019.csv")
head(Bonn2019)

summary(Bonn2019$FrauenProzent)
Bonn2019$FrauenProzent <-
  gsub(pattern = ",",
       replacement = ".",
       x = Bonn2019$FrauenProzent)
Bonn2019$FrauenProzent <-
  as.numeric(Bonn2019$FrauenProzent)

install.packages("readODS")

library(readODS)

Bonn2019 <- read_ods("Bevoelkerung.ods")

# Objekten teilen ----

rm(list = ls())

Afrika <- read.csv("Africa.env.csv")
Afrika$Country <- as.factor(Afrika$Country)
summary(Afrika$Country)

data("iris")

save(Afrika, iris, file = "meineObjekte.rda")
saveRDS(Afrika, file = "nurAfrika.rds")

rm(list = ls())

# Scenario 1
Afrika <- readRDS("nurAfrika.rds")
Afrika <- Afrika[,1]

load("meineObjekte.rda")

# Scenario 2
rm(list = ls())
load("meineObjekte.rda")
Afrika2 <- readRDS("nurAfrika.rds")


