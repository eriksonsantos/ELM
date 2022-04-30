mainaux <- function(xin,yin,p){
  saidaTrein <- Treinaelm(xin,yin,p)
  pesos <- matrix(unlist(saidaTrein[1]))
  Z <- matrix(unlist(saidaTrein[2]),nrow=3,ncol=p)
  YAprox <- saidaElm(xin,Z,pesos)
  
  lseq <-matrix( seq(-2,10,by=0.1))
  
  M <- matrix(0, nrow = length(lseq),ncol=length(lseq))

  for (i in 1: length(lseq)) {
    for(j in 1:length(lseq)){
      x1 <- lseq[i]
      y1 <- lseq[j]
      
      x1x2 <- matrix(cbind(x1,y1),nrow=1)
      M[i,j] <- saidaElm(x1x2,Z,pesos)
    }
    
  }
  
 acuracia <- 1 - (t(YAprox - yin) %*% (YAprox - yin) )/ (dim(YAprox)[1])
 print(acuracia)
 colors <- matrix(ifelse(yin==1,'red','blue'))

 contour(lseq,lseq,M,xlim=c(-2,10),ylim=c(-2,10))
 par(new=T)
 plot(xin[,1],xin[,2],xlim=c(-2,10),ylim=c(-2,10),col=colors,xlab='x1',ylab='x2')
  

  
  
}