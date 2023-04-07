describe("Given Boundary.Exceptions", {
  it("Exist",{
    Boundary.Exceptions |> is.null() |> expect_equal(FALSE)
  })
})

describe("When boundary.exceptions <- Boundary.Exceptions()",{
  it("then boundary.exceptions is a list",{
    # Given
    boundary.exceptions <- Boundary.Exceptions()

    # Then
    boundary.exceptions |> is.list() |> expect_equal(TRUE)
  })
  it("then boundary.exceptions contains NullException exception",{
    # Given
    boundary.exceptions <- Boundary.Exceptions()

    # Then
    boundary.exceptions[['NullException']] |> is.function() |> expect_equal(TRUE)
  })
})