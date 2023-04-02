describe("Given IQR.Service",{
  it("exist",{
    IQR.Service |> is.null() |> expect_equal(FALSE)
  })
})

describe("When services <- IQR.Service()",{
  it("then services is a list",{
    # Given
    services <- IQR.Service()

    # Then
    services |> is.list() |> expect_equal(TRUE)
  })
  it("then services contains IQRFromQuartiles service",{
    # Given
    services <- IQR.Service()

    # Then
    services[['IQRFromQuartiles']] |> is.null() |> expect_equal(FALSE)
  })
  it("then services contains IQRFromSample service",{
    # Given
    services <- IQR.Service()

    # Then
    services[['IQRFromSample']] |> is.null() |> expect_equal(FALSE)
  })
})

describe("When input |> service[['IQRfromQuartiles']]()",{
  it("then no exception is thrown if input is a list",{
    # Given
    service <- IQR.Service()
    quartile <- Quartile.Service()

    data <- 1000 |> rnorm(10,5)

    # When
    input <- list()
    input[['first']] <- data |> quartile[['first']]()
    input[['third']] <- data |> quartile[['third']]()

    # Then
    input |> service[['IQRFromQuartiles']]() |> expect_no_error()
  })
  it("then an exception is thrown if input is a list with no first",{
    # Given
    service <- IQR.Service()
    quartile <- Quartile.Service()

    data <- 1000 |> rnorm(10,5)

    # When
    input <- list()
    input[['third']] <- data |> quartile[['third']]()
  
    # Then
    input |> service[['IQRFromQuartiles']]() |> expect_error('first quartile missing')
  })
  it("then an exception is thrown if input is a list with no third",{
    # Given
    service <- IQR.Service()
    quartile <- Quartile.Service()

    data <- 1000 |> rnorm(10,5)

    # When
    input <- list()
    input[['first']] <- data |> quartile[['first']]()
  
    # Then
    input |> service[['IQRFromQuartiles']]() |> expect_error('third quartile missing')
  })
  it("then an exception is thrown if input is no a list",{
    # Given
    service <- IQR.Service()
    quartile <- Quartile.Service()

    data <- 1000 |> rnorm(10,5)

    # When
    data <- 1000 |> rnorm(10,5)

    # Then
    data |> service[['IQRFromQuartiles']]() |> expect_error('argument is not list')
  })
  it("then the IQR is returned if input is a list with first and third",{
    # Given
    service <- IQR.Service()

    quartile <- Quartile.Service()
    data <- 1000 |> rnorm(10,5)

    quartiles <- list()
    quartiles[['first']] <- data |> quartile[['first']]()
    quartiles[['third']] <- data |> quartile[['third']]()

    # When
    IQR <- (quartiles[['third']] - quartiles[['first']])

    # Then
    quartiles |> service[['IQRFromQuartiles']]() |> expect_equal(IQR)
  })
})

describe("When input |> service[['IQRFromSample']]()",{
  it("then no exception is thrown if input is numeric",{
    # Given
    service <- IQR.Service()

    # When
    input <- 1000 |> rnorm(10,5)

    # Then
    input |> service[['IQRFromSample']]() |> expect_no_error()
  })
  it("then an exception is thrown if input is no numeric",{
    # Given
    service <- IQR.Service()

    # When
    input <- list()

    # Then
    input |> service[['IQRFromSample']]() |> expect_error('argument is not numeric')
  })
  it("then the IQR is returned if input is numeric",{
    # Given
    service <- IQR.Service()
    quartile <- Quartile.Service()

    # When
    input <- 1000 |> rnorm(10,5)
    
    quartiles <- list()
    quartiles[['first']] <- input |> quartile[['first']]()
    quartiles[['third']] <- input |> quartile[['third']]()

    IQR <- (quartiles[['third']] - quartiles[['first']])

    # Then
    input |> service[['IQRFromSample']]() |> expect_equal(IQR)
  })
})