function(input, output, session) {

  # The dataset the user chooses from the data import module
  main_data <- dataimport$server()

  output$session_info <- renderPrint({
    sessionInfo()
  })

  # Dynamically generate the module for remapping variables
  mapcolumns_module <- reactive({
    data <- main_data()
    shinyHelpers::mapcolumnsModule(
      id = "mapcolumns",
      data = data,
      names = c("dob", "name"),
      multiple = c(FALSE, FALSE),
      labels = c("Choose the variable denoting the date of birth",
                 "Choose the variable corresponding to the patient's name")
    )
  })
  output$mapcolumns_output <- renderUI({
    mapcolumns_module()$ui()
  })
  mapcolumns <- reactive({ mapcolumns_module()$server() })

  output$plot <- renderPlot({

    # Generate the plot when the user clicks on the Analyze button
    if (input$analyze == 0) return()

    # You can access the mapped variables as reactive variables
    isolate({
      plot(rnorm(100), xlab = mapcolumns()$dob(), ylab = mapcolumns()$name())
    })
  })
}
