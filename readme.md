---
title: "Shiny App-Presidents Documentation"
author: "Ondrej Svoboda"
date: "July 21, 2016"
output: html_document
---

This is an accompanying documentation to the Shiny app. 
It has three parts:

* Instructions
* Descriptions of the Applications
* How to Run

# Task Instructions
   
Write a shiny application with associated supporting documentation. The documentation should be thought of as whatever a user will need to get started using your application.
Deploy the application on Rstudio's shiny server
Share the application link by pasting it into the provided text box
Share your server.R and ui.R code on github

The application must include the following:

Some form of input (widget: textbox, radio button, checkbox, ...)
Some operation on the ui input in sever.R
Some reactive output displayed as a result of server calculations
You must also include enough documentation so that a novice user could use your application.
The documentation should be at the Shiny website itself. Do not post to an external link.

The Shiny application in question is entirely up to you. However, if you're having trouble coming up with ideas, you could start from the simple prediction algorithm done in class and build a new algorithm on one of the R datasets packages. Please make the package simple for the end user, so that they don't need a lot of your prerequisite knowledge to evaluate your application. You should emphasize a simple project given the short time frame.

# Descriptions of the App

The application uses R dataset "presidents" which gathers popularity data for American presidents from polls done between 1945 and 1974. The app allows a user to choose a president and it renders his photo together with the period when he was the most and the least popular. For each year considered, I take into account only one presidents. This means that if a president resigned or died in mid-term, I replace the data for the remaining of the year by NAs and thus do not take them into account.

# How to Run the App
Run the app directly from this link:

https://shiningsvobodnik86.shinyapps.io/App-Presidents/

Download server.R, ui.R and 5 jpg files and use the command 
library(shiny), 
runApp('App-Presidents')