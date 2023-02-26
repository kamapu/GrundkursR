BonnStats <- function(x, ...) {
  if (!is.numeric(x))
    stop("Der Wert 'x' muss numerisch sein!")
  out <- c(mean(x, ...), sd(x, ...))
  names(out) <- c("Mittelwert", "Standardabweichung")
  return(out)
}
