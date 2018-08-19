library(shiny)
library(ggplot2)


shinyServer(function(input, output) {

  output$pdf <- renderPlot({
    dat <-data.frame(x=seq(0, 5, length=200),
                                        y=dweibull(seq(0, 5, length=200), input$norm_mean, input$norm_sd)
    )
    
    ggplot(dat, aes(x, y)) + geom_line(size=1.2) + theme_bw() + xlab('x') + ylab('') + ggtitle('Probability Density Function') 
  })
  
  
  output$cdf <- renderPlot({
    dat <- data.frame(x=seq(0, 5, length=200),
                                        y=pweibull(seq(0, 5, length=200), input$norm_mean, input$norm_sd)
    )
    
    ggplot(dat, aes(x, y)) + geom_line(size=1.2) + theme_bw() + xlab('x') + ylab('') + ggtitle('Cumulative Distibution Function') 
  })
  
  output$survival <- renderPlot({
   dat <- data.frame(x=seq(0, 5, length=200),
                                         y=1 - pweibull(seq(0, 5, length=200), input$norm_mean, input$norm_sd)
    )
    
    ggplot(dat, aes(x, y)) + geom_line(size=1.2) + theme_bw() + xlab('x') + ylab('') + ggtitle('Survival Function') 
  })  

  output$hazard <- renderPlot({
    dat <- data.frame(x=seq(0, 5, length=200),
                      y=dweibull(seq(0, 5, length=200), input$norm_mean, input$norm_sd) / (1 - pweibull(seq(0, 5, length=200), input$norm_mean, input$norm_sd)
    ))
    
    ggplot(dat, aes(x, y)) + geom_line(size=1.2) + theme_bw() + xlab('x') + ylab('') + ggtitle('Hazard Function') 
  })  
  
})