describe("Given Outlier.Warnings", {
  it("Exist",{
    Outlier.Warnings |> is.null() |> expect_equal(FALSE)
  })
})

describe("When outlier.warnings <- Outlier.Warnings()",{
  it("then outlier.warnings is a list",{
    # Given
    outlier.warnings <- Outlier.Warnings()

    # Then
    outlier.warnings |> is.list() |> expect_equal(TRUE)
  })
  it("then outlier.warnings contains OutOfRangeWarning warning",{
    # Given
    outlier.warnings <- Outlier.Warnings()

    # Then
    outlier.warnings[['OutOfRangeWarning']] |> is.function() |> expect_equal(TRUE)
  })
})

describe("When input |> outlier.warning[['OutOfRangeWarning']]()",{
  it("then no warning is thrown when input is FALSE",{
    # Given
    outlier.warning <- Outlier.Warnings()

    # THEN
    FALSE |> outlier.warning[['OutOfRangeWarning']]() |> expect_no_warning()
  })
  it("then a warning is thrown when input is TRUE",{
    # Given
    outlier.warning <- Outlier.Warnings()

    # THEN
    TRUE |> outlier.warning[['OutOfRangeWarning']]() |> expect_warning('medcouple is out of range: -0.6 > MC > 0.6')
  })
})