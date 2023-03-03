Skewness.Service <- \() {
  validate <- Skewness.Validation()

  services <- list()

  services[['medcouple']] <- \(sample) {
    sample |>
      validate[['Exist']]() |>
      validate[['IsNumeric']]()

    sample |>
      robustbase::mc()
  }

  return(services)
}