# Tag 3: Fangen wir mit Funktionen ----

Prozent <- function(x, n) {
  return(x/n*100)
}

Prozent(x = 1, n = 2)
Prozent(x = 1)

Prozent(1, 2)

Prozent(n = 2, x = 1)

Prozent <- function(x, n = 1) {
  return(x/n*100)
}

Prozent(0.2)

tProzent <- function(..., sep = "",
                     suffix = "%") {
  P <- Prozent(...)
  return(paste0(P, sep, suffix))
}

tProzent(1)
tProzent(1, sep = " ")
tProzent(1, sep = " ", suffix = "Prozent")
tProzent(1, suffix = "")

tProzent(1, 2)

# Matrix ----
M <- matrix(c(1:20), nrow = 5,
            byrow = TRUE)
M

class(M)
mode(M)

N <- matrix(letters, nrow = 5,
            ncol = 4)
N
class(N)
mode(N)

N[,2]
N[5,]
N[,c(TRUE, FALSE, TRUE, TRUE)]
N[,-2]

M*100

# Liste ----
Sachen <- list(A = 1:100,
               B = "Ich",
               C = matrix(c(1:10),
                          ncol = 5))
Sachen[[2]]
Sachen[["B"]]
Sachen$B

Sachen$MeinName <-c("Miguel",
                    "Alvarez")
Sachen$Person <- list(Name = "Miguel",
                      Alter = 30,
                      Herkunft = "Chile")
Sachen$Person$Alter
class(Sachen)
class(Sachen$Person)
class(Sachen$Person$Alter)
class(Sachen$Person$Name)

P1 <- list(Vorname = "Miguel",
           Nachname = "Alvarez",
           Alter = 30)
P2 <- list(Name = c(Vorname = "Miguel",
                    Nachname = "Alvarez"),
           Alter = 30)

print(paste(P1$Vorname, P1$Nachname))
print(paste(P2$Name, collapse = " "))

P1$Vorname
P2$Name["Vorname"]

names(P1$Vorname)
names(P2$Name)

# Datensatz ----
# data.frame

P3 <- data.frame(
  Vorname = c("Tim", "Liana"),
  Nachname = c("Müller", "Jäger"),
  Alter = c(20, 25)
)
P3
class(P3$Vorname)
class(P3$Alter)
P3[["Vorname"]]

rm(list = ls())

data()
data(iris)
head(iris)
?iris
