class PlatoN
	attr_reader :alimentos, :gramos

	def initialize (lista)
		@alimentos = Lista.new
		@gramos = Lista.new

		lista.each do |x|
			if (@alimentos.vacia || !@alimentos.find { |i| i == x })
				@alimentos.insert([x])
				@gramos.insert([(x.proteinas + x.lipidos + x.carbohidratos).round(2)])
			else
				@gramos[@alimentos.find_index(x)].valor += (x.proteinas + x.lipidos + x.carbohidratos).round(2) 
			end
		end
	end

	def gramos_total
		suma = 0
		
		@gramos.each do |i|
			suma += i
		end

		return suma
	end

	def prot
		suma = 0
	end
end
