library(shiny)

dataimport <- shinyHelpers::dataimportModule(
  id = "dataimport",
  fileExt = c("csv", "txt", "xlsx", "ods"),
  sampleDataPackage = "outbreaks"
)
