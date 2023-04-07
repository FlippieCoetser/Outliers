describe("Given Outlier.Service", {
  it("Exist",{
    Outlier.Service |> is.null() |> expect_equal(FALSE)
  })
})