describe("Given Adjustment.Exceptions", {
  it("Exist",{
    Adjustment.Exceptions |> is.null() |> expect_equal(FALSE)
  })
})