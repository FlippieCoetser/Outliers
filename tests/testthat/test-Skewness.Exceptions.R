test_that('Skewness.Exceptions exist',{
  Skewness.Exceptions |>
    is.null()      |>
      expect_equal(FALSE)
})
test_that('Skewness.Exceptions returns list of exceptions',{
  Skewness.Exceptions() |>
    is.list()        |>
      expect_equal(TRUE)
})

# Null Exception
test_that("exception instance has NullException",{
  # Given
  exception <- Skewness.Exceptions()

  # Then
  exception[['NullException']]  |>
    is.null()              |>
      expect_equal(FALSE)
})
test_that("FALSE |> exception[['NullException']]() throw no exception",{
  # Given
  exception <- Skewness.Exceptions()

  # Then
  FALSE |>
    exception[['NullException']]() |>
      expect_no_error()
})
test_that("TRUE |> exception[['NullException']]() throw NULL exception",{
  # Given
  exception <- Skewness.Exceptions()

  # Then
  TRUE |>
    exception[['NullException']]() |>
      expect_error('argument is NULL')
})

# Numeric Exception
test_that("exception instance has numeric exception",{
  # Given
  exception <- Skewness.Exceptions()

  # Then
  exception[['NumericException']]  |>
    is.null()              |>
      expect_equal(FALSE)
})
test_that("FALSE |> exception[['NumericException']]() throw no exception",{
  # Given
  exception <- Skewness.Exceptions()

  # Then
  FALSE |>
    exception[['NumericException']]() |>
      expect_no_error()
})
test_that("TRUE |> exception[['NumericException']]() throw numeric exception",{
  # Given
  exception <- Skewness.Exceptions()

  # Then
  TRUE |>
    exception[['NumericException']]() |>
      expect_error('argument is not numeric')
})
