describe("Given Outlier.Exceptions", {
  it("Exist",{
    Outlier.Exceptions |> is.null() |> expect_equal(FALSE)
  })
})