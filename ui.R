#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for miles per gallon application
shinyUI(pageWithSidebar(
        
        # Application title
        headerPanel("Linear Regression Application"),
        
        # Sidebar with controls to select the variable to plot against mpg
        # and to specify whether outliers should be included
        sidebarPanel( 
                h4("1. Select Variable to conduct linear regression analyses for the predicted variable mpg."),
                h4("2. The fitted curve ('selected variable' vs. mpg) is plotted on the right hand side and the equation for the linear regression is displayed"),
                h4("3. The r-squared value and he residual plot are provided to select the most suitable variable for the linear regression"),
                selectInput("select", "Variable:",
                            list("Horse Power" = "hp", 
                                 "Weight" = "wt", 
                                 "Cylinders" = "cyl", 
                                 "Displacement" = "disp", 
                                 "Gears" = "gear",
                                 "1/4 mile time" = "qsec"))
        ),
        
        # Show the caption and plot of the requested variable against mpg
        mainPanel(
                h4("Source code: https://github.com/jensschum/ddp_week4"),
                h4("Presentation: http://rpubs.com/schujen/dpp_week4"),
                br(),
                h4("Linear Regression Plot"),
                plotOutput("plot"),
                h4(textOutput("equation")),
                h4(textOutput("rsquared")),
                br(),
                h4("Residual Plot"),
                plotOutput("plot_resid")
        )
))