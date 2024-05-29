install.packages("devtools")
library(devtools)

devtools::install_github("htastan/TRmaps")
library(TRmaps)

install.packages("sf")
library(sf)

view(tr_nuts3)


ggplot(tr_nuts3) + 
  geom_sf()

map_suc <- sehir_suc %>%
  select(sehir, sayi)

map_suc2 <- left_join(tr_nuts3, sehir_suc, by = c("NUTS3_code" = "kod"))




ggplot(map_suc2) + 
  geom_sf(aes(fill = sayi)) +
  scale_fill_viridis_c((option = "earth"),
                        labels = scales::number_format(scale = 1e-3, suffix = "Bin"),
                        breaks = seq(0, 300000, by = 50000), 
                        trans = "reverse" ,
                       name = "Toplam Suç Sayısı"
  )+
  theme_void()







