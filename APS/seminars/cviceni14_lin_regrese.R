tab<-read.table("C:\\Users\\zikmundm\\Desktop\\as_online\\regrese.txt",header=TRUE)
tab
plot(tab, lwd = 2)  ## funkce plot vykresli data v tab. Dejte si na ni pozor
                    ## ma siroke pouziti, ale musi se spravne volat 
                    ## v zavislosti na vstupni promenne
lregrese<-lm(tab$koncentrace~tab$teplota)
                    ## linearni regresni model vytvorime prikazem "lm"
                    ## argumentem teto funkce je jako prvni zavisla (vysvetlovana) promenna (y)
                    ## potom za vlnovkou vysvetujici promenna (x)

lregrese            ## vypise pouze odhady parametru regresni primky

summary(lregrese)   ## zde uz dostaneme vyrazne podrobnejsi informace o modelu

residuals(lregrese) 
                    ## vypise rezidua vsech pozorovani (rozdil skutecne 
                    ## hodnoty y a teoreticke hodnoty na regresni primce)

abline(lregrese,col="red", lwd = 2)
                    ## timto prikazem vykreslime k pozorovanim regresni primku

#### podminky pro regresni model jsou
## 1.nulova stredni hodnota rezidui:

barplot(residuals(lregrese), main="residuals")
                    ## sloupcovy graf rezidui ukazuje, ze rezidua fluktuuji
                    ## kolem nuly
t.test(residuals(lregrese))
                    ## p-hodnota = 1, to hovori silne pro nulovou str. hodnotu
                    ## (nezapomenme ovsem, ze ji nikdy neprijmame a ze mame dost
                    ## malo pozorovani)
## 2. ostatni podminky na rezidua: nekorelovanost jednotlivych rezidui a 
## stejny rozptyl. Ty tezko overime, mame v kazdem x_j pouze jedno pozorovani

## pro vytvoreni intervalu spolehlivosti pro odhady koeficientu regresni primky 
## navic potrebujeme normalitu rezidui:  

qqnorm(residuals(lregrese))
qqline(residuals(lregrese),col="red", lwd = 2)

## pouzijeme Shapiruv-Wilkuv test (funguje dobre pro male rozsahy)
shapiro.test(residuals(lregrese))

#### PAS SPOLEHLIVOSTI A PREDIKCNI PAS

confint(lregrese, level=0.95)
                    ## intervaly spolehlivosti pro parametry regresni primky

pas_spolehlivosti<-predict(lregrese, interval="confidence", level=0.95)
                    ## pas spolehlivosti kolem regresni primky
                    ## je vytvoren oboustrannymi intervalovymi odhady E[Y(x)]
pas_spolehlivosti

predikcni_int<-predict(lregrese, interval="prediction", level=0.95)
                    ## predikcni interval kolem regresni primky je tvoren
                    ## intervalovymi odhady primo pro jednotliva 
                    ## pozorovani Y(x)
predikcni_int
plot(tab, lwd = 2)
abline(lregrese, lwd = 2)
lines(tab[,1],pas_spolehlivosti[,2],type="l",col="red",lwd = 2)
lines(tab[,1],pas_spolehlivosti[,3],type="l",col="red", lwd = 2)
lines(tab[,1],predikcni_int[,2],type="l",col="green", lwd = 2)
lines(tab[,1],predikcni_int[,3],type="l",col="green", lwd = 2)
                    ## vykresleni pozorovani, regresni primky a pasu
