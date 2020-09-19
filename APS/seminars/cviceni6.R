### 1. DISKRETNI NAHODNE VELICINY

## i) generovani z rovnomerneho diskretniho rozdeleni
#####################################################

sample(10, size=1, replace = FALSE, prob = NULL)

# 10 znamena, ze generujeme z cisel 1..10
# size pocet vygenerovanych realizaci
# replace .. zda se mohou hodnoty opakovat (pro size > 1)
# prob = NULL znamena rovnomerne rozd. na 1..10

### generovani z diskretniho rozdeleni s konecne moznostmi

sample(c(0.1,0.3,5,-1),replace=TRUE, size=3,prob=c(0.1,0.2,0.4,0.3))

# generujeme 3 cisla z cisel 0.1,0.3,5,-1 s pstmi 0.1,0.2,0.4,0.3
# mohou se opakovat

###############################
### SAMI:
###      vygenerujte 5 cisel z cisel 5,7,10,11,14 s pstmi 0.1,0.2,0.3,0.05,0.35
###      a) bez opakovani
###      b) s opakovanim 
###############################

sample(c(5,7,10,11,14),replace=FALSE, size=5,prob=c(0.1,0.2,0.3,0.05,0.35))
sample(c(5,7,10,11,14),replace=TRUE, size=5,prob=c(0.1,0.2,0.3,0.05,0.35))

## ii) generovani z alternativniho rozdeleni s parametrem p
###########################################################

# nema (aspon o tom nevim) vlastni prikaz lze bud pres sample:
p<-0.1
sample(c(0,1),1,prob=c(1-p,p))  

# nebo lze i pres binomicke (za chvili)


## iii) generovani z binomickeho rozdeleni Bi(size,prob)
########################################################

# pozor: n = pocet vygenerovanych realizaci z Bi(size,prob)
# pozor: size = pocet pokusu v nichz zkoumame pocet uspesnych
# prob = pst uspechu v jednotlivych pokusech

## pro binomicke uz si muzeme spocitat dalsi veci

#dbinom(x, size, prob, log = FALSE)   ## "hustota"(pstni fce) p(x)
                                      ## binomickeho rozdeleni
dbinom(3, 6, 0.8)  # = P(X = 3)
dbinom(6, 6, 0.8)  # = P(X = 6)

# pbinom(q, size, prob, lower.tail = TRUE, log.p = FALSE)
                            ## distribucni fce rozdeleni v bode q
                            ## pokud lower.tail = FALSE, spocte P[X>q]
pbinom(4.2,6,0.8)
pbinom(4.5,6,0.8)  # stejne, mezi 4.2 a 4.5 se pst nemeni

# kvantilova funkce
# qbinom(p, size, prob, lower.tail = TRUE, log.p = FALSE)
                            ## p..vektor nebo 1 hodnota alfa (p=0.5 ... 50%kvantil)
                            ## p mezi 0 a 1!!
                            ## lower.tail = FALSE..kriticka hodnota
qbinom(c(0.1,0.45,0.9),size =6,prob=0.8) ## urci 10%, 45% a 90% kvantil pro Bi(6,0.8)

# generovani nahodne veliciny s Bi9size, prob)
# rbinom(n, size, prob)
                            ## n..pocet vygenerovanych realizaci
                            ## size..parametr rozdeleni (my znacime n)
                            ## prob.. pst uspechu v jednotlivych pokusech
rbinom(5,6,0.8)             ## pokud dodrzite poradi parametru fce, nemusite psat 
                            ## jejich nazvy
rbinom(size=6,n=5,prob=0.8) ## pokud napisete nazvy parametru, zvladne je i v jinem poradi
                            ## lepsi psat alespon size nebo n/x/q
  
################################
### SAMI: uvazujte NV X~Bi(10,0.25)
###      a) spoctete pst P(X = 4), P(X = 0), P(X = 6)
###      b) urcete P(X <= 5)
###      c) urcete vsechny kvartily
###      d) vygenerujte 15 realizaci z tohoto rozdeleni
###      e) pomoci prikazu rbinom generujte z alternativniho rozd. s par.0.4
################################

# a
dbinom(c(4,0,6), 10, 0.25)
# b
pbinom(5, 10, 0.25)
# c
qbinom(c(0.25, 0.5, 0.75), 10, 0.25)
# d
rbinom(15, 10, 0.25)
# e
rbinom(10, 1, 0.4)

## iv) geometricke rozdeleni X~Ge(prob)

# dgeom(x, prob, log = FALSE)   ## pstni fce
dgeom(3, prob=0.8)             ## P(X = 3)

# pgeom(q, prob, lower.tail = TRUE, log.p = FALSE) ## distribucni fce
pgeom(4,prob=0.8)  ## P(X =< 4)

# qgeom(p, prob, lower.tail = TRUE, log.p = FALSE) ## kvantilova fce

# rgeom(n, prob)   ## generovani n realizaci z Ge(prob)

#################################
### SAMI: Uvazujte X~Ge(0.2)
###       a) spoctete P(X = 5), P(X = 2)
###       b) spoctete P(X =< 11), P(X > 7)
###       c) urcete 13% kvantil
###       d) vygenerujte 5 realizaci z tohoto rozdeleni
#################################

## v) Poissonovo rozdeleni X~Po(lambda)

# dpois(x, lambda, log = FALSE)  ## pstni funkce v bode x pri parametru lambda
dpois(3, lambda=5)               ## P(X = 3)

# ppois(q, lambda, lower.tail = TRUE, log.p = FALSE)  ## Distribucni fce v bode q
ppois(3.5,lambda=5)                   ## P(X=<3.5)
ppois(3.5,lambda=5,lower.tail=FALSE)  ## P(X > 3.5)

#qpois(p, lambda, lower.tail = TRUE, log.p = FALSE) ## kvantilova fce

# rpois(n, lambda)      ## generuje n realizaci z Po(lambda)

##################################
### SAMI: Uvazujte X~Po(2)
###       a) spoctete P(X = 3), P(X = 0)
###       b) spoctete P(X =< 6), P(X > 7)
###       c) urcete 20% kvantil
###       d) vygenerujte 7 realizaci z tohoto rozdeleni
##################################

### 2. SPOJITE NAHODNE VELICINY

## i) rovnomerne na intervalu [min,max]

#dunif(x, min = 0, max = 1, log = FALSE) ## hustota v bode x
dunif(13, min = 5,max = 13.5)

# punif(q, min = 0, max = 1, lower.tail = TRUE, log.p = FALSE)
                                         ## Distr. fce v bode q
punif(15, min = 5, max = 13.5)

# qunif(p, min = 0, max = 1, lower.tail = TRUE, log.p = FALSE)
                                         ## kvantilova fce

#runif(n, min = 0, max = 1)    ## generuje n realizaci z R[min, max]
runif(15, min = 5, max = 13.5)

##################################
### SAMI: Uvazujte X~R[-1,1]
###       a) spoctete hustotu v bode 0, 1.4 a 15
###       b) spoctete P(X =< 0.5), P(X > 0.75)
###       c) urcete 11% kvantil
###       d) vygenerujte 3 realizace z tohoto rozdeleni
##################################

## ii) exponencialni rozdeleni X~Exp(lambda), kde rate = 1/lambda je str. hodnota!!!!

# pozor, rate je prevracena hodnota nasi lambdy!!  (EX=rate)
# dexp(x, rate = 1, log = FALSE)     ## hustota

# pexp(q, rate = 1, lower.tail = TRUE, log.p = FALSE)
                                     ## Distribucni fce

# qexp(p, rate = 1, lower.tail = TRUE, log.p = FALSE) 
                                     ## kvantilova fce

# rexp(n, rate = 1)                  ## generovani n realizaci 

##################################
### SAMI: Uvazujte X~Exp se stredni hodnotou 3
###       a) spoctete hustotu v bode 0.1, 11.4
###       b) spoctete P(X =< 3), P(X > 0)
###       c) urcete 10% kvantil
###       d) vygenerujte 4 realizace z tohoto rozdeleni
##################################

## iii) normalni rozdeleni se str. hodnotou mean a smer. odchylkou sd

# dnorm(x, mean = 0, sd = 1, log = FALSE)
                                 ## hustota norm rozd N(mean,sd)

# pnorm(q, mean = 0, sd = 1, lower.tail = TRUE, log.p = FALSE)
                                 ## distribucni funcke

# qnorm(p, mean = 0, sd = 1, lower.tail = TRUE, log.p = FALSE)
                                 ## kvantilova fce

# rnorm(n, mean = 0, sd = 1)     ## generovani n realizaci
                                
##################################
### SAMI: Uvazujte X~N(-2,4)
###       a) spoctete hustotu v bode -1, 12
###       b) spoctete P(X =< -2), P(X > 0)
###       c) urcete vsechny kvartily
###       d) vygenerujte 3 realizace z tohoto rozdeleni
###       e) prepocitejte si priklady z cviceni misto tabulky s 
###          vyuzitim softwaru
##################################

