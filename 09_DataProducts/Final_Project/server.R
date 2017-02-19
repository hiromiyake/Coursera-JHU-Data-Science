#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(ggplot2)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  
  model1 = lm(circumference ~ age, data = subset(Orange, Tree == 1))
  model2 = lm(circumference ~ age, data = subset(Orange, Tree == 2))
  model3 = lm(circumference ~ age, data = subset(Orange, Tree == 3))
  model4 = lm(circumference ~ age, data = subset(Orange, Tree == 4))
  model5 = lm(circumference ~ age, data = subset(Orange, Tree == 5))
  
  
  
  model1pred <- reactive({
    dayToPred = input$dayToPred
    predict(model1, newdata = data.frame(age = dayToPred))
  })
  model2pred <- reactive({
    dayToPred = input$dayToPred
    predict(model2, newdata = data.frame(age = dayToPred))
  })
  model3pred <- reactive({
    dayToPred = input$dayToPred
    predict(model3, newdata = data.frame(age = dayToPred))
  })
  model4pred <- reactive({
    dayToPred = input$dayToPred
    predict(model4, newdata = data.frame(age = dayToPred))
  })
  model5pred <- reactive({
    dayToPred = input$dayToPred
    predict(model5, newdata = data.frame(age = dayToPred))
  })
  
  output$pred1 <- renderText({
    model1pred()
  })
  output$pred2 <- renderText({
    model2pred()
  })
  output$pred3 <- renderText({
    model3pred()
  })
  output$pred4 <- renderText({
    model4pred()
  })
  output$pred5 <- renderText({
    model5pred()
  })
   
  output$distPlot <- renderPlot({
    
    # generate bins based on input$bins from ui.R
    #x    <- faithful[, 2] 
    #bins <- seq(min(x), max(x), length.out = input$bins + 1)
    
    # draw the histogram with the specified number of bins
    #hist(x, breaks = bins, col = 'darkgray', border = 'white')
    
    g = qplot(Orange$age,Orange$circumference, color = Orange$Tree)
    g2 = g + geom_point(size = 5) + 
      labs(x="Day (since 1968/12/31)",y="Circumference (mm)") + 
      theme(axis.title = element_text(size=22)) +
      theme(text = element_text(size=20)) +
      scale_colour_discrete(name="Tree", breaks=c("1","2","3","4","5"))
    if(input$showModel1) {
      gm1 = geom_abline(intercept = model1$coefficients[1], slope = model1$coefficients[2], colour = "darkgreen")
    }
    else {
      gm1 = geom_blank()
    }
    if(input$showModel2) {
      gm2 = geom_abline(intercept = model2$coefficients[1], slope = model2$coefficients[2], colour = "blue")
    }
    else {
      gm2 = geom_blank()
    }
    if(input$showModel3) {
      gm3 = geom_abline(intercept = model3$coefficients[1], slope = model3$coefficients[2], colour = "orange")
    }
    else {
      gm3 = geom_blank()
    }
    if(input$showModel4) {
      gm4 = geom_abline(intercept = model4$coefficients[1], slope = model4$coefficients[2], colour = "purple")
    }
    else {
      gm4 = geom_blank()
    }
    if(input$showModel5) {
      gm5 = geom_abline(intercept = model5$coefficients[1], slope = model5$coefficients[2], colour = "green")
    }
    else {
      gm5 = geom_blank()
    }
    gvl = geom_vline(xintercept = input$dayToPred, size = 2)

    g2 + gm1 + gm2 + gm3 + gm4 + gm5 + gvl
    
  })
  
})
