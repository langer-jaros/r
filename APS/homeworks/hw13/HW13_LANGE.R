# Vypracovani 13. domaciho ukolu                                                                              #
# Jaroslav Langer, 2020/05/24                                                                                 #

# Konstanty                                                                                                   #
ROOT <- "C:\\Users\\lange\\VSCHT_FIT\\6_APS"
DIR <- "data"

### 1. Nactete si soubor pivokofola.txt                                                                     ###

data <- read.table(paste(ROOT, DIR, "pivokofola.txt", sep="\\"), header = T)
data # vypis

### 2. Pouzijte nasledujici prikaz k uprave dat do typu vhodneho pro kontingencni tabulky                   ### 
###    (naleznete jej i v ukazkovem zdrojovem kodu):                                                        ###

data <- as.table(as.matrix(data))
data # vypis

### 3. Jak vypadaji odhady skutecnych pravdepodobnosti pro danou tabulku?                                   ###

prop.table(data)

### 4. Otestujte pomoci testu dobre shody na Vami zvolene (rozumne) hladine, zda na sobe piti               ###
###    kofoly a piva zavisi. Nezapomente zformulovat odpovidajici statisticke hypotezy                      ###

# H0: veliciny jsou nezavisle (pxy bude blizko px*py pro vsechny x,y nalezici (X, Y))                         #
# H1: veliciny nejsou nezavisle                                                                               #

chisqTestRes <- chisq.test(data)
chisqTestRes # vypis

# alpha = 0.01 - test nezamita H0, veliciny mohou byt nezavisle                                               #
# alpha = 0.05 - test zamita H0, veliciny nejsou nezavisle                                                    #

### 5. Muzete na zaklade vystupu testu z R povazovat predpoklady tohoto testu za splnene?                   ###

# Mohu (pokud nemam vypnute warnings bez meho vedomi)

### 6. Vytvorte v Rku matici obsahujici teoreticke cetnosti, abyste overili, ze predpoklady splneny         ###       
###    skutecne jsou. Prilozte zdrojovy kod (jen pro nasi zajmavost ;-) ).                                  ###

prop.table(data) * sum(data)

### 7. Otestujte nezavislost i pomoci Fisherova exaktniho testu                                             ###

fisherTestRes <- fisher.test(data)
fisherTestRes # vypis

### 8. Porovnejte obe p-hodnoty. Ktera z nich vice odpovida skutecnosti?                                    ###

pValChisq <- chisqTestRes[[3]]
pValFisher <- fisherTestRes[[1]]

equals <- "p-hodnoty obou testu se rovnaji."
chiGreater <- "p-hodnota chi^2 testu je vetsi nez p-hodnota Fisherova testu."
chiSmaller <- "p-hodnota chi^2 testu je mensi nez p-hodnota Fisherova testu."

if (pValChisq == pValFisher) equals else if (pValChisq > pValFisher) chiGreater else chiSmaller

# Skutecnosti vice odpovida p-hodnota Fisherova testu, nebot pro kontingenci tabulky 2x2 neni asymptoticky   #
