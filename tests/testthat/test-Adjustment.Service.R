describe("Given Adjustment.Service", {
  it("Exist",{
    Adjustment.Service |> is.null() |> expect_equal(FALSE)
  })
})

describe("Given services <- Adjustment.Service()",{
  it("then services is a list",{
    # Given
    services <- Adjustment.Service()

    # Then
    services |> is.list() |> expect_equal(TRUE)
  })
  it("then services contains upper service",{
    # Given
    services <- Adjustment.Service()

    # Then
    services[['Upper']] |> is.function() |> expect_equal(TRUE)
  })
  it("then services contains lower service",{
    # Given
    services <- Adjustment.Service()

    # Then
    services[['Lower']] |> is.function() |> expect_equal(TRUE)
  })
})

describe("When medcouple |> services[['Upper']]()",{
  it("then exp(-4*medcouple) is returned if medcouple >= 0",{
    # Given
    service <- Adjustment.Service()
    medcouple <- 1

    # When
    result <- medcouple |> service[['Upper']]()

    # Then
    result |> expect_equal(exp(-4*medcouple))
  })
  it("then exp(-3*medcouple) is returned if medcouple < 0",{
    # Given
    service <- Adjustment.Service()
    medcouple <- -1

    # When
    result <- medcouple |> service[['Upper']]()

    # Then
    result |> expect_equal(exp(-3*medcouple))
  })
  it("then an exception should be thrown if input is NULL",{
    # Given
    service <- Adjustment.Service()
    medcouple <- NULL

    # Then
    medcouple |> service[['Upper']]() |> expect_error('argument is NULL')
  })
  it("then an exception should be thrown if input is not Numeric",{
    # Given
    service <- Adjustment.Service()
    medcouple <- ""

    # Then
    medcouple |> service[['Upper']]() |> expect_error('argument is not numeric')
  })
})

describe("When medcouple |> services[['Lower']]()",{
  it("then exp(3*medcouple) is returned if medcouple >= 0",{
    # Given
    service <- Adjustment.Service()
    medcouple <- 1

    # When
    result <- medcouple |> service[['Lower']]()

    # Then
    result |> expect_equal(exp(3*medcouple))
  })
  it("then exp(4*medcouple) is returned if medcouple < 0",{
    # Given
    service <- Adjustment.Service()
    medcouple <- -1

    # When
    result <- medcouple |> service[['Lower']]()

    # Then
    result |> expect_equal(exp(4*medcouple))
  })
  it("then an exception should be thrown if input is NULL",{
    # Given
    service <- Adjustment.Service()
    medcouple <- NULL

    # Then
    medcouple |> service[['Lower']]() |> expect_error('argument is NULL')
  })
  it("then an exception should be thrown if input is not Numeric",{
    # Given
    service <- Adjustment.Service()
    medcouple <- ""

    # Then
    medcouple |> service[['Lower']]() |> expect_error('argument is not numeric')
  })
})