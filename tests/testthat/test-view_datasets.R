# ColombiAPI - Access Colombia's Public Data via API Colombia
# Version 0.1.0
# Copyright (C) 2025 Renzo Caceres Rossi
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <https://www.gnu.org/licenses/>.

# view_datasets() function

library(testthat)
library(ColombiAPI)

test_that("view_datasets works when package is loaded", {
  result <- view_datasets()
  expect_type(result, "character")
  expect_true(length(result) > 0)
})

test_that("view_datasets prints correct message", {
  output <- capture_messages(view_datasets())
  expect_match(
    output[1],
    "Datasets available in the 'ColombiAPI' package:",
    fixed = TRUE
  )
})

test_that("view_datasets returns expected datasets", {
  datasets <- view_datasets()
  expected_datasets <- c(
    "Bogota_airstations_df",
    "Bogota_business_Date",
    "Bogota_holidays_Date",
    "Bogota_malls_tbl_df",
    "Cannabis_Licenses_tbl_df",
    "Colombia_coffee_tbl_df",
    "Medellin_rain_tbl_df",
    "Tulua_Public_Schools_tbl_df"
  )
  # Check if all expected datasets are present
  missing_datasets <- setdiff(expected_datasets, datasets)
  expect_true(
    length(missing_datasets) == 0,
    info = paste("Missing datasets:", paste(missing_datasets, collapse = ", "))
  )
})
