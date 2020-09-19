### dnesnim tematem jsou intervalove odhady
### v R-ku si ukazeme, jak urcit intervalove odhady pro stredni hodnotu a rozptyl
### vyberu z normalniho rozdeleni

## predtim si jeste ukazeme, jak pracovat v R s dalsimi tremi rozdelenimi

## chi-kvadrat rozdeleni o df stupnich volnosti
#  nejdulezitejsi (vlastne v podstate jedina dulezita) pro nas je kvantilova fce

qchisq(0.5, df=7)   ## median pro chi-kvadrat rozdeleno o df = 7 stupnich volnosti

## Studentovo t-rozdeleni o df stupnich volnosti
#  opet si ukazeme jen kvantilovou funkci. Distribucni fce, hustota a generovani
#  funguje analogicky jako v 6.tydnu

qt(0.95, df = 5)    ## 95% kvantil t-rozdeleni o 5 stupnich volnosti

## Fisherovo-Snedecorovo rozdeleni o m a n stupnich volnosti
# kvantilova funkce:

qf(0.9,df1=5,df2=4) ## 90% kvantil F-rozdeleni o 5 a 4 stupnich volnosti

#######################################################################

## a nyni uz k samotnym odhadum

## predtim by to chtelo nejaka data
## nactete si data ze souboru hruba_mzda.txt
## jedna se o prumerne mesicni hrube mzdy pro ruzna odvetvi ve 4. ctvrtleti 
## 2019 (v tisicich)
cesta<-"C:\\Users\\zikmundm\\Desktop\\as_online\\hruba_mzda.txt"
mzda<-read.table(cesta, header = FALSE)
mzda<-mzda[,1]

### 1. BODOVY ODHAD PARAMETRU

## uz vlastne umime z popisne statistiky

mean(mzda)         # bodovy odhad stredni hodnoty (jedna moznost)
median(mzda)       # bodovy odhad stredni hodnoty
boxplot(mzda)

var(mzda)          # bodovy odhad rozptylu
sd(mzda)           # bodovy odhad smerodatne odchylky

### 2. INTERVALOVY ODHAD PARAMETRU

## a) odhad stredni hodnoty

t.test(mzda, alternative="less",conf.level=0.95)$conf.int
                   # horni 95% intervalovy odhad: alternative = "less"
t.test(mzda, alternative="greater",conf.level=0.95)$conf.int
                   # dolni 95% intervalovy odhad
t.test(mzda,alternative="two.sided",conf.level=0.95)$conf.int
                   # oboustranny 95% intervalovy odhad


library(TeachingDemos)
sigma.test(mzda,alternative="less",conf.level=0.95)$conf.int
sigma.test(mzda,alternative="greater",conf.level=0.95)$conf.int
sigma.test(mzda,alternative="two.sided",conf.level=0.95)$conf.int
skv<-var(mzda)
n<-length(mzda)
alfa<-0.1
dolni<-(n-1)*skv/qchisq(1-alfa/2,df=n-1)
horni<-(n-1)*skv/qchisq(alfa/2,df=n-1)
intervalovy_odhad<-c(dolni,horni)
intervalovy_odhad