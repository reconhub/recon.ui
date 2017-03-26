recon.ui::reconNavbarPage(
  "{{{ pkg_name }}}",

  tabPanel(
    "Data",

    # Data import module
    dataimport$ui(),
    br(),

    # Column (variable) mappin module
    uiOutput("mapcolumns_output")
  ),

  tabPanel(
    "Analysis",

    # --- Analysis UI goes here

    actionButton("analyze", "Analyze"),
    plotOutput("plot")
  ),

  tabPanel(
    "Help",

    includeMarkdown("help.md")
  ),

  tabPanel(
    "Session info",

    verbatimTextOutput("session_info")
  )
)
