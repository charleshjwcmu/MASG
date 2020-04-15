# TODO: Add comment
# 
# Author: huang
###############################################################################


y <- 1:9
class(y)

mode(y)
class(y)


data.frame(as.matrix(1,1,1,1))
L3 <- LETTERS[1:3]
fac <- sample(L3, 10, replace = TRUE)
(d <- data.frame(VarA = c(1,4,7), VarB =c(2,5,8)))
e <- data.frame(VarC = c(2,5,6), VarD =c(2,5,8))
merge(d,e)

d <- d[1:4,]
d[,-1]
cor.test(d$VarA,d$VarB)
cor.test(VarA,VarB,d)

?cbind
?coerce
?unlist
?coerce
?vector
upper.tri(d)
upper.triangular(d)
d[upper.tri(d)]
upper.diag(d)
?upper.tri
?grep
x <- d[1:4,]

x = c(1,2,3,4)
names(x) <- letters[5:8]

?quit

rownames(d)
colnames(d)
x <- NA
y <- x/1

?match
library(DescTools)



?cor.test








