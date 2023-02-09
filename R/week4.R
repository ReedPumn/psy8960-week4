# Script Settings and Resources
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))
library(tidyverse)

# Data Import
import_tbl <- read_delim(file = "../data/week4.dat", delim = "-", col_names = c("casenum", "parnum", "stimver", "datadate", "qs"))
glimpse(import_tbl)
wide_tbl <- import_tbl %>% separate(col = qs, into = c("q1", "q2", "q3", "q4", "q5"), sep = " - ")
wide_tbl[5:9] <- sapply(wide_tbl[5:9], as.integer)
wide_tbl$datadate <- as.POSIXct(wide_tbl$datadate, format = "%b %d %Y, %H:%M:%S")
wide_tbl[5:9] <- na_if(wide_tbl[5:9], 0)
wide_tbl <- wide_tbl[wide_tbl$q2 != "NA",]
