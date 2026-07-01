:- consult('base.pl').
:- consult('reglas.pl').

consultar(Resultados, Barrio, PrecioMax, Cocina, Plan, Terraza, Reserva, Opcion) :-

    findall(
        [Nombre,Puntaje,Precio,Rating,Coincidencias],

        buscar_restaurante(
            Barrio,
            PrecioMax,
            Cocina,
            _,
            Plan,
            Terraza,
            Reserva,
            Opcion,
            Nombre,
            Precio,
            Rating,
            Puntaje,
            Coincidencias
        ),

        Resultados
    ).
