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

describe("When input |> adjustment.validator[['Exist']]()",{
  it("then no exception should be thrown if input is not null",{
    # Given
    adjustment.validator <- Adjustment.Validation()

    # THEN
    '' |> adjustment.validator[['Exist']]() |> expect_no_error()
  })
  it("should throw error when input is null",{
    # Given
    adjustment.validator <- Adjustment.Validation()

    # THEN
    NULL |> adjustment.validator[['Exist']]() |> expect_error('argument is NULL')
  })
})