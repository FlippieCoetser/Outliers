describe("Given Adjustment.Validation", {
  it("Exist",{
    Adjustment.Validation |> is.null() |> expect_equal(FALSE)
  })
})

describe("When adjustment.validators <- Adjustment.Validation()",{
  it("then adjustment.validation is a list",{
    # Given
    adjustment.validators <- Adjustment.Validation()

    # Then
    adjustment.validators |> is.list() |> expect_equal(TRUE)
  })
  it("then adjustment.validators contains Exist validator",{
    # Given
    adjustment.validators <- Adjustment.Validation()

    # Then
    adjustment.validators[['Exist']] |> is.function() |> expect_equal(TRUE)
  })
})