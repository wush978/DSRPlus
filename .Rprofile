local({
  path <- file.path(".lib", R.version$platform, getRversion())
  Sys.setenv("R_LIBS_USER" = path)
  .libPaths(new = path)
  options(repos = c("CRAN" = "http://cran.csie.ntu.edu.tw"))
})
