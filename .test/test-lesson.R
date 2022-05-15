
init_env <- function() {
  options(repos = c(CRAN = 'https://cran.csie.ntu.edu.tw'))
  install.packages('remotes')
  remotes::install_github('wush978/pvm@dev/exclude-recommended')
  pvm::import.packages(file = "/var/DSRPlus/pvm.yml")
  swirl::install_course_directory("/var/DSRPlus")
}

main <- function(course, lesson) {
  init_env()
  print(sprintf("course: %s lesson: %s", course, lesson))
}

if (!interactive()) {
  argv <- commandArgs(TRUE)
  course <- argv[1]
  lesson <- argv[2]
  main(course, lesson)
}
