mainaux <- function(xin,yin,p){
  saidaTrein <- Treinaelm(xin,yin,p)
  pesos <- matrix(unlist(saidaTrein[1]))
  Z <- matrix(unlist(saidaTrein[2]),nrow=(dim(xin)[2]+1),ncol=p)
 
 return(list(Z,pesos))
  
}