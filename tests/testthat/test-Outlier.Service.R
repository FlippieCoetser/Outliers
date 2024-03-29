describe("Given Outlier.Service", {
  it("Exist",{
    Outlier.Service |> is.null() |> expect_equal(FALSE)
  })
})

describe("Given outlier.services <- Outlier.Service()",{
  it("then outlier.services is a list",{
    # Given
    outlier.services <- Outlier.Service()

    # Then
    outlier.services |> is.list() |> expect_equal(TRUE)
  })
  it("then outlier.services contains Extract service",{
    # Given
    outlier.services <- Outlier.Service()

    # Then
    outlier.services[['Extract']] |> is.function() |> expect_equal(TRUE)
  })
  it("then outlier.services contains Remove service",{
    # Given
    outlier.services <- Outlier.Service()

    # Then
    outlier.services[['Remove']] |> is.function() |> expect_equal(TRUE)
  })
})

describe("When input |> outlier.service[['Extract']]()",{
  it("then the outlier in input should be returned",{
    # Given
    boundary.service <- Boundary.Service()

    outlier.service <- Boundary.Service() |> Outlier.Service()
    input   <- 1000 |> rnorm(10,5)

    # When
    boundary.upper <- input |> boundary.service[['Upper']]()
    boundary.lower <- input |> boundary.service[['Lower']]()

    expected.outliers <- input[input < boundary.lower | input > boundary.upper]
    actual.outliers   <- input |> outlier.service[['Extract']]()

    # Then
    actual.outliers |> expect_equal(expected.outliers)
  })
  it("then an exception is thrown when input is NULL",{
    # Given
    outlier.service <- Boundary.Service() |> Outlier.Service()
    
    # When
    input   <- NULL

    # Then
    input |> outlier.service[['Extract']]() |> expect_error('argument is NULL')
  })
  it("then an exception is thrown when input is not numeric",{
    # Given
    outlier.service <- Boundary.Service() |> Outlier.Service()
    
    # When
    input   <- ''

    # Then
    input |> outlier.service[['Extract']]() |> expect_error('argument is not numeric')
  })
  it("then an exception should be thrown when medcouple is out of range",{
    # Given
    outlier.service <- Boundary.Service() |> Outlier.Service()
    set.seed(42)

    # When
    input <- skewed_data <- rgamma(1000, shape = 0.1, rate = 0.1)

    # Then
    input |> outlier.service[['Extract']]() |> expect_warning('medcouple is out of range: -0.6 > MC > 0.6')
  })
})

describe("When input |> outlier.service[['Remove']]()",{
  it("then the outlier in input should be removed",{
    # Given
    boundary.service <- Boundary.Service()

    outlier.service <- Boundary.Service() |> Outlier.Service()
    input   <- 1000 |> rnorm(10,5)

    # When
    boundary.upper <- input |> boundary.service[['Upper']]()
    boundary.lower <- input |> boundary.service[['Lower']]()

    expected.outliers <- input[input >= boundary.lower & input <= boundary.upper]
    actual.outliers   <- input |> outlier.service[['Remove']]()

    # Then
    actual.outliers |> expect_equal(expected.outliers)
  })
  it("then an exception is thrown when input is NULL",{
    # Given
    outlier.service <- Boundary.Service() |> Outlier.Service()
    
    # When
    input   <- NULL

    # Then
    input |> outlier.service[['Remove']]() |> expect_error('argument is NULL')
  })
  it("then an exception is thrown when input is not numeric",{
    # Given
    outlier.service <- Boundary.Service() |> Outlier.Service()
    
    # When
    input   <- ''

    # Then
    input |> outlier.service[['Remove']]() |> expect_error('argument is not numeric')
  })
  it("then an exception should be thrown when medcouple is out of range",{
    # Given
    outlier.service <- Boundary.Service() |> Outlier.Service()
    set.seed(42)

    # When
    input <- skewed_data <- rgamma(1000, shape = 0.1, rate = 0.1)

    # Then
    input |> outlier.service[['Remove']]() |> expect_warning('medcouple is out of range: -0.6 > MC > 0.6')
  })
})