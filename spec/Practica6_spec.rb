RSpec.describe Alimento do

	before (:all) do
                @chocolate = Alimento.new("Chocolate", 5.3, 47.0, 30.0, 2.3, 3.4)
                @nuez = Alimento.new("Nuez", 20.0, 21.0, 54.0, 0.3, 7.9)
        end

	context "Probando a instanciar un alimento, acceso a variables y to_s: " do
                it "Se puede instanciar un alimento." do
                        a = Alimento.new("Carne de vaca", 21.1, 0.0, 3.1, 50.0, 164.0)
		end

		it "Los getter funcionan." do
                        expect(@chocolate.nombre).to eq("Chocolate")
                        expect(@chocolate.proteinas).to eq(5.3)
                        expect(@chocolate.carbohidratos).to eq(47.0)
                        expect(@chocolate.lipidos).to eq(30.0)
                        expect(@chocolate.gases).to eq(2.3)
                        expect(@chocolate.terreno).to eq(3.4)
                        expect(@nuez.nombre).to eq("Nuez")
                        expect(@nuez.proteinas).to eq(20.0)
                        expect(@nuez.carbohidratos).to eq(21.0)
                        expect(@nuez.lipidos).to eq(54.0)
	                expect(@nuez.gases).to eq(0.3)
	                expect(@nuez.terreno).to eq(7.9)
                end

		it "Funciona el to_s." do
                        expect(@chocolate.to_s).to eq("Nombre: Chocolate, Proteinas: 5.3, Carbohidratos: 47.0, Lipidos: 30.0, Gases: 2.3, Terreno: 3.4")
                        expect(@nuez.to_s).to eq("Nombre: Nuez, Proteinas: 20.0, Carbohidratos: 21.0, Lipidos: 54.0, Gases: 0.3, Terreno: 7.9")
                end
        end

	context "Probando las funciones para calcular el valor energetico: " do
		it "Se calculan las kcal de los glucidos." do
                        expect(@chocolate.kcal_glucidos).to eq(188.0)
                        expect(@nuez.kcal_glucidos).to eq(84.0)
		end
	end
end
