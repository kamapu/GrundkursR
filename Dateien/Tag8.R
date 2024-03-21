# Heute: GIS und R ----

# Zuerst die Dateien herunterladen
download.file(url = "https://kamapu.github.io/GrundkursR/Dateien/KursDateien.zip",
              destfile = "KursDateien.zip", method = "curl")
unzip("KursDateien.zip", overwrite = TRUE)
unlink("KursDateien.zip")

# Laden die Pakete

library(sf)
library(geojsonsf)
library(ggplot2)

Hbaeder <- geojson_sf("BonnHallenbaeder.geojson")
Hbaeder

Encoding(Hbaeder$name) <- "latin1"

ggplot(Hbaeder) +
  geom_sf() +
  geom_sf_label(aes(label = name))

# Wir laden die Bezirke
Bezirke <- readRDS("BonnBezirke_sp.rds")
class(Bezirke)
head(Bezirke)

# Bevölkerung addieren
Bevoelkerung <- readRDS("BonnBevoelkerung.rds")
Bezirke <- merge(Bezirke,
        subset(Bevoelkerung, Jahr == 2021))

# Einfache Karte
ggplot(Bezirke) +
  geom_sf()

# Gesamte Bevölkerung von 2021
ggplot(Bezirke) +
  geom_sf(aes(fill = Gesamt))
  
# Verteilung der Diche (Einwohner pro Quadrattkilometer)
Bezirke$Dichte <- with(Bezirke, Gesamt/FlaecheKm2)
ggplot(Bezirke) +
  geom_sf(aes(fill = Dichte))

ggplot(Bezirke) +
  geom_sf(aes(fill = Dichte)) +
  #geom_sf_label(aes(label = BezirkName),
  #              label.size = 0.005)
  geom_sf_text(aes(label = BezirkName),
                   col = "white", size = 2)

# Hallenbaeder
ggplot(Bezirke) +
  geom_sf(aes(fill = Dichte)) +
  geom_sf_label(data = Hbaeder,
                aes(label = name))

ggplot(Bezirke) +
  geom_sf(aes(fill = Dichte)) +
  geom_sf(data = Hbaeder, col = "#ffffff")

# Straßennetzwerk
Netz <- st_read("bonn-netz.shp")
head(Netz)

aggregate(linien_id ~ linien_art + linien_a_1,
          FUN = length, data = Netz)

# Automatisieren ----

# Repeat-Schleife
N <- 0
i <- 0

repeat {
  i <- i + 1
  N <- N + Bevoelkerung$Gesamt[i]
  print(paste(i, "ist", N))
  if(N > 20000) break
}

for(i in names(Bevoelkerung)) {
  print(paste(i, "ist",
              class(Bevoelkerung[[i]])))
}
  
# Funktionen
my_stats <- function(x) {
  ave = mean(x)
  sd = sd(x)
  return(c(ave = ave, sd = sd))
}

my_stats(Bevoelkerung$Gesamt)

my_stats(c(Bevoelkerung$Gesamt, NA))

# Nutzung von ...
my_stats <- function(x, ...) {
  ave = mean(x, ...)
  sd = sd(x, ...)
  return(c(ave = ave, sd = sd))
}

my_stats(c(Bevoelkerung$Gesamt, NA),
         na.rm = TRUE)

# Werte per defekt (default values)
# Die Funktion ignoriert NAs per defekt
my_stats <- function(x, na.rm = TRUE) {
  ave = mean(x, na.rm = na.rm)
  sd = sd(x, na.rm = na.rm)
  return(c(ave = ave, sd = sd))
}

my_stats(c(Bevoelkerung$Gesamt, NA))

my_stats(c(Bevoelkerung$Gesamt, NA),
         na.rm = FALSE)

# Funktion mit Warnung
my_stats <- function(x, na.rm = TRUE) {
  ave = mean(x, na.rm = na.rm)
  sd = sd(x, na.rm = na.rm)
  if(any(is.na(x)))
    warning("'x' contains NAs")
  return(c(ave = ave, sd = sd))
}

my_stats(Bevoelkerung$Gesamt)

my_stats(c(Bevoelkerung$Gesamt, NA))

# Funktion mit Fehlermeldung
my_stats <- function(x) {
  if(any(is.na(x)))
    stop("NA values are not allowed in 'x'")
  ave = mean(x)
  sd = sd(x)
  return(c(ave = ave, sd = sd))
}

my_stats(Bevoelkerung$Gesamt)
my_stats(c(Bevoelkerung$Gesamt, NA))














