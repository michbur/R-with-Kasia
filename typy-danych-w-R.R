x <- c(1, 5, 8)
class(x)
x_f <- factor(x)
# wywolanie ponizej nie zadziala, bo max nie ma sensu dla factora
# max(x_f)

as.numeric(x_f)

as.numeric(as.character(x_f))

df <- data.frame(klasa = x_f, imie = c("Jan", "Onufry", "Anna"))
str(df)

substr(df[["imie"]], 3, 3)

nchar("Trzy")
nchar(df[["imie"]])

substr(df[["imie"]], nchar(df[["imie"]]), nchar(df[["imie"]]))

ifelse(substr(df[["imie"]], nchar(df[["imie"]]), nchar(df[["imie"]])) == "a", 
       "kobieta", "mezczyzna")

rep("mezczyzna", length(letters[-1]))

sex_v <- c(setNames(rep("mezczyzna", length(letters[-1])), letters[-1]), a = "kobieta")

sex_v[substr(df[["imie"]], nchar(df[["imie"]]), nchar(df[["imie"]]))]

df[["plec"]] <- ifelse(substr(df[["imie"]], nchar(df[["imie"]]), nchar(df[["imie"]])) == "a", 
                       "kobieta", "mezczyzna")

# dodac kolumne z pierwsza litera imienia
