'''Basics'''

# Install a package
install.packages("tidyverse")
# Load a package                           
library(tidyverse)
# Get Help
?ggplot()                                   


'''Plotting'''

# Basic gg plot
ggplot(data = mpg) +                                            # Creates the plot
  geom_point(mapping = aes(x = displ, y = hwy, color = class))  # Adds x, y & color data
# Can also take args size, alpha, shape

# Manually setting params (outside aes function)
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy), color = "blue")

