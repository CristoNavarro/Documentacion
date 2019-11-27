class PlatoA < PlatoN
	attr_reader :gases, :terreno

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

	def gases_total
		suma = 0

		@gases.each do |i|
			suma += i
		end

		suma = suma.round(2)
	end

	def terreno_total
		suma = 0

		@terreno.each do |i|
			suma += i
		end

		suma = suma.round(2)
	end

	def to_s
		"[Gases -> #{gases_total}, Terreno -> #{terreno_total}]"
	end
end
