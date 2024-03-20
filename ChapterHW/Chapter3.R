die <- c(1, 2, 3, 4, 5, 6)
die
is.vector(die)
five <- 5
is.vector(five)
length(five)
length(die)
int <- 1L
text <- "ace"

int <- c(1L, 5L)
text <- c("ace", "hearts")
sum(int)
int
typeof(die)

int <- c(-1L, 2L, 4L)
int
sqrt(2)^2 - 2

logic <- c(TRUE, FALSE, TRUE)
logic

typeof(logic)
typeof(F)

comp <- c(1 + 1i, 1 + 2i, 1 + 3i)
comp

raw(3)
typeof(raw(3))
hand <- c("ace", "king", "queen", "jack", "ten")
hand

#Attributes
die <- c(1, 2, 3, 4, 5, 6)
die
is.vector(die)
five <- 5
is.vector(five)
length(five)
length(die)
int <- 1L
text <- "ace"

int <- c(1L, 5L)
text <- c("ace", "hearts")
sum(int)
int
typeof(die)

int <- c(-1L, 2L, 4L)
int
sqrt(2)^2 - 2

#Names

names(die)
names(die) <- c("one", "two", "three", "four", "five", "six")
names(die)
attributes(die)

names(die) <- c("uno", "dos", "tres", "quatro", "cinco", "seis")
die

names(die) <- NULL
die

#Dim
dim(die) <- c(2, 3)
die

dim(die) <- c(3, 2)
die

dim(die) <- c(1, 2, 3)
die

m <- matrix(die, nrow = 2)
m

m <- matrix(die, nrow = 2, byrow = TRUE)
m

#Arrays
ar <- array(c(11:14, 21:24, 31:34), dim = c(2, 2, 3))
ar

gender <- factor(c("male", "female", "female", "male"))
typeof(gender)
attributes(gender)

gender
as.character(gender)

card <- c("ace", "hearts", 1)
card

as.character(1)
as.logical(1)
as.numeric(FALSE)

hand1 <- c("ace", "king", "queen", "jack", "ten", "spades", "spades", "spades", "spades", "spades")
matrix(hand1, nrow = 5)

hand2 <- c("ace", "spades", "king", "spades", "queen", "spades", "jack", "spades", "ten", "spades")
matrix(hand2, nrow = 5, byrow = TRUE)

class("Hello")
class(5)

list1 <- list(100:130, "R", list(TRUE, FALSE))
list1

[[1]]
[1] 100 101 102 103 104 105 106 107 108 109 110 111 112 113 114 115 116 117 118 119 120 121 122 123 124 125 126 127 128 129 130

[[2]]
[1] "R"

[[3]]
[[3]][[1]]
[1] TRUE

[[3]][[2]]
[1] FALSE

card <- list(face = "ace", suit = "hearts", value = 1)
card

$face
[1] "ace"

$suit
[1] "hearts"

$value
[1] 1

df <- data.frame(face = c("ace", "two", "six"),
                 suit = c("clubs", "clubs", "clubs"),
                 value = c(1, 2, 3))
df

face  suit value
1  ace clubs     1
2  two clubs     2
3  six clubs     3


