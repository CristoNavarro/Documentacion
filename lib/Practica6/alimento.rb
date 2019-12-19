# Autor:: Cristo Daniel Navarro Rodriguez
#
# == Clase Alimento
#
# Con esta clase, queremos representar los alimentos de una dieta. Incluye el modulo Comparable para efectuar comparaciones.

class Alimento
	include Comparable
	# @return [Object] Nombre del alimento
	attr_reader :nombre
	# @return [Object] Cantidad de proteinas en gramos
       	attr_reader :proteinas
	# @return [Object] Cantidad de carbohidratos en gramos
	attr_reader :carbohidratos
	# @return [Object] Cantidad de lipidos en gramos
	attr_reader :lipidos
	# @return [Object] Cantidad de CO2 emitido
	attr_reader :gases
	# @return [Object] Metros cuadrados de terreno usados al año
	attr_reader :terreno

	# Inicializa el alimento
	#
	# ==== Parametros
	#
	# * +a+ - Nombre
	# * +b+ - Proteinas
	# * +c+ - Carbohidratos
	# * +d+ - Lipidos 
	# * +e+ - Gases
	# * +f+ - Terreno

	def initialize (a,b,c,d,e,f)
                @nombre,@proteinas,@carbohidratos,@lipidos,@gases,@terreno = a,b,c,d,e,f
        end

	# Formatea el alimento

	def to_s
                "Nombre: #{@nombre}, Proteinas: #{@proteinas}, Carbohidratos: #{@carbohidratos}, Lipidos: #{@lipidos}, Gases: #{@gases}, Terreno: #{@terreno}"
        end	

	# Calcula las kcal aportadas por los carbohidratos
	     
	def kcal_glucidos
	        @carbohidratos * 4
        end

	# Calcula las kcal aportadas por los lipidos

	def kcal_lipidos
                @lipidos * 9
        end

	# Calcula las kcal aportadas por las proteinas

	def kcal_proteinas
		@proteinas * 4
	end

 	# Calcula las kcal totales aportadas por el alimento

	def kcal_total
                kcal_glucidos + kcal_lipidos + kcal_proteinas
        end

	# Permite sumar un alimento con un array [gases,terreno] para calcular el impacto de varios alimentos

	def +(array)
		[(@gases + array[0]).round(2),(@terreno + array[1]).round(2)]
	end	

	# Compara alimentos segun sus kcal totales aportadas
	
	def <=>(other)
		kcal_total <=> other.kcal_total
	end
end
