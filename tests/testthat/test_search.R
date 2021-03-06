test_that("nhanes_search works", {
  skip_on_cran()

  destination = tempdir()

  vars <- nhanes_variables(destination = destination)
  files <- nhanes_data_files(destination = destination)


  test_that("nhanes_search on variables passes spot check", {
    results <- nhanes_search(vars, "mono-ethyl")

    expect_equal(results$variable_name, c("URXMEP", "URDMEPLC", "URXMEP", "URDMEPLC", "URXMEP", "URDMEPLC", "URXMEP", "URDMEPLC", "URXMEP", "URDMEPLC", "URXMEP", "URXMEP"))
    expect_equal(results$begin_year, c(2003, 2003, 2005, 2005, 2007, 2007, 2009, 2009, 2011, 2011, 2001, 1999))
  })

  test_that("nhanes_search on files passes spot check", {
    results <- nhanes_search(files, "Polyfluoroalkyl")

    expect_equal(results$data_file_name, c("SSPFAS_H", "PFAS_H", "L24PFC_C", "PFC_D", "PFC_E", "PFC_F", "PFC_G", "PFC_POOL"))
    expect_equal(results$cycle, c("2013-2014", "2013-2014", "2003-2004", "2005-2006", "2007-2008", "2009-2010", "2011-2012", "2001-2002"))
  })

  test_that("fuzzy search works on variables", {
    results <- nhanes_search(vars, "Perfluorooctanoic", fuzzy = TRUE, cycle == "2003-2004")

    expect_equal(nrow(results), 17)
  })

  test_that("fuzzy search works on files", {
    results <- nhanes_search(files, "fluoro", fuzzy = TRUE)

    expect_equal(nrow(results), 14)
    expect_equal(results$data_file_name, c("SSANA_A", "SSANA_B", "SSANA_C", "FLDEP_H", "FLDEW_H", "SSPFAS_H", "PFAS_H", "SSPFC_A", "L24PFC_C", "PFC_D", "PFC_E", "PFC_F", "PFC_G", "PFC_POOL"))
  })
})
