install.packages("tidyverse")
library("tidyverse")
clean_data <- function() {
toilets_raw<-read_csv(file = "/Users/huling/Downloads/wc_finder_opendata.csv")
glimpse(toilets_raw)
pop_raw<-read.csv(file = "/Users/huling/Desktop/R小组作业/München_Postzahlen.csv")
glimpse(pop_raw)
toilets_clean<-toilets_raw%>%
  select(
    Name = name,
    PLZ = plz,
    Strasse = strasse,
    Hausnr = hausnr,
    Kategorie = kategorie,
    Oeffnungszeiten = oeffnungszeiten,
    Zustand = zustand,
    Preis = preis
)%>%
  mutate(
    PLZ = as.character(PLZ), #转为字符型
    PLZ = str_pad(PLZ, width = 5, pad ="0"), #确保邮编为5位数
)
pop_clean <- pop_raw %>%
  mutate(
    PLZ = as.character(Postleitzahl),
    PLZ = str_pad(PLZ, width = 5, pad = "0"),
    Einwohner = as.character(Einwohner),
    Fläche = as.character(Fläche),
    Einwohner = na_if(Einwohner, ""),
    Einwohner = na_if(Einwohner, "—"),
    Fläche = na_if(Fläche, ""),
    Fläche = na_if(Fläche, "—"),
    Einwohner = parse_number(Einwohner),
    Fläche = parse_number(Fläche)
)%>%
  select(PLZ, Einwohner, Fläche)
combined_data <- toilets_clean %>%
  left_join(pop_clean, by = "PLZ")
glimpse(combined_data)
head(combined_data, 10)
}
run_cleaning <- function(){
  data <- clean_data()
  if (!dir.exists("data"))dir.create("data")
  write_csv(data, "data/München_Toilets_Tidy.csv")
  write_rds(data, "data/München_Toilets_Tidy.rds")
  
}
