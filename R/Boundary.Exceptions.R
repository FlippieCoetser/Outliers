Boundary.Exceptions <- \() {
  exceptions <- list()
  exceptions[['NullException']] <- \(invoke) {
    if (invoke) {stop('argument is NULL')}
  }
  exceptions[['NumericException']] <- \(invoke) {

  }
  return(exceptions)
}