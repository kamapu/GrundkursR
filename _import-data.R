library(zip)

Repo <- "../../courses-miguel/GrundkursR"

# Produce data set
Files <- list.files(file.path(Repo, "data"), full.names = TRUE)
#Files[!grepl(".log", Files, fixed = TRUE)]
unlink("Dateien/KursDateien.zip")
zip("Dateien/KursDateien.zip", Files, mode = "cherry-pick")

