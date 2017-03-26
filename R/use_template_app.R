#' Use a Shiny app template for the current package
#'
#' Generate a skeleton Shiny app for the current package. This function must be
#' called from the root directory of an R package.
#' @param path The path where the Shiny app will be created
#' @param overwrite set to \code{TRUE} if you want to force the Shiny app to
#' overwrite any existing Shiny apps in the given \code{path}
#' @export
use_template_app <- function(path = "inst/shiny", overwrite = FALSE) {

  pkg_name <- get_package_name()
  if (is.null(pkg_name)) {
    stop("'use_template_app' can only be called from the root directory of an R package.", call. = FALSE)
  }

  path <- file.path(getwd(), path)
  if (dir.exists(path)) {
    if (!overwrite) {
      stop("The directory '", path, "' already exists. Either choose a different path for the shiny app, or use the 'overwrite = TRUE' argument.", call. = FALSE)
    }
  }
  unlink(path, recursive = TRUE, force = TRUE)
  dir.create(path, showWarnings = FALSE, recursive = TRUE)
  path <- normalizePath(path)

  # Copy all the template files and render them using whisker templates
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

  if (file.exists("README.md")) {
    file.copy("README.md", file.path(path, "help.md"), overwrite = TRUE)
  }

  message("Created shiny app at\n", path)
  invisible(NULL)
}

get_package_name <- function() {
  if (!file.exists("DESCRIPTION")) {
    return(NULL)
  }

  lines <- readLines("DESCRIPTION")
  regex <- "^Package: (.*)"
  pkg_line <- which(grepl(regex, lines))
  if (length(pkg_line) == 0) {
    return(NULL)
  }

  pkg_line <- pkg_line[1]
  pkg_name <- sub(regex, "\\1", lines[pkg_line])
  pkg_name
}
