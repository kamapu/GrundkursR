# Erstellen des Datensatzes
bevoelkerungsdaten <- data.frame(
  ID = 1:300, # Anonymisierte ID für Individuen
  Bezirk = rep(c("Zauberwald", "Traumdorf", "Bergland"), each = 100), # Bezirk
  Klasse = rep(c("Menschen", "Elfen", "Gnome"), each = 100) # Klasse
)

# Überprüfen des erstellten Datensatzes
head(bevoelkerungsdaten)

summary(bevoelkerungsdaten)
