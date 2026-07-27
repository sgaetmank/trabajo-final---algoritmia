from pyswip import Prolog

prolog = Prolog()

prolog.consult("consultas.pl")
prolog.consult("viajante.pl")

# ==========================
# ESTADO
# ==========================

preferencias = {
    "plan": None,
    "precio": None,
    "cocina": None,
    "barrio": None,
    "terraza": None,
    "reserva": None,
    "opcion": None
}

# ==========================
# PREGUNTAS
# ==========================

preguntas = {
    "plan": (
        "¿Con quién vas?\n"
        "1 Pareja\n"
        "2 Amigos\n"
        "3 Familia\n"
        "4 Trabajo\n"
        "5 Solo"
    ),
    "precio": "¿Qué presupuesto máximo por persona manejás? (ej: 30000)",
    "cocina": (
        "¿Qué tipo de comida preferís?\n"
        "1 Argentina (incluye parrillas y bodegones)\n"
        "2 Pizza\n"
        "3 Italiana\n"
        "4 Japonesa / sushi\n"
        "5 Asiática\n"
        "6 Armenia\n"
        "7 India\n"
        "8 Israelí\n"
        "9 Mediterránea\n"
        "10 Mariscos\n"
        "11 Vegetariana\n"
        "12 Vegana\n"
        "13 De autor\n"
        "14 Contemporánea\n"
        "15 Fusión\n"
        "16 Cafetería\n"
        "0 Sin preferencia"
    ),
    "barrio": (
        "¿En qué barrio querés comer?\n"
        "1 Palermo\n"
        "2 San Telmo\n"
        "3 Villa Crespo\n"
        "4 Chacarita\n"
        "5 Recoleta\n"
        "6 Puerto Madero\n"
        "7 Belgrano\n"
        "8 San Nicolás\n"
        "9 Liniers\n"
        "10 Retiro\n"
        "11 Colegiales\n"
        "12 La Boca\n"
        "13 Almagro\n"
        "14 Monserrat\n"
        "0 Cualquiera"
    ),
    "terraza": (
        "¿Querés terraza o espacio al aire libre?\n"
        "1 Sí\n"
        "2 No\n"
        "0 Indistinto"
    ),
    "reserva": (
        "¿Necesitás que acepte reservas?\n"
        "1 Sí\n"
        "2 No\n"
        "0 Indistinto"
    ),
    "opcion": (
        "¿Tenés alguna preferencia alimentaria?\n"
        "1 Vegetariana\n"
        "2 Vegana\n"
        "3 Sin TACC\n"
        "0 Ninguna"
    )
}

# ==========================
# MAPEO
# ==========================

# Los valores de estos mapas coinciden exactamente con los átomos
# utilizados en la base de conocimiento Prolog.

mapas = {
    "plan": {
        "1": "cita",
        "2": "amigos",
        "3": "familia",
        "4": "trabajo",
        "5": "solo"
    },
    "cocina": {
        "1": "argentina",
        "2": "pizza",
        "3": "italiana",
        "4": "japonesa",
        "5": "asiatica",
        "6": "armenia",
        "7": "india",
        "8": "israeli",
        "9": "mediterranea",
        "10": "mariscos",
        "11": "vegetariana",
        "12": "vegana",
        "13": "autor",
        "14": "contemporanea",
        "15": "fusion",
        "16": "cafeteria",
        "0": "cualquiera"
    },
    "barrio": {
        "1": "palermo",
        "2": "san_telmo",
        "3": "villa_crespo",
        "4": "chacarita",
        "5": "recoleta",
        "6": "puerto_madero",
        "7": "belgrano",
        "8": "san_nicolas",
        "9": "liniers",
        "10": "retiro",
        "11": "colegiales",
        "12": "la_boca",
        "13": "almagro",
        "14": "monserrat",
        "0": "cualquiera"
    },
    "terraza": {
        "1": "si",
        "2": "no",
        "0": "cualquiera"
    },
    "reserva": {
        "1": "si",
        "2": "no",
        "0": "cualquiera"
    },
    "opcion": {
        "1": "vegetariana",
        "2": "vegana",
        "3": "sin_tacc",
        "0": "ninguna"
    }
}

# ==========================
# INPUT
# ==========================

def pedir_numero(campo):
    while True:
        print("\n🤖 BotiGastro:")
        print(preguntas[campo])

        respuesta = input("> ").strip()

        if campo == "precio":
            if respuesta.isdigit() and int(respuesta) > 0:
                return int(respuesta)

            print("❌ Ingresá un presupuesto mayor que cero.")
            continue

        if respuesta in mapas[campo]:
            return mapas[campo][respuesta]

        print("❌ Opción inválida.")


# ==========================
# PROLOG
# ==========================

def ejecutar_prolog(p):
    consulta = f"""
        consultar(
            Resultados,
            {p['barrio']},
            {p['precio']},
            {p['cocina']},
            {p['plan']},
            {p['terraza']},
            {p['reserva']},
            {p['opcion']}
        )
    """

    respuesta = list(prolog.query(consulta))

    if not respuesta:
        return []

    return respuesta[0]["Resultados"]


def convertir_resultados(resultados):
    lista = []

    for resultado in resultados:
        nombre = resultado[1]

        if isinstance(nombre, bytes):
            nombre = nombre.decode("utf-8")

        lista.append({
            "id": str(resultado[0]),
            "nombre": nombre,
            "puntaje": int(resultado[2]),
            "precio": int(resultado[3]),
            "rating": float(resultado[4]),
            "lat": float(resultado[5]),
            "lon": float(resultado[6]),
            "coincidencias": [str(x) for x in resultado[7]]
        })

    return lista


# ==========================
# EXPLICACIÓN INTELIGENTE
# ==========================

TRADUCCION = {
    "barrio": "📍 Está en el barrio elegido",
    "precio": "💰 Está dentro del presupuesto",
    "cocina": "🍽️ Coincide con la cocina elegida",
    "plan": "🎉 Es ideal para ese tipo de salida",
    "terraza": "🌿 Tiene terraza o espacio al aire libre",
    "reserva": "📅 Cumple con la condición de reserva",
    "opcion": "🥗 Tiene la opción alimentaria solicitada"
}


def generar_explicacion(restaurante):
    explicacion = []

    for coincidencia in restaurante["coincidencias"]:
        coincidencia = str(coincidencia).strip()

        if coincidencia in TRADUCCION:
            explicacion.append(TRADUCCION[coincidencia])

    return explicacion


# ==========================
# RANKING
# ==========================

def mostrar_top(resultados):
    if not resultados:
        print("\n❌ No se encontraron restaurantes.")
        return

    resultados.sort(
        key=lambda restaurante: (
            restaurante["puntaje"],
            restaurante["rating"]
        ),
        reverse=True
    )

    print("\n🏆 TOP 10 RESTAURANTES\n")

    for posicion, restaurante in enumerate(resultados[:10], start=1):
        print(f"{posicion}. ⭐ {restaurante['nombre']}")
        print(f"💰 Precio promedio: ${restaurante['precio']:,}".replace(",", "."))
        print(f"🎯 Puntaje: {restaurante['puntaje']}")
        print(f"⭐ Rating: {restaurante['rating']:.1f}")

        explicacion = generar_explicacion(restaurante)

        if explicacion:
            print("\nCoincide con:")

            for elemento in explicacion:
                print("   •", elemento)

        print("-" * 50)


# ==========================================================
# RECORRIDO (Problema del Viajante)
# ==========================================================

def preguntar_recorrido():
    while True:
        print("\n¿Deseás generar un recorrido entre algunos de estos restaurantes?")
        print("1. Sí")
        print("2. No")

        opcion = input("> ").strip()

        if opcion == "1":
            return True

        if opcion == "2":
            return False

        print("❌ Opción inválida.")


def mostrar_opciones_recorrido(disponibles):
    print("\nRestaurantes disponibles:\n")

    for posicion, restaurante in enumerate(disponibles, start=1):
        print(f"{posicion}. {restaurante['nombre']}")

    print("0. Finalizar selección")


def seleccionar_restaurantes(resultados):
    disponibles = resultados[:10].copy()
    seleccionados = []

    # ==========================
    # RESTAURANTE INICIAL
    # ==========================

    while True:
        print("\nElegí el restaurante donde querés comenzar y terminar el recorrido:\n")

        mostrar_opciones_recorrido(disponibles)

        opcion = input("> ").strip()

        if opcion.isdigit():
            opcion = int(opcion)

            if 1 <= opcion <= len(disponibles):
                inicio = disponibles.pop(opcion - 1)
                seleccionados.append(inicio)
                break

        print("❌ Opción inválida.")

    # ==========================
    # RESTAURANTES INTERMEDIOS
    # ==========================

    while disponibles:
        print("\nElegí otro restaurante para agregar al recorrido.")
        print("(0 para finalizar)")

        mostrar_opciones_recorrido(disponibles)

        opcion = input("> ").strip()

        if opcion == "0":
            break

        if opcion.isdigit():
            opcion = int(opcion)

            if 1 <= opcion <= len(disponibles):
                seleccionado = disponibles.pop(opcion - 1)
                seleccionados.append(seleccionado)
                continue

        print("❌ Opción inválida.")

    return seleccionados


# ==========================================================
# VIAJANTE
# ==========================================================

def calcular_recorrido(seleccionados):
    inicio = seleccionados[0]["id"]
    restantes = [restaurante["id"] for restaurante in seleccionados[1:]]

    lista = "[" + ",".join(restantes) + "]"

    consulta = f"""
        tsp(
            {inicio},
            {lista},
            Ruta,
            Costo
        )
    """

    respuesta = list(prolog.query(consulta))

    if not respuesta:
        return None

    return respuesta[0]


def mostrar_recorrido(recorrido, seleccionados):
    if recorrido is None:
        print("\n❌ No fue posible calcular el recorrido.")
        return

    nombres = {
        restaurante["id"]: restaurante["nombre"]
        for restaurante in seleccionados
    }

    # PySwip puede devolver los átomos como objetos propios.
    # Los convertimos a str para usarlos como claves del diccionario.
    ruta = [str(restaurante) for restaurante in recorrido["Ruta"]]
    costo = float(recorrido["Costo"])
    costo_km = costo * 111

    print("\n")
    print("=" * 60)
    print("🗺️  RECORRIDO ÓPTIMO (Problema del Viajante)")
    print("=" * 60)

    print(f"\n📍 Restaurante de inicio y fin: {nombres[ruta[0]]}\n")
    print("Recorrido recomendado:\n")

    for posicion, restaurante_id in enumerate(ruta, start=1):
        print(f"{posicion}. 🍽️ {nombres[restaurante_id]}")

        if posicion != len(ruta):
            print("      │")
            print("      ▼")

    print("\n" + "-" * 60)
    print(f"📏 Distancia aproximada: {costo_km:.2f} km")
    print("=" * 60)


# ==========================
# MAIN
# ==========================

def main():
    print("🤖 Hola. Soy BotiGastro.")
    print("Te voy a ayudar a elegir dónde comer.\n")

    for campo in preferencias:
        preferencias[campo] = pedir_numero(campo)

    print("\n🧠 Buscando mejores opciones...\n")

    resultados_prolog = ejecutar_prolog(preferencias)
    resultados = convertir_resultados(resultados_prolog)

    mostrar_top(resultados)

    # No tiene sentido ofrecer un recorrido si no hubo resultados.
    if not resultados:
        return

    if preguntar_recorrido():
        seleccionados = seleccionar_restaurantes(resultados)

        print("\nElegiste los siguientes restaurantes:\n")

        for restaurante in seleccionados:
            print("•", restaurante["nombre"])

        print("\n🧠 Calculando el mejor recorrido...\n")

        recorrido = calcular_recorrido(seleccionados)
        mostrar_recorrido(recorrido, seleccionados)


if __name__ == "__main__":
    main()