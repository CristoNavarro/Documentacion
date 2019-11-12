class Alimento
	attr_reader :nombre, :proteinas, :carbohidratos, :lipidos, :gases, :terreno

	def initialize (a,b,c,d,e,f)
                @nombre,@proteinas,@carbohidratos,@lipidos,@gases,@terreno = a,b,c,d,e,f
        end

	def to_s
                "Nombre: #{@nombre}, Proteinas: #{@proteinas}, Carbohidratos: #{@carbohidratos}, Lipidos: #{@lipidos}, Gases: #{@gases}, Terreno: #{@terreno}"
        end

	####    Valores energeticos ####
	
	def kcal_glucidos
	        @carbohidratos * 4
        end

	def kcal_lipidos
                @lipidos * 9
        end

	################################
end
