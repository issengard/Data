rodent=read.table("PanTHERIA_1-0_WR05_Aug2008.txt",
                header=TRUE,sep="\t",stringsAsFactors = FALSE)
names(rodent) <- sub("X[0-9._]+", "", names(rodent))
names(rodent) <- sub("MSW05_", "", names(rodent))
rodent=subset(rodent,Order=="Rodentia")
