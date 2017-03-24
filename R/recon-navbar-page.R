#' @export
reconNavbarPage <- function(title, ...) {
  css_path <- system.file("www/css/style.css", package = "recon.ui")
  np <- navbarPage(title, theme = css_path, ...)
  np[[1]] <- htmltools::tagAppendChild(np[[1]], shiny::includeCSS(css_path))
  nav_element <- np[[3]][[1]]
  old_class <- htmltools::tagGetAttribute(nav_element, "class")
  np[[3]][[1]] <- htmltools::tagAppendAttributes(nav_element,
                                                 class = "navbar-custom")
  np
}
