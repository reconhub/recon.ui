#' @export
reconNavbarPage <- function(title, ...) {
  np <- shiny::navbarPage(title, theme = "/recon.ui/css/style.css", ...)
  nav_element <- np[[3]][[1]]
  old_class <- htmltools::tagGetAttribute(nav_element, "class")
  np[[3]][[1]] <- htmltools::tagAppendAttributes(np[[3]][[1]],
                                                 class = "navbar-custom")

  logo <- htmltools::tags$ul(
    htmltools::tags$img(src = "recon.ui/img/logo.png"),
    class = "navbar-right recon-navbar-logo"
  )
  np[[3]][[1]]$children[[1]] <- htmltools::tagAppendChild(np[[3]][[1]]$children[[1]], logo)
  np
}
