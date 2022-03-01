rm(list=ls());

x <- 2;
y <- 5;

m<-matrix(data=pi,nrow=x,ncol=y);

mod<-y %% x;

TRUE == T;

sq <- sqrt(y);

sq^2 == y;

all.equal(sq^2, y);

0.3-0.2 == 0.1;

0/0;

0/0 == NaN; # NA: not available
is.nan(0/0);

Inf-Inf;

2*Inf ==Inf;
