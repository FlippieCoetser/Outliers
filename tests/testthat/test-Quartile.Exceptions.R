describe("Given Quartile.Exceptions",{
  it("Exist",{
    Quartile.Exceptions |> is.null() |> expect_equal(FALSE)
  })
})

describe("When exceptions <- Quartile.Exceptions()",{
  it("then exceptions is a list",{
    # Given
    exceptions <- Quartile.Exceptions()

    # Then
    exceptions |> is.list() |> expect_equal(TRUE)
  })
  it("then exceptions contains NullException",{
    # Given
    exceptions <- Quartile.Exceptions()

    # Then
    exceptions[['NullException']] |> is.null() |> expect_equal(FALSE)
  })
  it("then exceptions contains NumericException",{
    # Given
    exceptions <- Quartile.Exceptions()

    # Then
    exceptions[['NumericException']] |> is.null() |> expect_equal(FALSE)
  })
})

describe("When input |> exception[['NullException']]()",{
  it("then no exception is thrown when input is FALSE",{
    # Given
    exception <- Quartile.Exceptions()

    # THEN
    FALSE |> exception[['NullException']]() |> expect_no_error()
  })
  it("then an exception is thrown when input is TRUE",{
    # Given
    exception <- Quartile.Exceptions()

    # THEN
    TRUE |> exception[['NullException']]() |> expect_error('argument is NULL')
  })
})

describe("When input |> exception[['NumericException']]()",{
  it("then no exception is thrown when input is FALSE",{
    # Given
    exception <- Quartile.Exceptions()

    # THEN
    FALSE |> exception[['NumericException']]() |> expect_no_error()
  })
  it("then an exception is thrown when input is TRUE",{
    # Given
    exception <- Quartile.Exceptions()

    # THEN
    TRUE |> exception[['NumericException']]() |> expect_error('argument is not numeric')
  })
})