## ------------------------------------------------------------------------
library(foofactors)
a <- factor(c("character", "hits", "your", "eyeballs"))
b <- factor(c("but", "integer", "where it", "counts"))

## ------------------------------------------------------------------------
c(a, b)

## ------------------------------------------------------------------------
fbind(a, b)

## ------------------------------------------------------------------------
set.seed(1234)
x <- factor(sample(letters[1:5], size = 100, replace = TRUE))
table(x)
as.data.frame(table(x))

## ------------------------------------------------------------------------
freq_out(x)

## ------------------------------------------------------------------------
a <- factor(c("A","A","B"))
length(unique(a))
length(a)
detect_fct(a)

## ------------------------------------------------------------------------
b <- factor(c("A","B","C"))
length(unique(b))
length(b)
detect_fct(b)

## ------------------------------------------------------------------------
a <- factor(c("1","3","2","6"))
levels(a)
levels(reorder_desc(a))

b <- factor(c("Statistics","Mathematics","Computer Science"))
levels(b)
levels(reorder_desc(b))

