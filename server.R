#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

shinyServer(function(input, output,session) {
    
    observeEvent(input$mean, {
        req(input$mean,input$sd)
        updateSliderInput(session, "range", min=-4*input$sd+input$mean,max=4*input$sd+input$mean,step=0.25*input$sd)
    })
    
    observeEvent(input$sd, {
        req(input$mean,input$sd)
        updateSliderInput(session, "range", min=-4*input$sd+input$mean,max=4*input$sd+input$mean,step=0.25*input$sd)
    })
    
    
    observeEvent(input$mean, {
        
        req(input$mean,input$sd,input$range)
        
    output$graph <- renderPlot({
        req(input$mean,input$sd,input$range)
        min <- input$range[1]
        max <- input$range[2]
        mu <- input$mean
        sigma <- input$sd
        
        x <- seq(-4*sigma+mu,4*sigma+mu,length=1000)
        y <- dnorm(x,mu,sigma)
        
        
        plot(x,y,type="l",xlab="",ylab="",axes=FALSE,main=paste("Normal Distribution with Mean",mu,"and Standard Deviation",sigma))
        
        i <- x >= min & x <= max
        lines(x, y)
        polygon(c(min,x[i],max), c(0,y[i],0), col="blue")
        area <- round(pnorm(input$range[2],mu,sigma)-pnorm(input$range[1],mu,sigma),3)
        mtext(paste("The area under this normal distribution between", min, "and", max, "is",area),side=1,line=4,cex=1.25)
        axis(1, at=seq(-4*sigma+mu,4*sigma+mu,sigma), pos=0)
        
        })
    
    }
)
})
