describe("Given Outlier.Validation", {
  it("Exist",{
    Outlier.Validation |> is.null() |> expect_equal(FALSE)
  })
})

describe("When outlier.validators <- Outlier.Validation()",{
  it("then outlier.validators is a list",{
    # Given
    outlier.validators <- Outlier.Validation()

    # Then
    outlier.validators |> is.list() |> expect_equal(TRUE)
  })
  it("then outlier.validators contains Exist validator",{
    # Given
    outlier.validators <- Outlier.Validation()

    # Then
    outlier.validators[['Exist']] |> is.null() |> expect_equal(FALSE)
  })
  it("then outlier.validators contains IsNumeric validator",{
    # Given
    outlier.validators <- Outlier.Validation()

    # Then
    outlier.validators[['IsNumeric']] |> is.null() |> expect_equal(FALSE)
  })
})

describe("When input |> outlier.validate[['Exist']]()",{
  it("then an exception should be thrown when input is null",{
    # Given
    outlier.validate <- Outlier.Validation()

    # Then
    NULL |> outlier.validate[['Exist']]() |> expect_error('argument is NULL')
  })
  it("then no exception should be thrown when input is not null",{
    # Given
    outlier.validate <- Outlier.Validation()

    # When
    input <- 1

    # Then
    input |> outlier.validate[['Exist']]() |> expect_no_error()
  })
  it("then input should be returned if input is not null",{
    # Given
    outlier.validate <- Outlier.Validation()

    # When
    input <- 1

    # Then
    input |> outlier.validate[['Exist']]() |> expect_equal(input)
  })
})

describe("When input |> outlier.validate[['IsNumeric']]()",{
  it("then an exception should be thrown when input is null",{
    # Given
    outlier.validate <- Outlier.Validation()

    # Then
    '' |> outlier.validate[['IsNumeric']]() |> expect_error('argument is not numeric')
  })
  it("then no exception should be thrown when input is not null",{
    # Given
    outlier.validate <- Outlier.Validation()

    # When
    input <- 1

    # Then
    input |> outlier.validate[['IsNumeric']]() |> expect_no_error()
  })
  it("then input should be returned if input is numeric",{
    # Given
    outlier.validate <- Outlier.Validation()

    # When
    input <- 1

    # Then
    input |> outlier.validate[['IsNumeric']]() |> expect_equal(input)
  })
})