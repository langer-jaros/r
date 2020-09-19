cesta<-"C:\\Users\\lange\\VSCHT_FIT\\6_APS\\test.txt"
           ## je jednodussi si cestu k souboru dat zvlast. POZOR!! do uvozovek
           ## a s dvojitymi zpetnymi lomitky
cestaOut <- "C:\\Users\\lange\\VSCHT_FIT\\6_APS\\zapocet.txt"
test<-read.table(cesta, header = TRUE)
           ## header = TRUE znamena, ze prvni radek je hlavicka promenne  
test

head(test)  ## ukaze prvnich 6 radku
tail(test)  ## ukaze poslednich 6 radku

names(test)  ## fce, ktera ukaze, jak se jmenuji jednotlive sloupce

names(test)[names(test) == "V1"] <- "1PP"
names(test)[names(test) == "V2"] <- "2PP"
             ## funkce, kterou prejmenujeme sloupce (neni nutna, spis pro zajimavost)


zap<-test[,1]+test[,2]  ## v tehle promenne jsou celkove body, 
                        ## ktere jednotlivi studenti ziskali
zap

### SAMI: pridejte do promenne test sloupecek zap

test <- cbind(test, zap)
test

plot(zap)                 ## vykresleni grafu k zap. osa x je index jednotlivych radku
plot(zap,type="h")

help(plot)
### SAMI: a) zkuste si prohlednout help k funkci plot
###       b) podivejte se, jak se zmeni graf nahradite-li parametr type "h"
###          moznostmi "l","s","S", "p"
###       c) co se stane, nedame-li zadny parametr type ??

plot(zap,type="l")
plot(zap,type="s")
plot(zap,type="S")
plot(zap,type="p")
plot(zap)

min(zap)
max(zap)
mean(zap)

### SAMI: a) zjistete maximalni a minimalni vysledek z 1PP a 2PP
###       b) zjistete prumerny vysledek z 1PP a z 2PP

names(test)
test["1PP"]

test[,1]

max(test[,1])
# max(test["1PP"])
min(test[,1])
# min(test["1PP"])

max(test[,2])
# max(test["2PP"])
min(test[,2])
# min(test["2PP"])

mean(test[,1])
mean(test[,2])


names(zap)

write.table(zap, cestaOut, row.names=FALSE)