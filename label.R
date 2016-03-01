label <- function(var, value){
        value <- as.character(value)
        #Pone en mayúsculas el nombre de los bichos#
        if (var=="especie") { 
                value[value=="akodon.azarae"] <- "Akodon azarae"
                value[value=="mus.musculus"]   <- "Mus musculus"
                value[value=="oligoryzomys"]<-"Oligoryzomys sp."
                value[value=="rattus.norvergicus"]<-"Rattus norvergicus"
                value[value=="scapteromys.aquaticus"]<-"Scapteromys aquaticus"
                value[value=="thylamys.pulchellus"]<-"Thylamys pulchellus"
        }
        #Pone en mayúsculas el nombre de los sitios#
        if (var=="sitio") { 
                value[value=="alto.verde"] <- "Alto Verde"
                value[value=="colastine.sur"]   <- "Colastine Sur"
                value[value=="los.zapallos"]<-"Los Zapallos"
        }
        
        return(value)
}