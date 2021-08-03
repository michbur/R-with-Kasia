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


# stworzyc dla kazdej z galezi przemyslu folder (base::dir.create) w którym będzie się znajdowalo:
# 1) tabela .csv zawierajaca przedstawicieli tej galezi przemyslu w podziale na: 
# rase, zwiazek zawodowy i zawod
# 2) plik tekstowy zawierajacy wynik testu t (przekazany za pomoca utils::capture.output) 
# porownujacy liczbe godzin przepracowanych przez osoby bedace w zwiazku zawodowym 
# i nie bedace w takim zwiazku 
# 3) plik tekstowy zawierajacy opis ilu przedstawicieli danego zawodu w danej
# galezi przemyslu jest w zwiazku zawodowym

# 1. uzywajac funkcji base::unlink napisz petle, ktora usuwa foldery stworzone w poprzednim zadaniu
# 2. stworz dla kazdej z mozliwych wartosci zawodu folder i tam dodaj:
#   a) folder w którym bedzie znajdowal się dla kazdej z ras wynik testu korelacji (stats::cor.test) 
#      miedzy liczba godzin pracy z zarobkami (uzyj capture output) oraz wykres punktowy w formacie png
#      (uzyj funkcji plot, png i pamietaj o dev.off), ktory pokaze zaleznosc liczby godzin od zarobkow
#      (np. plot(1L:10, rnorm(10)))
#   b) plik csv z informacja ile osob w danym zawodzie ma dany stan cywilny i w jakiej galezi 
#      przemyslu pracuja
#   c) plik tekstowy podajacy nazwy pliku csv i podfolderu oraz tlumaczacy ich zawartosc
# 3. stworz petle, ktora usuwa foldery stworzone w zadaniu 2 razem z podfolderami
