describe("Given Adjustment.Validation", {
  it("Exist",{
    Adjustment.Validation |> is.null() |> expect_equal(FALSE)
  })
})