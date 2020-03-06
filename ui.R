#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(

    # Application title
    titlePanel("Normal Distribution Calculator"),

    headerPanel(h4("This app will compute the area under a normal curve between two specified values.")),
    
    sidebarLayout(
        sidebarPanel(
            
            numericInput("mean","Enter the mean value for your normal distribution:",value=0),
            
            numericInput("sd","Enter the standard deviation for your normal distribution:",value=1,min=1),
            
            sliderInput("range","Select your desired range of values:",min=-4,max=4,value=c(-1,1),step=0.25),                                                                      
            
        ),
            # Show a plot of the generated distribution
        mainPanel(
            
            plotOutput("graph")
        )
    )
))
