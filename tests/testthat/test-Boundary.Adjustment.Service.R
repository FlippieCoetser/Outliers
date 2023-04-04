describe("Given Boundary.Adjustment.Service", {
  it("Exist",{
    Boundary.Adjustment.Service |> is.null() |> expect_equal(FALSE)
  })
})

describe("Given services <- Boundary.Adjustment.Service()",{
  it("then services is a list",{
    # Given
    services <- Boundary.Adjustment.Service()

    # Then
    services |> is.list() |> expect_equal(TRUE)
  })
  it("then services contains upper service",{
    # Given
    services <- Boundary.Adjustment.Service()

    # Then
    services[['Upper']] |> is.function() |> expect_equal(TRUE)
  })
  it("then services contains lower service",{
    # Given
    services <- Boundary.Adjustment.Service()

    # Then
    services[['Lower']] |> is.function() |> expect_equal(TRUE)
  })
})