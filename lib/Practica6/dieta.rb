# Autor:: Cristo Daniel Navarro Rodriguez
#
# == Clase Dieta
#
# Esta clase fue creada en las primeras practicas para representar una dieta (conjunto de alimentos).

class Dieta
	
	# Array de alimentos de la dieta
	attr_reader :alimentos

	# Inicializa la dieta
	#
	# ==== Parametros
	#
	# * +array+ - Array de alimentos

	def initialize (array)
		@alimentos = array
	end

	# Calcula el impacto ambiental que tiene la dieta formateada como un array +[gases,terreno]+

	def impacto 
		resultado = [0,0]
		@alimentos.each {|i| resultado = i + resultado}
		return resultado
	end

	# Calcula las kcal aportadas por la dieta

	def energia
		resultado = 0;
		@alimentos.each {|i| resultado = resultado + i.kcal_total}
		return resultado
	end

	# Calcula las proteinas del conjunto de alimentos

	def prot
		resultado = 0
		@alimentos.each {|i| resultado = resultado + i.proteinas}
		return resultado
	end
end
