describe("Given Outlier.Exceptions", {
  it("Exist",{
    Outlier.Exceptions |> is.null() |> expect_equal(FALSE)
  })
})

describe("When outlier.exceptions <- Outlier.Exceptions()",{
  it("then outlier.exceptions is a list",{
    # Given
    outlier.exceptions <- Outlier.Exceptions()

    # Then
    outlier.exceptions |> is.list() |> expect_equal(TRUE)
  })
  it("then outlier.exceptions contains NullException exception",{
    # Given
    outlier.exceptions <- Outlier.Exceptions()

    # Then
    outlier.exceptions[['NullException']] |> is.function() |> expect_equal(TRUE)
  })
  it("then outlier.exceptions contains NumericException exception",{
    # Given
    outlier.exceptions <- Outlier.Exceptions()

    # Then
    outlier.exceptions[['NumericException']] |> is.function() |> expect_equal(TRUE)
  })
})

describe("When input |>  outlier.exception[['NullException']]()",{
  it("then no exception is thrown if input is FALSE",{
    # Given
    outlier.exception <- Outlier.Exceptions()

    # Then
    FALSE |> outlier.exception[['NullException']]() |> expect_no_error()
  })
  it("then NULL exception is thrown if input is TRUE",{
    # Given
    outlier.exception <- Outlier.Exceptions()

    # Then
    TRUE |> outlier.exception[['NullException']]() |> expect_error('argument is NULL')
  })
})

describe("When input |> outlier.exception[['NumericException']]()",{
  it("then no exception is thrown if input is FALSE",{
    # Given
    outlier.exception <- Outlier.Exceptions()

    # Then
    FALSE |> outlier.exception[['NumericException']]() |> expect_no_error()
  })
  it("then NULL exception is thrown if input is TRUE",{
    # Given
    outlier.exception <- Outlier.Exceptions()

    # Then
    TRUE |> outlier.exception[['NumericException']]() |> expect_error('argument is not numeric')
  })
})