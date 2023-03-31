# Recap ----
data(iris)

with(iris, {
  plot(Petal.Length, Sepal.Length,
       main = "Sepal vs. Petal",
       col = Species, pch = 16,
       cex = 2, xlim = c(0, 8),
       ylim = c(0, 8))
  abline(a = 0, b = 1, lty = 2,
         col = "orange")
})

par(mar = c(5, 5, 0.5, 0.5))

with(iris, {
  plot(Petal.Length, Sepal.Length,
       col = Species, pch = 16,
       cex = 2, xlim = c(0, 8),
       ylim = c(0, 8))
  abline(a = 0, b = 1, lty = 2,
         col = "orange")
})

dev.copy(png, width = 700,
         height = 700, res = 300,
         file = "plot_small.png")
dev.off()

with(iris, {
  plot(Petal.Length, Sepal.Length,
       col = Species, pch = 16,
       cex = 2, xlim = c(0, 8),
       ylim = c(0, 8),
       xlab = "Petals", ylab = "Sepals")
  abline(a = 0, b = 1, lty = 2,
         col = "orange")
})

dev.copy(png, width = 1200,
         height = 1200, res = 150,
         file = "plot_big.png")
dev.off()

dev.off()

# Faktoren ----

meinFaktor <- sample(
  c("klein", "mittel", "groß"),
          size = 100, replace = TRUE)
summary(meinFaktor)

meinFaktor <- as.factor(meinFaktor)
summary(meinFaktor)

meinFaktor <- factor(meinFaktor,
                     levels = c("klein", "mittel", "groß"))
summary(meinFaktor)

neuerFaktor <- c(meinFaktor, "supergroß")
summary(as.factor(neuerFaktor))
summary(neuerFaktor)

levels(meinFaktor) <-
  c(levels(meinFaktor), "supergroß")
levels(meinFaktor)
summary(meinFaktor)

meinFaktor <- sample(x = 1:3,
                     size = 100,
                     replace = TRUE)
summary(meinFaktor)
summary(as.factor(meinFaktor))
unique(meinFaktor)

meinFaktor <- factor(meinFaktor,
  levels = 1:3,
  labels = c("leicht", "mittel", "schwer"))
summary(meinFaktor)

data("iris")

boxplot(Sepal.Length ~ Species,
        data = iris)

iris$Species <- factor(iris$Species,
  levels =
    rev(levels(iris$Species)))

boxplot(Sepal.Length ~ Species,
        data = iris)


rev(levels(iris$Species))

levels(iris$Species) <-
  rev(levels(iris$Species))

boxplot(Sepal.Length ~ Species,
        data = iris)

# ggplots ----
library(ggplot2)
data("iris")

ggplot(data = iris,
       mapping = aes(
         x = Petal.Length,
         y = Sepal.Length)) +
  geom_point()

Plot1 <- ggplot(data = iris,
       mapping = aes(
         x = Petal.Length,
         y = Sepal.Length,
         color = Species)) +
  geom_point()

Plot1

Plot1 +
  facet_wrap(~ Species, ncol = 2)
  
saveRDS(Plot1, "plot1_ggplot.rds")

ggsave(filename = "Plot1_gg.png")
ggsave(filename = "Plot1_gg.jpg")
