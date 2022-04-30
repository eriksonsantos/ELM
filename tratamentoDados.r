tratamento <- function(dados1,dados2,dados3,dados4){
  xin1 = dados1$x
  yin1 = matrix(dados1$classes)
  yin1 <- ifelse(yin1==2,1,-1)
  
  xin2 = dados2$x
  yin2 = matrix(dados2$classes)
  yin2 <- ifelse(yin2==2,1,-1)
  
  xin3 = dados3$x
  yin3 = matrix(dados3$classes)
  yin3 <- ifelse(yin3==2,1,-1)
  
  xin4 = dados4$x
  yin4 = matrix(dados4$classes)
  yin4 <- ifelse(yin4==2,1,-1)
  
  return (list(xin1,yin1,xin2,yin2,xin3,yin3,xin4,yin4))
  
  
}