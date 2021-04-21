grants <- read.csv("https://raw.githubusercontent.com/STWUR/eRementarz-07-03-2020/master/data/ncn_grants.csv")

x <- list(a = 1, aaab = 2)
x$a
x$aaab
x$aa
x[["a"]]
x[["aaab"]]
x[["aa"]]
x[["aa", exact = FALSE]]

grants[grants[["subpanel"]] == "NZ2", ]

library(dplyr)
library(ggplot2)

filter
stats::filter

filter(grants, subpanel == "NZ2") %>% 
  mutate(over_milion = budget > 1e6) %>% 
  filter(over_milion) %>% 
  ggplot(aes(x = type)) +
  geom_bar()
