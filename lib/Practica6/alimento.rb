class Alimento
	attr_reader :nombre, :proteinas, :carbohidratos, :lipidos, :gases, :terreno

	def initialize (a,b,c,d,e,f)
                @nombre,@proteinas,@carbohidratos,@lipidos,@gases,@terreno = a,b,c,d,e,f
        end
end
