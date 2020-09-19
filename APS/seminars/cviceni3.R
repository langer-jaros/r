#### dnes nas cekaji matice #####

matrix(c(0,2,-1,3,10,0.5), nrow = 2, ncol = 3) 
     ## vytvori matici 2x3 s hodnotami 0,2,-1,3,10,0.5..pozor!! uklada po sloupcich
matrix(1:16, nrow = 4)
matrix(1:16, ncol = 4)   ## jak vidime, vede to k tez matici, usporadava prvky1..9
                         ##  1..9 do sloupcu
matrix(c(0,2,-1,3,10,0.5), nrow = 2, ncol = 3, byrow=TRUE)
                         ## chceme -li ukladat do radku

matice1<-matrix(1:16, nrow=4, byrow=TRUE)
matice1
matice1[2,4]              ## prvek na pozici (2,4)
matice1[,2]               ## druhy sloupec matice
matice1[3,]               ## 3. radek matice
matice1[15,19]            ## matice ma, pevnou strukturu,
                         ## chceme-li tedy prvek "mimo" matici, ale stezuje si

### SAMI: a) vypiste prvek ve 3. radku a prvnim sloupci matice1
###       b) prvni sloupec matice1
###       c) 4. radek matice1

matice1[3,1]
matice1[,1]
matice1[4]


matice1[3,4]<- -2   ## prvek na pozici 3. radku a 4. sloupce 
                    ## nahradime hodnotou -2

### SAMI: a) vytvorte matici jmenem SROUBEK typu 2x3
###          s prvky (po radcich): 3,0,-1.2,0.55,4,-7
###       b) prvek na pozici [1,3] v matici SROUBEK nahradte cislem 8

SROUBEK <- matrix(c(3,0,-1.2,0.55,4,-7), nrow=2, byrow=TRUE)
SROUBEK

SROUBEK[1,3] <- 8
SROUBEK

maticka<-matrix(nrow=5, ncol=9)
maticka             ## nezadame-li matici, vytvori matici "prazdnou", 
                    ## ale danych rozmeru

maticka[1,]<-1:9

maticka<-cbind(maticka,1:5)  ## pridame sloupec na konec matice
maticka

maticka<-rbind(-5:4,maticka) ## pridame radek na zacatek matice
maticka

maticka[2,c(1,7)]   ## vektor 1. a 7. prvku z 2. radku
maticka[c(1,5,6),3] ## vektor 1.,6. a 7. prvku z 3. sloupce
maticka2<-maticka[c(1,2),c(4,6)]
maticka2

### SAMI: a) do vasi matice SROUBEK pridejte nakonec sloupec (-1,0)
###       b) do Vasi matice SROUBEK pridejte na zacatek radek samych 2
###       c) vytvorte vektor VEK a do nej ulozte 3.4. a 5. prvek
###          druheho radku matice SROUBEK



SROUBEK <- cbind(SROUBEK, c(-1,0))
SROUBEK <- rbind(2, SROUBEK)
SROUBEK 

VEK <- SROUBEK[2, c(3,4,5)]
VEK

maticka<-maticka[-1,]  ## odstrani 1. radek z matice maticka
maticka1<-maticka[,-3] ## do maticka1 ulozi maticku krome 3. sloupce
maticka1
maticka3<-maticka[-c(4,5),-c(1,2)]  ## odstrani 1. sloupec z matice maticka
maticka3

### SAMI: z matice SROUBEK odstrante 2. sloupec a pak 1. radek

### ted uz mame zakladni praci se vsemi nejbeznejsimi strukturami definovanou 
### a priste zacneme pracovat s daty

SROUBEK <- SROUBEK[,-2]
SROUBEK <- SROUBEK[-1,]

SROUBEK