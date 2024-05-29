# TÜRKİYE ÖZELİNDE SUÇLAR
## Veri Seti Kaynağı: https://data.tuik.gov.tr/Kategori/GetKategori?p=Adalet-ve-Secim-110
Bu çalışma Anadolu Üniversitesi Ölçme ve Veri Analitiği Yüksek Lisans Programı, Veri Görselleştirme dersi kapsamında gerçekleştirilmiştir. Çalışmada veri seti olarak Tüik üzerinden Adalet ve Seçim başlığı içerisinde yer alan ‘ Suç Türü ve Medeni Durumuna Göre Ceza İnfaz Kurumuna Giren Hükümlüler’,  ‘İBBS, 3. Düzeyde, Suç Türü ve Suçun İşlendiği ile Göre Ceza İnfaz Kurumuna Giren Hükümlüler’, ‘ Hükümlü ve Tutuklu Sayısı’ isimli Ceza İnfaz Kurumu İstatistikleri kullanılmıştır. Excel formatında bulunan veri setleri öncelikle Excel içerisinde veri manipülasyonuna uğratılmış, sonrasında R Studio’ya yüklenmiştir. 1.ve 3.grafikler R Studio üzerinde yapılmış, 2. Grafik için Power BI görselleştirme aracı kullanılmıştır. 1.ve 3.grafik ayrı ayrı scriptlerde yapılmıştır. Aşağıda grafik ve kodları ayrı ayrı gösterilmiştir. 
## Grafik 1: 2011-2020 Yılları Arasında İşlenen Suçların Türlere Göre Toplam Sayısı - Çubuk Grafiği 
Bu grafikte suç tipine göre 2011- 2020 yılları arasında cezaevine giren hükümlü sayılarının değişimlerinin görselleştirilmesi amaçlanmıştır. Veri seti Excel formatında alınmış, Excel içerisinde gerekli düzenleme işlemleri yapılmış, sonrasında R Studio’ya yüklenmiştir. 

### Veri Seti: 
 ```markdown
Suç türü,Toplam
Ailenin korunması tedbirine aykırılık,41016
Askeri Ceza Kanunu'na muhalefet,18114
Ateşli silahlar ve bıçaklar ile ilgili suçlar,58320
Cinsel suçlar,45252
Dolandırıcılık,48738
Hakaret,33320
Hırsızlık,297078
İcra İflas Kanunu'na muhalefet,179531
Kaçakçılık,42659
Kişiyi hürriyetinden yoksun kılma,27664
Kötü muamele,874
Mala zarar verme,20830
Orman suçları,5272
Öldürme,74120
Rüşvet,1293
Sahtecilik,66382
Tehdit,72389
Trafik suçları,50346
Uyuşturucu madde ile ilgili suçlar ,178358
Yağma,86762
Yaralama,260024
Zimmet,2300
```


### Grafik : 
 ![grafik_1](https://github.com/alimcaglarr/data_visualization/assets/117393076/3d1e26f3-41da-43b8-a8c2-f32979fda86d)


### Kod Betiği: 
```r
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

```

## Grafik 2: Senelere ve Medeni Durumlarına Göre Hükümlülerin Sayıları
Bu grafikte medeni durumlarına göre hükümlerin sayılarının seneler içerisindeki değişiminin görselleştirilmesi amaçlanmıştır. Power BI görselleştirme aracıyla oluşturulmuştur. 
### Veri Seti: 
 ```markdown
SENE,SAYI,MEDENI_DURUM
2020,89818,HİÇ EVLENMEDİ
2019,98544,HİÇ EVLENMEDİ
2018,98480,HİÇ EVLENMEDİ
2017,78997,HİÇ EVLENMEDİ
2016,62066,HİÇ EVLENMEDİ
2015,56628,HİÇ EVLENMEDİ
2014,55234,HİÇ EVLENMEDİ
2013,45668,HİÇ EVLENMEDİ
2012,32794,HİÇ EVLENMEDİ
2011,22270,HİÇ EVLENMEDİ
2020,123410,EVLİ
2019,135439,EVLİ
2018,125159,EVLİ
2017,101758,EVLİ
2016,94441,EVLİ
2015,82326,EVLİ
2014,88841,EVLİ
2013,91547,EVLİ
2012,63859,EVLİ
2011,46908,EVLİ
2020,43009,BOSANDI
2019,44910,BOSANDI
2018,40642,BOSANDI
2017,32983,BOSANDI
2016,29405,BOSANDI
2015,28068,BOSANDI
2014,25010,BOSANDI
2013,22842,BOSANDI
2012,17628,BOSANDI
2011,10127,BOSANDI
```

### Grafik : 

![grafik_2](https://github.com/alimcaglarr/data_visualization/assets/117393076/fd8839f2-5d55-4c82-b1bd-fe4c2e114f75)

## Grafik 3: 2011-2020 Yılları Arasında İşlenen Şehir Bazlı Toplam Suç Sayıları 

Bu grafike Türkiye İller Haritası üzerinde 2011-2020 yılları arasında işlenen toplam suç sayılarının şehir bazlı gösteriminin görselleştirilmesi amaçlanmıştır. 
Veri seti Excel formatında alınmış, Excel içerisinde gerekli düzenleme işlemleri yapılmış, sonrasında R Studio’ya yüklenmiştir. 

### Veri Seti: 
 ```markdown
kod,sehir,sayi
TRA13,Bayburt,1042
TRB14,Tunceli,1261
TR906,Gümüşhane,2158
TRA24,Ardahan,2437
TR822,Çankırı,2905
TRB24,Hakkari,2962
TR905,Artvin,2995
TRB13,Bingöl,3044
TRC34,Siirt,3252
TRB22,Muş,3923
TRA23,Iğdır,4243
TR813,Bartın,4324
TRC13,Kilis,4731
TR823,Sinop,4965
TR715,Kırşehir,4967
TRA12,Erzincan,5059
TR812,Karabük,5244
TRA22,Kars,5351
TRC33,Şırnak,5438
TR413,Bilecik,5926
TR711,Kırıkkale,6282
TR425,Yalova,6289
TR904,Rize,6490
TRB23,Bitlis,6615
TRC12,Adıyaman,6632
TRC32,Batman,6641
TR723,Yozgat,7453
TR613,Burdur,7515
TRA21,Ağrı,7946
TR522,Karaman,8386
TR424,Bolu,8423
TR821,Kastamonu,8449
TRC31,Mardin,8695
TR714,Nevşehir,8809
TR712,Aksaray,9019
TR903,Giresun,9035
TR834,Amasya,9498
TR713,Niğde,9996
TR213,Kırklareli,10037
TR423,Düzce,10403
TRB12,Elâzığ,11269
TR334,Uşak,11741
TR832,Tokat,12036
TRB11,Malatya,12256
TR333,Kütahya,12540
TR722,Sivas,12807
TR833,Çorum,13194
TR633,Osmaniye,13579
TR901,Trabzon,13605
TR612,Isparta,14137
TRB21,Van,14265
TR811,Zonguldak,14460
TRA11,Erzurum,15609
TR212,Edirne,15701
TR902,Ordu,16197
TR222,Çanakkale,16462
TR332,Afyonkarahisar,20919
TR632,Kahramanmaraş,20960
TR412,Eskişehir,21064
TRC21,Şanlıurfa,22033
TR211,Tekirdağ,22994
TR422,Sakarya,24455
TRC22,Diyarbakır,26638
TR323,Muğla,30181
TR631,Hatay,30839
TR831,Samsun,34082
TR421,Kocaeli,34902
TR322,Denizli,37724
TR721,Kayseri,40116
TR221,Balıkesir,40188
TRC11,Gaziantep,40274
TR321,Aydın,41330
TR331,Manisa,45985
TR521,Konya,55540
TR622,Mersin,57075
TR411,Bursa,70616
TR621,Adana,72798
TR611,Antalya,90556
TR510,Ankara,96517
TR310,İzmir,152317
TR100,İstanbul,285655
```

### Grafik : 
    
![grafik_3](https://github.com/alimcaglarr/data_visualization/assets/117393076/b818469b-d761-45fd-ad1d-7341e1756f72)

### Kod Betiği: 
```r
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
```





