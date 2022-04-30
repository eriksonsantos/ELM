principal <- function(xin,yin,p){

nTrain <- as.integer( 0.70* dim(yin)[1])
nTest <- as.integer(0.3* dim(yin)[1])

nTotal <- dim(xin)[1]
seqAl <- sample(nTotal)

xinTreina <- as.matrix(xin[seqAl[1:nTrain],] )
yinTreina <- matrix(yin[seqAl[1:nTrain],] )


xinTeste <- as.matrix(xin[seqAl[(nTrain+1):nTotal],])
yinTeste <- matrix(yin[seqAl[(nTrain+1):nTotal],])


vetorAcuraciaTrain <- matrix(0,nrow=10)
vetorAcuraciaTest <- matrix(0,nrow=10)

for (i in 1:10) {
  result <- mainaux(xinTreina,yinTreina,p)
  
  pesos <- matrix(unlist(result[2]),ncol=1)
  Z <- matrix(unlist(result[1]),nrow=(dim(xinTeste)[2]+1),ncol=p)
  
  YAprox <- saidaElm(xinTreina,Z,pesos)
  
  lseq <-matrix( seq(-2,10,by=0.1))
  
  acuracia <- 1 - (t(YAprox - yinTreina) %*% (YAprox - yinTreina) )/ (dim(YAprox)[1])
  vetorAcuraciaTrain[i] <- acuracia
  
  
  
  YAprox <- saidaElm(xinTeste,Z,pesos)
  
  acuracia <- 1 - (t(YAprox - yinTeste) %*% (YAprox - yinTeste) )/ (dim(YAprox)[1])
  
  vetorAcuraciaTest[i] <- acuracia
}

print(paste("Desvio Padrão da acuracia Treinamento: " ,toString(var(vetorAcuraciaTrain))))

print(paste("Media da acuracia Treinamento: ",mean(vetorAcuraciaTrain)))

print(paste("Desvio Padrão da acuracia Teste: " ,toString(var(vetorAcuraciaTest))))

print(paste("Media da acuracia Teste: ",mean(vetorAcuraciaTest)))

}
