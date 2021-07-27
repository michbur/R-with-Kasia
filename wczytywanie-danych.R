# utils::read.table oraz jej wariant utils::read.csv i utils::read.csv2
library(dplyr)

library(readr)
read_table("./data/dane2.xls")
# nie bedzie dzialac

library(readxl)
dat <- read_xls(path = "./data/dane2.xls")
View(dat)

# zmiana katalogu zrodlowego: base::setwd()
# podgladanie obecnego katalogu zrodlowego base::getwd()

# RDS --------------------------------

group_by(dat, occupation, union) %>% 
  summarize(n = length(union)) %>% 
  saveRDS(file = "./results/unionized-occupations.RDS")

readRDS("./results/unionized-occupations.RDS")

# saveRDS (i save) pozwalaja nam zapisywac wszystkie rodzaje obiektow

# csv i inne ------------------------

filter(dat, married == "married", age > 40) %>% 
  write.csv("./results/married_above40.csv", row.names = FALSE)
read.csv("./results/married_above40.csv")

# rownames sa nieprzydatne
filter(dat, married == "married", age > 40) %>% 
  write.csv("./results/married_above40_with_rownames.csv", row.names = TRUE)
read.csv("./results/married_above40_with_rownames.csv")

filter(dat, married == "married", age > 40) %>% 
  write.table("./results/married_above40.tab", row.names = FALSE, sep = "\t")
read.table("./results/married_above40.tab", sep = "\t", header = TRUE)

write.table(dat, "clipboard")

# dla duzych tabel: data.table::fread oraz data.table::fwrite
# pamietac o opcji data.table = FALSE
 
