describe("Given Boundary.Validation", {
  it("Exist",{
    Boundary.Validation |> is.null() |> expect_equal(FALSE)
  })
})

describe("When boundary.validators <- Boundary.Validation()",{
  it("then boundary.validators is a list",{
    # Given
    boundary.validators <- Boundary.Validation()

    # Then
    boundary.validators |> is.list() |> expect_equal(TRUE)
  })
  it("then boundary.validators contains Exist validator",{
    # Given
    boundary.validators <- Boundary.Validation()

    # Then
    boundary.validators[['Exist']] |> is.null() |> expect_equal(FALSE)
  })
})

describe("When input |> boundary.validate[['Exist']]()",{
  it("then an exception should be thrown when input is null",{
    # Given
    boundary.validate <- Boundary.Validation()

    # Then
    NULL |> boundary.validate[['Exist']]() |> expect_error('argument is NULL')
  })
  it("then no exception should be thrown when input is not null",{
    # Given
    boundary.validate <- Boundary.Validation()

    # When
    input <- 1

    # Then
    input |> boundary.validate[['Exist']]() |> expect_no_error()
  })
})