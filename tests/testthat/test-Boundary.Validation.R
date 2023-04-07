describe("Given Boundary.Validation", {
  it("Exist",{
    Boundary.Validation |> is.null() |> expect_equal(FALSE)
  })
})

describe("When boundary.validators <- Boundary.Validation()",{
  it("then boundary.validators is a list",{
    # Given
    boundary.validators <- Boundary.Validation()

    # Then
    boundary.validators |> is.list() |> expect_equal(TRUE)
  })
  it("then boundary.validators contains Exist validator",{
    # Given
    boundary.validators <- Boundary.Validation()

    # Then
    boundary.validators[['Exist']] |> is.null() |> expect_equal(FALSE)
  })
})