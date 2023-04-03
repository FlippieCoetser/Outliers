describe("Given Skewness.Exceptions",{
  it("Exist",{
    Skewness.Exceptions |> is.null() |> expect_equal(FALSE)
  })
})

describe("When exceptions <- Skewness.Exceptions()",{
  it("then exceptions is a list",{
    # Given
    exceptions <- Skewness.Exceptions()

    # Then
    exceptions |> is.list() |> expect_equal(TRUE)
  })
  it("then exceptions contains NullException",{
    # Given
    exceptions <- Skewness.Exceptions()

    # Then
    exceptions[['NullException']] |> is.null() |> expect_equal(FALSE)
  })
  it("then exceptions contains NumericException",{
    # Given
    exceptions <- Skewness.Exceptions()

    # Then
    exceptions[['NumericException']] |> is.null() |> expect_equal(FALSE)
  })
})

describe("When input |> exception[['NullException']]()",{
  it("then no exception is thrown when input is FALSE",{
    # Given
    exception <- Skewness.Exceptions()

    # THEN
    FALSE |> exception[['NullException']]() |> expect_no_error()
  })
  it("then no exception is thrown when input is FALSE",{
    # Given
    exception <- Skewness.Exceptions()

    # THEN
    TRUE |> exception[['NullException']]() |> expect_error('argument is NULL')
  })
})

describe("When input |> exception[['NumericException']]()",{
  it("then no exception is thrown when input is FALSE",{
    # Given
    exception <- Skewness.Exceptions()

    # THEN
    FALSE |> exception[['NumericException']]() |> expect_no_error()
  })
  it("then no exception is thrown when input is FALSE",{
    # Given
    exception <- Skewness.Exceptions()

    # THEN
    TRUE |> exception[['NumericException']]() |> expect_error('argument is not numeric')
  })
})