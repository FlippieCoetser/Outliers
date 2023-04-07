describe("Given Boundary.Exceptions", {
  it("Exist",{
    Boundary.Exceptions |> is.null() |> expect_equal(FALSE)
  })
})

describe("When boundary.exceptions <- Boundary.Exceptions()",{
  it("then adjustment.exceptions is a list",{
    # Given
    boundary.exceptions <- Boundary.Exceptions()

    # Then
    boundary.exceptions |> is.list() |> expect_equal(TRUE)
  })
})