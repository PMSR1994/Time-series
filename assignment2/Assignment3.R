?Nile
plot(Nile)
rw <- dlm(m0=1000, C0=1000, FF=1, V=15100, GG=1, W=1470)
modFilt <- dlmFilter(Nile, rw)
names(modFilt)
plot(Nile, type = 'o', col = "black")
lines(window(modFilt$m,start=start(Nile)[1]),type="o",lty=2, pch=4, col="red")
legend("bottomleft",legend=c("data","filtered level"),col=c("black", "red"),lty=c(1,2),pch=c(1,4))
attach(modFilt)
v<- dlmSvd2var(modFilt$U.C, modFilt$D.C)
v<- unlist(dlmSvd2var(modFilt$U.C, modFilt$D.C))
pl <- dropFirst(m) + qnorm(0.05, sd = sqrt(v[-1]))
pu <- dropFirst(m) + qnorm(0.95, sd = sqrt(v[-1]))
detach()
lines(pl, lty = 2, col = "green")
lines(pu, lty = 2, col = "green")

# compute the standard deviation

sd <- sqrt(v)
ts.plot(sd, ylab="standard deviation")  
?Nile

forecast <- plot(window(Nile, start=1871), type="o", ylab="level", cex=.3)
lines(window(modFilt$f, start=1871), type="o", col=2, cex=.3)

attach(forecast)
w<- dlmSvd2var(modFilt$U.C, modFilt$D.C)
w<- unlist(dlmSvd2var(modFilt$U.C, modFilt$D.C))
pl <- dropFirst(m) + qnorm(0.05, sd = sqrt(w[-1]))
pu <- dropFirst(m) + qnorm(0.95, sd = sqrt(w[-1]))
detach()
lines(pl, lty = 2, col = "green")
lines(pu, lty = 2, col = "green")


