Codebook
================

    ##            Variable      Tipo                                Descripción
    ## 1                id character                           ID del individuo
    ## 2          muestreo    factor                                           
    ## 3             fecha      Date                           Fecha de captura
    ## 4        nro.trampa character                                           
    ## 5       tipo.trampa    factor                           Sherman/Tomahawk
    ## 6             sitio    factor                           Sitio de Captura
    ## 7            sector    factor                       Borde/Centro/Natural
    ## 8           especie    factor                                           
    ## 9              edad    factor                   Juvenil/Subadulto/Adulto
    ## 10              cc1    factor                 Condición corporal columna
    ## 11              cc2    factor                  Condición corporal cadera
    ## 12              BCS    factor                       Body Condition Score
    ## 13             peso   numeric                                    Peso(g)
    ## 14      largo.total   numeric                            Largo total(cm)
    ## 15             cola    factor                       Largo de la cola(cm)
    ## 16           cuerpo   numeric                       Largo del cuerpo(cm)
    ## 17             pata   numeric               Largo de la pata trasera(mm)
    ## 18            oreja   numeric                     Largo de la oreja (mm)
    ## 19             sexo    factor                               Macho/Hembra
    ## 20       testiculos    factor                        0= abdominal, 1= escrotal
    ## 21      v.seminales    factor              0= no desarrolladas, 1= desarrolladas
    ## 22           vagina    factor                        0= cerrada, 1= perforada
    ## 23            mamas    factor             0 = no desarrolladas, 1= desarrolladas
    ## 24         gestante    factor                        0= no preñad, 1= preñada
    ## 25 cicatrices.utero    factor                        0= ausentes, 1= presentes
    ## 26         fetos   integer                            Número de fetos
    ## 27          heridas    factor                                     0= no, 1= si
    ## 28    observaciones character
    ## 29           lipl32    factor                          n= negativo, p= positivo
    ## 30   secuenciacion     factor                               COI, barcode     
    ## 31   determ.sp         character         método/s utilizado para identificar especie
    ## 32   estado.craneo     character         estado procesamiento del cráneo
    ## 33   estado.carcasa    character         lugar almacenamiento carcasa
    ## 34   estado.organos    character         lugar almacenamiento órganos
    ## 35   corazon          factor            0= usado/no encontrado, 1= disponible             ## 36   pulmon             factor            0= usado/no encontrado, 1= disponible
    ## 37   higado              factor            0= usado/no encontrado, 1= disponible
    ## 38   bazo            factor            0= usado/no encontrado, 1= disponible
    ## 39   riñon1            factor            0= usado, 1= disponible
    ## 40   riñon2            factor            0= usado/no encontrado, 1= disponible
    ## 41   coagulo            factor            0= usado/no encontrado, 1= disponible
    ## 42   suero           factor            0= usado/no encontrado, 1= disponible
    ## 43   orina             factor            0= no colectada, 1= colectada
    ## 44   fetos             factor            guardados