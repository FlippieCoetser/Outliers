Adjustment.Validation <- \() {
  exception <- Adjustment.Exceptions()

  validators <- list()
  validators[['Exist']] <- \(data) {
    data |> is.null() |> exception[['NullException']]()
    return(data)
  }
  validators[['IsNumeric']] <- \(data) {
    
  }
  return(validators)
}