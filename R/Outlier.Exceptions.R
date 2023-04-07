Outlier.Exceptions <- \() {
  exceptions <- list()
  exceptions[['NullException']] <- \(invoke) {
    if (invoke) {stop('argument is NULL')}
  }
  exceptions[['NumericException']] <- \(invoke) {
    if (invoke) {stop('argument is not numeric')}
  }
  return(exceptions)
}