describe("Given Adjustment.Exceptions", {
  it("Exist",{
    Adjustment.Exceptions |> is.null() |> expect_equal(FALSE)
  })
})

describe("When adjustment.exceptions <- Adjustment.Exceptions()",{
  it("then adjustment.exceptions is a list",{
    # Given
    adjustment.exceptions <- Adjustment.Exceptions()

    # Then
    adjustment.exceptions |> is.list() |> expect_equal(TRUE)
  })
  it("then adjustment.exceptions contains Exist exception",{
    # Given
    adjustment.exceptions <- Adjustment.Exceptions()

    # Then
    adjustment.exceptions[['Exist']] |> is.function() |> expect_equal(TRUE)
  })
})