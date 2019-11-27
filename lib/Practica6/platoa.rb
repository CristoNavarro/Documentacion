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
end
