describe("Given Outlier.Service", {
  it("Exist",{
    Outlier.Service |> is.null() |> expect_equal(FALSE)
  })
})

describe("Given outlier.services <- Outlier.Service()",{
  it("then services is a list",{
    # Given
    outlier.services <- Outlier.Service()

    # Then
    outlier.services |> is.list() |> expect_equal(TRUE)
  })
})