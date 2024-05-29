Bu çalışma Anadolu Üniversitesi Ölçme ve Veri Analitiği Yüksek Lisans Programı, Veri Görselleştirme dersi kapsamında gerçekleştirilmiştir. Çalışmada veri seti olarak Tüik üzerinden Adalet ve Seçim başlığı içerisinde yer alan ‘ Suç Türü ve Medeni Durumuna Göre Ceza İnfaz Kurumuna Giren Hükümlüler’,  ‘İBBS, 3. Düzeyde, Suç Türü ve Suçun İşlendiği ile Göre Ceza İnfaz Kurumuna Giren Hükümlüler’, ‘ Hükümlü ve Tutuklu Sayısı’ isimli Ceza İnfaz Kurumu İstatistikleri kullanılmıştır. Excel formatında bulunan veri setleri öncelikle Excel içerisinde veri manipülasyonuna uğratılmış, sonrasında R Studio’ya yüklenmiştir. 1.ve 3.grafikler R Studio üzerinde yapılmış, 2. Grafik için Power BI görselleştirme aracı kullanılmıştır. 1.ve 3.grafik ayrı ayrı scriptlerde yapılmıştır. Aşağıda grafik ve kodları ayrı ayrı gösterilmiştir. 
Grafik 1: 
Bu grafikte suç tipine göre 2011- 2020 yılları arasında cezaevine giren hükümlü sayılarının değişimlerinin görselleştirilmesi amaçlanmıştır. Veri seti Excel formatındadır. Öncelikle Excel içerisinde gerekli işlemler yapılmış, sonrasında R Studio’ya yüklenmiştir. 
Veri Seti: 


Grafik : 
 ![grafik_1](https://github.com/alimcaglarr/data_visualization/assets/117393076/3d1e26f3-41da-43b8-a8c2-f32979fda86d)


Kod Betiği: 

install.packages("readxl")
install.packages("ggplot2")

library(readxl)
library(ggplot2)

getwd()

suc_turu <- read_excel("C:/Users/ALD0M/Documents/suc_turu.xls")

View(suc_turu)

is.numeric(suc_turu$Toplam)

names(suc_turu)[1] <- "suc_turleri"


ggplot(suc_turu, aes(x = Toplam, y = reorder(suc_turleri, +Toplam))) +
  geom_bar(stat = "identity", fill = "blue") +  
  scale_x_continuous(labels = function(x) {
    ifelse(x >= 50000, paste0(x/1000, " Bin"), as.character(x))
  }, limits = c(0, 300000), breaks = seq(0, 300000, by = 50000))+
  labs(x = "D0E¬lenme SayD1sD1",
       y = "Suc Turleri",
       title = "2011-2020 YD1llarD1 ArasD1nda D0E¬lenen SuclarD1n Turlere Gore Toplam SayD1sD1")+
  theme_bw()+
  theme(
    text = element_text(size=20),
    axis.text = element_text(size=20),
    axis.title = element_text(size=20),
    plot.title = element_text(size=20),
    legend.text = element_text(size=20),
    legend.title = element_text(size=20)
  )
