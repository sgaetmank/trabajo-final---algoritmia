:- consult('base.pl').
:- dynamic mejor/2.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%% DISTANCIA ENTRE RESTAURANTES %%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

/*
    distancia(+ID1,+ID2,-Distancia)

    Calcula la distancia euclidiana entre dos restaurantes
    utilizando las coordenadas almacenadas en la base de
    conocimiento.
*/

distancia(ID1,ID2,Distancia):-

    coordenadas(ID1,Lat1,Lon1),
    coordenadas(ID2,Lat2,Lon2),

    DX is Lat2-Lat1,
    DY is Lon2-Lon1,

    Distancia is sqrt(DX*DX + DY*DY).



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%% ELIMINAR %%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

/*
    eliminar(Elemento,Lista,NuevaLista)

    Elimina una ocurrencia de un elemento de una lista.

    Esta regla se utilizará para construir todas las
    las permutaciones posibles.
*/

eliminar(X,[X|R],R).

eliminar(X,[Y|R],[Y|R2]):-

    eliminar(X,R,R2).



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%% PERMUTACION %%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

/*
    permutacion(Lista,Permutacion)

    Genera todas las permutaciones posibles de una lista.

    Es la base del algoritmo de fuerza bruta utilizado para
    resolver el Problema del Viajante.
*/

permutacion([],[]).

permutacion(Lista,[X|Perm]):-

    eliminar(X,Lista,Resto),

    permutacion(Resto,Perm).



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%% COSTO DE UN RECORRIDO %%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

/*
    costo_camino(Lista,Costo)

    Calcula el costo total de recorrer todos los
    restaurantes de la lista en el orden indicado.
*/

costo_camino([_],0).

costo_camino([A,B|Resto],Costo):-

    distancia(A,B,D),

    costo_camino([B|Resto],CostoRestante),

    Costo is D + CostoRestante.


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%% MEJOR RECORRIDO %%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

/*
    mejor_ruta(+Inicio,+Restantes,-RutaOptima,-Costo)

    Recorre todas las permutaciones posibles mediante
    backtracking.

    No almacena todas las rutas en memoria. En cambio,
    compara cada recorrido con el mejor encontrado hasta
    el momento.
*/

mejor_ruta(Inicio,Restantes,RutaOptima,MejorCosto):-

    retractall(mejor(_,_)),

    assertz(mejor([],1000000000)),

    generar_rutas(Inicio,Restantes),

    mejor(RutaOptima,MejorCosto).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%% GENERAR RECORRIDOS %%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

/*
    generar_rutas(+Inicio,+Restantes)

    Genera una permutación por vez.

    Cada recorrido se evalúa inmediatamente.
*/

generar_rutas(Inicio,Restantes):-

    permutacion(Restantes,Perm),

    append([Inicio|Perm],[Inicio],Ruta),

    costo_camino(Ruta,Costo),

    actualizar_mejor(Ruta,Costo),

    fail.

generar_rutas(_, _).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%% ACTUALIZAR MEJOR RUTA %%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

/*
    actualizar_mejor(+Ruta,+Costo)

    Mantiene almacenada únicamente la mejor solución
    encontrada hasta el momento.
*/

actualizar_mejor(_,Costo):-

    mejor(_,CostoActual),

    Costo >= CostoActual,

    !.

actualizar_mejor(Ruta,Costo):-

    retractall(mejor(_,_)),

    assertz(mejor(Ruta,Costo)).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%% PROBLEMA DEL VIAJANTE %%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

/*
    tsp(Inicio,Restantes,Ruta,Costo)

    Regla principal.

    Inicio:
        Restaurante elegido como origen.

    Restantes:
        Restaurantes que deben visitarse exactamente
        una vez.

    Ruta:
        Recorrido óptimo encontrado.

    Costo:
        Distancia total recorrida.
*/

tsp(Inicio,Restantes,Ruta,Costo):-

    mejor_ruta(
        Inicio,
        Restantes,
        Ruta,
        Costo
    ).