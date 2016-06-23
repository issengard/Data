ratas<-read.csv("ratas.csv",header=TRUE)
#Carga resultados de LipL32
#ratas$lipl32<- ifelse(ratas$id!="lz47","n","p")
#
#Guarda los resultados
##library(xlsx)
#write.xlsx(ratas,"ratas.xlsx","Sheet1",col.names = T, row.names = F)
#
#Table por Especie y sexo para Los Zapallos
ratas=subset(ratas,sitio=="los.zapallos")
ratas=droplevels(ratas)
ratas1=table(ratas$especie,ratas$sexo)

#Crea el gráfico#
g=ggplot(ratas,aes(especie))
source("label.R")
g+geom_bar(aes(fill=especie))+ #gráfico barras
  facet_grid(sector~sitio,labeller=label)+ #Define nro de gráficas y nombres
  labs(x="Especie",y="Nº Individuos")+ #Títulos de los ejes
  scale_x_discrete(breaks=c("akodon.azarae","mus.musculus","oligoryzomys","rattus.norvegicus",
                            "scapteromys.aquaticus","thylamys.pulchellus"),
                   labels=c("Aa","Mm","Of","Rn","Sa","Tc"))+ #cambia marcas eje X
  scale_fill_brewer(palette="Set2",name="Especie",
                    breaks=c("akodon.azarae","mus.musculus","oligoryzomys","rattus.norvegicus","scapteromys.aquaticus","thylamys.pulchellus"),
                    labels=c("Akodon azarae", "Mus musculus", "Oligoryzomys flavescens","Rattus norvegicus","Scapteromys aquaticus","Thylamys pulchellus"))+#Cambia leyenda
  theme(legend.text = element_text(face = "italic"),legend.title=element_blank())

