
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)
library(dplyr)

shinyServer(function(input, output, session) {
    

    
    output$chart <- renderPlot({
        if("Internet" == input$dataType) {
            dataplot <- subset(internetmelt, countries == input$country)
            dataplot <- dataplot[order(as.integer(dataplot$year), decreasing=FALSE),]
            dataplot <- dataplot[,c("year", "countriesInternet")]
            
            barplot(dataplot$countriesInternet,
                  names.arg=dataplot$year,
                  main=paste("Internet Penetration Trend in",input$country),
                  ylab="Total Adoption (per 100 people)",
                  xlab="Year")          
            
        }
        else {
            dataplot <- subset(mobilemelt, countries == input$country)
            dataplot <- dataplot[order(as.integer(dataplot$year), decreasing=FALSE),]
            dataplot <- dataplot[,c("year", "countriesMobile")]
            
            barplot(dataplot[,"countriesMobile"],
                    names.arg=dataplot[,"year"],
                    main=paste("Mobile Penetration Trend in",input$country),
                    ylab="Total Adoption (per 100 people)",
                    xlab="Year")            
        }
        
    })      
    
    
    output$table <- renderTable({
        output <- dataset[dataset$countries == input$country, ]
        
        if (input$dataType == "Internet"){
            output <- output[,  c("year", "countriesInternet", "averageInternet")]
            colnames(output) <- c("Year", "Internet Penetration", "Other ASEAN Countries")            
        }
        
        if (input$dataType == "Mobile") {
            output <- output[,  c("year", "countriesMobile", "averageMobile")]
            colnames(output) <- c("Year", "Mobile Penetration", "Other ASEAN Countries")            
        }
        
        output
    })    
    
})
