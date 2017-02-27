# GGvis
#  Ggvis is data visualization for R which enables us to describe data graphics with a syntax similar to ggplot2.
#It enables to view and interact with the graphics on our local computer.

mtcars %>% ggvis(x= ~wt) %>%
  
  layer_densities (
    stroke := input_radiobuttons(c("Purple","Orange","steelblue"), label="Line color"),
    fill := input_select(c("Purple","Orange","steelblue"), label="Fill color")
  )

library(ggvis)
mtcars %>% ggvis(x = ~wt) %>%
  
  layer_densities (
    
    adjust = input_slider(.1, 2, value = 1, step = .1, label = "Bandwidth adjustment"),
    kernel = input_select (
      c("Gaussian" = "gaussian",
        "Epanechnikov" = "epanechnikov",
        "Rectangular" = "rectangular",
        "Triangular" = "triangular",
        "Biweight" = "biweight",
        "Cosine" = "cosine",
        "Optcosine" = "optcosine"),
      
      label = "Kernel")
  )