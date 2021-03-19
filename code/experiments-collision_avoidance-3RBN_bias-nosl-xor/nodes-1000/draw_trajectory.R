traj <- read.table('traj.txt')
pdf('trajectory.pdf')

plot(0,xlim=c(-1.5,1.5),ylim=c(-1.5,1.5),type='n',xlab='',ylab='')
points(c(-0.5,0.5),c(-0.5,-0.5),type='l',lty=2,lwd=2)
points(c(-0.5,0.5),c(0.5,0.5),type='l',lty=2,lwd=2)
points(c(-0.5,-0.5),c(-0.5,0.5),type='l',lty=2,lwd=2)
points(c(0.5,0.5),c(-0.5,0.5),type='l',lty=2,lwd=2)

points(traj[,2],traj[,3],type='l')

dev.off()