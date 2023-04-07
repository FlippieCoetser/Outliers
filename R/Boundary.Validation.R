Boundary.Validation <- \() {
  exception <- Boundary.Exceptions()

  validators <- list()
  validators[['Exist']] <- \(data) {
    data |> is.null() |> exception[['NullException']]()
    return(data)
  }
  return(validators)
}