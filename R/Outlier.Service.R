Outlier.Service <- \(boundary) {
  services <- list()
  services[['Extract']] <- \(sample) {
    boundary.upper <- sample |> boundary[['Upper']]()
    boundary.lower <- sample |> boundary[['Lower']]()

    sample[sample < boundary.lower | sample > boundary.upper] 
  }
  return(services)
}