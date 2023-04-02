describe("Given IQR.Exceptions",{
  it("exist",{
    # Given
    IQR.Exceptions |> is.null() |> expect_equal(FALSE)
  })
})

describe("When exceptions <- IQR.Exceptions()",{
  it("then exception is a list",{
    # Given
    exceptions <- IQR.Exceptions()

    # Then
    exceptions |> is.list() |> expect_equal(TRUE)
  })
  it("then exceptions contains NullException exception",{
    # Given
    exceptions <- IQR.Exceptions()

    # Then
    exceptions[['NullException']] |> is.null() |> expect_equal(FALSE)
  })
  it("then exceptions contains NumericException exception",{
    # Given
    exceptions <- IQR.Exceptions()

    # Then
    exceptions[['NumericException']] |> is.null() |> expect_equal(FALSE)
  })
  it("then exceptions contains ListException exception",{
    # Given
    exceptions <- IQR.Exceptions()

    # Then
    exceptions[['ListException']] |> is.null() |> expect_equal(FALSE)
  })
  it("then exceptions contains FirstQuartileMissingException exception",{
    # Given
    exceptions <- IQR.Exceptions()

    # Then
    exceptions[['FirstQuartileMissingException']] |> is.null() |> expect_equal(FALSE)
  })
  it("then exceptions contains ThirdQuartileMissingException exception",{
    # Given
    exceptions <- IQR.Exceptions()

    # Then
    exceptions[['ThirdQuartileMissingException']] |> is.null() |> expect_equal(FALSE)
  })
})

describe("When input |> exception[['NullException']]()",{
  it("then no exception is thrown if input is FALSE",{
    # Given
    exception <- IQR.Exceptions()

    # Then
    FALSE |> exception[['NullException']]() |> expect_no_error()
  })
  it("then NULL exception is thrown if input is TRUE",{
    # Given
    exception <- IQR.Exceptions()

    # Then
    TRUE |> exception[['NullException']]() |> expect_error('argument is NULL')
  })
})

describe("When input |> exception[['NumericException']]()",{
  it("then no exception is thrown if input is FALSE",{
    # Given
    exception <- IQR.Exceptions()

    # Then
    FALSE |> exception[['NumericException']]() |> expect_no_error()
  })
  it("then NULL exception is thrown if input is TRUE",{
    # Given
    exception <- IQR.Exceptions()

    # Then
    TRUE |> exception[['NumericException']]() |> expect_error('argument is not numeric')
  })
})

describe("When input |> exception[['ListException']]()",{
  it("then no exception is thrown if input is FALSE",{
    # Given
    exception <- IQR.Exceptions()

    # Then
    FALSE |> exception[['ListException']]() |> expect_no_error()
  })
  it("then NULL exception is thrown if input is TRUE",{
    # Given
    exception <- IQR.Exceptions()

    # Then
    TRUE |> exception[['ListException']]() |> expect_error('argument is not list')
  })
})

describe("When input |> exception[['FirstQuartileMissingException']]()",{
  it("then no exception is thrown if input is FALSE",{
    # Given
    exception <- IQR.Exceptions()

    # Then
    FALSE |> exception[['FirstQuartileMissingException']]() |> expect_no_error()
  })
  it("then NULL exception is thrown if input is TRUE",{
    # Given
    exception <- IQR.Exceptions()

    # Then
    TRUE |> exception[['FirstQuartileMissingException']]() |> expect_error('first quartile missing')
  })
})

describe("When input |> exception[['ThirdQuartileMissingException']]()",{
  it("then no exception is thrown if input is FALSE",{
    # Given
    exception <- IQR.Exceptions()

    # Then
    FALSE |> exception[['ThirdQuartileMissingException']]() |> expect_no_error()
  })
  it("then NULL exception is thrown if input is TRUE",{
    # Given
    exception <- IQR.Exceptions()

    # Then
    TRUE |> exception[['ThirdQuartileMissingException']]() |> expect_error('third quartile missing')
  })
})