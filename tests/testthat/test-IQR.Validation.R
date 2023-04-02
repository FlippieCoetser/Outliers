describe("Given IQR.Validation",{
  it("exist",{
    IQR.Validation |> is.null() |> expect_equal(FALSE)
  })
})

describe("When validators <- IQR.Validation()",{
  it("then validators is a list",{
    # Given
    validators <- IQR.Validation()

    # Then
    validators |> is.list() |> expect_equal(TRUE)
  })
  it("then validators contains Exist validator",{
    # Given
    validators <- IQR.Validation()

    # Then
    validators[['Exist']] |> is.null() |> expect_equal(FALSE)
  })
  it("then validators contains IsNumeric validator",{
    # Given
    validators <- IQR.Validation()

    # Then
    validators[['IsNumeric']] |> is.null() |> expect_equal(FALSE)
  })
  it("then validators contains IsList validator",{
    # Given
    validators <- IQR.Validation()

    # Then
    validators[['IsList']] |> is.null() |> expect_equal(FALSE)
  })
  it("then validators contains HasFirstQuartile validator",{
    # Given
    validators <- IQR.Validation()

    # Then
    validators[['HasFirstQuartile']] |> is.null() |> expect_equal(FALSE)
  })
  it("then validators contains HasThirdQuartile validator",{
    # Given
    validators <- IQR.Validation()

    # Then
    validators[['HasThirdQuartile']] |> is.null() |> expect_equal(FALSE)
  })
})

describe("When input |> validator[['Exist']]()",{
  it("should throw error when input is null",{
    # Given
    validator <- IQR.Validation()

    # THEN
    NULL |> validator[['Exist']]() |> expect_error()
  })
})

describe("When input |> validator[['IsNumeric']]()",{
  it("then no exception is thrown when input is number",{
    # Given
    validator <- IQR.Validation()

    # THEN
    1 |> validator[['IsNumeric']]() |> expect_no_error()
  })
  it("then an exception is thrown when input is string",{
    # Given
    validator <- IQR.Validation()

    # THEN
    '' |> validator[['IsNumeric']]() |> expect_error('argument is not numeric')
  })
})

describe("When input |> validator[['IsList']]()",{
  it("then no exception is thrown when input is list",{
    # Given
    validator <- IQR.Validation()

    # THEN
    list() |> validator[['IsList']]() |> expect_no_error()
  })
  it("then an exception is thrown when input is not a list",{
    # Given
    validator <- IQR.Validation()

    # THEN
    8 |> validator[['IsList']]() |> expect_error('argument is not list')
  })
})

describe("When input |> validator[['HasFirstQuartile']]()",{
  it("then no exception is thrown when input has first member",{
    # Given
    validator <- IQR.Validation()

    # THEN
    list(first = 8) |> validator[['HasFirstQuartile']]() |> expect_no_error()
  })
  it("then an exception is thrown when input has no first member",{
    # Given
    validator <- IQR.Validation()

    # THEN
    list() |> validator[['HasFirstQuartile']]() |> expect_error('first quartile missing')
  })
})

describe("When input |> validator[['HasThirdQuartile']]()",{
  it("then no exception is thrown when input has third member",{
    # Given
    validator <- IQR.Validation()

    # THEN
    list(third = 8) |> validator[['HasThirdQuartile']]() |> expect_no_error()
  })
  it("then an exception is thrown when input has no third member",{
    # Given
    validator <- IQR.Validation()

    # THEN
    list() |> validator[['HasThirdQuartile']]() |> expect_error('third quartile missing')
  })
})