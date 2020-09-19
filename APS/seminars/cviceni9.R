## nejprve si nacteme data

pivo<-read.table("C:\\...\\pivo.txt",header = T)
pivo<-pivo[,1]   ## nekdy je potreba jeste explicitne napsat data jako vektor, popr. matici

## vzdycky je dobre si na zacatku udelat nejakou pruzkumovou statistiku

summary(pivo)
sd(pivo)

boxplot(pivo)

## podminkou testovani je normalita dat, tu samozrejme sice neprokazeme,
## ale podivame se, jestli data alespon vypadaji normalne

hist(pivo,breaks=15)

qqnorm(pivo)
qqline(pivo,col="green")

## i kdyby ovsem ne, pozorovani mame dost, aby nam test asymptoticky fungoval

########################################################
######## JEDNOVYBEROVY TEST O STREDNI HODNOTE ##########

########################################################
## podivejme se, ja nyni udelat oboustranny test "rucne"
## predem upozornuji, ze to NEBUDEME potrebovat, takze pokud se Vam to nelibi,
## nectete az po dalsi radek plny krizku :-)

mu_0<-0.5    ## hypoteticka hodnota, kterou testujeme
alfa<-0.05  ## hladina testu

statistika<-(mean(pivo)-mu_0)*sqrt(length(pivo))/sd(pivo)
            ## vypocet testove statistiky

kvantil<-qt(1-alfa/2,length(pivo)-1)
            ## kvantil hodnota k porovnani s testovou statistikou

ifelse(abs(statistika)>kvantil,"zamitame H_0","nezamitame H_0")
            ## porovnani statistiky s kritickym oborem, rovnou napise, zda
            ## zamitame ci nikoliv

phodnota<-2*pt(statistika,length(pivo)-1)
            ## p-hodnota je vlastne funkcni hodnota ditsribucni funkce
            ## vycislena v hodnote testove statistiky
            ## dvojnasobek je tam kvuli oboustrannemu testu (pouzivame alfa/2)
##
#########################################################

## a ted si to konecne ukazeme pomoci R-ka, mnohem snaze a jednoduse
## prikaz uz vlastne zname, je to tentyz jako u int. odhadu 

# jednostranne t-testy
test_l<-(t.test(pivo,mu=0.5,alternative ="less",conf.level=0.95))
test_g<-(t.test(pivo,mu=0.5,alternative ="greater",conf.level=0.95))

## oboustranny t-test
test<-(t.test(pivo,mu=0.5,alternative ="two.sided",conf.level=0.95))

## a co vsechno vlastne timto prikazem zjistime?
test
str(test)

## chceme-li si vypsat jen nektere atributy, muzeme pouzit symbol $

test$statistic       ## hodnota testove statistiky
test$parameter       ## pocet stupnu volnosti (n - 1)
test$p.value         ## p-hodnota
test$conf.int        ## interval spolehlivosti (to uz zname z minula)
test$estimate        ## bodovy odhad stredni hodnoty
test$null.value      ## hypoteticka hodnota, kterou chceme otestovat
test$alternative     ## typ zvolene alternativy
test$method          ## pouzita metoda
test$data.name       ## jmeno datove mnoziny (vyberu) na nemz zakladame test


########################################################
############ JEDNOVYBEROVY TEST O ROZPTYLU #############
########################################################

## opet bychom si ho mohli naprogramovat, ale principu uz rozumime,
## takze uz rovnou prejdeme k testu
## stejne jako u intervalovych odhadu neni tento test v zakladnim 
## balicku, musime si tedy opet nahrat knihovnu TeachingDemos

library(TeachingDemos)

sigma.test(pivo,alternative="less",conf.level=0.95)
sigma.test(pivo,alternative="greater",conf.level=0.95)
sigma.test(pivo,alternative="two.sided",conf.level=0.95)