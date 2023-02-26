# Logische Operationen -----
5 == 5
5 != 5
! 5 == 5
10 < 20
10 < 10
10 <= 10

5 == 5 & 10 == 10
5 == 5 & 10 == 15
5 == 5 | 10 == 15
5 == 7 | 10 == 15

# Vektoren und Zuweisung -----

c(5, 6, 10)
c(1:100)

A <- c(1:100)
# B = c(5, 6)
# c(202, 200) -> M

A + 100

B <- 20
M <- 30
B + M

A/10

a <- c(1, 5 , 101)

DieHundert <- c(1:100)
the_hundred <- c(1:100)

A >= 50
A

A[50]
A[c(2, 3, 75)]

letters
LETTERS

LETTERS[20]
Auswahl <- A[A >= 50]

ls()
objects()

rm(B)
rm(the_hundred, DieHundert)
rm(list = "a")
rm(list = ls())

# Symbol vs. Text
A <- 50
rm("A")
rm(list = A)

# Logische Operationen (2) ----
"A" %in% LETTERS
"A" %in% letters
50 %in% 1:100

all(c("a", "b", "C") %in% letters)
any(c("a", "b", "C") %in% letters)

# Datentypen ----

# character
is.character("A")
is.character('B')

is.character("Mein Name ist 'Miguel'")

A <- c(1:10)
is.integer(A)

B <- A/100
is.integer(B)

B

# coersion
as.integer(B)

round(B*10)
as.integer(B*10)

round(B, digits = 1)

is.character(letters)

L <- A > 4
is.logical(L)

# factor
M <- as.factor(c("du", "er", "du", "sie", "er", "du"))
summary(M)

N <- c("ich", M)
