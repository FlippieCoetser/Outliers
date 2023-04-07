Boundary.Service <- \() {
  validate <- Boundary.Validation()

  quartile   <- Quartile.Service()
  range      <- IQR.Service() |> IQR.Processing()
  skewness   <- Skewness.Service()
  adjustment <- Adjustment.Service()

  services <- list()
  services[['Upper']] <- \(sample) {
    sample |> validate[['Exist']]() |> validate[['IsNumeric']]()

    (sample |> quartile[['third']]()) + 1.5 * 
    (sample |> range[['IQR']]()) * 
    (sample |> skewness[['medcouple']]() |> adjustment[['Upper']]())
  }
  services[['Lower']] <- \(sample) {
    sample |> validate[['Exist']]() |> validate[['IsNumeric']]()

    (sample |> quartile[['first']]()) - 1.5 * 
    (sample |> range[['IQR']]()) * 
    (sample |> skewness[['medcouple']]() |> adjustment[['Lower']]())
  }
  return(services)
}