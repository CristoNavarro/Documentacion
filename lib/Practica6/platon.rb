class PlatoN
	def initialize (lista)
		@alimentos = Lista.new
		@gramos = Lista.new
		aux = lista.head

		while aux != nil
			if (@alimentos.vacia || !@alimentos.find { |i| i == aux.valor })
				@alimentos.insert([aux.valor])
				@gramos.insert([1000])
			else
				@gramos[@alimentos.find_index(aux.valor)].valor += 1000
			end

			aux = aux.next
		end
	end
end
