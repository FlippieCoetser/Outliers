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
  it("then outlier.services contains upper service",{
    # Given
    outlier.services <- Outlier.Service()

    # Then
    outlier.services[['Extract']] |> is.function() |> expect_equal(TRUE)
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
})