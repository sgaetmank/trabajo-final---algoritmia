:- encoding(utf8).

:- consult('base.pl').
:- consult('reglas.pl').

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% CONSULTA PRINCIPAL (WRAPPER PARA PYTHON)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

consultar(Resultados) :-
    findall(
        [Nombre,Puntaje,Precio],
        buscar_restaurante(
            Barrio,
            PrecioMax,
            TipoLocal,
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
        ),
        Resultados
    ).