describe("Given Outlier.Service", {
  it("Exist",{
    Outlier.Service |> is.null() |> expect_equal(FALSE)
  })
})

describe("Given outlier.services <- Outlier.Service()",{
  it("then outlier.services is a list",{
    # Given
    outlier.services <- Outlier.Service()

    # Then
    outlier.services |> is.list() |> expect_equal(TRUE)
  })
  it("then outlier.services contains upper service",{
    # Given
    outlier.services <- Outlier.Service()

    # Then
    outlier.services[['Extract']] |> is.function() |> expect_equal(TRUE)
  })
})