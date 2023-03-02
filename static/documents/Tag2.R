# Nochmals logische Operatoren ----

TRUE & TRUE
TRUE & FALSE
FALSE & FALSE

age <- 30
age > 15
age < 100

age > 15 & age < 100
age > 15 & age < 20

occ <- "Student"
occ == "Student" | occ == "Teacher"

occ <- "Taxi Driver"
occ == "Student" | occ == "Teacher"

TRUE | TRUE
TRUE | FALSE
FALSE | TRUE

# Buchstaben
letters
LETTERS

"a" %in% letters
"ä" %in% letters
"a" %in% LETTERS
letters %in% LETTERS

M <- c("m", "X", "M")
M %in% letters
M %in% LETTERS

!TRUE
!FALSE

!20
!0
!1

!"Ich"

M <- c("m", "X", "M")
M %in% letters
M %in% LETTERS

(!M %in% letters) == (M %in% LETTERS)

all((!M %in% letters) == (M %in% LETTERS))
all(M %in% letters)
any(M %in% letters)

# Verschiedene Klassen in einem Vektor

Ich <- c(Namen = "Miguel",
         Alter = 30,
         Hausnr = 2)
Ich
Ichn <- as.integer(Ich)
as.integer(15.99)
round(15.99)
round(15.09, digits = 1)

Ich["Namen"]
names(Ich)
Ich[c("Namen", "Hausnr")]

# NULL vs NA ----
length(NA)
length(c(NA, NA))

length(NULL)

Ich
Ich["Alter"] <- NA
Ich

Ich <- NULL
Ich

#as.numeric(exp(1i*pi))

example("mean")

RSiteSearch("Logistic regression")

demo()
demo("graphics")

# Logisches
M <- sample(x = c(TRUE, FALSE), size = 100, replace = TRUE)

M
as.numeric(M)
as.logical(c(0, 1, 5, 100))
sum(M)

# Laut Max
length(M) - sum(M)

# Laut Casey
sum(!M)

# Laut Miguel
sum(M == FALSE)

# Laut Alexander
sum(M == 0)

