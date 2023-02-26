# Funktionen ----

A <- c(3, NA, 7)
mean(A)
mean(A, na.rm = TRUE)
mean(x = A, na.rm = TRUE)
mean(na.rm = TRUE, x = A)
mean(A, TRUE)
mean(A,,TRUE)

# Matrix ----
M <- matrix(c(1:20), nrow = 4)
M
N <- matrix(c(1:20), nrow = 4, byrow = TRUE)
N
N[,2]
N[2,]
N[2,2]
N[2,2] <- 100
N
N[N < 5] <- 500
N
length(N)

N[1,5] <- "ich"
N

A <- 1:100
A[5] <- "du"

A + 10

class(N)

# Datensatz ----
data()
data(iris)
class(iris)

head(iris)
tail(iris)
str(iris)
summary(iris)

iris[, 2]
iris[5,]

my_iris <- iris

iris$Species
iris$Species[100]

iris[ , "Petal.Width"]

# Liste ----

MeineListe <- list(
  A = 1:100,
  B = matrix(c(1:20), nrow = 4)
)

MeineListe$A
MeineListe[[1]]
iris[[1]]

MeineListe[["A"]]
iris[["Petal.Length"]]

# Zurück zu Datensätze ----
summary(iris$Species)

setosa <- subset(iris, Species == "setosa")
summary(setosa)

no_setosa <- subset(iris, Species != "setosa")
no_setosa <- subset(iris,
      Species %in% c("versicolor", "virginica"))
summary(no_setosa)

mean(iris$Sepal.Length)

big_fl <- subset(iris, Sepal.Length >
                   mean(Sepal.Length))
summary(big_fl)
