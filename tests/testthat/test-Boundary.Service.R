describe("Given Boundary.Service", {
  it("Exist",{
    Boundary.Service |> is.null() |> expect_equal(FALSE)
  })
})

describe("Given services <- Boundary.Service()",{
  it("then services is a list",{
    # Given
    services <- Boundary.Service()

    # Then
    services |> is.list() |> expect_equal(TRUE)
  })
  it("then services contain Upper service",{
    # Given
    services <- Boundary.Service()

    # Then
    services[['Upper']] |> is.null() |> expect_equal(FALSE)
  })
  it("then services contain Lower service",{
    # Given
    services <- Boundary.Service()

    # Then
    services[['Lower']] |> is.null() |> expect_equal(FALSE)
  })
})

describe("Given input |> service[['Upper']]()",{
  it("then an upper boundary should be returned",{
    # Given
    quartile   <- Quartile.Service()
    range      <- IQR.Service() |> IQR.Processing()
    skewness   <- Skewness.Service()
    adjustment <- Adjustment.Service()

    service <- Boundary.Service()
    input   <- 1000 |> rnorm(10,5)

    # When
    expected.boundary <- 
      (input |> quartile[['third']]()) + 1.5 * 
      (input |> range[['IQR']]()) * 
      (input |> skewness[['medcouple']]() |> adjustment[['Upper']]()) 

    actual.boundary <- input |> service[['Upper']]()

    # Then
    actual.boundary |> expect_equal(expected.boundary)
  })
})