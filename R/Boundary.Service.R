Boundary.Service <- \() {
  quartile   <- Quartile.Service()
  range      <- IQR.Service() |> IQR.Processing()
  skewness   <- Skewness.Service()
  adjustment <- Adjustment.Service()

  services <- list()
  services[['Upper']] <- \(sample) {  
    (sample |> quartile[['third']]()) + 1.5 * 
    (sample |> range[['IQR']]()) * 
    (sample |> skewness[['medcouple']]() |> adjustment[['Upper']]())
  }
  return(services)
}