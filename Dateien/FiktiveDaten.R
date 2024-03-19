# Erzeugen der Daten
set.seed(123)  # Setzen des Zufallszahlengenerators für Reproduzierbarkeit
n_menschen <- 1500  # Anzahl der Menschen im Traumdorf
n_elfen <- 1000  # Anzahl der Elfen im Zauberwald
n_gnome <- 500  # Anzahl der Gnome im Bergland

# Anonymisierte IDs
IDs_menschen <- 1:n_menschen
IDs_elfen <- (n_menschen + 1):(n_menschen + n_elfen)
IDs_gnome <- (n_menschen + n_elfen + 1):(n_menschen + n_elfen + n_gnome)

# Bezirke
bezirke <- c(rep("Traumdorf", n_menschen),
             rep("Zauberwald", n_elfen),
             rep("Bergland", n_gnome))

# Klassen
klassen <- c(rep("Mensch", n_menschen),
             rep("Elfe", n_elfen),
             rep("Gnom", n_gnome))

# Datensatz erstellen
population_data <- data.frame(
  ID = c(IDs_menschen, IDs_elfen, IDs_gnome),
  Bezirk = bezirke,
  Klasse = klassen
)

# Zufällige Reihenfolge
population_data <- population_data[sample(nrow(population_data)), ]

# Zeige die ersten Zeilen des Datensatzes an
head(population_data)

summary(population_data)
