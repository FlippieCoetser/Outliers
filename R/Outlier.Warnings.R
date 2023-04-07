Outlier.Warnings <- \() {
  warnings <- list()
  warnings[['OutOfRangeWarning']] <- \(invoke) {
    if (invoke) {warning('medcouple is out of range: -0.6 > MC > 0.6')}
  }
  return(warnings)
}