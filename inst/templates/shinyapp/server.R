function(input, output, session) {
  main_data <- dataimport$server()

  output$session_info <- renderPrint({
    sessionInfo()
  })

  output$plot <- renderPlot({
    # Your plot goes here
    # plot(main_data())
  })
}
