# demos, vignettes, examples ----
demo()
demo("graphics")

browseVignettes()

?mean
example("mean")

# Packages ----
library(ggplot2)
qplot(1:10, rnorm(10), colour = runif(10))

# ggplot2::qplot()

install.packages("ade4")


# Dateien herunterladen ----
download.file(url = "https://kamapu.github.io/RKurs-VHS-2022/documents/KursDateien.zip",
              destfile = "KursDateien.zip", method = "curl")
unzip("KursDateien.zip", overwrite = TRUE)
unlink("KursDateien.zip")

# Sauberes Workspace
rm(list = ls())
?read.csv

Bevoelkerung <- read.csv("Bevoelkerung-2021.csv")
B2 <- read.csv2("Bevoelkerung-2021.csv")

write.csv2(Bevoelkerung, "B2.csv", na = "-999999")
