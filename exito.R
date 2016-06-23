#Crea Base de Datos#
ratas=read.csv("ratas.csv",header=T) 
library(xlsx)
esfuerzo<-read.xlsx("./captura.xlsx",sheetIndex=1,header=TRUE)
esfuerzo$esfuerzo<-esfuerzo$n.trampas-((0.5*esfuerzo$saltadas)+esfuerzo$sin.cebo+esfuerzo$perdidas+(0.5*esfuerzo$otro.animal))
esfuerzo$exito<-esfuerzo$capturas/esfuerzo$esfuerzo
esfuerzo$muestreo=as.factor(ifelse(esfuerzo$fecha>as.Date("2014-10-02"),2,1))
write.xlsx(esfuerzo, "./captura.xlsx", sheetName="captura", col.names=TRUE, row.names=FALSE, append=FALSE, showNA=TRUE) #Crea un nuevo excel con los datos modificados

#Prepara base de datos para graficar#
library(dplyr)
#exito<-summarize(group_by
#(esfuerzo,sitio,sector,muestreo,tipo.trampa),
#mean=mean(exito),sd=sd(exito),se=sd(exito)/sqrt(length(exito)))
exito<-summarize(group_by(esfuerzo,sitio,sector),
                 mean=mean(exito),sd=sd(exito),se=sd(exito)/sqrt(length(exito)))
exito2<-summarize(group_by(esfuerzo,sitio),
                 mean=mean(exito),sd=sd(exito),se=sd(exito)/sqrt(length(exito)))

#Opción 2#
source('summarySE.R')
exito2=summarySE(esfuerzo,measurevar="exito",groupvars=c("sitio","sector","muestreo","tipo.trampa"))

#éxito por tipo de trampa#
source('summarySE.R')
exit=summarySE(esfuerzo,measurevar="exito",groupvars=c("tipo.trampa"))

#Porcentaje de trampas perturbadas#
summarize(group_by(esfuerzo,tipo.trampa),
          total=sum(n.trampas),
          dist=sum(saltadas+sin.cebo+perdidas+otro.animal),
          porcent=round((dist*100)/total,digits=2))

#Gráfico#
library(ggplot2)
pd <- position_dodge(0.2)
limits<-aes(ymax=mean+se,ymin=mean-se)
g=ggplot(exito,aes(x=muestreo,y=mean,colour=tipo.trampa,ymax=max(mean+se)))
source("label.R")
g+
        geom_errorbar(limits,width=.1,position=pd)+
        geom_point(position=pd,size=3)+
        scale_colour_discrete(name="Tipo de Trampa",
                            breaks=c("S","T"),
                            labels=c("Sherman","Tomahawk"))+
        facet_grid(sector~sitio,labeller=label)+
        labs(x="Muestreo",y="Éxito de captura")+
  theme(plot.background = element_blank())
