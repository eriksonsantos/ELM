rm(list = ls())
library('plot3D')
library('mlbench')
library('scatterplot3d')
library('rgl')
library(corpcor)
source('functions.r')
source('mainaux.r')
source('principal.r')
source('principalPerceptron.r')
source('mainAuxPerceptron.r')
source('perceptron.r')


xin <- as.matrix(heart[,1:13])

minimo <- matrix(0, nrow =13)
maximo <- matrix(0,nrow =13)

for (i in 1:13) {
  minimo[i] = min(xin[,i])
  maximo[i] = max(xin[,i])
}

for (i in 1:13) {
  for (j in 1:270) {
    xin[j,i] <- (xin[j,i] - minimo[i])/(maximo[i] - minimo[i])
  }
 
}
y <- as.matrix(heart[,14])

yin <- ifelse(y == 2,1,-1)
p <- 50
principal(xin,yin,p)

yin <- ifelse(yin==-1,0,1)
principalPerceptron(xin,yin,400)


