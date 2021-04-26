pdf("./trumptweets.pdf")

library(ggplot2)
library(scales)
library(dplyr)
library(tidyr)
library(dlookr)
library(flextable)
library(tidytext)

## Read and Combine: #realdonaldtrump and #trumptweets
### #realdonaldtrump

realtrump <- read.csv("./realdonaldtrump.csv")
realtrump %>% select(retweets,favorites) %>%diagnose_numeric()

### #trumptweets

trumptweets <- read.csv("./trumptweets.csv")
trumptweets %>% select(retweets,favorites) %>%diagnose_numeric()
trumptweets <- trumptweets %>% select(-geo)

### Combine  realdonaldtrump and trumptweets into single data.frame

tweets <- rbind(realtrump,trumptweets)
tweets$date <- as.Date(tweets$date) 
tweets$mentions <- gsub("@","",tweets$mentions)

tweets %>% select(retweets,favorites) %>%diagnose_numeric()

dev.off()