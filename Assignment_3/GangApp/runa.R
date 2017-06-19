getwd()
setwd("C:\\Users\\gang.ping.m.zhu\\Documents\\Stevens\\FE513\\HW\\Assignment_3")
library(shiny)

# 1.1. show application by folder name
runApp("GangApp")

# # 1.2. show page with source code
# runApp("cocoApp", display.mode = "showcase")
# 
# 
# # 2. use rsconnect to upload app on rshiny online server (free)
# # My app is published on https://fe513test.shinyapps.io/cocoapp/
# # You need to sign up on the website http://www.shinyapps.io/
# # Login and get the token (put in setAccountInfo)
# # Deploy the app
# # Please note: all files you used should be uploaded, and use relative path inside the app. 
# # All used packages should be loaded in the script using library()
# install.packages("rsconnect")
# 
# #set authentication from your account in shinyapp.io
# rsconnect::setAccountInfo(name='xx',
#                           token='xx',
#                           secret='xx')
# 
# #upload your app. After that, your app will be online automatically
# rsconnect::deployApp("C:\\Users\\xzhu\\Dropbox\\Course\\FE513\\L10 - rShiny\\cocoApp",
#                      server = "shinyapps.io", account ="fe513test")


# 3. Introduce a new package - ggvis for interactive plot, which can be used in shinyApp
# ggvis has similar idea as ggplot.
# library(ggvis)
# d <- diamonds[sample(nrow(diamonds), 1000), ]
# pBasic <- ggvis(d, x = ~carat, y = ~price)
# layer_points(pBasic)
# 
# # To combine 3 command together
# d %>%
#   ggvis(x = ~carat, y = ~price, fill = ~clarity) %>%
#   layer_points()
# 
# # If you only want to change the color, you should use := instead of =. 
# # = indicates "category". 
# d %>%
#   ggvis(x = ~carat, y = ~price, fill := "blue") %>%
#   layer_points()
# 
# # Plot with interactive controller on size and opacity.
# d %>% 
#   ggvis(x = ~carat, y = ~price, 
#         size := input_slider(10, 100),
#         opacity := input_slider(0, 1)
#   ) %>% 
#   layer_points()
