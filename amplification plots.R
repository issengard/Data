#Edita data frame para las muestras de la primer campaña#
amp=read.table(file="ampdata1.txt",header=TRUE,sep="\t",skip=8)
colnames(amp)[3]<-"delta.RN"
amp=amp[complete.cases(amp),]
amp=droplevels(amp)
levels(amp$Well)<-c("LZ06","LZ14","LZ24","LZ04","LZ20","LZ19",
                     "LZ16","LZ05","LZ11","LZ13","LZ07","LZ17",
                     "LZ02","LZ23","LZ15","LZ22","LZ01","LZ03",
                     "LZ10","LZ21","LZ18","CS01","AV01","LZ09",
                     "LZ08","LZ12","PC","NC","NC")

#Edita data frame para las muestras de la segunda campaña#
amp2= read.table(file="ampdata2.txt",header=TRUE,sep="\t",skip=8)
colnames(amp2)[3]<-"delta.RN"
amp2=amp2[complete.cases(amp2),]
amp2=droplevels(amp2)
levels(amp2$Well)<-c("LZ40","AV06","AV02","LZ26","LZ27","LZ33",
                              "LZ41","AV03","CS03","LZ25","LZ38","LZ32",
                              "LZ30","LZ29","LZ34","LZ31","LZ28","LZ36",
                              "LZ35","LZ37","LZ39","CS04","CS02","AV04",
                              "AV05","LZ42","R+PC","PC2","NC")

library(xlsx)
write.xlsx(amp, "./amp.xlsx", sheetName="amp1", col.names=TRUE, row.names=FALSE, append=FALSE) #Crea un nuevo excel con los datos modificados
write.xlsx(amp2, "./amp2.xlsx", sheetName="amp2", col.names=TRUE, row.names=FALSE, append=FALSE)

amp=read.xlsx("amp.xlsx",sheetIndex=1,header=TRUE)
amp=amp[with(amp,order(Well)),]

amp2=read.xlsx("amp2.xlsx",sheetIndex=1,header=TRUE)
amp2=amp2[with(amp2,order(Well)),]

amp3=rbind(amp,amp2)
write.xlsx(amp3, "./amp3.xlsx", sheetName="amp3", col.names=TRUE, row.names=FALSE, append=FALSE)
amp3=read.xlsx("amp3.xlsx",sheetIndex=1,header=TRUE)
amp3=amp3[with(amp3,order(Well)),]

#Crea el amplification plot 1er corrida#
library(ggplot2)
library(RColorBrewer)
g=ggplot(amp,aes(x=Cycle,y=delta.RN,colour=Well))
g+
  geom_path(size=1.2)+ 
        geom_point(aes(shape=Well),size=6)+ 
        geom_abline(intercept=1000,slope=0,color="red",size=1.5)+
        geom_text(label="Threshold:1000",x=2,y=1500,colour="red")+
        scale_colour_manual(values=rep(brewer.pal(12,"Paired"),times=5))+
        scale_shape_manual(values=rep(c(3:22),each=2))+
  guides(color=guide_legend(ncol=2))

#Crea el amplification plot 2da corrida#
h=ggplot(amp2,aes(x=Cycle,y=delta.RN,colour=Well))
h+
  geom_path(size=1.2)+ 
  geom_point(aes(shape=Well),size=6)+ 
  geom_abline(intercept=1000,slope=0,color="red",size=1.5)+
  geom_text(label="Threshold:1000",x=2,y=1500,colour="red")+
  scale_colour_manual(values=rep(brewer.pal(12,"Paired"),times=5))+
  scale_shape_manual(values=rep(c(3:22),each=2))+
  guides(color=guide_legend(ncol=2))

#Gráfico de las dos corridas#
g=ggplot(amp3,aes(x=Cycle,y=delta.RN,colour=Well,group=Well))
g+
  geom_line(size=1.2)+ 
  geom_point(aes(shape=Well),size=6)+ 
  geom_abline(intercept=1000,slope=0,color="red",size=1.5)+
  geom_text(label="Threshold=1000",x=5,y=1500,colour="red")+
  scale_colour_manual(values=rep(brewer.pal(12,"Paired"),times=5))+
  scale_shape_manual(values=rep(c(2:22),each=4))+
  guides(color=guide_legend(ncol=4))+
  theme(plot.background = element_blank())
