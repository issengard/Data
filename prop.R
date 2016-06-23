library(xlsx)
ratas<-read.xlsx("./ratas.xlsx",sheetIndex=1,header=TRUE)

#índice masa corporal#
library(dplyr)
ratas1=summarize(group_by(ratas,especie,sexo),
                 weight=round(mean(peso),digits=2),
          BMI=round(mean(peso/(largo-cola)^2),digits=2),
          sd=round(sd(peso/(largo-cola)^2),digits=3),
          Lee.index=round(mean(peso^(1/3)/(largo-cola)),digits=2),
          sd2=round(sd(peso^(1/3)/(largo-cola)),digits=3),
          cc=round(mean(ccorp1),digits=1),
          cc2=round(mean(ccorp2),digits=1))
ratas=subset(ratas,especie=="rattus.norvergicus"|especie=="scapteromys.aquaticus")
ratas$cuerpo<-ratas$largo-ratas$cola
ratas<-ratas[,c(1:13,24,14:23)]
ratas<-ratas[-1,]
ratas1<-subset(ratas,especie=="rattus.norvergicus",select=c(especie,edad,cuerpo,cola,pata,oreja,peso,sexo))
ratas2<-subset(ratas,especie=="scapteromys.aquaticus",select=c(especie,edad,cuerpo,cola,pata,oreja,peso,sexo))
