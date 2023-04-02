IQR.Service <- \() {
  quartile <- Quartile.Service()
  
  validate <- IQR.Validation()

  services <- list()
  services[['IQRFromQuartiles']] <- \(quartiles) {
    quartiles |>
      validate[['Exist']]()            |>
      validate[['IsList']]()           |>
      validate[['HasFirstQuartile']]() |>
      validate[['HasThirdQuartile']]()

    quartiles[['third']] - quartiles[['first']]
  }
  services[['IQRFromSample']]    <- \(sample) {
    sample |>
      validate[['Exist']]() |>
      validate[['IsNumeric']]()

    quartiles <- list()
    quartiles[['first']] <- sample |> quartile[['first']]()
    quartiles[['third']] <- sample |> quartile[['third']]()

    quartiles |> services[['IQRFromQuartiles']]()
  }
  return(services)
}