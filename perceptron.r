perceptron <- function(xin, yd, eta, tol, maxepocas, par)
{
  dimxin <- dim(xin)
  N <- dimxin[1]
  n <- dimxin[2]
  
  if(par == 1){
    wt  <- as.matrix(runif(n+1) - 0.5)
    xin <- cbind(-1,xin)
  }else wt <- as.matrix(runif(n) - 0.5)
  
  nepocas <- 0
  eepoca <- tol + 1
  
  evec<- matrix(nrow=1, ncol=maxepocas)
  while((nepocas < maxepocas) && (as.integer(eepoca) > tol)){
    ei2 <- 0
    
    xseq <- sample(N)
    for(i in 1: N){
      irand <- xseq[i]
      yhati <- 1.0 *((xin[irand,] %*% wt)>=0)
      ei <- yd[irand] - yhati
      dw <- eta* ei*xin[irand,]
      wt <- wt+ dw
      ei2 <- ei2+ ei*ei
      
    }
    nepocas <- nepocas + 1
    evec[nepocas] <- ei2/2
    
    eepoca <- evec[nepocas]
  }
  
  return(wt)
  
}

yperceptron <- function(x,w){
  
  x <- cbind(-1,x)
  u <- x%*%w
  
  y<- 1.0*(u>=0)
  return(as.matrix(y))
}

