"""Interfaz gráfica de BotiGastro CABA.

La lógica de recomendaciones y del recorrido permanece en ``app.py``. Este
archivo solo transforma las elecciones de la interfaz en preferencias y
presenta los resultados obtenidos desde Prolog.
"""

import importlib
import os
from pathlib import Path
import tkinter as tk
from tkinter import ttk


DIRECTORIO_PROYECTO = Path(__file__).resolve().parent


OPCIONES = {
    "plan": [
        ("Pareja", "cita"), ("Amigos", "amigos"),
        ("Familia", "familia"), ("Trabajo", "trabajo"), ("Solo", "solo"),
    ],
    "cocina": [
        ("Argentina", "argentina"), ("Pizza", "pizza"),
        ("Italiana", "italiana"), ("Japonesa / sushi", "japonesa"),
        ("Asiática", "asiatica"), ("Armenia", "armenia"),
        ("India", "india"), ("Israelí", "israeli"),
        ("Mediterránea", "mediterranea"), ("Mariscos", "mariscos"),
        ("Vegetariana", "vegetariana"), ("Vegana", "vegana"),
        ("De autor", "autor"), ("Contemporánea", "contemporanea"),
        ("Fusión", "fusion"), ("Cafetería", "cafeteria"),
        ("Sin preferencia", "cualquiera"),
    ],
    "barrio": [
        ("Palermo", "palermo"), ("San Telmo", "san_telmo"),
        ("Villa Crespo", "villa_crespo"), ("Chacarita", "chacarita"),
        ("Recoleta", "recoleta"), ("Puerto Madero", "puerto_madero"),
        ("Belgrano", "belgrano"), ("San Nicolás", "san_nicolas"),
        ("Liniers", "liniers"), ("Retiro", "retiro"),
        ("Colegiales", "colegiales"), ("La Boca", "la_boca"),
        ("Almagro", "almagro"), ("Monserrat", "monserrat"),
        ("Cualquiera", "cualquiera"),
    ],
    "terraza": [("Sí", "si"), ("No", "no"), ("Indistinto", "cualquiera")],
    "reserva": [("Sí", "si"), ("No", "no"), ("Indistinto", "cualquiera")],
    "opcion": [
        ("Vegetariana", "vegetariana"), ("Vegana", "vegana"),
        ("Sin TACC", "sin_tacc"), ("Ninguna", "ninguna"),
    ],
}


class BotiGastroGUI(tk.Tk):
    FONDO = "#FFF7ED"
    TARJETA = "#FFFFFF"
    TINTA = "#31251F"
    SUAVE = "#75665D"
    TERRACOTA = "#C85E3D"
    TERRACOTA_OSCURO = "#913D2A"
    DORADO = "#E9AB52"
    CREMA = "#FBE4C8"

    def __init__(self):
        super().__init__()
        self.title("BotiGastro CABA")
        self.geometry("1080x720")
        self.minsize(820, 590)
        self.configure(background=self.FONDO)
        self._configurar_estilos()

        self.logica = None
        self.error_inicio = None
        self.resultados = []
        self.variables = {}
        self.mapa_opciones = {}
        self.contenedor = ttk.Frame(self, style="App.TFrame", padding=(32, 24))
        self.contenedor.pack(fill="both", expand=True)

        self._cargar_logica()
        self.mostrar_inicio()

    def _configurar_estilos(self):
        estilo = ttk.Style(self)
        estilo.theme_use("clam")
        estilo.configure("App.TFrame", background=self.FONDO)
        estilo.configure("Card.TFrame", background=self.TARJETA)
        estilo.configure("Title.TLabel", background=self.FONDO, foreground=self.TINTA, font=("TkDefaultFont", 21, "bold"))
        estilo.configure("Subtitle.TLabel", background=self.FONDO, foreground=self.SUAVE, font=("TkDefaultFont", 10))
        estilo.configure("CardTitle.TLabel", background=self.TARJETA, foreground=self.TINTA, font=("TkDefaultFont", 13, "bold"))
        estilo.configure("CardText.TLabel", background=self.TARJETA, foreground=self.SUAVE)
        estilo.configure("App.TLabel", background=self.FONDO, foreground=self.TINTA)
        estilo.configure("Muted.TLabel", background=self.FONDO, foreground=self.SUAVE)
        estilo.configure("Accent.TButton", background=self.TERRACOTA, foreground="white", borderwidth=0, padding=(16, 10), font=("TkDefaultFont", 10, "bold"))
        estilo.map("Accent.TButton", background=[("active", self.TERRACOTA_OSCURO)])
        estilo.configure("Secondary.TButton", background=self.CREMA, foreground=self.TERRACOTA_OSCURO, borderwidth=0, padding=(14, 9))
        estilo.map("Secondary.TButton", background=[("active", "#F5D4AD")])
        estilo.configure("Card.TLabelframe", background=self.TARJETA, bordercolor="#F1D8C1", relief="solid")
        estilo.configure("Card.TLabelframe.Label", background=self.TARJETA, foreground=self.TERRACOTA_OSCURO, font=("TkDefaultFont", 10, "bold"))
        estilo.configure("TCombobox", padding=5)
        estilo.configure("TEntry", padding=6)
        estilo.configure("TCheckbutton", background=self.TARJETA, foreground=self.TINTA, padding=4)

    def _logo(self, padre, tamanio=64):
        lienzo = tk.Canvas(padre, width=tamanio, height=tamanio, bg=self.TERRACOTA, highlightthickness=0)
        margen = tamanio * .18
        lienzo.create_oval(margen, margen, tamanio - margen, tamanio - margen, outline="#FFF7ED", width=3)
        lienzo.create_oval(tamanio*.34, tamanio*.34, tamanio*.66, tamanio*.66, outline="#FFF7ED", width=2)
        lienzo.create_line(tamanio*.21, tamanio*.28, tamanio*.21, tamanio*.72, fill="#FFF7ED", width=2)
        for x in (tamanio*.15, tamanio*.21, tamanio*.27):
            lienzo.create_line(x, tamanio*.25, x, tamanio*.37, fill="#FFF7ED", width=1)
        return lienzo

    def _encabezado(self, titulo, subtitulo):
        cabecera = ttk.Frame(self.contenedor, style="App.TFrame")
        cabecera.pack(fill="x", pady=(0, 18))
        self._logo(cabecera, 54).pack(side="left", padx=(0, 13))
        textos = ttk.Frame(cabecera, style="App.TFrame")
        textos.pack(side="left", fill="x", expand=True)
        ttk.Label(textos, text=titulo, style="Title.TLabel").pack(anchor="w")
        ttk.Label(textos, text=subtitulo, style="Subtitle.TLabel", wraplength=760).pack(anchor="w", pady=(2, 0))

    def _area_desplazable(self):
        marco = ttk.Frame(self.contenedor, style="App.TFrame")
        marco.pack(fill="both", expand=True)
        lienzo = tk.Canvas(marco, bg=self.FONDO, highlightthickness=0)
        barra = ttk.Scrollbar(marco, orient="vertical", command=lienzo.yview)
        contenido = tk.Frame(lienzo, bg=self.FONDO)
        ventana = lienzo.create_window((0, 0), window=contenido, anchor="nw")
        contenido.bind("<Configure>", lambda _e: lienzo.configure(scrollregion=lienzo.bbox("all")))
        lienzo.bind("<Configure>", lambda e: lienzo.itemconfigure(ventana, width=e.width))
        lienzo.configure(yscrollcommand=barra.set)
        lienzo.pack(side="left", fill="both", expand=True)
        barra.pack(side="right", fill="y")
        return contenido

    def _botonera(self):
        botones = ttk.Frame(self.contenedor, style="App.TFrame")
        botones.pack(fill="x", pady=(18, 0))
        return botones

    def _cargar_logica(self):
        """Carga app.py una vez: allí se crea y consulta la única instancia Prolog."""
        try:
            os.chdir(DIRECTORIO_PROYECTO)
            self.logica = importlib.import_module("app")
        except Exception:
            self.error_inicio = (
                "No se pudo iniciar la conexión con SWI-Prolog. Verificá que "
                "PySwip, SWI-Prolog y los archivos .pl estén instalados en la "
                "carpeta del proyecto."
            )

    def _limpiar(self):
        for widget in self.contenedor.winfo_children():
            widget.destroy()

    def mostrar_inicio(self):
        self._limpiar()
        marco = tk.Frame(self.contenedor, bg=self.TARJETA, highlightbackground="#F1D8C1", highlightthickness=1, padx=55, pady=42)
        marco.place(relx=.5, rely=.5, anchor="center")
        self._logo(marco, 82).pack(pady=(0, 16))
        tk.Label(marco, text="BotiGastro CABA", bg=self.TARJETA, fg=self.TINTA, font=("TkDefaultFont", 26, "bold")).pack(pady=(0, 8))
        tk.Label(
            marco,
            text="Sabores de Buenos Aires, elegidos para vos.", bg=self.TARJETA, fg=self.TERRACOTA_OSCURO,
            font=("TkDefaultFont", 12, "bold"),
        ).pack(pady=(0, 10))
        tk.Label(
            marco, bg=self.TARJETA, fg=self.SUAVE,
            text="Encontrá restaurantes según tus preferencias y armá un recorrido gastronómico a tu medida.",
            wraplength=520,
            justify="center",
        ).pack(pady=(0, 24))
        if self.error_inicio:
            tk.Label(marco, text=self.error_inicio, bg=self.TARJETA, fg="#A4372A", wraplength=520, justify="center").pack(pady=(0, 18))
            ttk.Button(marco, text="Cerrar", style="Secondary.TButton", command=self.destroy).pack()
        else:
            ttk.Button(marco, text="Comenzar a explorar  →", style="Accent.TButton", command=self.mostrar_formulario).pack()

    def mostrar_formulario(self):
        self._limpiar()
        self.variables = {}
        self.mapa_opciones = {}
        self._encabezado("Contanos qué tenés ganas", "Elegí tus preferencias y prepararemos una selección pensada para tu salida.")

        formulario = ttk.LabelFrame(self.contenedor, text="Preferencias de la salida", style="Card.TLabelframe", padding=22)
        formulario.pack(fill="x", expand=False, padx=3)
        campos = [
            ("plan", "Tipo de salida"), ("precio", "Presupuesto máximo por persona"),
            ("cocina", "Tipo de cocina"), ("barrio", "Barrio"),
            ("terraza", "Preferencia de terraza"), ("reserva", "Preferencia sobre reserva"),
            ("opcion", "Opción alimentaria"),
        ]
        for fila, (campo, etiqueta) in enumerate(campos):
            ttk.Label(formulario, text=etiqueta, style="CardText.TLabel").grid(row=fila, column=0, sticky="w", padx=(0, 22), pady=8)
            variable = tk.StringVar()
            self.variables[campo] = variable
            if campo == "precio":
                ttk.Entry(formulario, textvariable=variable, width=28).grid(row=fila, column=1, sticky="ew", pady=5)
            else:
                etiquetas = [etiqueta for etiqueta, _ in OPCIONES[campo]]
                self.mapa_opciones[campo] = dict(OPCIONES[campo])
                combo = ttk.Combobox(formulario, textvariable=variable, values=etiquetas, state="readonly", width=28)
                combo.grid(row=fila, column=1, sticky="ew", pady=5)
                combo.current(0)
        formulario.columnconfigure(1, weight=1)

        self.error_formulario = ttk.Label(self.contenedor, foreground="#A4372A", background=self.FONDO)
        self.error_formulario.pack(anchor="w", pady=(12, 0))
        botones = self._botonera()
        ttk.Button(botones, text="Buscar recomendaciones  →", style="Accent.TButton", command=self.buscar).pack(side="left")
        ttk.Button(botones, text="Volver", style="Secondary.TButton", command=self.mostrar_inicio).pack(side="right")

    def buscar(self):
        texto_precio = self.variables["precio"].get().strip()
        if not texto_precio.isdigit() or int(texto_precio) <= 0:
            self.error_formulario.config(text="Ingresá un presupuesto numérico mayor que cero.")
            return
        preferencias = {"precio": int(texto_precio)}
        for campo in OPCIONES:
            preferencias[campo] = self.mapa_opciones[campo][self.variables[campo].get()]
        try:
            crudos = self.logica.ejecutar_prolog(preferencias)
            self.resultados = self.logica.convertir_resultados(crudos)
            self.resultados.sort(key=lambda restaurante: (restaurante["puntaje"], restaurante["rating"]), reverse=True)
        except Exception:
            self.error_formulario.config(text="No se pudieron obtener recomendaciones. Revisá la configuración de Prolog.")
            return
        self.mostrar_resultados()

    def mostrar_resultados(self):
        self._limpiar()
        self._encabezado("Tu selección gastronómica", "Ordenamos las opciones por afinidad con tus preferencias, puntaje y rating.")
        if not self.resultados:
            vacio = tk.Frame(self.contenedor, bg=self.TARJETA, padx=28, pady=26, highlightbackground="#F1D8C1", highlightthickness=1)
            vacio.pack(fill="x")
            tk.Label(vacio, text="No encontramos coincidencias esta vez.", bg=self.TARJETA, fg=self.TINTA, font=("TkDefaultFont", 13, "bold")).pack(anchor="w")
            tk.Label(vacio, text="Probá ampliar el presupuesto o usar una preferencia más general.", bg=self.TARJETA, fg=self.SUAVE).pack(anchor="w", pady=(5, 14))
            ttk.Button(vacio, text="Modificar preferencias", style="Accent.TButton", command=self.mostrar_formulario).pack(anchor="w")
            return

        ttk.Label(self.contenedor, text=f"{min(10, len(self.resultados))} lugares para descubrir", style="Muted.TLabel").pack(anchor="w", pady=(0, 9))
        lista = self._area_desplazable()
        for posicion, restaurante in enumerate(self.resultados[:10], start=1):
            tarjeta = tk.Frame(lista, bg=self.TARJETA, highlightbackground="#F1D8C1", highlightthickness=1, padx=18, pady=14)
            tarjeta.pack(fill="x", pady=6, padx=3)
            insignia = tk.Label(tarjeta, text=f"#{posicion}", bg=self.TERRACOTA, fg="white", font=("TkDefaultFont", 11, "bold"), padx=9, pady=6)
            insignia.grid(row=0, column=0, rowspan=2, sticky="n", padx=(0, 13))
            tk.Label(tarjeta, text=restaurante["nombre"], bg=self.TARJETA, fg=self.TINTA, font=("TkDefaultFont", 14, "bold")).grid(row=0, column=1, sticky="w")
            datos = f"★ {restaurante['rating']:.1f}   ·   Puntaje {restaurante['puntaje']}   ·   $ {restaurante['precio']:,}".replace(",", ".")
            tk.Label(tarjeta, text=datos, bg=self.TARJETA, fg=self.TERRACOTA_OSCURO, font=("TkDefaultFont", 10, "bold")).grid(row=0, column=2, sticky="e", padx=(15, 0))
            explicacion = " · ".join(self.logica.generar_explicacion(restaurante)) or "Sin coincidencias detalladas"
            tk.Label(tarjeta, text=explicacion, bg=self.TARJETA, fg=self.SUAVE, wraplength=720, justify="left").grid(row=1, column=1, columnspan=2, sticky="w", pady=(7, 0))
            tarjeta.columnconfigure(1, weight=1)
        botones = self._botonera()
        ttk.Button(botones, text="Armar recorrido  →", style="Accent.TButton", command=self.mostrar_seleccion_recorrido).pack(side="left")
        ttk.Button(botones, text="Nueva búsqueda", style="Secondary.TButton", command=self.mostrar_formulario).pack(side="right")
        ttk.Button(botones, text="Cerrar", style="Secondary.TButton", command=self.destroy).pack(side="right", padx=(0, 8))

    def mostrar_seleccion_recorrido(self):
        self._limpiar()
        self._encabezado("Diseñá tu recorrido", "Marcá los lugares que querés visitar y después elegí dónde empezará —y terminará— el paseo.")
        seleccion_frame = ttk.LabelFrame(self.contenedor, text="1. Elegí los restaurantes", style="Card.TLabelframe", padding=14)
        seleccion_frame.pack(fill="both", expand=True)
        self.seleccion_vars = []
        for posicion, restaurante in enumerate(self.resultados[:10], start=1):
            variable = tk.BooleanVar(value=False)
            self.seleccion_vars.append(variable)
            variable.trace_add("write", self._actualizar_inicios)
            ttk.Checkbutton(
                seleccion_frame,
                text=f"{posicion}.  {restaurante['nombre']}   ·   ★ {restaurante['rating']:.1f}",
                variable=variable,
            ).grid(row=(posicion - 1) // 2, column=(posicion - 1) % 2, sticky="w", padx=10, pady=5)
        seleccion_frame.columnconfigure(0, weight=1)
        seleccion_frame.columnconfigure(1, weight=1)

        inicio_frame = ttk.LabelFrame(self.contenedor, text="2. Elegí el restaurante inicial", style="Card.TLabelframe", padding=14)
        inicio_frame.pack(fill="x", pady=14)
        ttk.Label(inicio_frame, text="El recorrido volverá a este mismo lugar.", style="CardText.TLabel").pack(side="left", padx=(0, 14))
        self.inicio_var = tk.StringVar()
        self.inicio_combo = ttk.Combobox(inicio_frame, textvariable=self.inicio_var, state="readonly", width=38)
        self.inicio_combo.pack(side="left", padx=8)
        self.error_recorrido = ttk.Label(self.contenedor, foreground="#A4372A", background=self.FONDO)
        self.error_recorrido.pack(anchor="w")
        botones = self._botonera()
        ttk.Button(botones, text="Calcular ruta óptima  →", style="Accent.TButton", command=self.calcular_recorrido).pack(side="left")
        ttk.Button(botones, text="Volver a resultados", style="Secondary.TButton", command=self.mostrar_resultados).pack(side="right")

    def _actualizar_inicios(self, *_):
        indices = [indice for indice, variable in enumerate(self.seleccion_vars) if variable.get()]
        opciones = [f"{indice + 1}. {self.resultados[indice]['nombre']}" for indice in indices]
        anterior = self.inicio_var.get()
        self.inicio_combo["values"] = opciones
        self.inicio_var.set(anterior if anterior in opciones else (opciones[0] if opciones else ""))

    def calcular_recorrido(self):
        indices = [indice for indice, variable in enumerate(self.seleccion_vars) if variable.get()]
        if len(indices) < 2:
            self.error_recorrido.config(text="Seleccioná al menos dos restaurantes para calcular el recorrido.")
            return
        try:
            indice_inicio = next(
                indice for indice in indices
                if self.inicio_var.get() == f"{indice + 1}. {self.resultados[indice]['nombre']}"
            )
        except StopIteration:
            self.error_recorrido.config(text="Elegí el restaurante inicial.")
            return
        seleccionados = [self.resultados[indice_inicio]] + [self.resultados[indice] for indice in indices if indice != indice_inicio]
        try:
            recorrido = self.logica.calcular_recorrido(seleccionados)
        except Exception:
            self.error_recorrido.config(text="No fue posible calcular el recorrido. Intentá nuevamente.")
            return
        if not recorrido:
            self.error_recorrido.config(text="No fue posible calcular el recorrido.")
            return
        self.mostrar_recorrido(recorrido, seleccionados)

    def mostrar_recorrido(self, recorrido, seleccionados):
        self._limpiar()
        nombres = {restaurante["id"]: restaurante["nombre"] for restaurante in seleccionados}
        ruta = [str(restaurante) for restaurante in recorrido["Ruta"]]
        costo_km = float(recorrido["Costo"]) * 111
        self._encabezado("Tu recorrido óptimo", "El mejor orden para visitar los restaurantes seleccionados y regresar al punto de partida.")
        resumen = tk.Frame(self.contenedor, bg=self.TERRACOTA, padx=20, pady=14)
        resumen.pack(fill="x", pady=(0, 14))
        tk.Label(resumen, text="PUNTO DE PARTIDA Y REGRESO", bg=self.TERRACOTA, fg="#FCE9D2", font=("TkDefaultFont", 9, "bold")).pack(anchor="w")
        tk.Label(resumen, text=nombres.get(ruta[0], ruta[0]), bg=self.TERRACOTA, fg="white", font=("TkDefaultFont", 15, "bold")).pack(anchor="w", pady=(3, 0))
        recorrido_frame = tk.Frame(self.contenedor, bg=self.TARJETA, highlightbackground="#F1D8C1", highlightthickness=1, padx=24, pady=16)
        recorrido_frame.pack(fill="both", expand=True)
        for posicion, restaurante_id in enumerate(ruta, start=1):
            fila = tk.Frame(recorrido_frame, bg=self.TARJETA)
            fila.pack(fill="x", anchor="w", pady=2)
            tk.Label(fila, text=str(posicion), bg=self.DORADO, fg=self.TINTA, width=3, pady=4, font=("TkDefaultFont", 9, "bold")).pack(side="left", padx=(0, 12))
            tk.Label(fila, text=nombres.get(restaurante_id, restaurante_id), bg=self.TARJETA, fg=self.TINTA, font=("TkDefaultFont", 12, "bold")).pack(side="left")
            if posicion != len(ruta):
                tk.Label(recorrido_frame, text="│", bg=self.TARJETA, fg=self.TERRACOTA, font=("TkDefaultFont", 14, "bold")).pack(anchor="w", padx=16)
        distancia = tk.Frame(self.contenedor, bg=self.CREMA, padx=18, pady=10)
        distancia.pack(fill="x", pady=(14, 0))
        tk.Label(distancia, text="DISTANCIA TOTAL APROXIMADA", bg=self.CREMA, fg=self.TERRACOTA_OSCURO, font=("TkDefaultFont", 9, "bold")).pack(anchor="w")
        tk.Label(distancia, text=f"{costo_km:.2f} km", bg=self.CREMA, fg=self.TINTA, font=("TkDefaultFont", 16, "bold")).pack(anchor="w")
        botones = self._botonera()
        ttk.Button(botones, text="Nuevo recorrido", style="Accent.TButton", command=self.mostrar_seleccion_recorrido).pack(side="left")
        ttk.Button(botones, text="Reiniciar búsqueda", style="Secondary.TButton", command=self.mostrar_formulario).pack(side="right")
        ttk.Button(botones, text="Cerrar", style="Secondary.TButton", command=self.destroy).pack(side="right", padx=(0, 8))


if __name__ == "__main__":
    BotiGastroGUI().mainloop()
