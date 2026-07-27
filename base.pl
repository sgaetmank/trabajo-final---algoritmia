:- encoding(utf8).

/*==========================================================
    BOTIGASTRO CABA
    Base de conocimiento ampliada

    Restaurantes originales: r1-r20.
    Restaurantes agregados:  r21-r60.

    Notas de actualización:
      - precio/2 representa un valor promedio aproximado
        por persona, expresado en pesos argentinos.
      - rating/2 y precio/2 son datos variables y deben
        revisarse periódicamente.
      - terraza(si) incluye terraza, patio o mesas al aire
        libre.
      - ambiente/2 e ideal_para/2 normalizan descripciones
        y reseñas a los átomos utilizados por esta base.
==========================================================*/


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%    RESTAURANTES    %%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% restaurante(ID, Nombre).

restaurante(r1,"Don Julio").
restaurante(r2,"La Cabrera").
restaurante(r3,"El Ferroviario").
restaurante(r4,"Guerrín").
restaurante(r5,"La Mezzetta").
restaurante(r6,"El Imperio").
restaurante(r7,"Sarkis").
restaurante(r8,"Sacro").
restaurante(r9,"Chuí").
restaurante(r10,"Buenos Aires Verde").
restaurante(r11,"Osaka").
restaurante(r12,"Niño Gordo").
restaurante(r13,"Gran Dabbang").
restaurante(r14,"Casa Cavia").
restaurante(r15,"Anafe").
restaurante(r16,"El Preferido de Palermo").
restaurante(r17,"Birkin").
restaurante(r18,"Café Registrado").
restaurante(r19,"Mirutaki").
restaurante(r20,"La Alacena").
restaurante(r21,"Aramburu").
restaurante(r22,"Elena").
restaurante(r23,"Duhau Restaurante & Vinoteca").
restaurante(r24,"Narda Comedor").
restaurante(r25,"Mishiguene").
restaurante(r26,"Crizia").
restaurante(r27,"Julia").
restaurante(r28,"Mengano").
restaurante(r29,"Anchoita").
restaurante(r30,"Bis Restaurante").
restaurante(r31,"Caseros Restaurante").
restaurante(r32,"Trescha").
restaurante(r33,"Kona Corner").
restaurante(r34,"Corte Comedor").
restaurante(r35,"Ultramarinos").
restaurante(r36,"Ácido").
restaurante(r37,"Naranjo Bar").
restaurante(r38,"Reliquia").
restaurante(r39,"Picaron").
restaurante(r40,"El Obrero").
restaurante(r41,"Parrilla Peña").
restaurante(r42,"Los Galgos").
restaurante(r43,"Café San Juan").
restaurante(r44,"La Brigada").
restaurante(r45,"Cabaña Las Lilas").
restaurante(r46,"Sottovoce").
restaurante(r47,"La Parolaccia del Mare").
restaurante(r48,"Las Cuartetas").
restaurante(r49,"El Cuartito").
restaurante(r50,"Banchero").
restaurante(r51,"Los Inmortales").
restaurante(r52,"Las Violetas").
restaurante(r53,"Café Tortoni").
restaurante(r54,"Café Tabac").
restaurante(r55,"La Poesía").
restaurante(r56,"El Federal").
restaurante(r57,"El Desnivel").
restaurante(r58,"Hierbabuena").
restaurante(r59,"Artemisia").
restaurante(r60,"Gioia Cocina Botánica").


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%       BARRIO       %%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


barrio(r1,palermo).
barrio(r2,palermo).
barrio(r3,liniers).
barrio(r4,san_nicolas).
barrio(r5,chacarita).
barrio(r6,chacarita).
barrio(r7,villa_crespo).
barrio(r8,palermo).
barrio(r9,villa_crespo).
barrio(r10,palermo).
barrio(r11,puerto_madero).
barrio(r12,palermo).
barrio(r13,palermo).
barrio(r14,palermo).
barrio(r15,villa_crespo).
barrio(r16,palermo).
barrio(r17,palermo).
barrio(r18,palermo).
barrio(r19,palermo).
barrio(r20,palermo).
barrio(r21,recoleta).
barrio(r22,retiro).
barrio(r23,recoleta).
barrio(r24,belgrano).
barrio(r25,palermo).
barrio(r26,palermo).
barrio(r27,villa_crespo).
barrio(r28,palermo).
barrio(r29,villa_crespo).
barrio(r30,recoleta).
barrio(r31,san_telmo).
barrio(r32,villa_crespo).
barrio(r33,belgrano).
barrio(r34,belgrano).
barrio(r35,belgrano).
barrio(r36,colegiales).
barrio(r37,chacarita).
barrio(r38,palermo).
barrio(r39,chacarita).
barrio(r40,la_boca).
barrio(r41,san_nicolas).
barrio(r42,san_nicolas).
barrio(r43,san_telmo).
barrio(r44,san_telmo).
barrio(r45,puerto_madero).
barrio(r46,recoleta).
barrio(r47,puerto_madero).
barrio(r48,san_nicolas).
barrio(r49,recoleta).
barrio(r50,la_boca).
barrio(r51,san_nicolas).
barrio(r52,almagro).
barrio(r53,monserrat).
barrio(r54,palermo).
barrio(r55,san_telmo).
barrio(r56,san_telmo).
barrio(r57,san_telmo).
barrio(r58,san_telmo).
barrio(r59,palermo).
barrio(r60,recoleta).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%   TIPO DE LOCAL    %%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


tipo_local(r1,parrilla).
tipo_local(r2,parrilla).
tipo_local(r3,parrilla).
tipo_local(r4,pizzeria).
tipo_local(r5,pizzeria).
tipo_local(r6,pizzeria).
tipo_local(r7,restaurante).
tipo_local(r8,restaurante).
tipo_local(r9,restaurante).
tipo_local(r10,restaurante).
tipo_local(r11,restaurante).
tipo_local(r12,restaurante).
tipo_local(r13,restaurante).
tipo_local(r14,cafe).
tipo_local(r15,restaurante).
tipo_local(r16,bodegon).
tipo_local(r17,cafe).
tipo_local(r18,cafe).
tipo_local(r19,restaurante).
tipo_local(r20,restaurante).
tipo_local(r21,restaurante).
tipo_local(r22,restaurante).
tipo_local(r23,restaurante).
tipo_local(r24,restaurante).
tipo_local(r25,restaurante).
tipo_local(r26,restaurante).
tipo_local(r27,restaurante).
tipo_local(r28,bodegon).
tipo_local(r29,parrilla).
tipo_local(r30,restaurante).
tipo_local(r31,restaurante).
tipo_local(r32,restaurante).
tipo_local(r33,restaurante).
tipo_local(r34,parrilla).
tipo_local(r35,restaurante).
tipo_local(r36,restaurante).
tipo_local(r37,restaurante).
tipo_local(r38,restaurante).
tipo_local(r39,restaurante).
tipo_local(r40,bodegon).
tipo_local(r41,parrilla).
tipo_local(r42,cafe).
tipo_local(r43,restaurante).
tipo_local(r44,parrilla).
tipo_local(r45,parrilla).
tipo_local(r46,restaurante).
tipo_local(r47,restaurante).
tipo_local(r48,pizzeria).
tipo_local(r49,pizzeria).
tipo_local(r50,pizzeria).
tipo_local(r51,pizzeria).
tipo_local(r52,cafe).
tipo_local(r53,cafe).
tipo_local(r54,cafe).
tipo_local(r55,cafe).
tipo_local(r56,bodegon).
tipo_local(r57,parrilla).
tipo_local(r58,restaurante).
tipo_local(r59,restaurante).
tipo_local(r60,restaurante).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%   TIPO DE COCINA   %%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


cocina(r1,argentina).
cocina(r2,argentina).
cocina(r3,argentina).
cocina(r4,pizza).
cocina(r5,pizza).
cocina(r6,pizza).
cocina(r7,armenia).
cocina(r8,vegana).
cocina(r9,vegetariana).
cocina(r10,vegetariana).
cocina(r11,japonesa).
cocina(r12,asiatica).
cocina(r13,india).
cocina(r14,cafeteria).
cocina(r15,autor).
cocina(r16,argentina).
cocina(r17,cafeteria).
cocina(r18,cafeteria).
cocina(r19,japonesa).
cocina(r20,italiana).
cocina(r21,autor).
cocina(r22,argentina).
cocina(r23,argentina).
cocina(r24,autor).
cocina(r25,israeli).
cocina(r26,contemporanea).
cocina(r27,autor).
cocina(r28,argentina).
cocina(r29,argentina).
cocina(r30,contemporanea).
cocina(r31,argentina).
cocina(r32,fusion).
cocina(r33,japonesa).
cocina(r34,argentina).
cocina(r35,mariscos).
cocina(r36,contemporanea).
cocina(r37,argentina).
cocina(r38,argentina).
cocina(r39,fusion).
cocina(r40,argentina).
cocina(r41,argentina).
cocina(r42,argentina).
cocina(r43,mediterranea).
cocina(r44,argentina).
cocina(r45,argentina).
cocina(r46,italiana).
cocina(r47,italiana).
cocina(r48,pizza).
cocina(r49,pizza).
cocina(r50,pizza).
cocina(r51,pizza).
cocina(r52,cafeteria).
cocina(r53,cafeteria).
cocina(r54,cafeteria).
cocina(r55,argentina).
cocina(r56,argentina).
cocina(r57,argentina).
cocina(r58,vegetariana).
cocina(r59,vegetariana).
cocina(r60,vegana).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%  PRECIO PROMEDIO   %%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


precio(r1,55000).
precio(r2,48000).
precio(r3,25000).
precio(r4,18000).
precio(r5,12000).
precio(r6,11000).
precio(r7,22000).
precio(r8,30000).
precio(r9,24000).
precio(r10,26000).
precio(r11,70000).
precio(r12,35000).
precio(r13,28000).
precio(r14,30000).
precio(r15,32000).
precio(r16,26000).
precio(r17,18000).
precio(r18,17000).
precio(r19,38000).
precio(r20,29000).
precio(r21,100000).
precio(r22,100000).
precio(r23,100000).
precio(r24,40000).
precio(r25,100000).
precio(r26,100000).
precio(r27,100000).
precio(r28,65000).
precio(r29,75000).
precio(r30,50000).
precio(r31,40000).
precio(r32,100000).
precio(r33,75000).
precio(r34,70000).
precio(r35,100000).
precio(r36,60000).
precio(r37,45000).
precio(r38,70000).
precio(r39,65000).
precio(r40,30000).
precio(r41,45000).
precio(r42,30000).
precio(r43,45000).
precio(r44,70000).
precio(r45,80000).
precio(r46,55000).
precio(r47,45000).
precio(r48,22000).
precio(r49,22000).
precio(r50,20000).
precio(r51,22000).
precio(r52,25000).
precio(r53,25000).
precio(r54,20000).
precio(r55,22000).
precio(r56,25000).
precio(r57,30000).
precio(r58,35000).
precio(r59,35000).
precio(r60,60000).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%  RANGO DE PRECIO   %%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% Criterio usado para los nuevos registros:
% economico: hasta 18000
% medio:     18001 a 29999
% caro:      30000 a 49999
% premium:   desde 50000

rango(r1,premium).
rango(r2,premium).
rango(r3,medio).
rango(r4,economico).
rango(r5,economico).
rango(r6,economico).
rango(r7,medio).
rango(r8,caro).
rango(r9,medio).
rango(r10,medio).
rango(r11,premium).
rango(r12,caro).
rango(r13,medio).
rango(r14,caro).
rango(r15,caro).
rango(r16,medio).
rango(r17,economico).
rango(r18,economico).
rango(r19,caro).
rango(r20,medio).
rango(r21,premium).
rango(r22,premium).
rango(r23,premium).
rango(r24,caro).
rango(r25,premium).
rango(r26,premium).
rango(r27,premium).
rango(r28,premium).
rango(r29,premium).
rango(r30,premium).
rango(r31,caro).
rango(r32,premium).
rango(r33,premium).
rango(r34,premium).
rango(r35,premium).
rango(r36,premium).
rango(r37,caro).
rango(r38,premium).
rango(r39,premium).
rango(r40,caro).
rango(r41,caro).
rango(r42,caro).
rango(r43,caro).
rango(r44,premium).
rango(r45,premium).
rango(r46,premium).
rango(r47,caro).
rango(r48,medio).
rango(r49,medio).
rango(r50,medio).
rango(r51,medio).
rango(r52,medio).
rango(r53,medio).
rango(r54,medio).
rango(r55,medio).
rango(r56,medio).
rango(r57,caro).
rango(r58,caro).
rango(r59,caro).
rango(r60,premium).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%      TERRAZA       %%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


terraza(r1,no).
terraza(r2,si).
terraza(r3,si).
terraza(r4,no).
terraza(r5,no).
terraza(r6,no).
terraza(r7,no).
terraza(r8,si).
terraza(r9,si).
terraza(r10,si).
terraza(r11,no).
terraza(r12,si).
terraza(r13,no).
terraza(r14,si).
terraza(r15,no).
terraza(r16,si).
terraza(r17,si).
terraza(r18,no).
terraza(r19,no).
terraza(r20,no).
terraza(r21,no).
terraza(r22,si).
terraza(r23,si).
terraza(r24,si).
terraza(r25,si).
terraza(r26,si).
terraza(r27,no).
terraza(r28,si).
terraza(r29,si).
terraza(r30,si).
terraza(r31,si).
terraza(r32,no).
terraza(r33,si).
terraza(r34,si).
terraza(r35,no).
terraza(r36,no).
terraza(r37,si).
terraza(r38,no).
terraza(r39,si).
terraza(r40,si).
terraza(r41,no).
terraza(r42,no).
terraza(r43,si).
terraza(r44,no).
terraza(r45,si).
terraza(r46,si).
terraza(r47,si).
terraza(r48,no).
terraza(r49,no).
terraza(r50,no).
terraza(r51,no).
terraza(r52,no).
terraza(r53,no).
terraza(r54,si).
terraza(r55,si).
terraza(r56,no).
terraza(r57,no).
terraza(r58,si).
terraza(r59,si).
terraza(r60,si).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%      RESERVA       %%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


reserva(r1,si).
reserva(r2,si).
reserva(r3,no).
reserva(r4,no).
reserva(r5,no).
reserva(r6,no).
reserva(r7,no).
reserva(r8,si).
reserva(r9,si).
reserva(r10,si).
reserva(r11,si).
reserva(r12,si).
reserva(r13,si).
reserva(r14,si).
reserva(r15,si).
reserva(r16,si).
reserva(r17,no).
reserva(r18,no).
reserva(r19,si).
reserva(r20,si).
reserva(r21,si).
reserva(r22,si).
reserva(r23,si).
reserva(r24,si).
reserva(r25,si).
reserva(r26,si).
reserva(r27,si).
reserva(r28,si).
reserva(r29,si).
reserva(r30,si).
reserva(r31,si).
reserva(r32,si).
reserva(r33,si).
reserva(r34,si).
reserva(r35,si).
reserva(r36,si).
reserva(r37,si).
reserva(r38,si).
reserva(r39,si).
reserva(r40,si).
reserva(r41,si).
reserva(r42,si).
reserva(r43,si).
reserva(r44,si).
reserva(r45,si).
reserva(r46,si).
reserva(r47,si).
reserva(r48,no).
reserva(r49,no).
reserva(r50,no).
reserva(r51,no).
reserva(r52,si).
reserva(r53,no).
reserva(r54,no).
reserva(r55,si).
reserva(r56,si).
reserva(r57,no).
reserva(r58,si).
reserva(r59,si).
reserva(r60,si).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%% OPCIONES ALIMENTARIAS %%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% opcion(ID, Tipo).

opcion(r1,vegetariana).
opcion(r1,sin_tacc).

opcion(r2,vegetariana).

opcion(r3,vegetariana).

opcion(r4,vegetariana).

opcion(r5,vegetariana).

opcion(r6,vegetariana).

opcion(r7,vegetariana).

opcion(r8,vegana).
opcion(r8,vegetariana).
opcion(r8,sin_tacc).

opcion(r9,vegetariana).
opcion(r9,vegana).

opcion(r10,vegetariana).
opcion(r10,vegana).
opcion(r10,sin_tacc).

opcion(r11,sin_tacc).

opcion(r12,vegetariana).

opcion(r13,vegetariana).

opcion(r14,vegetariana).

opcion(r15,vegetariana).

opcion(r16,vegetariana).

opcion(r17,vegetariana).

opcion(r18,vegetariana).

opcion(r19,sin_tacc).

opcion(r20,vegetariana).

opcion(r21,vegetariana).
opcion(r21,sin_tacc).

opcion(r22,vegetariana).

opcion(r23,vegetariana).

opcion(r24,vegetariana).

opcion(r25,vegetariana).

opcion(r26,vegetariana).

opcion(r27,vegetariana).

opcion(r28,vegetariana).

opcion(r30,vegetariana).

opcion(r31,vegetariana).

opcion(r33,vegetariana).

opcion(r34,vegetariana).

opcion(r36,vegetariana).

opcion(r38,vegetariana).

opcion(r39,vegetariana).

opcion(r40,vegetariana).

opcion(r41,vegetariana).

opcion(r42,vegetariana).

opcion(r43,vegetariana).
opcion(r43,sin_tacc).

opcion(r44,vegetariana).

opcion(r45,vegetariana).
opcion(r45,sin_tacc).

opcion(r46,vegetariana).

opcion(r47,vegetariana).
opcion(r47,sin_tacc).

opcion(r48,vegetariana).

opcion(r49,vegetariana).

opcion(r50,vegetariana).

opcion(r51,vegetariana).

opcion(r52,vegetariana).

opcion(r53,vegetariana).

opcion(r54,vegetariana).

opcion(r55,vegetariana).

opcion(r56,vegetariana).

opcion(r57,vegetariana).

opcion(r58,vegetariana).
opcion(r58,vegana).
opcion(r58,sin_tacc).

opcion(r59,vegetariana).
opcion(r59,vegana).

opcion(r60,vegana).
opcion(r60,vegetariana).



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%     PLAN IDEAL     %%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% ideal_para(ID, TipoPlan).

ideal_para(r1,cita).
ideal_para(r1,familia).

ideal_para(r2,cita).
ideal_para(r2,amigos).

ideal_para(r3,familia).
ideal_para(r3,amigos).

ideal_para(r4,amigos).
ideal_para(r4,familia).

ideal_para(r5,amigos).

ideal_para(r6,amigos).

ideal_para(r7,amigos).
ideal_para(r7,familia).

ideal_para(r8,cita).

ideal_para(r9,cita).

ideal_para(r10,cita).

ideal_para(r11,cita).

ideal_para(r12,amigos).

ideal_para(r13,amigos).

ideal_para(r14,cita).
ideal_para(r14,trabajo).

ideal_para(r15,cita).

ideal_para(r16,familia).

ideal_para(r17,trabajo).

ideal_para(r18,trabajo).

ideal_para(r19,cita).

ideal_para(r20,cita).
ideal_para(r20,familia).

ideal_para(r21,cita).

ideal_para(r22,cita).
ideal_para(r22,trabajo).

ideal_para(r23,cita).
ideal_para(r23,trabajo).

ideal_para(r24,amigos).
ideal_para(r24,familia).

ideal_para(r25,cita).
ideal_para(r25,amigos).

ideal_para(r26,cita).
ideal_para(r26,amigos).

ideal_para(r27,cita).

ideal_para(r28,amigos).
ideal_para(r28,cita).

ideal_para(r29,amigos).
ideal_para(r29,cita).

ideal_para(r30,cita).
ideal_para(r30,trabajo).

ideal_para(r31,amigos).
ideal_para(r31,trabajo).

ideal_para(r32,cita).

ideal_para(r33,cita).
ideal_para(r33,amigos).

ideal_para(r34,amigos).
ideal_para(r34,familia).

ideal_para(r35,cita).

ideal_para(r36,amigos).

ideal_para(r37,cita).
ideal_para(r37,amigos).

ideal_para(r38,cita).

ideal_para(r39,amigos).
ideal_para(r39,cita).

ideal_para(r40,familia).
ideal_para(r40,amigos).

ideal_para(r41,familia).
ideal_para(r41,amigos).

ideal_para(r42,amigos).
ideal_para(r42,trabajo).

ideal_para(r43,amigos).
ideal_para(r43,cita).

ideal_para(r44,familia).
ideal_para(r44,amigos).

ideal_para(r45,cita).
ideal_para(r45,familia).

ideal_para(r46,cita).
ideal_para(r46,familia).

ideal_para(r47,familia).
ideal_para(r47,amigos).

ideal_para(r48,amigos).
ideal_para(r48,familia).

ideal_para(r49,amigos).
ideal_para(r49,familia).

ideal_para(r50,amigos).
ideal_para(r50,familia).

ideal_para(r51,amigos).
ideal_para(r51,familia).

ideal_para(r52,familia).
ideal_para(r52,trabajo).

ideal_para(r53,trabajo).
ideal_para(r53,familia).

ideal_para(r54,trabajo).
ideal_para(r54,amigos).

ideal_para(r55,amigos).
ideal_para(r55,trabajo).

ideal_para(r56,familia).
ideal_para(r56,amigos).

ideal_para(r57,amigos).
ideal_para(r57,familia).

ideal_para(r58,cita).
ideal_para(r58,familia).

ideal_para(r59,amigos).
ideal_para(r59,familia).

ideal_para(r60,cita).
ideal_para(r60,trabajo).



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%      AMBIENTE      %%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


ambiente(r1,elegante).
ambiente(r2,animado).
ambiente(r3,familiar).
ambiente(r4,informal).
ambiente(r5,informal).
ambiente(r6,informal).
ambiente(r7,animado).
ambiente(r8,elegante).
ambiente(r9,tranquilo).
ambiente(r10,tranquilo).
ambiente(r11,elegante).
ambiente(r12,moderno).
ambiente(r13,moderno).
ambiente(r14,tranquilo).
ambiente(r15,moderno).
ambiente(r16,familiar).
ambiente(r17,tranquilo).
ambiente(r18,tranquilo).
ambiente(r19,moderno).
ambiente(r20,elegante).
ambiente(r21,elegante).
ambiente(r22,elegante).
ambiente(r23,elegante).
ambiente(r24,animado).
ambiente(r25,animado).
ambiente(r26,elegante).
ambiente(r27,tranquilo).
ambiente(r28,moderno).
ambiente(r29,animado).
ambiente(r30,tranquilo).
ambiente(r31,tranquilo).
ambiente(r32,elegante).
ambiente(r33,moderno).
ambiente(r34,animado).
ambiente(r35,elegante).
ambiente(r36,moderno).
ambiente(r37,animado).
ambiente(r38,tranquilo).
ambiente(r39,moderno).
ambiente(r40,familiar).
ambiente(r41,informal).
ambiente(r42,animado).
ambiente(r43,informal).
ambiente(r44,animado).
ambiente(r45,elegante).
ambiente(r46,elegante).
ambiente(r47,familiar).
ambiente(r48,informal).
ambiente(r49,informal).
ambiente(r50,informal).
ambiente(r51,informal).
ambiente(r52,elegante).
ambiente(r53,elegante).
ambiente(r54,tranquilo).
ambiente(r55,tranquilo).
ambiente(r56,familiar).
ambiente(r57,informal).
ambiente(r58,tranquilo).
ambiente(r59,tranquilo).
ambiente(r60,elegante).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%       RATING       %%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


rating(r1,4.8).
rating(r2,4.7).
rating(r3,4.7).
rating(r4,4.6).
rating(r5,4.7).
rating(r6,4.5).
rating(r7,4.8).
rating(r8,4.6).
rating(r9,4.6).
rating(r10,4.7).
rating(r11,4.8).
rating(r12,4.7).
rating(r13,4.7).
rating(r14,4.8).
rating(r15,4.8).
rating(r16,4.8).
rating(r17,4.6).
rating(r18,4.6).
rating(r19,4.5).
rating(r20,4.7).
rating(r21,4.6).
rating(r22,4.6).
rating(r23,4.5).
rating(r24,3.9).
rating(r25,4.4).
rating(r26,4.6).
rating(r27,4.6).
rating(r28,4.3).
rating(r29,4.6).
rating(r30,4.2).
rating(r31,4.3).
rating(r32,4.5).
rating(r33,4.3).
rating(r34,4.3).
rating(r35,4.5).
rating(r36,4.1).
rating(r37,4.1).
rating(r38,4.6).
rating(r39,4.5).
rating(r40,4.4).
rating(r41,4.5).
rating(r42,4.3).
rating(r43,4.4).
rating(r44,4.5).
rating(r45,4.5).
rating(r46,4.5).
rating(r47,4.4).
rating(r48,4.4).
rating(r49,4.6).
rating(r50,4.4).
rating(r51,4.3).
rating(r52,4.4).
rating(r53,4.5).
rating(r54,4.3).
rating(r55,4.4).
rating(r56,4.5).
rating(r57,4.4).
rating(r58,4.4).
rating(r59,4.4).
rating(r60,4.6).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%    COORDENADAS     %%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% coordenadas(ID, Latitud, Longitud).

coordenadas(r1,-34.5888,-58.4302).   % Don Julio
coordenadas(r2,-34.5884,-58.429).   % La Cabrera
coordenadas(r3,-34.6447,-58.5146).   % El Ferroviario
coordenadas(r4,-34.6037,-58.3816).   % Guerrín
coordenadas(r5,-34.5895,-58.4555).   % La Mezzetta
coordenadas(r6,-34.5914,-58.455).   % El Imperio
coordenadas(r7,-34.5962,-58.4344).   % Sarkis
coordenadas(r8,-34.582,-58.4242).   % Sacro
coordenadas(r9,-34.5951,-58.4367).   % Chuí
coordenadas(r10,-34.5805,-58.4256).   % Buenos Aires Verde
coordenadas(r11,-34.6083,-58.3647).   % Osaka
coordenadas(r12,-34.5899,-58.4284).   % Niño Gordo
coordenadas(r13,-34.5875,-58.4276).   % Gran Dabbang
coordenadas(r14,-34.5788,-58.3929).   % Casa Cavia
coordenadas(r15,-34.5945,-58.434).   % Anafe
coordenadas(r16,-34.5881,-58.4264).   % El Preferido de Palermo
coordenadas(r17,-34.5867,-58.4255).   % Birkin
coordenadas(r18,-34.5849,-58.425).   % Café Registrado
coordenadas(r19,-34.5878,-58.4305).   % Mirutaki
coordenadas(r20,-34.5988,-58.4314).   % La Alacena
coordenadas(r21,-34.5896,-58.3925).   % Aramburu
coordenadas(r22,-34.589,-58.3817).   % Elena
coordenadas(r23,-34.5893598,-58.3862536).   % Duhau Restaurante & Vinoteca
coordenadas(r24,-34.563,-58.437).   % Narda Comedor
coordenadas(r25,-34.5754,-58.4133).   % Mishiguene
coordenadas(r26,-34.5854,-58.4395).   % Crizia
coordenadas(r27,-34.5942,-58.444).   % Julia
coordenadas(r28,-34.5911,-58.4365).   % Mengano
coordenadas(r29,-34.598,-58.442).   % Anchoita
coordenadas(r30,-34.5896,-58.3924).   % Bis Restaurante
coordenadas(r31,-34.6253,-58.3748).   % Caseros Restaurante
coordenadas(r32,-34.5968,-58.4408).   % Trescha
coordenadas(r33,-34.5627,-58.4373).   % Kona Corner
coordenadas(r34,-34.55406,-58.44824).   % Corte Comedor
coordenadas(r35,-34.5576,-58.448).   % Ultramarinos
coordenadas(r36,-34.5899,-58.4474).   % Ácido
coordenadas(r37,-34.5938,-58.4435).   % Naranjo Bar
coordenadas(r38,-34.5868,-58.445).   % Reliquia
coordenadas(r39,-34.598,-58.4465).   % Picaron
coordenadas(r40,-34.6296318426,-58.3568497214).   % El Obrero
coordenadas(r41,-34.601,-58.3919).   % Parrilla Peña
coordenadas(r42,-34.6031019976,-58.3922124658).   % Los Galgos
coordenadas(r43,-34.6209,-58.373).   % Café San Juan
coordenadas(r44,-34.6184685424,-58.3725976859).   % La Brigada
coordenadas(r45,-34.6036313802,-58.3670505149).   % Cabaña Las Lilas
coordenadas(r46,-34.587,-58.3892).   % Sottovoce
coordenadas(r47,-34.6112,-58.3662).   % La Parolaccia del Mare
coordenadas(r48,-34.603608509,-58.3785962386).   % Las Cuartetas
coordenadas(r49,-34.597845778,-58.3855198157).   % El Cuartito
coordenadas(r50,-34.6352625615,-58.3586258445).   % Banchero
coordenadas(r51,-34.6038824699,-58.3860320927).   % Los Inmortales
coordenadas(r52,-34.6104,-58.4207).   % Las Violetas
coordenadas(r53,-34.6087,-58.378).   % Café Tortoni
coordenadas(r54,-34.575,-58.406).   % Café Tabac
coordenadas(r55,-34.6161,-58.371).   % La Poesía
coordenadas(r56,-34.6203,-58.3718).   % El Federal
coordenadas(r57,-34.6202,-58.371).   % El Desnivel
coordenadas(r58,-34.6255,-58.3741).   % Hierbabuena
coordenadas(r59,-34.5827,-58.4396).   % Artemisia
coordenadas(r60,-34.5894,-58.3863).   % Gioia Cocina Botánica