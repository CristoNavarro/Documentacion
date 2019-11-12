class Dieta

	def initialize (array)
		@alimentos = array
	end

	def impacto 
		resultado = [0,0]
		@alimentos.each {|i| resultado = i + resultado}
		return resultado
	end

	def energia
		resultado = 0;
		@alimentos.each {|i| resultado = resultado + i.kcal_total}
		return resultado
	end
end
