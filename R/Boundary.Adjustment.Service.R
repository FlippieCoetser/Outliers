Boundary.Adjustment.Service <- \() {
  skewness <- Skewness.Service()

  services <- list()
  services[['Upper']] <- \(medcouple) {
    adjustments <- list()
    adjustments[[1]] <- \(medcouple) exp(-3*medcouple)
    adjustments[[2]] <- \(medcouple) exp(-4*medcouple)
    
    adjustments[[(medcouple >= 0) + 1]](medcouple)
  }
  services[['Lower']] <- \(medcouple) {
    adjustments <- list()
    adjustments[[1]] <- \(medcouple) exp(4*medcouple)
    adjustments[[2]] <- \(medcouple) exp(3*medcouple)
    
    adjustments[[(medcouple >= 0) + 1]](medcouple)
   }
  return(services)
}