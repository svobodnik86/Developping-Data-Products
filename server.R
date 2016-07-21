library(shiny)

# preprocessing of data
data("presidents")
presidentNames <-c("Harry S. Truman","Harry S. Truman","Harry S. Truman","Harry S. Truman","Harry S. Truman","Harry S. Truman","Harry S. Truman","Harry S. Truman","Dwight D. Eisenhower","Dwight D. Eisenhower","Dwight D. Eisenhower","Dwight D. Eisenhower","Dwight D. Eisenhower","Dwight D. Eisenhower","Dwight D. Eisenhower","Dwight D. Eisenhower","John F. Kennedy","John F. Kennedy","John F. Kennedy","Lyndon B. Johnson","Lyndon B. Johnson","Lyndon B. Johnson","Lyndon B. Johnson","Lyndon B. Johnson","Richard Nixon","Richard Nixon","Richard Nixon","Richard Nixon","Richard Nixon","Richard Nixon")

Q1<-c()
Q2<-c()
Q3<-c()
Q4<-c()
year<-c()
year=1945
for(i in 1:30){
    year[i]<-1945+i-1
    Q1[i]<-presidents[i]
    Q2[i]<-presidents[i+1]
    Q3[i]<-presidents[i+2]
    Q4[i]<-presidents[i+3]
    
}

presidentsDF <- data.frame(year,Q1,Q2,Q3,Q4, presidentNames,row.names = NULL)

# check whether NAs are reported for quarters after president change (see Roosevelt, Kennedy, Nixon)
# 1st QT 1945 NA, 3rd and 4th QTs 1974
presidentsDF$Q3[30]<-NA
presidentsDF$Q4[30]<-NA


# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  
  output$text2 <- renderText({
      radio <- input$radio
      presidentElect <- input$selectPres
      if (radio==1){
          paste(" President", input$selectPres, "reached the highest approval of", calculateApproval(presidentElect), 
                "% of American people in ", calculateMinMaxPeriod(presidentElect), ".")
      }else{
          paste(" President", input$selectPres, "reached the lowest approval of", calculateApproval(presidentElect), 
                "% of American people in ", calculateMinMaxPeriod(presidentElect), ".")
      }
          
          })
  
  output$photo <- renderImage({
      filename <- paste((input$selectPres), ".jpg",sep='')
      list(src = filename,contentType = 'image/jpg',
           height = 300)
      
  }, deleteFile = FALSE)
  
  #output$documentation <- renderMarkdown(file = "App-Presidents/readme.md")
  output$documentation <- renderText({  
      readLines("readme.html")  
  })
  
  calculateApproval <- function(president){
      if (input$radio == 1){
        max(presidentsDF[presidentsDF$presidentNames==input$selectPres,2:5], na.rm=TRUE)}
      else {
        min(presidentsDF[presidentsDF$presidentNames==input$selectPres,2:5], na.rm=TRUE) 
      }
  }
  
  calculateMinMaxPeriod <- function(president){
      minmax <- c()
      extreme <- calculateApproval(president)
      electionYear <- min(presidentsDF[presidentsDF$presidentNames==president,1])
      lastYear <- max(presidentsDF[presidentsDF$presidentNames==president,1])
      for (year in electionYear:lastYear){
          for (i in 2:5){
              maxVal <- presidentsDF[presidentsDF$year==year,i]
              if (!is.na(maxVal)){
                  if (maxVal == extreme){
                      if (length(minmax)==0){
                          minmax <- paste(names(presidentsDF[i]), "of" , year)
                      }else {
                          minmax <- c(paste(minmax,"and", names(presidentsDF[i]), "of" , year))
                      }
                  }
              }
          }
      }
      minmax
  }

})
