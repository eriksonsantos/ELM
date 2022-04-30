rm(list = ls())
library('plot3D')
source('tratamentoDados.r')
library('mlbench')
library('scatterplot3d')
library('rgl')
library(corpcor)
source('functions.r')
source('mainaux.r')
data('iris')

plot(iris, col=c('red','blue','green'))

xc1 <- as.matrix(iris[1:50,1:4])
xc2 <- as.matrix(iris[51:150,1:4])

yc1 <- matrix(1,nrow=dim(xc1)[1],ncol=1)
yc2 <- matrix(0,nrow=dim(xc2)[1],ncol=1)

xin <- rbind(xc1,xc2)
yin <- rbind(yc1,yc2)

yin <- ifelse(yin == 1,1,-1)

nTrain <- 0.70* dim(yin)[1]
nTest <- 0.3* dim(yin)[1]

seqAl <- sample(150)

xinTreina <- as.matrix(xin[seqAl[1:nTrain],] )
yinTreina <- matrix(yin[seqAl[1:nTrain],] )
xinTeste <- as.matrix(xin[seqAl[(nTrain+1):150],])
yinTeste <- matrix(yin[seqAl[(nTrain+1):150],])


p <- 100

mainaux(xinTreina,yinTreina,p)


#scatterplot3d(xin1[,1],xin1[,2],M,color = colors)
#plot3d(xin1[,1],xin1[,2],M)
