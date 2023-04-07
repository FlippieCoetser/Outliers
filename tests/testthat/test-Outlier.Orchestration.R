describe("Given Outlier.Orchestration",{
  it("exist",{
    Outlier.Orchestration |> is.null() |> expect_equal(FALSE)
  })
})

describe("When outlier.orchestrations <- Outlier.Orchestration()",{
  it("then outlier.orchestrations is a list",{
    # Given
    outlier.orchestrations <- Outlier.Orchestration()
    
    # Then
    outlier.orchestrations |> is.list() |> expect_equal(TRUE)
  })
  it("then outlier.orchestrations contains Extract processor",{
    # Given
    outlier.orchestrations <- Outlier.Orchestration()
    
    # Then
    outlier.orchestrations[['Extract']] |> is.null() |> expect_equal(FALSE)
  })
  it("then outlier.orchestrations contains Remove processor",{
    # Given
    outlier.orchestrations <- Outlier.Orchestration()
    
    # Then
    outlier.orchestrations[['Remove']] |> is.null() |> expect_equal(FALSE)
  })
})


describe("When input |> outlier.orchestration[['Extract']]()",{
  it("then the outlier in input should be returned",{
    # Given
    boundary.service <- Boundary.Service()

    outlier.orchestration <- Outlier.Orchestration()
    input   <- 1000 |> rnorm(10,5)

    # When
    boundary.upper <- input |> boundary.service[['Upper']]()
    boundary.lower <- input |> boundary.service[['Lower']]()

    expected.outliers <- input[input < boundary.lower | input > boundary.upper]
    actual.outliers   <- input |> outlier.orchestration[['Extract']]()

    # Then
    actual.outliers |> expect_equal(expected.outliers)
  })
})

describe("When input |> outlier.orchestration[['Remove']]()",{
  it("then the outlier in input should be removed",{
    # Given
    boundary.service <- Boundary.Service()

    outlier.orchestration <- Outlier.Orchestration()
    input   <- 1000 |> rnorm(10,5)

    # When
    boundary.upper <- input |> boundary.service[['Upper']]()
    boundary.lower <- input |> boundary.service[['Lower']]()

    expected.outliers <- input[input >= boundary.lower & input <= boundary.upper]
    actual.outliers   <- input |> outlier.orchestration[['Remove']]()

    # Then
    actual.outliers |> expect_equal(expected.outliers)
  })
})