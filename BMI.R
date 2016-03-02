ratas= read.csv("ratas.csv",header=T, sep=",",na.strings =c(""," "))
#ratas$id<-as.character(ratas$id)
#ratas$muestreo<-as.factor(ratas$muestreo)
#ratas$fecha<-as.Date(ratas$fecha)
#ratas$nro.trampa<-as.character(ratas$nro.trampa)
#ratas$observaciones<-as.character(ratas$observaciones)

#Crea columna para el BCS:body condition score (Hickman 2010)
ratas$BCS=rowMeans(subset(ratas,select = c(cc1,cc2)),na.rm = T)
ratas=ratas[,c(1:11,30,12:29)]
write.csv(x = ratas,file = "ratas.csv",col.names = TRUE,row.names = FALSE)

#Crea columna para el BMI: body mass index (Labocha 2014)
ratas$BMI= round(log(ratas$peso)/log(ratas$cuerpo),digits = 2)
ratas=ratas[,c(1:16,31,17:30)]

#Correlación entre BCS y BMI
cor.test(ratas$BCS,ratas$BMI,method="spearman",exact=F)
cor(ratas[,c("BMI","BCS")],use="complete",method="spearman")
