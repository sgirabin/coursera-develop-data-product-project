
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

shinyUI(
    
    # Use a fluid Bootstrap layout
    fluidPage(    
        
        # Give the page a title
        titlePanel("Internet and Mobile Penetration Trend in ASEAN Countries"),
        
        # Generate a row with a sidebar
        sidebarLayout(      
            
            # Define the sidebar with two input
            sidebarPanel(
                

                helpText("Data from ", a("World Bank.", href = "http://databank.worldbank.org/data/home.aspx")),
                selectInput("dataType","Penetration Type:", choices=list("Internet","Mobile"), selected="Internet"),
                selectInput("country", "Countries:", 
                            choices=list("Singapore", "Thailand" , "Malaysia", "Indonesia", "Philippines","Vietnam", "Myanmar", "Cambodia"), selected = "Singapore"),                                
                hr(),
                
                #Documentation
                h4("Tutorial:"),
                h5("1. Please select the data Penetration type"),
                h5("2. Please select the country"),
                h5("3.The graph and table will be automatically plotted based on the selection"),
                br(),
                br()
                
            ),
            
            # Create a spot for the barplot
            mainPanel(
                plotOutput("chart"),
                
                tableOutput(outputId="table"),
                h6("Number shown are per 100 people")
                
            )
            
        )
    )
)
