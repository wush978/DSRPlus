
init_env <- function() {
  install.packages('remotes')
  remotes::install_github('wush978/pvm@dev/exclude-recommended')
}

main <- function(course, lesson) {
  print(sprintf("course: %s lesson: %s", course, lesson))
}

if (!interactive()) {
  argv <- commandArgs(TRUE)
  course <- argv[1]
  lesson <- argv[2]
  main(course, lesson)
}
