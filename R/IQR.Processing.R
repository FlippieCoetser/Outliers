IQR.Processing <- \(service) {
  processors <- list()
  processors[['IQR']] <- \(input) {
    services <- list()
    services[[1]] <- \(input) input |> service[['IQRFromQuartiles']]()
    services[[2]] <- \(input) input |> service[['IQRFromSample']]()

    input |> services[[(input |> is.numeric()) + 1]]() 
  }
  return(processors)
}