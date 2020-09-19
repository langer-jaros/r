### Dneska budeme zkoumat zavislost kvantivativnich velicin
### Pripomenme si, ze se jedna o veliciny, jejichz ciselne vysledky dava smysl 
### usporadat. Tj., je-li realizace NV vetsi nez jina jeji realizace, dava to 
### nejaky interpretacni smysl (ne jako kdyz barvam vlasu dodame ciselnou hodnotu)


korelace<-read.table("C:\\...\\M_CH.txt", header = T)
        ## tato SKUTECNA data obsahuji prumerne znamky z matematiky a chemie 
        ## ze stredoskolskeho studia u sta studentu VSCHT ucastnicich se prvniho 
        ## zkouskoveho terminu z Matematiky I v zimnim semestru akademickeho roku 2015-2016

korelace<-as.matrix(korelace)   ## opet, je dobre udelat z dat matici

summary(korelace)               ## a vzdycky je dobre podivat se na zakladni vyberove charakteristiky
plot(korelace)                  ## pro zkoumani zavislosti dvou velicin je dulezite mrknout
                                ## na jejich vzajemny vztah


cor(korelace, method = "pearson")   ## klasicky vyberovy korelacni koeficient (Pearsonuv)
cor(korelace, method = "spearman")  ## Spearman indikuje vzaj. monotonii, nikoliv primo lin. vztah
cor(korelace, method = "kendall")   ## Kendalluv je mene citlivy nez Spearman na male mnozstvi pozorovani

# Jak vidime, VSECHNY tri koeficinety jsou kladne. Zda se tedy, ze lepsi znamka z jednoho predmetu
# indikuje lepsi znamku z druheho, budeme tedy testovat oproti alternative "greater"

cor.test(korelace[,1], korelace[,2], alternative = "greater", method = "pearson")
cor.test(korelace[,1], korelace[,2], alternative = "greater", method = "spearman")
cor.test(korelace[,1], korelace[,2], alternative = "greater", method = "kendall")

## Spearman a Kendall jsou tzv. neparametricke testy (nepracuji na zaklade odhadu parametru 
## rozdeleni, nybrz na tzv. poradovych statistikach - jsou "obecnejsi"
## take na rozdil od Pearsona neidikuji miru linearni zavislosti, ale monotonni zavislosti


## a protoze tohle tema bylo kratke a casto se vlastne clovek setka s vice nez 2-rozmernym
## nahodnym vektorem (jeho realizacemi), ukazeme Vam (nad ramec obsahu kurzu)
## jak opticky lepe zpracovat korelacni matice (Pearson) pro vice promennych

korelace2<-read.table("C:\\...\\predmety.txt", header = T)

library(corrplot)
corrplot(cor(korelace2), method="number")
corrplot(cor(korelace2), method="ellipse")

