describe("Given Boundary.Adjustment.Service", {
  it("Exist",{
    Boundary.Adjustment.Service |> is.null() |> expect_equal(FALSE)
  })
})