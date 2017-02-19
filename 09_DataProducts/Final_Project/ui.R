#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(ggplot2)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Predict Orange Tree Growth"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
       sliderInput("dayToPred",
                   "Day to Predict Tree Circumference:",
                   min = 0,
                   max = 2000,
                   value = 0),
       checkboxInput("showModel1", "Show/Hide Tree 1 Line", value = TRUE),
       checkboxInput("showModel2", "Show/Hide Tree 2 Line", value = TRUE),
       checkboxInput("showModel3", "Show/Hide Tree 3 Line", value = TRUE),
       checkboxInput("showModel4", "Show/Hide Tree 4 Line", value = TRUE),
       checkboxInput("showModel5", "Show/Hide Tree 5 Line", value = TRUE),
       submitButton("Model Circumference and Update Plot")
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
       plotOutput("distPlot"),
       h5("Modeled Circumference for Tree 1:"),
       textOutput("pred1"),
       h5("Modeled Circumference for Tree 2:"),
       textOutput("pred2"),
       h5("Modeled Circumference for Tree 3:"),
       textOutput("pred3"),
       h5("Modeled Circumference for Tree 4:"),
       textOutput("pred4"),
       h5("Modeled Circumference for Tree 5:"),
       textOutput("pred5"),
       h3("Documentation"),
       p("This Shiny application takes data from the Orange data set in R
         and models the circumference (in mm) of 5 different orange trees
         (labeled by different colors) with the predictor age 
         (in the number of days since 1968/12/31) with linear
         regression. The user can specify the day at which to predict
         the circumference of each tree with the slide bar, and also
         whether to display the linear model for each of the trees.
         The data exists until about day 1600, but the model allows you
         to extrapolate to day 2000. This allows orange growers to
         predict how large the orange trees could get and could lead to
         harvesting the oranges in a timely way to optimize the quantity
         and/or quality of their oranges. One limitation of the linear
         model is that it does not capture possible saturation of the
         tree circumference. In other words, it is unlikely that the
         trees will continue to grow in size indefinitely. Therefore
         extrapolating the circumference too far into the future may not
         lead to reliable predictions in future tree circumference.")
    )
  )
))
