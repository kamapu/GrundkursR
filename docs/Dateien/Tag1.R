# Einstieg in R ----

# Mein erster R-Befehl
# Das ist eine Adition
5+5

## Schritt 2 ----
5^2

5**2

(5 + 2)*10
5 + 2 * 10

((5+2) *10) /3

round(((5+2) *10) /3, digits = 2)

M <- 5
M * 10

M <- 20
M * 10

# Logische Operatoren ----

5 == 5
5 != 5

"m" == "m"
"m" == "M"

m <- 6
MeineAlter <- 20

my_age <- 30
house_number <- 10

# Objekten löschen
rm(m)

ls()
rm(list = ls())

as.numeric(TRUE)
as.numeric(FALSE)

# Arbeit mit Vektoren ----
M <- c(1:10)
M + 100

M <- c(1:1000000)
M + 100

letters
LETTERS

class(M)
class(letters)

length(M)
length(letters)

letters + 100

c(2, 4, "x")
class("2")

class(as.integer("2"))

as.integer("2")
as.integer("x")
