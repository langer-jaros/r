# Vypracovani 5. domaciho ukolu #
# Jaroslav Langer, 2020/04/05 #

# Konstanty #
KOREN <- "C:\\Users\\lange\\VSCHT_FIT\\6_APS"
DATA <- "data"
ZADANI <- "jizda.txt"
DRAHA <- "draha"
CAS <- "cas"
UKOLY <- "homeworks"
UKOL <- "ukol5.csv"

### 1. Nactete si data ze souboru jizda.txt ###

CESTA <- paste(KOREN, DATA, ZADANI, sep="\\")
zadani <- read.table(CESTA, header = TRUE)
CESTA <- NULL # poctive nuluji

zadani # vypis

### 2. Jaka maximalni draha byla ujeta? ###

max(zadani[DRAHA])
max(zadani[DRAHA]) == max(zadani[,2]) # vraci stejny vysledek

### 3. Jak dlouho v prumeru autum trvala jizda? ###

mean(zadani[,1])
# mean(zadani["cas"]) # tohle nefunguje :/ asi mean neumi data frame

### 4. vytvorte promennou (vektor) RYCHLOST a ulozte do ni prumernou rychlost jednotlivych
aut ###

RYCHLOST <- zadani[DRAHA] / zadani[CAS]
RYCHLOST # vypis

# Test jestli jsou zpusoby stejne #
RYCHLOST_JINAK <- zadani[,2] / zadani[,1]
sum(RYCHLOST == RYCHLOST_JINAK) == length(RYCHLOST_JINAK) # Test jestli jsou zpusoby stejne

### 5. Jaka byla minimalni prumerna rychlost? ###

min(RYCHLOST)

### 6. K udajum o dobe jizdy a ujete draze pridejte sloupec RYCHLOST ###

ukol <- cbind(zadani, RYCHLOST)
names(ukol)[3] = "prumerna rychlost"
ukol # vypis

### 7. Zapiste tato data do souboru UKOL nekam na svuj disk ###

CESTA <- paste(KOREN, UKOLY, UKOL, sep="\\")

write.table(ukol, CESTA, row.names=FALSE)

CESTA <- NULL # poctive nuluji
