
?Nile
plot(Nile)

#1
ll <- dlm(m0=1000, C0=1000, FF=1, V=15100, GG=1, W=1470)
unlist(ll)
llFilt <-dlmFilter(Nile,ll)
names(llFilt)
lines(window(llFilt$m,start=start(Nile)[1]),
      type="o",lty=2, pch=4, col="red")
legend("bottomleft",legend=c("data","filtered level"),
       col=c("black", "red"),lty=c(1,2),pch=c(1,2))

listC <- dlmSvd2var(llFilt$U.C, llFilt$D.C)
sqrtC <- sqrt(unlist(listC))
ts.plot(sqrtC[-1], ylab="standard deviation")
ts.plot(sqrtC[-(1:10)])  

plot(Nile)
lines(window(llFilt$m,start=start(Nile)[1]),
      type="o",lty=2, pch=4, col="red")
legend("bottomleft",legend=c("data","filtered level"),
       col=c("black", "red"),lty=c(1,2),pch=c(1,2))
lines(llFilt$m + 2*sqrtC,lty=2,col="green")
lines(llFilt$m - 2*sqrtC,lty=2,col="green")
      
#2
plot(window(Nile, start=1871), type="o", ylab="level", cex=.3)
lines(window(llFilt$f, start=1871), type="o", col=2, cex=.3)

listR <- dlmSvd2var(llFilt$U.R, llFilt$D.R)
sqrtR <- sqrt(unlist(listR))
lines(llFilt$f + 2*(sqrtR),lty=2,col="green")
lines(llFilt$f - 2*(sqrtR),lty=2,col="green")

#3 signal to noise=W/V (the higher it is, the more important the weight of the observations yt)

#example with very high V with respect to W, that is low signal to noise and low importance of the observations

plot(Nile)
ll <- dlm(m0=1000, C0=1000, FF=1, V=10000, GG=1, W=100)
unlist(ll)
llFilt <-dlmFilter(Nile,ll)
names(llFilt)
lines(window(llFilt$m,start=start(Nile)[1]),
      type="o",lty=2, pch=4, col="red")
legend("bottomleft",legend=c("data","filtered level"),
       col=c("black", "red"),lty=c(1,2),pch=c(1,2))

listC <- dlmSvd2var(llFilt$U.C, llFilt$D.C)
sqrtC <- sqrt(unlist(listC))
ts.plot(sqrtC[-1], ylab="standard deviation")
ts.plot(sqrtC[-(1:10)])  

plot(Nile)
lines(window(llFilt$m,start=start(Nile)[1]),
      type="o",lty=2, pch=4, col="red")
legend("bottomleft",legend=c("data","filtered level"),
       col=c("black", "red"),lty=c(1,2),pch=c(1,2))
lines(llFilt$m + 2*sqrtC,lty=2,col="green")
lines(llFilt$m - 2*sqrtC,lty=2,col="green")

plot(window(Nile, start=1871), type="o", ylab="level", cex=.3)
lines(window(llFilt$f, start=1871), type="o", col=2, cex=.3)

listR <- dlmSvd2var(llFilt$U.R, llFilt$D.R)
sqrtR <- sqrt(unlist(listR))
lines(llFilt$f + 2*(sqrtR),lty=2,col="green")
lines(llFilt$f - 2*(sqrtR),lty=2,col="green")

#example with very low V with respect to W, that is high signal to noise and high importance of the observations

plot(Nile)
ll <- dlm(m0=1000, C0=1000, FF=1, V=1000, GG=1, W=2000)
unlist(ll)
llFilt <-dlmFilter(Nile,ll)
names(llFilt)
lines(window(llFilt$m,start=start(Nile)[1]),
      type="o",lty=2, pch=4, col="red")
legend("bottomleft",legend=c("data","filtered level"),
       col=c("black", "red"),lty=c(1,2),pch=c(1,2))

listC <- dlmSvd2var(llFilt$U.C, llFilt$D.C)
sqrtC <- sqrt(unlist(listC))
ts.plot(sqrtC[-1], ylab="standard deviation")
ts.plot(sqrtC[-(1:10)])  

plot(Nile)
lines(window(llFilt$m,start=start(Nile)[1]),
      type="o",lty=2, pch=4, col="red")
legend("bottomleft",legend=c("data","filtered level"),
       col=c("black", "red"),lty=c(1,2),pch=c(1,2))
lines(llFilt$m + 2*sqrtC,lty=2,col="green")
lines(llFilt$m - 2*sqrtC,lty=2,col="green")

plot(window(Nile, start=1871), type="o", ylab="level", cex=.3)
lines(window(llFilt$f, start=1871), type="o", col=2, cex=.3)

listR <- dlmSvd2var(llFilt$U.R, llFilt$D.R)
sqrtR <- sqrt(unlist(listR))
lines(llFilt$f + 2*(sqrtR),lty=2,col="green")
lines(llFilt$f - 2*(sqrtR),lty=2,col="green")



