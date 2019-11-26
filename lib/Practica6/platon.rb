class PlatoN
	attr_reader :alimentos, :gramos

	def initialize (lista)
		@alimentos = Lista.new
		@gramos = Lista.new
		aux = lista.head

		while aux != nil
			if (@alimentos.vacia || !@alimentos.find { |i| i == aux.valor })
				@alimentos.insert([aux.valor])
				@gramos.insert([(aux.valor.proteinas + aux.valor.lipidos + aux.valor.carbohidratos).round(2)])
			else
				@gramos[@alimentos.find_index(aux.valor)].valor += (aux.valor.proteinas + aux.valor.lipidos + aux.valor.carbohidratos).round(2) 
			end

			aux = aux.next
		end
	end

	def gramos_total
		suma = 0
		aux = @gramos.head

		while aux != nil
			suma += aux.valor
			aux = aux.next
		end

		return suma
	end
end
