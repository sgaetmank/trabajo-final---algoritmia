:- encoding(utf8).

/*==========================================================
    BOTIGASTRO CABA
    Base de conocimiento

    Cada restaurante posee un ID.

    Luego cada característica se almacena como un hecho
    independiente.

    Ventajas:
        - Fácil de extender.
        - Fácil de consultar.
        - Muy claro para explicar.
==========================================================*/


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%        RESTAURANTES        %%%%%%%%%%%%%%%%%
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



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%   BARRIO   %%%%%%%%%%%%%%%%%%%%%%%%%%
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



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%  TIPO DE LOCAL  %%%%%%%%%%%%%%%%%%%%%%%
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



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%  TIPO DE COCINA  %%%%%%%%%%%%%%%%%%%%%%
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



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%% PRECIO PROMEDIO %%%%%%%%%%%%%%%%%%%%%%
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



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%% RANGO DE PRECIO %%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

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



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%% TERRAZA %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
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



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%% RESERVA %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
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



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%% OPCIONES ALIMENTARIAS %%%%%%%%%%%%%%%%%
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



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%% PLAN IDEAL %%%%%%%%%%%%%%%%%%%%%%%%%%
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



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%% AMBIENTE %%%%%%%%%%%%%%%%%%%%%%%%%%%%
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



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%% RATING %%%%%%%%%%%%%%%%%%%%%%%%%%%
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