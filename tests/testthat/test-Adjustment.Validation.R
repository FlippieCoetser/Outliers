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

describe("When input |> adjustment.validate[['Exist']]()",{
  it("then no exception should be thrown if input is not null",{
    # Given
    adjustment.validate <- Adjustment.Validation()

    # Then
    '' |> adjustment.validate[['Exist']]() |> expect_no_error()
  })
  it("then an exception should be thrown when input is null",{
    # Given
    adjustment.validate <- Adjustment.Validation()

    # Then
    NULL |> adjustment.validate[['Exist']]() |> expect_error('argument is NULL')
  })
  it("then input should be returned if input is not null",{
    # Given
    adjustment.validate <- Adjustment.Validation()

    # When
    input <- ''

    # Then
    input |> adjustment.validate[['Exist']]() |> expect_equal(input)
  })
})