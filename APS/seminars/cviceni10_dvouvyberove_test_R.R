#####################################################################
################# 1. PAROVY TEST O STREDNI HODNOTE ##################
#####################################################################

## pro tento test nacteme data ze souboru PP_AS.txt:

KOREN <- "C:\\Users\\lange\\VSCHT_FIT\\6_APS"
DATA <- "data"
KRALICCI <- "kralicci.txt"
CAJICEK <- "cajicek.txt"
VAHA <- "vaha.txt"

### 1. Uvazujme opet data o namerenem IQ, najdete je v souboru vysledky_iq.txt. ### 

data <- read.table(paste(KOREN, DATA, KRALICCI, sep="\\"), header = T)
data
summary(data)
length(data[,1])
data<-as.matrix(data)
boxplot(data)
hist(data[,1])
hist(data[,2])
qqnorm(data[,1])
qqline(data[,1],col="green")
qqnorm(data[,2])
qqline(data[,1],col="red")


t.test(data[,1],data[,2], pair = T, alternative = "greater",conf.level=0.87)

t.test(data[,1],data[,2], pair = T, alternative = "less",conf.level=0.85)

t.test(data[,1],data[,2], pair = T, alternative = "two.sided",conf.level=0.99)

#####################################################################
# CAJICEK
#####################################################################

data <- read.table(paste(KOREN, DATA, CAJICEK, sep="\\"), header = T)
data
summary(data)
length(data[,1])
data<-as.matrix(data)
boxplot(data)	
hist(data[,1])
hist(data[,2])
qqnorm(data[,1])
qqline(data[,1],col="green")
qqnorm(data[,2])
qqline(data[,1],col="red")

t.test(data[,1], data[,2], alternative="less",conf.level=0.90)
t.test(data[,1], data[,2], alternative="less",conf.level=0.99)

t.test(data[,2], data[,1], alternative="less",conf.level=0.90)

#####################################################################
# VAHA
#####################################################################

data <- read.table(paste(KOREN, DATA, VAHA, sep="\\"), header = T)
data
summary(data)
length(data[,1])
data<-as.matrix(data)
boxplot(data)	
hist(data[,1])
hist(data[,2])
qqnorm(data[,1])
qqline(data[,1],col="green")
qqnorm(data[,2])
qqline(data[,1],col="red")

var(data[,1])
var(data[,2])

## zdaji se byt pomerne rozdilne, ale nezapomente, ze se v rozptylech scitaji
## ctverce, cili na odchylkach se to tolik poznat nemusi:

sd(data[,1])
sd(data[,2])

var.test(data[,1], data[,2], ratio = 1, alternative = "two.sided",conf.level=0.99)

## ratio je parametr udavajici, kolik by mel v nulove hypoteze byt podil rozptylu
## pro nas vzdy 1, tak ho ani nemusime uvadet:

var.test(kruh1, kruh2, alternative = "less")



## nejprve si nacteme dalsi data:
kruh1<-read.table("C:\\...\\zk_m.txt", header = F)
kruh2<-read.table("C:\\...\\zk_j.txt", header = F)

## v textovych souborech jsou vybery z vysledku prvniho pokusu zkouskove pisemky 
## pro dve paralelky z AS (LS 2018)

kruh1<-kruh1[,1]   ## obcas je potreba vytvorit z dat jeste vektor (popr. matici)
kruh2<-kruh2[,1]

## podivame se, jakpak to dopadlo:

summary(kruh1)
summary(kruh2)

boxplot(kruh1,kruh2)

hist(kruh1, breaks = 15)
hist(kruh2, breaks = 15)

qqnorm(kruh1)
qqline(kruh1,col="green")
qqnorm(kruh2)
qqline(kruh2,col="green")

## do normality maji data, zda se, dost daleko, zejmena druhy vyber, takze
## vysledky testu budeme povazovat za asymptoticke (oba vybery maji rozsah 
## vyssi nez 30)

## pohledem na vyberove charakteristiky vidime, ze prvni paralelka mela
## vyssi vyberovy prumer i median, muzeme tedy otestovat, zda prvni paralelka 
## ma statisticky vyznamne vyssi vysledky (stredni hodnotu)

t.test(kruh1, kruh2, alternative="greater")
## opet, neuvedeme-li conf.level, defaultne je zvolena hl. 5%
## ostatne, vime, ze tato informace se odrazi pouze v intervalu spolehlivosti
## pro rozdil stredich hodnot

#####################################################################
###################### 3. TEST SHODY ROZPTYLU #######################
#####################################################################

## na rozdil od jednovyberoveho testu o rozptylu je test shody rozptylu
## (F-test) implementovam primo do zakladniho balicku R-ka:

## podivejme se, jake vlastne byly vyberove rozptyly jednotlivych vyberu

var(kruh1)
var(kruh2)

## zdaji se byt pomerne rozdilne, ale nezapomente, ze se v rozptylech scitaji
## ctverce, cili na odchylkach se to tolik poznat nemusi:

sd(kruh1)
sd(kruh2)

## i smerodatne odchylky se celkem lisi. Zda se, ze prvni paralelka mela
## nejen vyssi ocekavane vysledky, ale dokonce i stabilnejsi, zkusme se 
## podivat, zda byl rozptyl prvni paralelky signifikantne nizsi nez u druhe

var.test(kruh1, kruh2, ratio = 1, alternative = "less")
## ratio je parametr udavajici, kolik by mel v nulove hypoteze byt podil rozptylu
## pro nas vzdy 1, tak ho ani nemusime uvadet:

var.test(kruh1, kruh2, alternative = "less")

## Na zaver poznamenejme (opakovane), ze pri dvouvyberovem testu shody strednich
## hodnot, NEPROVADIME predbezny test shody rozptylu a nevolime podle jeho 
## vysledku typ t-testu (pri shodnych rozptylech), jak se uvadi ve STARSI LITERATURE.
## Tento postup neni korektni, nebot nulovou hypotezu o shode rozptylu
## NELZE z podstaty testovani prijmout, a tudiz nas to neopravnuje k volbe testu
## o shode strednich hodnot pri stejnych rozptylech.