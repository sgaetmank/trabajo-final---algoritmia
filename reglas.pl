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
    CocinaBuscada,
    CocinaReal,
    Plan,
    Terraza,
    Reserva,
    Opcion,
    Nombre,
    Precio,
    Rating,
    Puntaje,
    Coincidencias
) :-

    restaurante(ID,Nombre),

    cocina(ID,CocinaReal),
    precio(ID,Precio),
    rating(ID,Rating),

    calcular_coincidencias(
        ID,
        Barrio,
        PrecioMax,
        CocinaBuscada,
        Plan,
        Terraza,
        Reserva,
        Opcion,
        Coincidencias,
        Puntaje
    ).

calcular_coincidencias(
    ID,
    Barrio,
    PrecioMax,
    Cocina,
    Plan,
    Terraza,
    Reserva,
    Opcion,
    Coincidencias,
    Puntaje
) :-

    findall(Texto,
        (
            (
                Barrio \= cualquiera,
                barrio(ID,Barrio),
                Texto = barrio
            );

            (
                precio(ID,P),
                P =< PrecioMax,
                Texto = precio
            );

            (
                Cocina \= cualquiera,
                cocina(ID,Cocina),
                Texto = cocina
            );

            (
                Plan \= cualquiera,
                ideal_para(ID,Plan),
                Texto = plan
            );

            (
                Terraza \= cualquiera,
                terraza(ID,Terraza),
                Texto = terraza
            );

            (
                Reserva \= cualquiera,
                reserva(ID,Reserva),
                Texto = reserva
            );

            (
                Opcion \= ninguna,
                opcion(ID,Opcion),
                Texto = opcion
            )
        ),
        Coincidencias
    ),

    length(Coincidencias,Puntaje).
