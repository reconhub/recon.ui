#' @export
use_template_app <- function(pkg_name = "mypackage") {
  path <- file.path(getwd(), "shiny")
  dir.create(path, showWarnings = FALSE, recursive = TRUE)

  data <- list(
    pkg_name = pkg_name
  )
  template_path <- system.file("templates", "shinyapp", package = "recon.ui",
                               mustWork = TRUE)
  template_files <- list.files(template_path, full.names = TRUE)
  lapply(template_files, function(file) {
    template_out <- whisker::whisker.render(readLines(file), data)
    file_out <- file.path(path, basename(file))
    writeLines(template_out, file_out)
  })

  message("Created shiny app template at ", path)
}
