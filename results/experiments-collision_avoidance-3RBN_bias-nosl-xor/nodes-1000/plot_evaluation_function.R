myfiles <- dir(pattern="[^2][1].txt_conv.txt")
n <- length(myfiles)
pdf("plot-evaluation_function-0_1.pdf")
plot(0,xlim=c(1200,1440000),ylim=c(0,1),xlab='Iteration',ylab='Evaluation function',type='n',main="Bias 0.1")
for (i in 1:n)
{
	mydata <- read.table(myfiles[i],fill=TRUE)
	if (dim(mydata)[1] > 5)
		points(mydata[,26:27],type='l')
}
dev.off()

myfiles <- dir(pattern="21.txt_conv.txt")
n <- length(myfiles)
pdf("plot-evaluation_function-0_21.pdf")
plot(0,xlim=c(1200,1440000),ylim=c(0,1),xlab='Iteration',ylab='Evaluation function',type='n',main="Bias 0.21")
for (i in 1:n)
{
	mydata <- read.table(myfiles[i],fill=TRUE)
	if (dim(mydata)[1] > 5)
		points(mydata[,26:27],type='l')
}
dev.off()

myfiles <- dir(pattern="5.txt_conv.txt")
n <- length(myfiles)
pdf("plot-evaluation_function-0_5.pdf")
plot(0,xlim=c(1200,1440000),ylim=c(0,1),xlab='Iteration',ylab='Evaluation function',type='n',main="Bias 0.5")
for (i in 1:n)
{
	mydata <- read.table(myfiles[i],fill=TRUE)
	if (dim(mydata)[1] > 5)
		points(mydata[,26:27],type='l')
}
dev.off()

myfiles <- dir(pattern="79.txt_conv.txt")
n <- length(myfiles)
pdf("plot-evaluation_function-0_79.pdf")
plot(0,xlim=c(1200,1440000),ylim=c(0,1),xlab='Iteration',ylab='Evaluation function',type='n',main="Bias 0.79")
for (i in 1:n)
{
	mydata <- read.table(myfiles[i],fill=TRUE)
	if (dim(mydata)[1] > 5)
		points(mydata[,26:27],type='l')
}
dev.off()

myfiles <- dir(pattern="[^7][9].txt_conv.txt")
n <- length(myfiles)
pdf("plot-evaluation_function-0_9.pdf")
plot(0,xlim=c(1200,1440000),ylim=c(0,1),xlab='Iteration',ylab='Evaluation function',type='n',main="Bias 0.9")
for (i in 1:n)
{
	mydata <- read.table(myfiles[i],fill=TRUE)
	if (dim(mydata)[1] > 5)
		points(mydata[,26:27],type='l')
}
dev.off()