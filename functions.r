Treinaelm <- function(xin,y,p){
  
  xin <- cbind(1,xin)
  n <- dim(xin)[2]
  Z <- replicate(p,runif(n,-0.5,0.5)) #As quantidades de linhas refere a quantidade de neuronios
  #de entrada - As quantidades de colunas são os neuronios da camada intermediaria 
  
  
  H <- tanh(xin %*%Z) #Z seria os conjunto de pesos da camada escondida
  
  
  W <- pseudoinverse(H) %*% y
  
  return(list(W,Z))
  
}

saidaElm <- function(xin,Z,W){
  xin <- cbind(1,xin)
  H <- tanh(xin %*% Z)
  YAprox <- sign(H %*% W)
  
  return (YAprox)
  
}