library(shiny)

shinyUI(fluidPage(
  
  titlePanel('Weibull Survival Distributions'),
  
  sidebarLayout(
    sidebarPanel(
      
                           sliderInput('norm_mean', 'Shape:', min=0.1, max=5, value=0, step=0.1),
                           sliderInput('norm_sd', 'Scale:', min=0.1, max=5, value=1, step=0.1)
                  )
      
    ,
    
    mainPanel(
      textOutput('header'),
      
      plotOutput('pdf', width='500px', height='250px'),
      plotOutput('cdf', width='500px', height='250px'),
      plotOutput('survival', width='500px', height='250px'),
      plotOutput('hazard', width='500px', height='250px')   
    )
  )
  
))
