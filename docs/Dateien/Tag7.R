# Zeichenketten

x <- "Die Katzen sind"
y <- sample(1:10, size = 1)

paste(x, y)

Text <- paste("Die Katzen sind", sample(1:10, 1))

# Ist das Wort im Text beinhaltet
grepl("Katz", Text)
grepl("Hund", Text)

# Wir lesen einen Skript ein und fragen
# Ist 'iris' da erwähnt
Skript <- readLines("Tag2.R")
any(grepl("iris", Skript))

# Wir ersetzen iris durch titanic.
Skript <- gsub("iris", "titanic", Skript)
writeLines(Skript, "Tag100.R")

source("Tag100.R")

nchar("Miguel")
nchar("a o")

hist(nchar(Skript))

