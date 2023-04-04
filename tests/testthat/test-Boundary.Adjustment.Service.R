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
})