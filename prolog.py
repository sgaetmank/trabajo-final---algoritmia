# app.py
from pyswip import Prolog

def mostrar_menu(titulo, opciones):
    print(f"\n--- {titulo} ---")
    for k, v in opciones.items():
        print(f"[{k}] {v}")
    while True:
        eleccion = input("Seleccioná un número: ").strip()
        if eleccion in opciones:
            return eleccion
        print("Opción inválida. Por favor, elegí un número de la lista.")

def boti_gastro():
    prolog = Prolog()
    prolog.consult("base.pl")
    
    print("=====================================================")
    print(" 🍽️  ¡Bienvenido a BotiGastro CABA! 🍽️ ")
    print(" Tu asistente experto en recomendaciones gastronómicas.")
    print("=====================================================")

    # ESTADO 1: Tipo de Ocasión
    ocasiones = {"1": "Cita Romántica", "2": "Salida con Amigos", "3": "Almuerzo Familiar"}
    sel_ocasion = mostrar_menu("¿Qué tipo de salida estás planeando?", ocasiones)
    ocasion_map = {"1": "cita_romantica", "2": "salida_amigos", "3": "almuerzo_familiar"}
    ocasion = ocasion_map[sel_ocasion]

    # ESTADO 2: Selección de Barrio
    barrios = {"1": "Palermo", "2": "San Telmo", "3": "Chacarita", "4": "Villa Crespo"}
    sel_barrio = mostrar_menu("¿Por qué zona tenés ganas de ir?", barrios)
    barrio_map = {"1": "palermo", "2": "san_telmo", "3": "chacarita", "4": "villa_crespo"}
    barrio = barrio_map[sel_barrio]

    # ESTADO 3: Preferencia de Terraza
    terrazas = {"1": "Sí, prefiero comer afuera/terraza", "2": "No me importa / Prefiero adentro"}
    sel_terraza = mostrar_menu("¿Te interesa que el lugar tenga espacio al aire libre?", terrazas)
    terraza = "si" if sel_terraza == "1" else "no"

    # ESTADO 4: Preferencia Vegetariana
    veggies = {"1": "Sí, busco un lugar 100% vegetariano", "2": "No, que tenga de todo"}
    sel_veggie = mostrar_menu("¿Buscás un menú exclusivamente vegetariano?", veggies)
    veggie = "si" if sel_veggie == "1" else "no"

    # ESTADO 5: Presupuesto máximo
    print("\n--- Presupuesto ---")
    try:
        precio_max = int(input("¿Cuánto es lo máximo que querés gastar por plato en $? (Ej: 25000): "))
    except ValueError:
        precio_max = 999999 # Si pone cualquier cosa, no limita por precio

    # CONSULTA AL SISTEMA EXPERTO (PySwip)
    query = f"buscar_restaurante({ocasion}, {barrio}, {precio_max}, {terraza}, {veggie}, Nombre, Tipo, Precio)"
    
    print("\n🧠 [El Sistema Experto está procesando las reglas lógicas...]")
    resultados = list(prolog.query(query))

    # PRESENTACIÓN DE RESULTADOS
    if resultados:
        print(f"\n✨ ¡Completado! Encontré estas opciones ideales para tu {ocasiones[sel_ocasion]}:")
        print("=========================================================================")
        for res in resultados:
            # Decodificar strings si vienen en formato bytes desde Prolog
            nombre = res['Nombre'].decode('utf-8') if isinstance(res['Nombre'], bytes) else res['Nombre']
            tipo = res['Tipo'].decode('utf-8') if isinstance(res['Tipo'], bytes) else res['Tipo']
            
            nombre_limpio = nombre.replace('_', ' ').title()
            tipo_limpio = tipo.replace('_', ' ').title()
            
            print(f"📍 ¡Te recomiendo visitar: **{nombre_limpio}**!")
            print(f"   - Estilo gastronómico: {tipo_limpio}")
            print(f"   - Precio estimado por plato: ${res['Precio']}")
            print("-------------------------------------------------------------------------")
    else:
        print("\n❌ El Sistema Experto determinó que ningún local de la base cumple con TODOS los filtros en paralelo.")
        print("Tip: Intentá subir el presupuesto máximo o cambiar el tipo de ocasión.")

if __name__ == "__main__":
    boti_gastro()