mainauxPerceptron <- function(xin,yin,qtd){
  pesos <- perceptron(xin,yin,0.1,0.1,qtd,1)
  return(pesos)
  
}