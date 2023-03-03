test_that('Medcouple.Service exist',{
  Skewness.Service |>
    is.null()      |>
      expect_equal(FALSE)
})
test_that("Skewness.Service() returns list of services",{
  # Given
  services <- Skewness.Service()

  # Then
  services    |>
    is.list() |>
      expect_equal(TRUE)
})

# Medcouple 
test_that("service instance has medcouple service",{
  # Given
  services <- Skewness.Service()

  # Then
  services[['medcouple']] |>
    is.null()             |>
      expect_equal(FALSE)
})
test_that("sample |> service[['medcouple']]() returns medcouple skewness of sample",{
  # Given
  service <- Skewness.Service()

  data <- 1000 |> rnorm(10,5)

  # When
  medcouple <- data |> robustbase::mc()

  # Then
  data |>
    service[['medcouple']]() |>
      expect_equal(medcouple)
})