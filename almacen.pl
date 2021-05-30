%almacenable/2 nombre tamaño
almacenable('pala',grande).
almacenable('pico',grande).
almacenable('romana',grande).
almacenable('rastrillo',grande).
almacenable('lazo',chico).
almacenable('tamalera',grande).
almacenable('garrafon de agua',chico).
almacenable('budinera',grande).
almacenable('aceite para motor',chico).
almacenable('coples',chico).
almacenable('niples',chico).
almacenable('cables de luz',grande).
almacenable('clavos',chico).
almacenable('tornillos',chico).
almacenable('silla apilable',grande).
almacenable('videograbadora',grande).
almacenable('regresadora',grande).
almacenable('pc',grande).
almacenable('bote de pintura para pared',grande).
almacenable('bote de pintura de aceite',grande).
almacenable('pintura en spay',chico).
almacenable('tarro',grande).
almacenable('vaso',grande).
almacenable('charola',chico).
almacenable('servilletero',chico).
almacenable('letrero',chico).
almacenable('libro',grande).
almacenable('paquete de hojas',grande).
almacenable('antologias',grande).
almacenable('arreglo navideño',chico).

%herramienta/1 nombre
herramienta('pala').
herramienta('pico').
herramienta('romana').
herramienta('rastrillo').
herramienta('lazo').

%almacen/4 nombre, tamaño, clima acceso
almacen('costurero',chico,caliente,dificil).
almacen('bodega',grande,tibio,facil).

%criterios
vulnerable_al_calor(X):-
    almacenable(X,_),
    member(X,['aceite_para_motor','bote de pintura para pared','bote de pintura de aceite','pintura en spay','pc','regresadora'])
    .

inflamable(X):-
    almacenable(X,_)
    ,member(X,['libro','lazo','aceite para motor','cables de luz','videograbadora','regresadora','pc','bote de pintura para pared','bote de pintura de aceite','pintura en spay','libro','paquete de hojas','antologias','arreglo navideño'])
   .

es_caro(X):-
    almacenable(X,_)
    ,member(X,['pala','pico','romana','rastrillo','tamalera','coples','niples','cables de luz','bote de pintura para pared','tarro','vaso','charola','arreglo navideño'])
    .

%reglas
se_almacena_en(Almacen,Cosa):-
    almacen(Almacen,_,tibio,_)
    , vulnerable_al_calor(Cosa)
    .

se_almacena_en(Almacen,Cosa):-
    almacen(Almacen,_,tibio,_)
    , inflamable(Cosa)
    .

se_almacena_en(Almacen,Cosa):-
    almacen(Almacen,chico,_,_)
    ,herramienta(Cosa)
    ,almacenable(Cosa,chico)
    .

se_almacena_en(Almacen,Cosa):-
    almacen(Almacen,grande,_,_)
    ,herramienta(Cosa)
    ,almacenable(Cosa,grande)
    .

se_almacena_en(Almacen,Cosa):-
    almacen(Almacen,chico,_,_)
    ,es_caro(Cosa)
    .
se_almacena_en(Almacen,Cosa):-
    almacen(Almacen,chico,_,_)
    ,not(es_caro(Cosa))
    ,almacenable(Cosa,_)
    .

falta_de_clasificar(Cosa):-
    almacenable(Cosa,_)
    ,not(se_almacena_en(_,Cosa))
    .

donde_se_almacena_que(Almacen,Cosas):-
    bagof(Cosa,se_almacena_en(Almacen,Cosa),CosasConDuplicados)
    ,sort(CosasConDuplicados,Cosas).

%categorias
%trastos_decocina().
%insumos_para_coche().
%insumos_para_plomeria().
%insumos_para_electricidad().
%insumos_de_ferreteria().
%costuras().
%arreglos_navideños().
%libros().
%papeleria().
%computadoras().
%articulos_electricos().
%pintura_vinilica().
%pintura_de_aceite().
%chunches_del_bar().
%sillas().














