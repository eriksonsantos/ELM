rm(list = ls())
library('plot3D')
library('mlbench')
library('scatterplot3d')
library('rgl')
library(corpcor)
source('principal.r')
source('mainaux.r')
source('functions.r')

source('principalPerceptron.r')
source('mainAuxPerceptron.r')
source('perceptron.r')

data("BreastCancer")
library(dplyr)

library(tidyr)

A <- as.integer(as.vector(unlist(BreastCancer[1:150,2])))
B<- as.integer(as.vector(unlist(BreastCancer[1:150,3])))
C<- as.integer(as.vector(unlist(BreastCancer[1:150,4])))
D <- as.integer(as.vector(unlist(BreastCancer[1:150,5])))
E <- as.integer(as.vector(unlist(BreastCancer[1:150,6])))
F <- as.integer(as.vector(unlist(BreastCancer[1:150,7])))
G<- as.integer(as.vector(unlist(BreastCancer[1:150,8])))
H <- as.integer(as.vector(unlist(BreastCancer[1:150,9])))
I <- as.integer(as.vector(unlist(BreastCancer[1:150,10])))

xin <- cbind(A,B,C,D,E,F,G,H,I)
xin[is.na(xin)] <- 0


yinAux <- matrix(BreastCancer[1:150,11],ncol=1)
yin <- matrix(1.0*(yinAux[1:150]=='benign'),ncol=1)

yin <- ifelse(yin == 1,1,-1)

minimo <- matrix(0, nrow =9)
maximo <- matrix(0,nrow =9)

for (i in 1:9) {
  minimo[i] = min(xin[,i])
  maximo[i] = max(xin[,i])
}

for (i in 1:9) {
  for (j in 1:150) {
    xin[j,i] <- (xin[j,i] - minimo[i])/(maximo[i] - minimo[i])
  }
  
}

p <- 50

principal(xin,yin,p)

yin <- ifelse(yin == -1,0,1)
principalPerceptron(xin,yin,300)
