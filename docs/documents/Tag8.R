# Die Zeit in R ----

## Zeit ----
Zeit <- Sys.time()
class(Zeit)

Datum <- Sys.Date()
class(Datum)

Geburtsdatum <- as.Date("1978-10-27")
Sys.Date() - Geburtsdatum

Geburtsdatum
as.integer(Geburtsdatum)

as.Date("27.10.1978")
?strptime
D1 <- as.Date(strptime("27.10.1978", format = "%d.%m.%Y"))
class(D1)

Heute <- Sys.Date()
format(Heute, format = "%u")
format(Heute, format = "%A")
format(Heute, format = "%V")

# Jetzt Rmarkdown ----
