# R (language)

`2020/10/01 Jaroslav Langer`

Repository for learning the r language.

## Content
- [Install R (ubuntu)](#install-r-(ubuntu))
- [Run R](#run-r)
- [Jupyter notebook](#jupyter-notebook)
- [Comments](#comments)
- [Printing](#printing)
- [Variables](#variables)
- [Operators](#operators)
- [Vectors](#vectors)
- [List](#list)
- [](#)
- [](#)
- [Length and dim](#length-and-dim)
- [Strings](#strings)
- [Mathematical functions](#mathematical-functions)
- [Conditions](#conditions)
- [Loops](#loops)
- [Functions](#functions)
- [Base package](#base-package)
- [Functional programming](#functional-programming)
- [TODO](#todo)
- [](#)


## Install R (ubuntu)

```sh
sudo add-apt-repository 'deb https://cloud.r-project.org/bin/linux/ubuntu bionic-cran40/'
sudo apt update
sudo apt install r-base
```

### Further installation for jupyter notebook

```sh
sudo apt-get install libzmq3-dev libcurl4-openssl-dev libssl-dev jupyter-core jupyter-client
```

```sh
cd folder_to_install_irkernel
# Start R
sudo R
```

```r
install.packages(c('repr', 'IRdisplay', 'IRkernel'), type = 'source')
# User specific installation
IRkernel::installspec()
# User non-specific installation
IRkernel::installspec(user = FALSE)
```

[source](https://irkernel.github.io/installation/#linux-panel)

## Run R

### R in terminal

```sh
# Start R in terminal
R
```

```r
# Quit
q()
```

### Run R scripts

```sh
Rscript r_commands.r
```

## Jupyter notebook

### Quick look to the documentation

```r
? almost_anything
```
Exit on press "q"

## Comments

```r
# classical comment
```

## Printing

```r
# just write anything you want to print
"Anything"
print("Anything")
```

## Variables

### Assigning variables

```r
my_var <- 7
# my_var = 8 # dont use this one
my_var <<- 10 # later more
```

### Variable types

```r
my_integer <- 1
my_double <- 1.1
my_string <- "1.1 km"
my_boolean <- FALSE
```

### Typeof, mode, class

typeof - The Type of an Object

```r
# Types of variables
typeof(1) # double, WAT?
typeof(as.integer(1)) # integer, ok
```

mode - The (Storage) Mode of an Object

```r
# Maybe modes of object better
mode(1) # numeric
mode(as.integer(1)) # numeric
```

class - Object Classes

```r
# Class
class(1) # 'numeric'
```

[Yet don't understand, but this link looks good](https://stackoverflow.com/questions/35445112/what-is-the-difference-between-mode-and-class-in-r)

### Convert variable types

```r
int <- '1'
long <- 1L

as.integer(int)
as.double(1L)
as.character(1L)
```

## Operators

### Mathematical operators

```r
# + - * / ()
(1 + 2 - 3) * 10/3
# powers (probably the same)
2 ** 2 ^ 3
# Modulo
123 %% 7
# Devision
123 %/% 7
```

### Logical operators

```r
TRUE == T
FALSE != F
T && T
T || F
xor(T, F)
```

### Identical comparation

```r
# == automatically casts the operands to match type
1.0 == as.integer(1.0) # TRUE
# Use identical for stronger comparism
identical(1.0, as.integer(1.0)) # FALSE
```

## Vectors

```r
vector('numeric', len)
```

### Revert order of vector values

```r
rev(1:10)
```

### Replicates the given values by n

```r
rep(1, 5) # 1 1 1 1 1
```

### Initialize by types

```r
logical(5)
integer(5)
double(5)
character(10)
```

### Combine values into vector 

```r
# Creating vector with enumeration # 1 2 3 4 5
VECTOR <- c(1, 2, 3, 4, 5)
```

### sequences

```r
# Create as sequence with begining, end and step
seq(5) # 1 2 3 4 5
seq(5, 9) # 5 6 7 8 9
seq(5, 7, 0.5) # 5.0 5.5 6.0 6.5 7.0

# Create vector with range # 1 2 3 4 5 6 7
VECTOR  <- 1:7
# Works with any range, takes both edge values # 2 1 0 -1 -2
VECTOR  <- 2:-2
```

### Accessing vectors

Indices, slices and masks

```r
my_vector <- seq(5)
my_vector[5]
my_vector[c(1, 4)]
my_vector[seq(1, 3)]
mask <- c(TRUE, TRUE, FALSE, TRUE, FALSE)
my_vector[mask]
my_vector[c(FALSE, TRUE)] # 2 4 (repeats F, T and again F, T ...)
my_vector[c(FALSE, TRUE) & c(T, T)]
my_vector[-2]
my_vector[-2:5]
```

## List

```r
list(1,2,3)
```

### Access list

```r
# Access list item
ll[1]
# Access value of the item
ll[[1]]
```

## Matrix

## Factors

## Length and dim

```r
# Lenght of a vector
lenght(c(1, 2, 3)) # 3

# Dimension
dim(c(1, 2, 3))
```

## Strings

```r
# Concatenating strings
PATH <- paste(ROOT, DATA, TASK, sep="\\")
# Concat strings of vector
paste(c('1', '2', '3'), collapse="")

# Split string into list
list <- strsplit(string, "")
# Regex works (unless fixed=T set )
splited <- strsplit(text, "(,?\\??\\.? )|(\\?|\\.|\\!)")[[1]]
```

### Letters

```r
# Vector of alphabet characters
letters
# Make lower case, upper case 
tolower('A')
toupper('b')
# Is item in vector - operator in
'a' %in% letters # TRUE
c('a', 'b') %in% letters # TRUE TRUE
# get index of item
which(letters == 'e') # 5
#
```

## Mathematical functions

```r
sum(c(1,2,3,4))

mean(c(1,2,3,4))

ceiling(log2(118))

floor(log(35))

abs(-320)
```

## Conditions

```r
if (condition) {
    stuff()
} else if (condition_1) {
    stuff_1()
} else {
    stuff_final()
}
```

### Ternary condition

```r
# (Condition, positive, negative)
ifelse(counts[i] != 0, letters_present <- c(letters_present, letters[i]), "")
```

## Loops

```r
for (val in sequence) {
    statement
}
```

## Functions

```r
function_name <- function(arg_1, arg_2)
{
    c("Evaluation of the last statement is returned", arg_1, arg_2)
}
```

## Base package

### Unique

```r
unique(c('ba', 'ab', 'ab', 'aa')) # "ba" "ab" "aa"
```

### Sort and Order

```r
# Order items
sort(unique(c('ba', 'ab', 'ab', 'aa'))) # "aa" "ab" "ba"
# Return indices of sorted array
order(unique(c('ba', 'ab', 'ab', 'aa')))
```

## Functional programming

Lambda, Map, Reduce, Filter

[link](https://helloacm.com/r-programming-tutorial-map-reduce-filter-and-lambda-examples/)

## TODO

```r
table<-read.table(cesta, header = TRUE) #je tam hlavicka takze Header = True

table<- table[,1]

summary(table)

sd(table)

boxplot(table)

hist(table,breaks=15)  #velky kopecek je na 90, neni na 94

qqnorm(table)

qqline(table,col="red")  #nerekla bych ze to lezi na jedne primce

statistika <- (mean(table)-mu_0)*sqrt(length(table))/sd(table)

kvantil<-qt(1-alfa/2, length(table)-1 )

ifelse(abs(statistika)>kvantil, "zamitame H_0", "nezamitame H_0")

test_r<-t.test(table, mu=100, alternative ="less", conf.level=0.95)

https://www.rdocumentation.org/collaborators/name/R-core%20R-core@R-project.org
```