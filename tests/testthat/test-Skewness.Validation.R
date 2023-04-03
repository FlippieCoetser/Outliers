describe("Given Skewness.Validation",{
  it("Exist",{
    Skewness.Validation |> is.null() |> expect_equal(FALSE)
  })
})

describe("When validators <- Skewness.Validation()",{
  it("then validators is a list",{
    # Given
    validators <- Skewness.Validation()

    # Then
    validators |> is.list() |> expect_equal(TRUE)
  })
  it("then validators contains Exist",{
    # Given
    validators <- Skewness.Validation()

    # Then
    validators[['Exist']] |> is.null() |> expect_equal(FALSE)
  })
  it("then validators contains IsNumeric",{
    # Given
    validators <- Skewness.Validation()

    # Then
    validators[['IsNumeric']] |> is.null() |> expect_equal(FALSE)
  })
})

describe("When input |> validator[['Exist']]()",{
  it("then no exception is thrown when input is not NULL",{
    # Given
    validator <- Skewness.Validation()

    # THEN
    '' |> validator[['Exist']]() |> expect_no_error()
  })
  it("then an exception is thrown when input is NULL",{
    # Given
    validator <- Skewness.Validation()

    # THEN
    NULL |> validator[['Exist']]() |> expect_error('argument is NULL')
  })
})

describe("When input |> validator[['IsNumeric']]()",{
  it("then no exception is thrown when input is numeric",{
    # Given
    validator <- Skewness.Validation()

    # THEN
    1 |> validator[['IsNumeric']]() |> expect_no_error()
  })
  it("then an exception is thrown when input is not numeric",{
    # Given
    validator <- Skewness.Validation()

    # THEN
    '' |> validator[['IsNumeric']]() |> expect_error('argument is not numeric')
  })
})