describe("Given IQR.Processing",{
  it("exist",{
    # Given
    IQR.Processing |> is.null() |> expect_equal(FALSE)
  })
})

describe("When processors <- IQR.Processing()",{
  it("then processors is a list",{
    # Given
    processors <- IQR.Processing()

    # Then
    processors |> is.list() |> expect_equal(TRUE)
  })
  it("then processors contains IQR processor",{
    # Given
    processors <- IQR.Processing()

    # Then
    processors[['IQR']] |> is.null() |> expect_equal(FALSE)
  })
})

describe("When input |> processor[['IQR']]()",{
  it("then no exception is thrown if input is numeric",{
    # Given
    processors <- IQR.Service() |> IQR.Processing()
    
    # When 
    input <- 1000 |> rnorm(10,5)

    # Then
    input |> processors[['IQR']]() |> expect_no_error()
  })
  it("then the IQR is returned if input is numeric",{
    # Given
    processors <- IQR.Service() |> IQR.Processing()
    quartile   <- Quartile.Service()

    # When
    input <- 1000 |> rnorm(10,5)

    quartiles <- list()
    quartiles[['first']] <- input |> quartile[['first']]()
    quartiles[['third']] <- input |> quartile[['third']]()
    
    IQR <- (quartiles[['third']] - quartiles[['first']])

    # Then
    input |> processors[['IQR']]() |> expect_equal(IQR)
  })
  it("then no exception is thrown if input is a list",{
    # Given
    processors <- IQR.Service() |> IQR.Processing()
    quartile   <- Quartile.Service()

    input <- 1000 |> rnorm(10,5)

    # When
    quartiles <- list()
    quartiles[['first']] <- input |> quartile[['first']]()
    quartiles[['third']] <- input |> quartile[['third']]()

    # Then
    quartiles |> processors[['IQR']]() |> expect_no_error()
  })
  it("then the IQR is returned if input is a list with first and third quartile",{
    # Given
    processors <- IQR.Service() |> IQR.Processing()
    quartile   <- Quartile.Service()

    input <- 1000 |> rnorm(10,5)

    # When
    quartiles <- list()
    quartiles[['first']] <- input |> quartile[['first']]()
    quartiles[['third']] <- input |> quartile[['third']]()

    IQR <- (quartiles[['third']] - quartiles[['first']])

    # Then
    quartiles |> processors[['IQR']]() |> expect_equal(IQR)
  })
})

