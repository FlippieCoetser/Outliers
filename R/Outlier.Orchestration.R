Outlier.Orchestration <- \() {
  service <- Boundary.Service() |> Outlier.Service()

  orchestrations <- list()
  orchestrations[['Extract']] <- \(sample) {
    sample |> service[['Extract']]()
  }
  orchestrations[['Remove']]  <- \(sample) {
    sample |> service[['Remove']]()
  }
  return(orchestrations)
}