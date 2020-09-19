# Vypracovani 7. domaciho ukolu #
# Jaroslav Langer, 2020/04/12 #

# Konstanty #
KOREN <- "C:\\Users\\lange\\VSCHT_FIT\\6_APS"
DATA <- "data"
ZADANI <- "iq.txt"

### 1. Stahnete si soubor iq.txt. ### 

zadani <- read.table(paste(KOREN, DATA, ZADANI, sep="\\"), header = FALSE)
zadani # vypis
names(zadani)[names(zadani) == "V1"] <- "iq"
names(zadani) # vypis

### 2. Projdete si pomoci ukazkoveho zdrojoveho kodu soubor dat. ###

summary(zadani)	## vypise minima, maxima, kvartily, vyberovy prumer  a median
quantile(zadani$iq ,c(0.1,0.25,0.5,0.75,0.9))  ## vypise decily a kvartily

### 3. (a) Jaky je vyberovy prumer IQ? ###

mean(zadani$iq)

###    (b) Kolik je vyberova smerodatna odchylka? ###

sd(zadani$iq)

###    (c) Kolik je vyberovy rozptyl? ###

var(zadani$iq)

###    (d) Urcete vsechny vyberove kvartily. ###

quantile(zadani$iq, c(0.25, 0.5, 0.75))

###    (e) Vypada to, ze data pochazi z normalniho rozdeleni? Zduvodnete. ###

qqnorm(zadani$iq) # Vypada to ze ano, 
# protoze si kvantily z iq a normalniho rozdeleni dobre odpovidaji

###    (f) Kolik je mezikvartilove rozpeti? Kolik je variacni rozpeti? ###

quantile(zadani$iq, 0.75) - quantile(zadani$iq, 0.25)
max(zadani$iq) - min(zadani$iq)
