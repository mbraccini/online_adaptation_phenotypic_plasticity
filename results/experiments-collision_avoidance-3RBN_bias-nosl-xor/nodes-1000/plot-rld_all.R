t1 <- 0.7


vt1 <- rep(0,1440000)
myfiles <- dir(pattern="[^2][1].txt_conv.txt")
n <- length(myfiles)
m <- 0
for (i in 1:n)
{
	mydata <- read.table(myfiles[i],fill=TRUE)
	if (dim(mydata)[1] > 5) {
		m <- m + 1
		x <- mydata[,26:27]
		l <- dim(x)[1]
		l <- l - 5
		for (j in 1:l) {
			if(x[j,2] >= t1){
				for (h in x[j,1]:1440000) {
					vt1[h] <- vt1[h] + 1
				}
				break
			}
		}
	}
}
vt01 <- vt1/100
# pdf("plot-rld-0_1.pdf")
# plot(0,xlim=c(1200,1440000),ylim=c(0,1),xlab='Step',ylab='RLD',type='n',main="Bias 0.1")
# points(seq(1,1440000),vt1,type='l')
# dev.off()


vt1 <- rep(0,1440000)
myfiles <- dir(pattern="21.txt_conv.txt")
n <- length(myfiles)
m <- 0
for (i in 1:n)
{
	mydata <- read.table(myfiles[i],fill=TRUE)
	if (dim(mydata)[1] > 5) {
		m <- m + 1
		x <- mydata[,26:27]
		l <- dim(x)[1]
		l <- l - 5
		for (j in 1:l) {
			if(x[j,2] >= t1){
				for (h in x[j,1]:1440000) {
					vt1[h] <- vt1[h] + 1
				}
				break
			}
		}
	}
}
vt021 <- vt1/100


vt1 <- rep(0,1440000)
myfiles <- dir(pattern="5.txt_conv.txt")
n <- length(myfiles)
m <- 0
for (i in 1:n)
{
	mydata <- read.table(myfiles[i],fill=TRUE)
	if (dim(mydata)[1] > 5) {
		m <- m + 1
		x <- mydata[,26:27]
		l <- dim(x)[1]
		l <- l - 5
		for (j in 1:l) {
			if(x[j,2] >= t1){
				for (h in x[j,1]:1440000) {
					vt1[h] <- vt1[h] + 1
				}
				break
			}
		}
	}
}
vt05 <- vt1/100



vt1 <- rep(0,1440000)
myfiles <- dir(pattern="79.txt_conv.txt")
n <- length(myfiles)
m <- 0
for (i in 1:n)
{
	mydata <- read.table(myfiles[i],fill=TRUE)
	if (dim(mydata)[1] > 5) {
		m <- m + 1
		x <- mydata[,26:27]
		l <- dim(x)[1]
		l <- l - 5
		for (j in 1:l) {
			if(x[j,2] >= t1){
				for (h in x[j,1]:1440000) {
					vt1[h] <- vt1[h] + 1
				}
				break
			}
		}
	}
}
vt079 <- vt1/100



vt1 <- rep(0,1440000)
myfiles <- dir(pattern="[^7][9].txt_conv.txt")
n <- length(myfiles)
m <- 0
for (i in 1:n)
{
	mydata <- read.table(myfiles[i],fill=TRUE)
	if (dim(mydata)[1] > 5) {
		m <- m + 1
		x <- mydata[,26:27]
		l <- dim(x)[1]
		l <- l - 5
		for (j in 1:l) {
			if(x[j,2] >= t1){
				for (h in x[j,1]:1440000) {
					vt1[h] <- vt1[h] + 1
				}
				break
			}
		}
	}
}
vt09 <- vt1/100

pdf("plot-rld_all_in_one-n1000.pdf")
plot(0,xlim=c(1200,1440000),ylim=c(0,1),xlab='Step',ylab='RLD',type='n',main="1000 nodes - Threshold value 0.7")
x <- seq(1200,1440000,1200)
points(x,vt01[x],type='l',lwd=2,col=2,lty=1)
points(x,vt021[x],type='l',lwd=2,col=3,lty=2)
points(x,vt05[x],type='l',lwd=2,col=4,lty=3)
points(x,vt079[x],type='l',lwd=2,col=5,lty=4)
points(x,vt09[x],type='l',lwd=2,col=6,lty=5)
legend("topleft",legend=c('0.1','0.21','0.5','0.79','0.9'),col=c(2,3,4,5,6),lty=1:5,lwd=2)
dev.off()