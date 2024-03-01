# Vektoren ----

A <- c(1:100)
class(A)
length(A)

B <- A/10
B
class(B)
length(B)

A[5]
A[-5]
letters[15]
letters[1:5]
letters[c(3, 7, 10)]

# Zuweisen nicht vergessen
M <- A[-5]
A <- A[-5]

M <- A[5]
M

# Indizieren mit logischen Werten
A <- c(1:100)
A
A[A > 30]

Noten <- c(1, 4, 5)
Studenten <- sample(Noten, size = 20, replace = TRUE)
Studenten

names(Studenten) <- letters[1:20]
Studenten

Studenten[Studenten < 5]
Studenten[Studenten <= 4]
Studenten[Studenten %in% c(1,4)]
Studenten[Studenten != 5]
Studenten[!Studenten > 4]

as.numeric(c(TRUE, FALSE))

sum(c(1:5))

# Wie viele Studenten bestehen
sum(Studenten < 5)

# Welcher Anteil der Studenten bestehen die Prüfung?
sum(Studenten < 5)/length(Studenten)*100
mean(Studenten)

# Datensätze
data()

?iris

data("iris")
head(iris)
tail(iris)
summary(iris)

# Subset für Datensätze
iris_setosa <- subset(x = iris, Species == "setosa")
summary(iris_setosa)

iris_sv <- subset(iris, Species %in%
                    c("setosa", "virginica"))
summary(iris_sv)

# Erzeugen von Faktoren
Performance <- sample(x = c("high", "medium", "low"),
                      size = 20,
                      replace = TRUE)
Performance
class(Performance)
summary(Performance)

Performance <- as.factor(Performance)
summary(Performance)

Performance <- as.character(Performance)
summary(Performance)

Performance <- factor(Performance,
                levels = c("low", "medium", "high"))
summary(Performance)

# Dateien einlesen ----

download.file(url = "https://kamapu.github.io/GrundkursR/Dateien/KursDateien.zip",
              destfile = "KursDateien.zip")
unzip("KursDateien.zip", overwrite = TRUE)
unlink("KursDateien.zip")

# Tabelle einlesen
Bevoelkerung <- readRDS("BonnBevoelkerung.rds")
head(Bevoelkerung)
