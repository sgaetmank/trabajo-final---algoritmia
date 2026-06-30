import subprocess
import json

SWIPL = r"C:\Program Files\swipl\bin\swipl.exe"

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
# PREGUNTAS (TODO NUMÉRICO)
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
# VALIDACIÓN SEGURA
# ==========================

def pedir_numero(campo):
    while True:
        print("\n🤖 BotiGastro:")
        print(preguntas[campo])

        r = input("> ").strip()

        if campo == "precio":
            if r.isdigit():
                return int(r)
            print("❌ Ingresá un número válido.")
            continue

        if r in mapas[campo]:
            return mapas[campo][r]

        print("❌ Opción inválida. Intentá de nuevo.")

# ==========================
# PROLOG
# ==========================
def ejecutar_prolog(p):

    consulta = f"""
    findall(
        [Nombre,Puntaje,Precio],
        buscar_restaurante(
            {p['barrio']},
            {p['precio']},
            {p['cocina']},
            {p['cocina']},
            {p['plan']},
            {p['terraza']},
            {p['reserva']},
            {p['opcion']},
            Nombre,
            Precio,
            Rating,
            Puntaje,
            Motivos
        ),
        Resultados
    ),
    write(Resultados),
    nl,
    halt.
    """

    proceso = subprocess.run(
        [SWIPL, "-q", "-s", "consultas.pl", "-g", consulta],
        capture_output=True,
        text=True,
        timeout=5
    )

    if proceso.returncode != 0:
        print("❌ ERROR PROLOG:")
        print(proceso.stderr)
        return []

    salida = (proceso.stdout or "").strip()


    return salida

def parse_resultados(raw):

    if not raw or raw == "[]":
        return []

    raw = raw.strip()

    # limpiar estructura Prolog
    raw = raw.replace("[[", "[").replace("]]", "]")

    items = []

    partes = raw.split("],[")

    for p in partes:
        p = p.replace("[", "").replace("]", "")
        campos = p.split(",")

        if len(campos) >= 3:
            nombre = campos[0]
            puntaje = int(campos[1])
            precio = int(campos[2])
            items.append((nombre, puntaje, precio))

    return items

# ==========================
# TOP 10
# ==========================

def mostrar_top(resultados):

    if not resultados:
        print("\n❌ No se encontraron resultados.")
        return

    resultados.sort(key=lambda x: x[1], reverse=True)

    print("\n🏆 TOP 10 RESTAURANTES:\n")

    for i, r in enumerate(resultados[:10]):
        print(f"{i+1}. ⭐ {r[0]} | {r[1]} pts | 💰 {r[2]}")

# ==========================
# MAIN
# ==========================
def main():

    print("🤖 Hola. Soy BotiGastro.")
    print("Te voy a ayudar a elegir dónde comer.\n")

    for campo in preferencias:
        preferencias[campo] = pedir_numero(campo)

    print("\n🧠 Buscando mejores opciones...\n")

    raw = ejecutar_prolog(preferencias)

    resultados = parse_resultados(raw)

    mostrar_top(resultados)


if __name__ == "__main__":
    main()