Outlier.Validation <- \() {
  exception <- Outlier.Exceptions()
  warnings   <- Outlier.Warnings()

  skewness   <- Skewness.Service()

  validators <- list()
  validators[['Exist']] <- \(data) {
    data |> is.null() |> exception[['NullException']]()
    return(data)
  }
  validators[['IsNumeric']] <- \(data) {
    data |> is.numeric() |> isFALSE() |> exception[['NumericException']]()
    return(data)
  }
  validators[['IsMedcoupleInRange']] <- \(data) {
    medcouple <- data |> skewness[['medcouple']]()

    (medcouple > 0.6)  |> warnings[['OutOfRangeWarning']]()
    (medcouple < -0.6) |> warnings[['OutOfRangeWarning']]()
  
    return(data)
  }
  return(validators)
}