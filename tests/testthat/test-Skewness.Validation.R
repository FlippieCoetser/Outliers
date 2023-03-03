test_that("Skewness.Validation exist",{
  Skewness.Validation |>
    is.null()         |>
      expect_equal(FALSE)
})
test_that("Skewness.Validation() returns list of validators",{
  Skewness.Validation() |>
    is.list()        |>
      expect_equal(TRUE)
})

# Data Exist Validator
test_that("validator instance has Exist validator",{
  # Given
  validator <- Skewness.Validation()

  # Then
  validator[["Exist"]]  |>
    is.null()           |>
      expect_equal(FALSE)
})
test_that("data |> validator[['Exist']]() should throw error when data is null",{
  # Given
  validator <- Skewness.Validation()

  # THEN
  NULL |>
    validator[['Exist']]() |>
      expect_error()
})

# Data Is Numeric Validator
test_that("validator instance has IsNumeric validator",{
  # Given
  validator <- Skewness.Validation()

  # Then
  validator[["IsNumeric"]]  |>
    is.null()               |>
      expect_equal(FALSE)
})
test_that("data |> validator[['IsNumeric']]() should throw error when data is string",{
  # Given
  validator <- Skewness.Validation()

  # Then
  '' |>
    validator[['IsNumeric']]() |>
      expect_error()
})
