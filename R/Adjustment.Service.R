Adjustment.Service <- \() {
  validate <- Adjustment.Validation()

  services <- list()
  services[['Upper']] <- \(medcouple) {
    medcouple |> validate[['Exist']]() |> validate[['IsNumeric']]()

    adjustments <- list()
    adjustments[[1]] <- \(medcouple) exp(-3*medcouple)
    adjustments[[2]] <- \(medcouple) exp(-4*medcouple)
    
    medcouple |> adjustments[[(medcouple >= 0) + 1]]()
  }
  services[['Lower']] <- \(medcouple) {
    medcouple |> validate[['Exist']]()|> validate[['IsNumeric']]()   
     
    adjustments <- list()
    adjustments[[1]] <- \(medcouple) exp(4*medcouple)
    adjustments[[2]] <- \(medcouple) exp(3*medcouple)
    
    medcouple |> adjustments[[(medcouple >= 0) + 1]]()
   }
  return(services)
}