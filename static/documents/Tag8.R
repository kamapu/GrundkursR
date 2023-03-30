# Statistiken ----

data("iris")

summary(iris)

mean(iris$Sepal.Length)
sd(iris$Sepal.Length)
var(iris$Sepal.Length)

sqrt(var(iris$Sepal.Length))

x <- iris$Sepal.Length

# Variationskoeffizient
sd(x)/mean(x)

hist(iris$Petal.Length)

# Lineare Regression
pairs(iris)

Model1 <- lm(Petal.Width ~ Petal.Length,
             data = iris)
class(Model1)
str(Model1)
summary(Model1)
Model1

with(iris, plot(Petal.Length, Petal.Width,
                pch = 21, col = "blue",
                bg = "orange"))
abline(Model1, lty = "dotted",
       col = "darkgreen")
?points

