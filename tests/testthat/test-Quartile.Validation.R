describe("Given Quartile.Validation",{
  it("Exist",{
    Quartile.Validation |> is.null() |> expect_equal(FALSE)
  })
})

describe("When validators <- Quartile.Validation()",{
  it("then validators is a list",{
    # Given
    validators <- Quartile.Validation()

    # Then
    validators |> is.list() |> expect_equal(TRUE)
  })
  it("then validators contains Exist",{
    # Given
    validators <- Quartile.Validation()

    # Then
    validators[['Exist']] |> is.null() |> expect_equal(FALSE)
  })
  it("then validators contains IsNumeric",{
    # Given
    validators <- Quartile.Validation()

    # Then
    validators[['IsNumeric']] |> is.null() |> expect_equal(FALSE)
  })
})

describe("When input |> validator[['Exist']]()",{
  it("then no exception is thrown when input is not NULL",{
    # Given
    validator <- Quartile.Validation()

    # THEN
    '' |> validator[['Exist']]() |> expect_no_error()
  })
  it("then an exception is thrown when input is NULL",{
    # Given
    validator <- Quartile.Validation()

    # THEN
    NULL |> validator[['Exist']]() |> expect_error('argument is NULL')
  })
})

describe("When input |> validator[['IsNumeric']]()",{
  it("then no exception is thrown when input is numeric",{
    # Given
    validator <- Quartile.Validation()

    # THEN
    1 |> validator[['IsNumeric']]() |> expect_no_error()
  })
  it("then an exception is thrown when input is not numeric",{
    # Given
    validator <- Quartile.Validation()

    # THEN
    '' |> validator[['IsNumeric']]() |> expect_error('argument is not numeric')
  })
})