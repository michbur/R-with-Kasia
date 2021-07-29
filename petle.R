all_R_files <- list.files(path = ".", pattern = "R$")

ith_file <- all_R_files[5]
print(ith_file)
sapply(all_R_files, function(ith_file) {
  print(ith_file)
  sum(nchar(readLines(ith_file)))
})

jth_file <- all_R_files[5]
sapply(all_R_files, function(ith_file) {
  print(jth_file)
  sum(nchar(readLines(jth_file)))
})

lapply(all_R_files, function(ith_file) {
  sum(nchar(readLines(ith_file)))
})

library(readxl)
dat <- read_xls(path = "./data/dane2.xls")

apply(dat, MARGIN = 1, function(ith_row) {
  occ <- paste0(unlist(strsplit(ith_row["occupation"], "/")), collapse = " (") 

  occ_nice <- ifelse(grepl(pattern = "(", x = occ, fixed = TRUE), paste0(occ, ")"),
         occ)
  
  paste0(occ_nice, " [", ith_row["age"], "]")
})

library(dplyr)
dat_with_no_na <- mutate(dat, 
                         occupation_vector = ifelse(is.na(occupation), "unknown", occupation),
                         occupation_vector = gsub("[/ ]", "_", occupation_vector))

lapply(unique(dat_with_no_na[["occupation_vector"]]), function(ith_occ) {
  filter(dat_with_no_na, occupation_vector == ith_occ) %>% 
    select(-occupation_vector) %>% 
    write.csv(file = paste0("./results/", ith_occ, ".csv"), row.names = FALSE)
})

for(ith_occ in unique(dat_with_no_na[["occupation_vector"]])) {
  filter(dat_with_no_na, occupation_vector == ith_occ) %>% 
    select(-occupation_vector) %>% 
    write.csv(file = paste0("./results/", ith_occ, ".csv"), row.names = FALSE)
}

list.dirs(recursive = FALSE)
