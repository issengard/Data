#Prepara Datos
ratas<-read.csv("ratas.csv",header=TRUE)
ratas=subset(ratas,sitio=="los.zapallos")
ratas=droplevels(ratas)
#Crea tabla de frecuencia por sexo
ratas1=table(ratas$especie,ratas$sexo)
#Cuenta individuos por especie
ratas2=count(ratas,"especie")
#Crea una tabla uniendo las frecuencias por individuo y por especie
ratas3=data.frame(cbind(ratas1,total=ratas2$freq))
ratas3=cbind(especie=row.names(ratas3),ratas3)
rownames(ratas3)<-NULL
names(ratas3)=c("Especie","Hembras","Machos","Total")