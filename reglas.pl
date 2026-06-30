:- encoding(utf8).

/*==========================================================
        BOTIGASTRO CABA
        Motor de inferencia
==========================================================*/

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%% BUSCADOR PRINCIPAL %%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Predicado que conecta los criterios del usuario con el
% cálculo de puntaje, y filtra por puntaje minimo.

buscar_restaurante(
    Barrio,
    PrecioMax,
    Tipo,
    Cocina,
    Plan,
    Terraza,
    Reserva,
    Opcion,
    Nombre,
    Precio,
    Rating,
    Puntaje,
    Motivos
) :-
    restaurante(ID,Nombre),

    puntaje_total(
        ID,
        Barrio,
        PrecioMax,
        Tipo,
        Cocina,
        Plan,
        Terraza,
        Reserva,
        Opcion,
        Puntaje,
        Motivos
    ),

    puntaje_minimo(Min),
    Puntaje >= Min,

    precio(ID,Precio),
    rating(ID,Rating).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%% PESOS %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Cada criterio tiene una importancia distinta. 
% Si mas adelante quieren modificar el comportamiento del 
% sistema experto, solamente cambian estos valores.

peso(barrio,3).
peso(precio,4).
peso(tipo_local,3).
peso(cocina,5).
peso(plan,4).
peso(terraza,2).
peso(reserva,2).
peso(opcion,5).
peso(rating,3).



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%% COINCIDENCIAS %%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Todas estas reglas responden SI o NO.

coincide_barrio(ID,cualquiera):-
    restaurante(ID,_).

coincide_barrio(ID,Barrio):-
    barrio(ID,Barrio).



coincide_precio(ID,Max):-
    precio(ID,P),
    P=<Max.



coincide_tipo(ID,cualquiera):-
    restaurante(ID,_).

coincide_tipo(ID,Tipo):-
    tipo_local(ID,Tipo).



coincide_cocina(ID,cualquiera):-
    restaurante(ID,_).

coincide_cocina(ID,Cocina):-
    cocina(ID,Cocina).



coincide_plan(ID,cualquiera):-
    restaurante(ID,_).

coincide_plan(ID,Plan):-
    ideal_para(ID,Plan).



coincide_terraza(ID,cualquiera):-
    restaurante(ID,_).

coincide_terraza(ID,si):-
    terraza(ID,si).

coincide_terraza(ID,no):-
    terraza(ID,no).



coincide_reserva(ID,cualquiera):-
    restaurante(ID,_).

coincide_reserva(ID,si):-
    reserva(ID,si).

coincide_reserva(ID,no):-
    reserva(ID,no).



coincide_opcion(ID,ninguna):-
    restaurante(ID,_).

coincide_opcion(ID,Opcion):-
    opcion(ID,Opcion).



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%% RATING %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

puntaje_rating(ID,P):-

    rating(ID,R),

    (
        R>=4.8 -> P=3
        ;
        R>=4.6 -> P=2
        ;
        P=1
    ).



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%% PUNTAJE %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

puntaje_total(
    ID,
    Barrio,
    PrecioMax,
    Tipo,
    Cocina,
    Plan,
    Terraza,
    Reserva,
    Opcion,
    Puntaje,
    Motivos
) :-

    evaluar_barrio(ID,Barrio,P1,M1),
    evaluar_precio(ID,PrecioMax,P2,M2),
    evaluar_tipo(ID,Tipo,P3,M3),
    evaluar_cocina(ID,Cocina,P4,M4),
    evaluar_plan(ID,Plan,P5,M5),
    evaluar_terraza(ID,Terraza,P6,M6),
    evaluar_reserva(ID,Reserva,P7,M7),
    evaluar_opcion(ID,Opcion,P8,M8),
    puntaje_rating(ID,P9),

    Puntaje is P1+P2+P3+P4+P5+P6+P7+P8+P9,

    flatten([M1,M2,M3,M4,M5,M6,M7,M8], Motivos).



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%% EVALUADORES %%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

evaluar_barrio(ID,Barrio,P,[barrio]):-

    coincide_barrio(ID,Barrio),

    peso(barrio,P),!.

evaluar_barrio(_,_,0,[]).



evaluar_precio(ID,Precio,P,[precio]):-

    coincide_precio(ID,Precio),

    peso(precio,P),!.

evaluar_precio(_,_,0,[]).



evaluar_tipo(ID,Tipo,P,[tipo_local]):-

    coincide_tipo(ID,Tipo),

    peso(tipo_local,P),!.

evaluar_tipo(_,_,0,[]).



evaluar_cocina(ID,Cocina,P,[cocina]):-

    coincide_cocina(ID,Cocina),

    peso(cocina,P),!.

evaluar_cocina(_,_,0,[]).



evaluar_plan(ID,Plan,P,[plan]):-

    coincide_plan(ID,Plan),

    peso(plan,P),!.

evaluar_plan(_,_,0,[]).



evaluar_terraza(ID,Terraza,P,[terraza]):-

    coincide_terraza(ID,Terraza),

    peso(terraza,P),!.

evaluar_terraza(_,_,0,[]).



evaluar_reserva(ID,Reserva,P,[reserva]):-

    coincide_reserva(ID,Reserva),

    peso(reserva,P),!.

evaluar_reserva(_,_,0,[]).



evaluar_opcion(ID,Opcion,P,[opcion]):-

    coincide_opcion(ID,Opcion),

    peso(opcion,P),!.

evaluar_opcion(_,_,0,[]).



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%% PUNTAJE MINIMO %%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Si el restaurante obtiene menos puntaje,
% no vale la pena recomendarlo.

puntaje_minimo(10).