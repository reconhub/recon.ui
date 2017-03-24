recon.ui::reconNavbarPage(
  "{{{ pkg_name }}}",
  tabPanel(
    "Data",
    dataimport$ui()
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
