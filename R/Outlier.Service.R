Outlier.Service <- \(boundary) {
  validate <- Outlier.Validation()

  services <- list()
  services[['Extract']] <- \(sample) {
    sample |> validate[['Exist']]()

    boundary.upper <- sample |> boundary[['Upper']]()
    boundary.lower <- sample |> boundary[['Lower']]()

    sample[sample < boundary.lower | sample > boundary.upper] 
  }
  services[['Remove']] <- \(sample) {
    boundary.upper <- sample |> boundary[['Upper']]()
    boundary.lower <- sample |> boundary[['Lower']]()

    sample[sample >= boundary.lower & sample <= boundary.upper] 
  }
  return(services)
}