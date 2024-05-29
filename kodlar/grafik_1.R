
install.packages("readxl")
install.packages("ggplot2")

library(readxl)
library(ggplot2)

getwd()

suc_turu <- read_excel("C:/Users/ALİM/Documents/suc_turu.xls")

View(suc_turu)

is.numeric(suc_turu$Toplam)

names(suc_turu)[1] <- "suc_turleri"


ggplot(suc_turu, aes(x = Toplam, y = reorder(suc_turleri, +Toplam))) +
  geom_bar(stat = "identity", fill = "blue") +  
  scale_x_continuous(labels = function(x) {
    ifelse(x >= 50000, paste0(x/1000, " Bin"), as.character(x))
  }, limits = c(0, 300000), breaks = seq(0, 300000, by = 50000))+
  labs(x = "İşlenme Sayısı",
       y = "Suc Turleri",
       title = "2011-2020 Yılları Arasında İşlenen Sucların Turlere Gore Toplam Sayısı")+
  theme_bw()+
  theme(
    text = element_text(size=20),
    axis.text = element_text(size=20),
    axis.title = element_text(size=20),
    plot.title = element_text(size=20),
    legend.text = element_text(size=20),
    legend.title = element_text(size=20)
  )
  

