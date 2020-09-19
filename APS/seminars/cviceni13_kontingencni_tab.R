##############################################################
####### TEST NEZAVISLOSTI V KONTINGENCNICH TABULKACH #########
##############################################################

## dneska nas ceka novinka, budeme pracovat s daty, ktera jsou
## primo implementovana v R-ku
## takovych data setu je mnoho, vetsinou slouzi jako idealni
## ukazkova data pro nejakou specifickou metodu

HairEyeColor ## nase data obsahuji informaci o barve vlasu, oci a o pohlavi
             ## 592 studentu

require(graphics)  ## jiny zpusob nacteni knihovny "graphics"
                   ## jenom kvuli te mozaice

## krabicove vykresleni jednotlivych kategorii
mosaicplot(HairEyeColor)

## vytvorime si dvojrozmerne kontingencni tabulky

vlasyoci <- apply(HairEyeColor, c(1, 2), sum)
vlasyXY <- apply(HairEyeColor, c(1, 3), sum)
ociXY <- apply(HairEyeColor, c(2, 3), sum)

mosaicplot(vlasyoci, main = "vztah mezi barvou oci a vlasu")
   ## vykresleni bez rozliseni pohlavi

mosaicplot(vlasyXY, main = "vztah mezi barvou vlasu a pohlavim")
   ## bez rozliseni barvy oci

mosaicplot(ociXY, main = "vztah mezi barvou oci a pohlavim")

## muzeme se podivat na odhady pravdepodobnosti jednotlivych trid:

prop.table(vlasyoci)
prop.table(vlasyoci)* sum(vlasyoci)  ## skutecne je to v poradku

prop.table(ociXY)
prop.table(vlasyXY)

#### samotny test:

chisq.test(vlasyoci)
chisq.test(vlasyXY)
chisq.test(ociXY)

########################################################################
########################################################################

##### NADSTAVBA NAD TIMTO KURZEM:
################

## Fisheruv exaktni test je na rozdil od chi-kvadrat testu dobre shody
## presny, nikoliv asymptoticky, tedy nema takove problemy s malymi vybery:

fisher.test(vlasyXY)
fisher.test(ociXY)

## bohuzel, tabulka 4x4 je uz moc velka :-(




## VICEPOLNI TABULKA:

require(DescTools)    ## je treba teto knihovny

vsechno<-apply(HairEyeColor, c(1, 2,3), sum)

## test vicepolni tabulka:

mantelhaen.test(vsechno)

## co by udelal chi^2 test?
chisq.test(ftable(HairEyeColor))


## MIRA ZAVISLOSTI:

## toto cislo Cramerovo V je v intervalu [0,1] a cim blize je jednicce, 
## tim je silnejsi zavislost, blizko nule je zavislost slaba
## nevyhoda: spatna interpretace (nelze rict, zda V = 0.62 je silna, ci slaba zavislost)

CramerV(vlasyoci)
CramerV(vlasyXY)
CramerV(ociXY)