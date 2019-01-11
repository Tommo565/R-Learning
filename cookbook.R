'''Resources'''

# R for Data Science
https://r4ds.had.co.nz/

# R Cheatsheet collection
https://www.rstudio.com/resources/cheatsheets/

'''Basics'''

Alt + Shift + K shows keyboard shortcuts
Cmd + Ctrl + Enter runs everything after the cursor
Cmd + Shift + S runs the whole script

install.packages("tidyverse")               # Install a package                     
library(tidyverse)                          # Load a package      
?ggplot()                                   # Get Help
x <- 3 * 4                                  # Object Assignment
function_name(arg1 = val1, arg2 = val2)     # Call a function
View(flights)                               # View a full dataset
?object                                     # Get help 
print()                                     # Prints to the console
getwd()                                     # Get working directory
setwd("/path/to/my/CoolProject")            # Set Working directory
problems(x)                                 # Show problem data in a tibble

# Function syntaxå
rescale01 <- function(x) {
  rng <- range(x, na.rm = TRUE)
  (x - rng[1]) / (rng[2] - rng[1])
}

'''Data Manipulation'''

# Filtering
df <- filter(df, col1 == 1, col2 == 1)      # Basic Filtering
df <- filter(df, is.na(col1), col2 != 1)    # NA syntax
df <- filter(df, col1 %in% c(1,2,3))        # In syntax (c function combines values into a vector)

# Sorting
df <- arange(df, col1, col2, col3)          # Sort rows based upon values
df <- arange(df, desc(col1))                # Sort Descending

# Columns
colnames(df)

# Select columns
df <- select(df, col1, col2, col3)          # Select named columns
df <- select(df, col1:col10)                # Select columns between
df <- select(df, -(col1:col10))             # Select columns except
df <- select(df, starts_with('col'))        # Selct columns that start with ...
df <- select(df, ends_with('1'))            # Selct columns that end with ...
df <- select(df, contains('col'))           # Selct columns that contain ...
df <- select(df, matches("(.)\\1"))         # Selct using a regex
df <- select(df, col1, col2, everything())  # Order columns with specified variables first

# Rename columns
df <- rename(df, col1 = col2)               # Rename a columns

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



# Tibbles & Parsing

as_tibble(df)                               # Coerce a df to a tibble

# Create a tibble
tb <- tibble(
  `:)` = "smile", 
  ` ` = "space",
  `2000` = "number"
)

# Create a tibble using a tribble                                          
tribble(
  ~x, ~y, ~z,
  #--|--|----
  "a", 2, 3.6,
  "b", 1, 8.5
)
c("TRUE", "FALSE")                              # Convert values to a vector / list
df <- class(as.data.frame(tb))                  # Convert a tibble to a dataframe
df <- read_csv("data/file.csv")                 # Read in a csv to a tibble
str(parse_logical(c("TRUE", "FALSE", "NA")))    # Parse logical values
str(parse_integer(c("1", "2", "3")))            # Parse integers
str(parse_date(c("2010-01-01", "1979-10-14")))  # Parse dates             
parse_number("$100")                            # Parse currency etc.
parse_datetime("2010-10-01T2010")               # Parse datetime
guess_parser("2010-10-01")                      # Get R to guess the data format

















# Syntax for ggplot:

ggplot(data = <DATA>) + 
  <GEOM_FUNCTION>(mapping = aes(<MAPPINGS>))

# Examples 

# Simple Bar chart
ggplot(data = df) +
    geom_bar(mapping = aes(x = var1))

# Basic gg plot
ggplot(data = mpg) +                                            # Creates the plot
  geom_point(mapping = aes(x = displ, y = hwy, color = class))  # Adds x, y & color data
# Can also take args size, alpha, shape

# Manually setting params (outside aes function)
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy), color = "blue")