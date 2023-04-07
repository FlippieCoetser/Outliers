Adjustment.Validation <- \() {
  exception <- Adjustment.Exceptions()

  validators <- list()
  validators[['Exist']] <- \(data) {
    data |> is.null() |> exception[['NullException']]()
    return(data)
  }
  validators[['IsNumeric']] <- \(data) {
    data |> is.numeric() |> isFALSE() |> exception[['NumericException']]()
  }
  return(validators)
}