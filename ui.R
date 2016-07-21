
library(markdown)

shinyUI(navbarPage("Popularity of American Presidents",
                   tabPanel("Application",
                            fluidPage(
                                    fluidRow(
                                        column(3,
                                               selectInput("selectPres", label = h3("Select American President"), 
                                                           choices = list("Harry S. Truman",
                                                                          "Dwight D. Eisenhower",
                                                                          "John F. Kennedy",
                                                                          "Lyndon B. Johnson",
                                                                          "Richard Nixon"), selected = "Harry S. Truman")),
                                        column(3,
                                               radioButtons("radio", label = h3("Popularity criterion"),
                                                            choices = list("Most Popular" = 1, "Least Popular" = 2),selected = 1))
                                            ),
                                    fluidRow(
                                        textOutput("text2")
                                    ),
                                    fluidRow(
                                        imageOutput("photo")
                                    )
                                )),
                   tabPanel("About",
                            htmlOutput("documentation")
                   )
                   
))

