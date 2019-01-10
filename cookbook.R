 '''Resources'''

# R Cheatsheet collection
# https://www.rstudio.com/resources/cheatsheets/

'''Basics'''

# Alt + Shift + K shows keyboard shortcuts

install.packages("tidyverse")                     # Install a package                     
library(tidyverse)                                # Load a package      
?ggplot()                                         # Get Help
x <- 3 * 4                                        # Object Assignment
function_name(arg1 = val1, arg2 = val2, ...)      # Call a function
View(flights)                                     # View a full dataset
?object                                           # Get help 

'''Data Manipulation'''

# Filtering
df <- filter(df, col1 == 1, col2 == 1)                  # Basic Filtering
df <- filter(df, is.na(col1), col2 != 1)                # NA syntax
df <- filter(df, col1 %in% c(1,2,3))                    # In syntax (c function combines values into a vector)

# Sorting
df <- arange(df, col1, col2, col3)                      # Sort rows based upon values
df <- arange(df, desc(col1))                            # Sort Descending

# Select columns
df <- select(df, col1, col2, col3)                      # Select named columns
df <- select(df, col1:col10)                            # Select columns between
df <- select(df, -(col1:col10))                         # Select columns except
df <- select(df, starts_with('col'))                    # Selct columns that start with ...
df <- select(df, ends_with('1'))                        # Selct columns that end with ...
df <- select(df, contains('col'))                       # Selct columns that contain ...
df <- select(df, matches("(.)\\1"))                     # Selct using a regex
df <- select(df, col1, col2, everything())              # Order columns with specified variables first

# Rename columns
df <- rename(df, col1 = col2)                           # Rename a columns

# Create columns (mutate)
mutate(df,
  new_col1 = col1 - col2,
  new_col2 = col1 + col2
)

# Create new columns + get rid of old ones
transmute(
  col1 = col1 - col2,
  col2 = col3 + col4
)

# Groupby / summarise
gp <- group_by(df, col1, col2, col3)
summarise(gp, delay = mean(col4, na.rm = TRUE))

# Pipes
flights %>% 
  group_by(year, month, day) %>% 
  summarise(mean = mean(dep_delay, na.rm = TRUE))


















# Syntax for ggplot:

ggplot(data = <DATA>) + 
  <GEOM_FUNCTION>(mapping = aes(<MAPPINGS>))

# Examples 

# Basic gg plot
ggplot(data = mpg) +                                            # Creates the plot
  geom_point(mapping = aes(x = displ, y = hwy, color = class))  # Adds x, y & color data
# Can also take args size, alpha, shape

# Manually setting params (outside aes function)
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy), color = "blue")