describe("Given Boundary.Service", {
  it("Exist",{
    Boundary.Service |> is.null() |> expect_equal(FALSE)
  })
})

describe("Given services <- Boundary.Service()",{
  it("then services is a list",{
    # Given
    services <- Boundary.Service()

    # Then
    services |> is.list() |> expect_equal(TRUE)
  })
})