describe("Given Boundary.Exceptions", {
  it("Exist",{
    Boundary.Exceptions |> is.null() |> expect_equal(FALSE)
  })
})