library(jsonlite)
library(dplyr)

## 匯入103年
library(readr)
X103EduPreSal_BigPos <- read_csv("C:/Users/YTH/Desktop/data2/103EduPreSal_BigPos.csv", 
                                 col_types = cols(collageGB = col_double(), 
                                                  collageSal = col_double(), facultyGB = col_double(), 
                                                  facultySal = col_double(), graduaeSal = col_double(), 
                                                  graduateGB = col_double(), juniorGB = col_double(), 
                                                  juniorSal = col_double(), seniorGB = col_double(), 
                                                  seniorSal = col_double()), locale = locale(encoding = "BIG5"))
View(X103EduPreSal_BigPos)

## 匯入104年
library(readr)
X104EduPreSal_BigPos <- read_csv("C:/Users/YTH/Desktop/data2/104EduPreSal_BigPos.csv", 
                                 col_types = cols(collageGB = col_double(), 
                                                  collageSal = col_double(), facultyGB = col_double(), 
                                                  facultySal = col_double(), graduaeSal = col_double(), 
                                                  graduateGB = col_double(), juniorGB = col_double(), 
                                                  juniorSal = col_double(), salaryGB = col_double(), 
                                                  seniorGB = col_double(), seniorSal = col_double()), 
                                 locale = locale(encoding = "BIG5"))
View(X104EduPreSal_BigPos)

## 匯入105年
library(readr)
X105EduPrePerMonSal_BigPos <- read_csv("C:/Users/YTH/Desktop/data2/105EduPrePerMonSal_BigPos.csv", 
                                       col_types = cols(collageGB = col_double(), 
                                                        collageSal = col_double(), facultyGB = col_double(), 
                                                        facultySal = col_double(), graduaeSal = col_double(), 
                                                        graduateGB = col_double(), juniorGB = col_double(), 
                                                        juniorSal = col_double(), salary = col_double(), 
                                                        salaryGB = col_double(), seniorGB = col_double(), 
                                                        seniorSal = col_double()), locale = locale(encoding = "BIG5"))
View(X105EduPrePerMonSal_BigPos)

## 匯入106年
library(readr)
X106EduPrePerMonSal_BigPos <- read_csv("C:/Users/YTH/Desktop/data2/106EduPrePerMonSal_BigPos.csv", 
                                       col_types = cols(collageGB = col_double(), 
                                                        collageSal = col_double(), facultyGB = col_double(), 
                                                        facultySal = col_double(), graduaeSal = col_double(), 
                                                        graduateGB = col_double(), juniorGB = col_double(), 
                                                        juniorSal = col_double(), salaryGB = col_double(), 
                                                        seniorGB = col_double(), seniorSal = col_double()), 
                                       locale = locale(encoding = "BIG5"))
View(X106EduPrePerMonSal_BigPos)

## No.3
Sal<-data.frame(career=X106EduPrePerMonSal_BigPos$career,
                collageSal=X106EduPrePerMonSal_BigPos$collageSal,
                graduaeSal=X106EduPrePerMonSal_BigPos$graduaeSal)
Sal$SalaryAdd<-Sal$graduaeSal/Sal$collageSal
Sal<-arrange(Sal,desc(SalaryAdd))
View(Sal)
head(Sal,10)


## No.2
  ##男>女(小~大)、大到小排列
SalBG103<-data.frame(year=X103EduPreSal_BigPos$year,
                     career=X103EduPreSal_BigPos$career,
                     salBG=X103EduPreSal_BigPos$collageGB)%>%
  arrange(salBG)%>%
  head(10)
View(SalBG103)

SalBG104<-data.frame(year=X104EduPreSal_BigPos$year,
                     career=X104EduPreSal_BigPos$career,
                     salBG=X104EduPreSal_BigPos$collageGB)%>%
  arrange(salBG)%>%
  head(10)
View(SalBG104)

SalBG105<-data.frame(year=X105EduPrePerMonSal_BigPos$year,
                     career=X105EduPrePerMonSal_BigPos$career,
                     salBG=X105EduPrePerMonSal_BigPos$collageGB)%>%
  arrange(salBG)%>%
  head(10)
View(SalBG105)

SalBG106<-data.frame(year=X106EduPrePerMonSal_BigPos$year,
                     career=X106EduPrePerMonSal_BigPos$career,
                     salBG=X106EduPrePerMonSal_BigPos$collageGB)%>%
  arrange(salBG)%>%
  head(10)
View(SalBG106)

ComSalBG<-rbind(SalBG103,SalBG104,SalBG105,SalBG106)
View(ComSalBG)

  ##女>男(大~小)、大到小排列
SalGB103<-data.frame(year=X103EduPreSal_BigPos$year,
                     career=X103EduPreSal_BigPos$career,
                     salBG=X103EduPreSal_BigPos$collageGB)%>%
  arrange(desc(salBG))%>%
  head(10)
View(SalGB103)

SalGB104<-data.frame(year=X104EduPreSal_BigPos$year,
                     career=X104EduPreSal_BigPos$career,
                     salBG=X104EduPreSal_BigPos$collageGB)%>%
  arrange(desc(salBG))%>%
  head(10)
View(SalGB104)

SalGB105<-data.frame(year=X105EduPrePerMonSal_BigPos$year,
                     career=X105EduPrePerMonSal_BigPos$career,
                     salBG=X105EduPrePerMonSal_BigPos$collageGB)%>%
  arrange(desc(salBG))%>%
  head(10)
View(SalGB105)

SalGB106<-data.frame(year=X106EduPrePerMonSal_BigPos$year,
                     career=X106EduPrePerMonSal_BigPos$career,
                     salBG=X106EduPrePerMonSal_BigPos$collageGB)%>%
  arrange(desc(salBG))%>%
  head(10)
View(SalGB106)

ComSalGB<-rbind(SalGB103,SalGB104,SalGB105,SalGB106)
View(ComSalGB)


## No.4
IntCar<-rbind(filter(X106EduPrePerMonSal_BigPos,career=="工業部門"),
              filter(X106EduPrePerMonSal_BigPos,career=="製造業"),
              filter(X106EduPrePerMonSal_BigPos,career=="服務業部門"),
              filter(X106EduPrePerMonSal_BigPos,career=="運輸及倉儲業"),
              filter(X106EduPrePerMonSal_BigPos,career=="資訊及通訊傳播業"))
View(IntCar)
IntCar2<-data.frame(year=IntCar$year,
                    career=IntCar$career,
                    collageSal=IntCar$collageSal,
                    graduateSal=IntCar$graduaeSal)
View(IntCar2)
IntCar3<-data.frame(IntCar2,
                    gra_col=IntCar$graduaeSal-IntCar$collageSal)
View(IntCar3)


## No.1
X106103<-X106EduPrePerMonSal_BigPos$collageSal/X103EduPreSal_BigPos$collageSal
X103106Join<-data.frame(X103EduPreSal_BigPos,X106EduPrePerMonSal_BigPos,X106103)%>%arrange(desc(X106103))
head(X103106Join,10)
View(X103106Join)

X106103Sal3<-filter(X103106Join,X106103>1.05)
X106103Sal3$career<-strsplit(X106103Sal3$career,"-")
Pi<-c()
for (n in 1:nrow(X106103Sal3)) {
  Pi<-c(Pi,X106103Sal3$career[n][1])
}
Pi2<-c()
for (n in 1:length(Pi)) {
  Pi2<-c(Pi2,Pi[[n]][1])
}
table(Pi2)









