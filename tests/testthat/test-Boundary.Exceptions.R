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
  it("then boundary.exceptions contains NumericException exception",{
    # Given
    boundary.exceptions <- Boundary.Exceptions()

    # Then
    boundary.exceptions[['NumericException']] |> is.function() |> expect_equal(TRUE)
  })
})

describe("When input |>  boundary.exception[['NullException']]()",{
  it("then no exception is thrown if input is FALSE",{
    # Given
    boundary.exception <- Boundary.Exceptions()

    # Then
    FALSE |> boundary.exception[['NullException']]() |> expect_no_error()
  })
  it("then NULL exception is thrown if input is TRUE",{
    # Given
    boundary.exception <- Boundary.Exceptions()

    # Then
    TRUE |> boundary.exception[['NullException']]() |> expect_error('argument is NULL')
  })
})

describe("When input |>  boundary.exception[['NumericException']]()",{
  it("then no exception is thrown if input is FALSE",{
    # Given
    boundary.exception <- Boundary.Exceptions()

    # Then
    FALSE |> boundary.exception[['NumericException']]() |> expect_no_error()
  })
  it("then NULL exception is thrown if input is TRUE",{
    # Given
    boundary.exception <- Boundary.Exceptions()

    # Then
    TRUE |> boundary.exception[['NumericException']]() |> expect_error('argument is not numeric')
  })
})