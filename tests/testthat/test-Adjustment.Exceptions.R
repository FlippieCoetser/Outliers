describe("Given Adjustment.Exceptions", {
  it("Exist",{
    Adjustment.Exceptions |> is.null() |> expect_equal(FALSE)
  })
})

describe("When adjustment.exceptions <- Adjustment.Exceptions()",{
  it("then adjustment.exceptions is a list",{
    # Given
    adjustment.exceptions <- Adjustment.Exceptions()

    # Then
    adjustment.exceptions |> is.list() |> expect_equal(TRUE)
  })
  it("then adjustment.exceptions contains NullException exception",{
    # Given
    adjustment.exceptions <- Adjustment.Exceptions()

    # Then
    adjustment.exceptions[['NullException']] |> is.function() |> expect_equal(TRUE)
  })
  it("then adjustment.exceptions contains NumericException exception",{
    # Given
    adjustment.exceptions <- Adjustment.Exceptions()

    # Then
    adjustment.exceptions[['NumericException']] |> is.function() |> expect_equal(TRUE)
  })
})

describe("When input |>  adjustment.exception[['NullException']]()",{
  it("then no exception is thrown if input is FALSE",{
    # Given
    adjustment.exception <- Adjustment.Exceptions()

    # Then
    FALSE |> adjustment.exception[['NullException']]() |> expect_no_error()
  })
  it("then NULL exception is thrown if input is TRUE",{
    # Given
    adjustment.exception <- Adjustment.Exceptions()

    # Then
    TRUE |> adjustment.exception[['NullException']]() |> expect_error('argument is NULL')
  })
})

describe("When input |> adjustment.exception[['NumericException']]()",{
  it("then no exception is thrown if input is FALSE",{
    # Given
    adjustment.exception <- Adjustment.Exceptions()

    # Then
    FALSE |> adjustment.exception[['NumericException']]() |> expect_no_error()
  })
  it("then NULL exception is thrown if input is TRUE",{
    # Given
    adjustment.exception <- Adjustment.Exceptions()

    # Then
    TRUE |> adjustment.exception[['NumericException']]() |> expect_error('argument is not numeric')
  })
})