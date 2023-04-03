describe("Given Skewness.Service",{
  it("Exist",{
    Skewness.Service |> is.null() |> expect_equal(FALSE)
  })
})

describe("When services <- Skewness.Service()",{
  it("then services is a list",{
    # Given
    services <- Skewness.Service()

    # Then
    services |> is.list() |> expect_equal(TRUE)
  })
  it("then services contains medcouple",{
    # Given
    services <- Skewness.Service()

    # Then
    services[['medcouple']] |> is.null() |> expect_equal(FALSE)
  })
})

describe("When input |> service[['medcouple']]()",{
  it("then the medcouple of the sample number are returned",{
    # Given
    service <- Skewness.Service()

    input <- 1000 |> rnorm(10,5)

    # When
    medcouple <- input |> robustbase::mc()

    # THEN
    input |> service[['medcouple']]() |> expect_equal(medcouple)
  })
  it("then an exception is thrown when input is not numeric",{
    # Given
    service <- Skewness.Service()

    # THEN
    'a' |> service[['medcouple']]() |> expect_error('argument is not numeric')
  })
})