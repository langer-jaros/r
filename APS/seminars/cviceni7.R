cesta<-"C:\\Users\\zikmundm\\Desktop\\as_online\\data_popisna_statistika.txt"
KOREN <- "C:\\Users\\lange\\VSCHT_FIT\\6_APS"
DATA <- "data"
ZADANI <- "data_popisna_statistika.txt"
CESTA <- paste(KOREN, DATA, ZADANI, sep="\\")

DATA<-read.table(CESTA, header=TRUE)
        ##nacteme data do aktivni mnoziny DATA z uloziste F, slozky Aplikovana statistika
DATA<-DATA[,-1]
names(DATA)=c("bodyPP1","bodyPP2")   ##do hlavicky uvede nazev jednotlivych sloupcu

######################################
##### SUMARNI STATISTIKY #############
######################################

summary(DATA)                       ## vypise minima, maxima, kvartily, vyberovy prumer  a median
quantile(DATA$bodyPP1,c(0.1,0.25,0.5,0.75,0.9))  ## vypise decily a kvartily
quantile(DATA$bodyPP2,c(0.1,0.25,0.5,0.75,0.9))  ## vypise decily a kvartily
mean(DATA[,1])
mean(DATA[,2])

######################################
########## MIRY VARIABILITY ##########
######################################

c(var(DATA[,1]),var(DATA[,2]))
rozptyl<-c(var(DATA$bodyPP1),var(DATA$bodyPP2))     ## vypise vyberovy rozptyl
rozptyl

s_odch<-c(sd(DATA[,1]),sd(DATA[,2]))        ## vypise smerodatne odchylky
s_odch

sqrt(rozptyl)

var_rozpeti<-c(max(DATA$bodyPP1)-min(DATA$bodyPP1),max(DATA$bodyPP2)-min(DATA$bodyPP2))
var_rozpeti

decilove_rozpeti<-c(quantile(DATA$bodyPP1,0.9)-quantile(DATA$bodyPP1,0.1),quantile(DATA$bodyPP2,0.9)-quantile(DATA$bodyPP2,0.1))
decilove_rozpeti

kvartilove_rozpeti<-c(quantile(DATA$bodyPP1,0.75)-quantile(DATA$bodyPP1,0.25),quantile(DATA$bodyPP2,0.75)-quantile(DATA$bodyPP2,0.25))
kvartilove_rozpeti

var_koeficient<-c(sd(DATA[,1])/mean(DATA[,1]),sd(DATA[,2])/mean(DATA[,2]))
var_koeficient


########################################
### VYPOCET KORELACNIHO KOEFICIENTU ####
########################################

cov(DATA)                           ## kovariancni matice
var(DATA)
cor(DATA, method="pearson")         ## Pearsonova korelacni matice 



########################################
########## GRAFICKE VYSTUPY ############
########################################


############# BODOVY GRAF ##############

plot(DATA[,1])
plot(DATA[,2],type="l")
points(DATA[,1],col="red")
plot(DATA)


######## BOXPLOTY #########
boxplot(DATA)

######## HISTOGRAMY #######
hist(DATA[,1])
hist(DATA[,2])

####### Q-Q GRAF #######

qqnorm(DATA[,1])
qqnorm(DATA[,2])
