# Vypracovani 8. domaciho ukolu #
# Jaroslav Langer, 2020/04/19 #

# Konstanty #
KOREN <- "C:\\Users\\lange\\VSCHT_FIT\\6_APS"
DATA <- "data"
ZADANI <- "vysledky_iq.txt"

### 1. Uvazujme opet data o namerenem IQ, najdete je v souboru vysledky_iq.txt. ### 

zadani <- read.table(paste(KOREN, DATA, ZADANI, sep="\\"), header = FALSE)
zadani # vypis
names(zadani)[names(zadani) == "V1"] <- "iq"
names(zadani) # vypis

### 2. Projdete si pomoci ukazkoveho zdrojoveho kodu k popisne statistice soubor dat. #
#      Existuji tam nejaka odlehla pozorovani? #
#      Zda se, ze celkove IQ muze pochazet z normalniho rozdeleni? ###

summary(zadani)	## vypise minima, maxima, kvartily, vyberovy prumer  a median
quantile(zadani$iq ,c(0.1,0.25,0.5,0.75,0.9))  ## vypise decily a kvartily
hist(zadani$iq)
# Zda se ze celkove IQ muze pochazet z normalniho rozdeleni #
boxplot(zadani$iq)
qqnorm(zadani$iq)
# V souboru jsou dve odlehla pozorovani, konkretne zmeny 145->155 a 139->150 od minule #

### 3. Odpovezte na nasledujici otazky:

###   (a) Urcete alespon dva bodove odhady stredni hodnoty. #
#         Dali byste nekteremu prednost? Proc? ###

mean(zadani$iq) # Dal bych prednost vyberovemu prumeru, protoze verim, ze rozdeleni je normalni #
median(zadani$iq)

###   (b) Kolik je bodovy odhad rozptylu? ###

var(zadani$iq)

###   (c) Urcete dolni a horni 99% interval spolehlivosti pro stredni hodnotu #
#         (predpokladame, ze data pochazi z normalniho rozdeleni). ###

t.test(zadani, alternative="greater",conf.level=0.99)$conf.int
t.test(zadani, alternative="less",conf.level=0.99)$conf.int

###   (d) Urcete 95% oboustranny intervalovy odhad pro stredni hodnotu #
#         (predpokladame, ze data pochazi z normalniho rozdeleni). ###

t.test(zadani,alternative="two.sided",conf.level=0.95)$conf.int

###   (e) Urcete 90% intervalovy oboustranny odhad rozptylu #
#         (predpokladame, ze data pochazi z normalniho rozdeleni). ###

skv<-var(zadani$iq)
n<-length(zadani$iq)
alfa<-0.1
dolni<-(n-1)*skv/qchisq(1-alfa/2,df=n-1)
horni<-(n-1)*skv/qchisq(alfa/2,df=n-1)
intervalovy_odhad<-c(dolni,horni)
intervalovy_odhad

### 4. Nasledujici otazky nesouvisi s R-kem, ale je dobre si to promyslet. #
#      Odpovezte na nasledujici otazky ANO/NE/NELZE RICI: ###

###   (a) Jestlize stredni hodnota µ lezi uvnitr 95% intervalu spolehlivosti, lezi i v 90% intervalu? ###
NELZE RICI
###   (b) Jestlize lezi stredni hodnota µ v 90% intervalu spolehlivosti, lezi i v 95% intervalu? ###
ANO
###   (c) Jestlize stredni hodnota µ nelezi v 95% intervalu spolehlivosti, muze lezet v 90% intervalu spolehlivosti? ###
NE
###   (d) Jestlize stredni hodnota µ nelezi v 95% intervalu spolehlivosti, muze lezet v 99% intervalu spolehlivosti? ###
ANO
### Predpokladame porad ten samy nahodny vyber ###
