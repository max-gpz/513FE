#Step 1: load packages
library(plotly)
library(ggvis)
library(shinythemes)

#UI define the layout and format of whole web interface
shinyUI(
  fluidPage(
    
    # Use the theme in shinythemes package
    theme = shinytheme("united"),
    # import .css file (external file)
    # You need to put the css file into www folder
    #theme = "style.css",
  
    ########### Set header ##########
    # Application title
    headerPanel("FE513 (Name: Assignment 3 App)"),
  
    ########### Set sidebar ##########
    # Sidebar with a slider input for number of observations
    sidebarPanel(
      # Input option for colors on wordclod
      checkboxInput("Colorinp2", "wordcloud color?", FALSE),

      # Define a input numeric block with default value = 2, each word cloud can have a different frequency
      numericInput("Ninp2", "Wordcloud min frequency", 2),
      
      numericInput("Ninp2.1", "Wordcloud min frequency", 2),
      
      numericInput("Ninp2.2", "Wordcloud min frequency", 2)
      
    ),
  
    ########### Set mainpanel ##########
    # Show a plot of the generated distribution
    mainPanel(
      h3("The widget on the side panel controls the word clouds. This page loads slowly due to the processing of words in the database."),

      
      tabsetPanel(
#        tabPanel("1.Random Line", code("data <- rnorm(N)"),plotOutput("pout11"), plotOutput("pout12")),
        tabPanel("E1.SQL and Names", textOutput("printsql1"), p("\n"), textOutput("printsql2"), p("\n"), textOutput("randomusers")),
        tabPanel("E1.Wordcloud", plotOutput("pout2")), 
        tabPanel("E2.Summary", textOutput("summaryu1"), p("\n"), textOutput("summaryu2"), p("\n"), textOutput("summaryu3"), p("\n"), tableOutput("tout3")),
        tabPanel("E2.Results", h3("The information below is the size of the clusters."), textOutput("kmeans"), p("\n"), h3("The information below indicates variance between clusters, within clusters, and of clusters."), textOutput("kbet"), p("\n"), textOutput("ktotss"), p("\n"), textOutput("kwith"), p("\n"), textOutput("ktotwith"), p("\n"), textOutput("Hclust"), p("\n"), plotOutput("Hplot")),
        tabPanel("E2.Compare", h3("The table below is for K means."), p("\n"), tableOutput("ktable"), p("\n"), h3("The table below is for Hierarchical Clustering."), p("\n"), tableOutput("htable"))
      )
      

    )
  )
)
