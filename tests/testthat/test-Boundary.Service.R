describe("Given Boundary.Service", {
  it("Exist",{
    Boundary.Service |> is.null() |> expect_equal(FALSE)
  })
})e