# Autor:: Cristo Daniel Navarro Rodriguez
#
# == Clase PlatoA
#
# Esta clase hereda de la clase PlatoN. Con ella representamos las caracteristicas del impacto ambiental del plato.

class PlatoA < PlatoN
	# Lista de los gases emitidos por los alimentos del plato
	attr_reader :gases
	# Lista del terreno consumido por los alimentos del plato
	attr_reader :terreno

	# Inicializa el plato "ambiental"
	#
	# ==== Parametros
	#
	# * +lista+ - Lista con los alimentos
	#
	# Inicializa la clase madre y las listas. Para cada alimento en el atributo @alimentos, calcula su cantidad en gramos y sobre esta cantidad calcula los gases y el terreno correspondientes.

	def initialize (lista)
		super(lista)

		@gases = Lista.new
		@terreno = Lista.new
		x = 0
		suma = 0

		@alimentos.each do |i|
			cantidad = @gramos[x].valor / (i.proteinas + i.lipidos + i.carbohidratos)
			suma = (i.gases * cantidad).round(2)
			@gases.insert([suma])
			suma = (i.terreno * cantidad).round(2)
			@terreno.insert([suma])
			x += 1
		end
	end

	# Calcula los gases totales emitidos
	#
	# Suma los gases emitidos por cada alimento

	def gases_total
		suma = 0

		@gases.each do |i|
			suma += i
		end

		suma = suma.round(2)
	end

	# Calcula el terreno total consumido
	#
	# Suma el terreno consumido por cada alimento

	def terreno_total
		suma = 0

		@terreno.each do |i|
			suma += i
		end

		suma = suma.round(2)
	end

	# Formatea el plato "ambiental"

	def to_s
		"[Gases -> #{gases_total}, Terreno -> #{terreno_total}]"
	end
end
