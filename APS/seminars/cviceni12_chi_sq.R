### CHI-KVADRAT TEST DOBRE SHODY ###
####################################

help(chisq.test)  ## jak zjistime jiz brzy, tato funkce se pouziva take (a hlavne)
                  ## pro testovani nezavislosti kvalitativnich nahodnych velicin
                  ## my ho dneska pouzijeme pro test dvou diskretnich rozdeleni
                  

####################################
## 1. Rovnomerne diskretni rozdeleni
####################################
"C:\\Users\\zikmundm\\Desktop\\as_online"
data<-read.table("C:\\Users\\zikmundm\\Desktop\\as_online\\kostka.txt", header=F)
data<-data[,-1]
data<-as.matrix(data)
rovnomerne<-data[2,]
rovnomerne<-as.vector(rovnomerne)  ## tohle jsou trochu zbytecne upravy, ale
                                   ## mam rada promenne "ciste"
pr_rovnomerne<-rep(1/length(rovnomerne),length(rovnomerne))
                                   ## vektor pravdepodobnosti

## a ted uz samotny test:
chisq.test(rovnomerne, p = pr_rovnomerne)

#########################
## 2. binomicke rozdeleni
#########################

data<-read.table("C:\\Users\\zikmundm\\Desktop\\as_online\\vajce.txt", header = F)
data<-data[,-1]
data<-as.matrix(data)
binomicke<-data[2,]
binomicke<-as.vector(binomicke)    

## pro binomicke rozdeleni musime odhadnout parametr p
## odhad je p = prumer/pocet pozorovani

odhad_par<-sum(data[1,]*data[2,])/(sum(data[2,])*length(data[2,]))

pr_binom<-dbinom(0:6, size = 6, prob = odhad_par)
                       ## toto je vektor pravdepodobnosti pro binomicke
                       ## rozdeleni s parametry 6 a odhad_par

## a konecne samotny test:

chisq.test(binomicke, p = pr_binom)  ## jak vidime, data nesplnuji predpoklady
                                     ## chisq.testu
## podivejme se na teoreticke cetnosti:
pr_binom*sum(binomicke)

## tyto korekce podobny problem vyresi

chisq.test(binomicke, p = pr_binom,simulate.p.value = T, B = 2000)

########################################
########### TESTY NORMALITY ############

## k testovani normality muzeme samozrejme pouzit chisq.test,
## ale jak jste sami videli, neni primo implementovany a u spojitych
## rozdeleni je predpriprava jeste komplikovanejsi (pocitani pravdepodobnosti
## jednotlivych trid

## ukazeme si tedy vhodnejsi test k testovani normality rozdeleni nah. vyberu:

normalni<-read.table("C:\\Users\\zikmundm\\Desktop\\as_online\\pivo.txt", header = F)
normalni<-as.vector(normalni[,1])

###### 1. Shapiruv - Wilkuv test normality
##################################################

shapiro.test(normalni)

## tento test je vhodny pro vybery o mensim rozsahu, obycejne ho uzivame pro n<= 50

###### 2. Kolmogorovovuv - Smirnovuv test
##################################################

## tento test je obecnejsi, umi jednak testovat shodu i s jinymi rozdelenimi
## ale zaroven je dvouvyberovy - umi testovat, zdali dva nah. vybery maji stejne rozdeleni.

ks.test(normalni, pnorm, mean = mean(normalni),sd = sd(normalni))
ks.test(binomicke, pbinom, size = 6, prob = odhad_par)

###### 3. Implementovany Chi^2-test
##################################################

## potrebuje tyto knihovny:
library(fBasics)
library(nortest)

pchiTest(normalni)

## pro srovnani:
## kdybychom chteli rovnou pouzit chisq.test, museli bychom:
## 1) vytvorit tabulku cetnosti
## 2) spocitat teoreticke pravdepodobnosti jednotlivych trid
