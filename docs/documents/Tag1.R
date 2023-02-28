# Tag 1 ----
# R als Taschenrechner ----

# Dieses ist ein Kommentar
5 + 5
5*1000 # Das ist gleich Fünf-Tausend
100-3
60/3

# Jetzt wird es ernst ----

10*100 + 5
10*(100 + 5)
(10*(100 + 5)) +50

5+5
5 + 5
5 +                5

6 *
  5 + 10

# Zuweisung ----

M <- 500
M/100

meinWert <- 200
my_value <- 100
meinWert + M

M <- 20

M <- 100 * 33
M + m
meinwert
m <- 20
meinWert

# Logische Operatoren -----

100 > 5
99 < 5

100 == 100
100 != 100

100 < 100
100 <= 100

# Vektor ----
rm(list = ls())

M <- 23
N <- 24
rm(M)
ls()

rm(list = ls())

meinVektor <- c(2, 3, 4, 5)
meinVektor*10

M <- c(1:100)
M

A <- sample(x = 1:100, size = 5)
A

B <- rep(x = 5, times = 10)
B
c(1:1000000)/10

## Vektoren-Klassen ----

### numeric ----
D <- c(1:100)/1000

### character ----
A <- "Miguel"
Teilnehmer <- c("Max", "Aditi", "Linda", "Casey",
                "Karoline", "Alexander")

Teilnehmer/2
Zahlen <- c(B, D)
Zahlen
Sachen <- c(B, Teilnehmer)
"5" + "5"

## Coersion ----
as.character(5)
as.numeric("5")
as.numeric("Miguel")

NA # Non-available

is.character(Teilnehmer)
is.character(B)

## Länge ----

length(Teilnehmer)

## Indizierung ----
Teilnehmer[3]
Teilnehmer[-3]
Teilnehmer[length(Teilnehmer)]
Teilnehmer[Teilnehmer != "Alexander"]
Teilnehmer[c(2, 4)]

N <- Teilnehmer != "Alexander"
class(N)
is.logical(N)
c(TRUE, FALSE)
c(T, F, F)
c(true, false)
