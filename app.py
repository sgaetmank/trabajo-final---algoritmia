from pyswip import Prolog

prolog = Prolog()
prolog.consult("consultas.pl")

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
    "plan": "¿Con quién vas?\n1 Pareja\n2 Amigos\n3 Familia\n4 Trabajo\n5 Solo",
    "precio": "¿Qué presupuesto manejás? (ej: 30000)",
    "cocina": "¿Qué tipo de comida preferís?\n1 Pizza\n2 Parrilla\n3 Sushi\n4 Italiana\n5 Mexicana\n6 Hamburguesas\n7 Bar\n0 Sin preferencia",
    "barrio": "¿En qué barrio querés comer?\n1 Palermo\n2 San Telmo\n3 Caballito\n0 Cualquiera",
    "terraza": "¿Querés terraza?\n1 Sí\n2 No\n0 Indistinto",
    "reserva": "¿Necesitás reserva?\n1 Sí\n2 No\n0 Indistinto",
    "opcion": "¿Preferencia alimentaria?\n1 Vegetariana\n2 Vegana\n0 Ninguna"
}

# ==========================
# MAPEO
# ==========================

mapas = {
    "plan": {
        "1": "cita",
        "2": "amigos",
        "3": "familia",
        "4": "trabajo",
        "5": "solo"
    },
    "cocina": {
        "1": "pizza",
        "2": "parrilla",
        "3": "sushi",
        "4": "italiana",
        "5": "mexicana",
        "6": "hamburguesas",
        "7": "bar",
        "0": "cualquiera"
    },
    "barrio": {
        "1": "palermo",
        "2": "san_telmo",
        "3": "caballito",
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

        r = input("> ").strip()

        if campo == "precio":
            if r.isdigit():
                return int(r)

        if r in mapas[campo]:
            return mapas[campo][r]

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

    for r in resultados:

        lista.append({

            "nombre": str(r[0]),

            "puntaje": int(r[1]),

            "precio": int(r[2]),

            "rating": float(r[3]),

            "coincidencias": [str(x) for x in r[4]]

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
    "terraza": "🌿 Tiene terraza",
    "reserva": "📅 Cumple con la condición de reserva",
    "opcion": "🥗 Tiene la opción alimentaria solicitada"
}

def generar_explicacion(restaurante):

    explicacion = []

    for c in restaurante["coincidencias"]:

        c = str(c).strip()

        if c in TRADUCCION:
            explicacion.append(TRADUCCION[c])

    return explicacion

# ==========================
# RANKING
# ==========================

def mostrar_top(resultados):

    if not resultados:
        print("\n❌ No se encontraron restaurantes.")
        return

    resultados.sort(key=lambda x: x["puntaje"], reverse=True)

    print("\n🏆 TOP 10 RESTAURANTES\n")

    for i, r in enumerate(resultados[:10]):

        print(f"{i+1}. ⭐ {r['nombre']}")
        print(f"💰 Precio promedio: ${r['precio']}")
        print(f"🎯 Puntaje: {r['puntaje']}")
        print(f"⭐ Rating: {r['rating']}")

        exp = generar_explicacion(r)

        if exp:
            print("\nCoincide con:")

            for e in exp:
                print("   •", e)

        print("-"*50)
        
# ==========================
# MAIN
# ==========================

def main():

    print("🤖 Hola. Soy BotiGastro.")
    print("Te voy a ayudar a elegir dónde comer.\n")

    for c in preferencias:
        preferencias[c] = pedir_numero(c)

    print("\n🧠 Buscando mejores opciones...\n")

    resultados = ejecutar_prolog(preferencias)

    resultados = convertir_resultados(resultados)

    mostrar_top(resultados)



if __name__ == "__main__":
    main()