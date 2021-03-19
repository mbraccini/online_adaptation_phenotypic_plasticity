t1 <- 0.8


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
vt1 <- vt1/100
pdf("plot-rld-0_1.pdf")
plot(0,xlim=c(1200,1440000),ylim=c(0,1),xlab='Step',ylab='RLD',type='n',main="Bias 0.1")
points(seq(1,1440000),vt1,type='l')
dev.off()


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
vt1 <- vt1/100
pdf("plot-rld-0_21.pdf")
plot(0,xlim=c(1200,1440000),ylim=c(0,1),xlab='Step',ylab='RLD',type='n',main="Bias 0.21")
points(seq(1,1440000),vt1,type='l')
dev.off()


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
vt1 <- vt1/100
pdf("plot-rld-0_5.pdf")
plot(0,xlim=c(1200,1440000),ylim=c(0,1),xlab='Step',ylab='RLD',type='n',main="Bias 0.5")
points(seq(1,1440000),vt1,type='l')
dev.off()


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
vt1 <- vt1/100
pdf("plot-rld-0_79.pdf")
plot(0,xlim=c(1200,1440000),ylim=c(0,1),xlab='Step',ylab='RLD',type='n',main="Bias 0.79")
points(seq(1,1440000),vt1,type='l')
dev.off()


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
vt1 <- vt1/100
pdf("plot-rld-0_9.pdf")
plot(0,xlim=c(1200,1440000),ylim=c(0,1),xlab='Step',ylab='RLD',type='n',main="Bias 0.9")
points(seq(1,1440000),vt1,type='l')
dev.off()