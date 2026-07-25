:- consult('base.pl').
:- consult('reglas.pl').

consultar(Resultados, Barrio, PrecioMax, Cocina, Plan, Terraza, Reserva, Opcion) :-

    findall(

        [ID,Nombre,Puntaje,Precio,Rating,Lat,Lon,Coincidencias],

        (

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

            restaurante(ID,Nombre),
            coordenadas(ID,Lat,Lon)

        ),

        Resultados
    ).