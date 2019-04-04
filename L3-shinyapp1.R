#---required!!!
require(shiny, quietly=T)

#---what's on the web page???
ui<-
  #---yeah I don't know about this.  Straight copying the help page, now
  fluidPage(
    #####INPUT
    #---numeric input!!
    numericInput(
      #---what variable does R call the input vale??
      "N",
      #---a prompt for the user
      "How many observations for a random normal distribution??",
      #---initial value!!
      25
    ),
    ####OUTPUT
    #---plot a graph!
    plotOutput(
      #---name of the plot object
      "histogram"
    )
    
  )

#---what's R doing in the background??
server<-
  #---best I can tell, this is ALWAYS the next line.  You're making a function with inputs and outputs.
  function(input, output){
    #---create the output histogram...
    output$histogram<-
      #---renderPlot...not 100% sure about this.
      renderPlot(
        #---create a histogram...
        hist(
          #---...of random normal data
          rnorm(
            #---with N values, where N is the input
            input$N
          )
        )
      )
    
  }


shinyApp(ui,server)