# Foofactors Vignette
Qiaoyue Tang  
`r Sys.Date()`  

Factors are a very useful type of variable in R, but they can also drive you nuts. Especially the "stealth factor" that you think of as character.

Can we soften some of their sharp edges?

Binding two factors via `fbind()`:


```r
library(foofactors)
a <- factor(c("character", "hits", "your", "eyeballs"))
b <- factor(c("but", "integer", "where it", "counts"))
```

Simply catenating two factors leads to a result that most don't expect.


```r
c(a, b)
```

```
## [1] 1 3 4 2 1 3 4 2
```

The `fbind()` function glues two factors together and returns factor.


```r
fbind(a, b)
```

```
## [1] character hits      your      eyeballs  but       integer   where it 
## [8] counts   
## Levels: but character counts eyeballs hits integer where it your
```

Often we want a table of frequencies for the levels of a factor. The base `table()` function returns an object of class `table`, which can be inconvenient for downstream work.  Processing with `as.data.frame()` can be helpful but it's a bit clunky.


```r
set.seed(1234)
x <- factor(sample(letters[1:5], size = 100, replace = TRUE))
table(x)
```

```
## x
##  a  b  c  d  e 
## 25 26 17 17 15
```

```r
as.data.frame(table(x))
```

```
##   x Freq
## 1 a   25
## 2 b   26
## 3 c   17
## 4 d   17
## 5 e   15
```

The `freq_out()` function returns a frequency table as a well-named `tbl_df`:


```r
freq_out(x)
```

```
## # A tibble: 5 x 2
##        x     n
##   <fctr> <int>
## 1      a    25
## 2      b    26
## 3      c    17
## 4      d    17
## 5      e    15
```


R is not so good as detecting whether a factor is actually just characters. We consider a factor is a true factor when the number of unique values in it does not equal to the length of it. For example, this is a factor with two levels:


```r
a <- factor(c("A","A","B"))
length(unique(a))
```

```
## [1] 2
```

```r
length(a)
```

```
## [1] 3
```

```r
detect_fct(a)
```

```
## [1] TRUE
```

If the number of unique values does equal to the length of the factor we consider it as characters instead of a factor. For example, this should be characters instead of a factor with three levels:


```r
b <- factor(c("A","B","C"))
length(unique(b))
```

```
## [1] 3
```

```r
length(b)
```

```
## [1] 3
```

```r
detect_fct(b)
```

```
## [1] FALSE
```

This function can reorder the levels of a factor into descending order. The descending levels of strings are automatically considered as descending alphabetical order in R.


```r
a <- factor(c("1","3","2","6"))
levels(a)
```

```
## [1] "1" "2" "3" "6"
```

```r
levels(reorder_desc(a))
```

```
## [1] "6" "3" "2" "1"
```

```r
b <- factor(c("Statistics","Mathematics","Computer Science"))
levels(b)
```

```
## [1] "Computer Science" "Mathematics"      "Statistics"
```

```r
levels(reorder_desc(b))
```

```
## [1] "Statistics"       "Mathematics"      "Computer Science"
```
