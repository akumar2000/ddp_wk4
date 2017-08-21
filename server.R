#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(datasets)

shinyServer(function(input, output) {
        
        col <- reactive({
                input$select 
        })
        
        
        formula <- reactive({
                paste("mpg ~", input$select)
        })
        
        mf <- reactive({
                lm(as.formula(formula()), data = mtcars)
        })
        
        equation <- reactive({    
                coeffs = coefficients(mf())
                conc = "+"
                if (coeffs[2] < 0){
                        conc = ""
                }
                
                paste(round(coeffs[1], digits = 2), conc , round(coeffs[2], digits = 2) , "*" , col() , sep = " ")
        })
        
        output$rsquared <- renderText({ 
                paste("R-squared: ", round(summary(mf())$r.squared,digits =2), sep = " ")
        })
        
        output$equation <- renderText({ 
                paste("Equation: ", equation(), sep = " ")
        })  
        
        output$plot <- renderPlot({ 
                plot(as.formula(formula()), 
                     data = mtcars, ylab="MPG", xlab=col(), col="blue")
                abline(mf())
        })
        
        output$plot_resid <- renderPlot({ 
                resid = resid(mf())
                plot(resid ~ mtcars$mpg, ylab="Residuals", xlab="MPG",col="darkgreen")
                abline(0, 0)
        })
        
        
})
