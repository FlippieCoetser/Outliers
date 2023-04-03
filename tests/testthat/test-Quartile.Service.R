describe("Given Quartile.Service",{
  it("Exist",{
    Quartile.Service |> is.null() |> expect_equal(FALSE)
  })
})

describe("When services <- Quartile.Service()",{
  it("then services is a list",{
    # Given
    services <- Quartile.Service()

    # Then
    services |> is.list() |> expect_equal(TRUE)
  })
  it("then services contains first",{
    # Given
    quartile <- Quartile.Service()

    # Then
    quartile[['first']] |> is.null() |> expect_equal(FALSE)
  })
  it("then services contains third",{
    # Given
    quartile <- Quartile.Service()

    # Then
    quartile[['third']] |> is.null() |> expect_equal(FALSE)
  })
})

describe("When input |> service[['first']]()",{
  it("then the first quartile of the sample number are returned",{
    # Given
    quartile <- Quartile.Service()
    input <- 1000 |> rnorm(10,5)

    value.expected <- input |> quantile(0.25)

    # Then
    input |> quartile[['first']]() |> expect_equal(value.expected)
  })
  it("then an exception is thrown when data is not numeric",{
    # Given
    quartile <- Quartile.Service()

    # Then
    '' |> quartile[['first']]() |> expect_error('argument is not numeric')
  })
  it("then an exception is thrown when data is NULL",{
    # Given
    quartile <- Quartile.Service()

    # Then
    NULL |> quartile[['first']]() |> expect_error('argument is NULL')
  })
})

describe("When input |> service[['third']]()",{
  it("then the third quartile of the sample number are returned",{
    # Given
    quartile <- Quartile.Service()
    input <- 1000 |> rnorm(10,5)

    value.expected <- input |> quantile(0.75)

    # Then
    input |> quartile[['third']]() |> expect_equal(value.expected)
  })
  it("then an exception is thrown when data is not numeric",{
    # Given
    quartile <- Quartile.Service()

    # Then
    '' |> quartile[['third']]() |> expect_error('argument is not numeric')
  })
  it("then an exception is thrown when data is NULL",{
    # Given
    quartile <- Quartile.Service()

    # Then
    NULL |> quartile[['third']]() |> expect_error('argument is NULL')
  })
})