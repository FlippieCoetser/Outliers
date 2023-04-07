Outlier.Service <- \(boundary) {
  services <- list()
  services[['Extract']] <- \(sample) {
    boundary.upper <- sample |> boundary[['Upper']]()
    boundary.lower <- sample |> boundary[['Lower']]()

    sample[sample < boundary.lower | sample > boundary.upper] 
  }
  services[['Remove']] <- \(sample) {
    
  }
  return(services)
}