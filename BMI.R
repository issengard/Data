library (xlsx)
ratas= read.xlsx("ratas.xlsx", sheetIndex = 1, header=T)
#Separa por sexo
ratasf=subset(ratas,sexo=="f")
ratasm=subset(ratas,sexo=="m")
#Crea el BMI por sexo
ratasf$BMI=log(ratasf$peso)/log(ratasf$cuerpo)
ratasm$BMI=log(ratasm$peso)/log(ratasm$cuerpo)
#Modelo 1: peso explicado por todos los factores
model1=lm(peso,data=ratas)
library(ggplot2)
g=ggplot(ratas,aes(cuerpo,peso))
g+
  geom_point(aes(color=especie))+
  geom_smooth(method="lm")

