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

		it "Se calculan las kcal de los lipidos." do
                        expect(@chocolate.kcal_lipidos).to eq(270.0)
                        expect(@nuez.kcal_lipidos).to eq(486.0)
                end

		it "Se calculan las kcal de las proteinas." do
                        expect(@chocolate.kcal_proteinas).to eq(21.2)
                        expect(@nuez.kcal_proteinas).to eq(80.0)
                end

		it "Se calculan las kcal totales del alimento." do
                        expect(@chocolate.kcal_total).to eq(479.2)
                        expect(@nuez.kcal_total).to eq(650.0)
                end
	end

	context "Probando la suma y la multiplicacion por un entero para el calculo del impacto: " do
		it "Se suma los gases y el terreno de un alimento con un array [gases,terreno]." do
			expect(@chocolate + [0.3,7.9] ).to eq([2.6,11.3])
		end
	end
end

RSpec.describe Dieta do

	before (:all) do
                @chocolate = Alimento.new("Chocolate", 5.3, 47.0, 30.0, 2.3, 3.4)
                @nuez = Alimento.new("Nuez", 20.0, 21.0, 54.0, 0.3, 7.9)
		@tofu = Alimento.new("Tofu", 8.0, 1.9, 4.8, 2.0, 2.2)
		@hombre = Dieta.new([@chocolate, @chocolate, @chocolate, @chocolate, @chocolate, @nuez, @tofu])
		@mujer = Dieta.new([@chocolate, @chocolate, @chocolate, @chocolate, @nuez])
        end

	context "Probando a instanciar una dieta y las funciones para calcular el impacto de los alimentos: " do
		it "Se instancia una dieta." do
			dieta = Dieta.new([@chocolate, @nuez, @nuez, @leche, @cafe])
		end

		it "Se calcula el impacto de la dieta de un hombre." do
			expect(@hombre.impacto).to eq([13.8,27.1])
			expect(@hombre.energia).to eq(3128.8)
		end

		it "Se calcula el impacto de la dieta de una mujer." do
			expect(@mujer.impacto).to eq([9.5,21.5])
			expect(@mujer.energia).to eq(2566.8)
                end
		
		it "Se calculan las proteinas de una dieta." do
			expect(@hombre.prot).to eq(54.5)
			expect(@mujer.prot).to eq(41.2)
                end
	end
end

RSpec.describe Lista do

	before (:each) do
		@nodo1 = Nodo.new(2,nil,nil)
		@lista1 = Lista.new(@nodo1)
		@lista2 = Lista.new(nil)
		@lista3 = Lista.new(nil)
		@lista3.insert([2,3,4,6,1])
	end

	context "Probando que se puede instanciar una lista, acceso a variables y to_s: " do
		it "Se instancia una lista." do
			@lista1.instance_of? Lista
		end

		it "Se puede acceder a las variables de la lista." do
			expect(@lista1.head).to eq(@nodo1)
			expect(@lista1.tail).to eq(@nodo1)
		end

		it "Funciona el to_s." do
			expect(@lista1.to_s).to eq("[2]")
			expect(@lista2.to_s).to eq("[]")
		end
	end

	context "Probando el funcionamiento de los nodos de la lista: " do
		it "Existe un nodo con sus datos, su siguiente y su previo." do
			@nodo = Nodo.new(1,nil,nil)
			expect(@nodo.valor).to eq(1)
			expect(@nodo.next).to eq(nil)
			expect(@nodo.prev).to eq(nil)
		end
	end

	context "Probando el funcionamiento de la lista: " do
		it "Se comprueba si la lista esta vacia." do
			expect(@lista2.vacia).to eq(true)
			expect(@lista1.vacia).to eq(false)
		end
		
		it "Se puede insertar un elemento." do
			@lista1.insert([4])
			expect(@lista1.to_s).to eq("[2 4]")
			@lista2.insert([5])
			expect(@lista2.to_s).to eq("[5]")
		end

		it "Se pueden insertar varios elementos." do
			@lista1.insert([1,5,6,3])
			expect(@lista1.to_s).to eq("[2 1 5 6 3]")
			@lista2.insert([2,3,4])
			expect(@lista2.to_s).to eq("[2 3 4]")
		end

		it "Se extrae el primer elemento." do
			@lista3.pop_front
			expect(@lista3.to_s).to eq("[3 4 6 1]")
			@lista3.pop_front
			expect(@lista3.to_s).to eq("[4 6 1]")
		end

		it "Se extrae el ultimo elemento." do
			@lista3.pop_back
			expect(@lista3.to_s).to eq("[2 3 4 6]")
			@lista3.pop_back
			expect(@lista3.to_s).to eq("[2 3 4]")
			@lista2.pop_back
			expect(@lista2.to_s).to eq("[]")
		end
	end
end
