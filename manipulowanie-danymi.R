library(dplyr)

x <- c(1, 5, 8)
x_f <- factor(x)
df <- data.frame(klasa = x_f, imie = c("Jan", "Onufry", "Anna"))

# NSE

mutate(df, ostatnia_litera = substr(imie, nchar(imie), nchar(imie)))

filter(df, klasa == "5")

mutate(df, ostatnia_litera = substr(imie, nchar(imie), nchar(imie))) %>% 
  filter(ostatnia_litera != "a") %>% 
  mutate(n_znakow = nchar(imie))

mutate(df, ostatnia_litera = substr(imie, nchar(imie), nchar(imie)),
       kobieta = ostatnia_litera == "a") %>%
  group_by(kobieta) %>% 
  summarise(n = length(imie))

set.seed(1)
df_test <- data.frame(klasa = factor(sample(1L:8, size = 40, replace = TRUE), levels = 1L:8), 
                      imie = sample(c("Jan", "Onufry", "Anna", "Katarzyna", "Michał"), 40, 
                                    replace = TRUE),
                      wzrost = (runif(40) + 1) * 100)

# tylko Jan i Anna

filter(df_test, imie %in% c("Jan", "Anna"))

# uporzadkowanie według  klasy (rosnaco) i wzrostu (malejaco)
arrange(df_test, klasa, desc(wzrost))

# pierwszych pieciu najwyzszych uczniow
arrange(df_test, desc(wzrost))[1L:5, ]
arrange(df_test, desc(wzrost)) %>% 
  slice(1L:5)

# imiona pieciu najwyzszych uczniow
arrange(df_test, desc(wzrost)) %>% 
  slice(1L:5) %>% 
  pull(imie)

arrange(df_test, desc(wzrost)) %>% 
  slice(1L:5) %>% 
  select(imie)

# podac sredni wzrost uczennic i uczniow

# 1. podac mediane wzrostu, MAD wzrostu (mad) oraz mediane + MAD i mediane - MAD 
# wzrostu uczniow i uczennic w danej klasie

# 2. podac wzrost najwyzszego ucznia w kazdej klasie

# 3. podac ilu jest uczniow i uczennic w klasach

