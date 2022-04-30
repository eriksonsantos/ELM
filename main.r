rm(list = ls())
library('plot3D')
source('tratamentoDados.r')
library('mlbench')
library('scatterplot3d')
library('rgl')
library(corpcor)
source('functions.r')
source('mainaux.r')
dados1 = mlbench.circle(100)
dados2 = mlbench.spirals(100,sd=0.1)
dados3 = mlbench.2dnormals(200)
dados4 = mlbench.xor(100)

dadosTrat <- tratamento(dados1,dados2,dados3,dados4)

xin1 <- matrix(unlist(dadosTrat[1]),ncol=2)
yin1 <- matrix(unlist(dadosTrat[2]),ncol=1)
xin2 <- matrix(unlist(dadosTrat[3]),ncol=2)
yin2 <- matrix(unlist(dadosTrat[4]),ncol=1)
xin3 <- matrix(unlist(dadosTrat[5]),ncol=2)
yin3 <- matrix(unlist(dadosTrat[6]),ncol=1)
xin4 <- matrix(unlist(dadosTrat[7]),ncol=2)
yin4 <- matrix(unlist(dadosTrat[8]),ncol=1)

p <- 100

mainaux(xin3,yin3,p)


#scatterplot3d(xin1[,1],xin1[,2],M,color = colors)
#plot3d(xin1[,1],xin1[,2],M)

  