describe("Given Boundary.Validation", {
  it("Exist",{
    Boundary.Validation |> is.null() |> expect_equal(FALSE)
  })
})