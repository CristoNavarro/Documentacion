# Autor:: Cristo Daniel Navarro Rodriguez
#
# == Nodo
#
# Los nodos (creados mediante un Struct) representan los elementos de una lista

Nodo = Struct.new(:valor, :next, :prev)

# == Clase Lista
#
# Con esta clase representamos una lista. La usamos para crear listas de alimentos que representan dietas. Incluye el modulo Enumerable.

class Lista
	include Enumerable
	# Cabeza de la lista
	attr_reader :head
	# Cola de la lista
	attr_reader :tail

	# Inicializa la lista con la cabeza y la cola iguales al parametro que se pasa al new.
	#
	# ==== Parametros
	#
	# * +head+ - Cabeza de la cola. Por defecto se pone a nil

	def initialize (head = nil)
		@head, @tail = head, head
	end

	# Formatea la lista

	def to_s
		cadena = String.new
		if (vacia)
			return "[]"
		else
			cadena << "["
			nodo = Nodo.new(@head.valor, @head.next, @head.prev)

			while nodo != tail
				cadena << "#{nodo.valor} "
				nodo = nodo.next
			end

			cadena << "#{nodo.valor}]"
		end

		return cadena
			
	end

	# Comprueba si la lista esta vacia, o lo que es lo mismo, que la cabeza apunte a nil

	def vacia
		head == nil
	end

	# Inserta un conjunto de datos por detras en la lista
	#
	# ==== Parametros
	#
	# * +datos+ - Array con los datos a insertar
	#
	# Crea un nodo con cada dato y lo va insertando por detras, ajustando el head y el tail de los nodos afectados

	def insert (datos)
		datos.each {|i|
			nodo = Nodo.new(i, nil, nil)
			if vacia
				@head = nodo
			else
				nodo.prev = @tail
				@tail.next = nodo
			end
			@tail = nodo
		}
	end

	# Extrae el primer elemento de la lista

	def pop_front
		if !vacia
			@head = @head.next 
			@head.prev = nil
		end
	end

	# Extrae el ultimo elemento de la lista

	def pop_back
		if !vacia
			@tail = @tail.prev
			@tail.next = nil
		end
	end

	# Calcula los gases emitidos anualmente en la obtencion de los alimentos de la lista
	#
	# Para ello va sumando los alimentos y devuelve la primera posicion del array resultante

	def gases_anuales
		if vacia
			return 0
		else
			resultado = [0,0]
			aux = @head

			while aux != @tail
				resultado = aux.valor + resultado
				aux = aux.next
			end
			
			resultado = aux.valor + resultado

			return resultado[0]
		end
	end

	# Calcula los gases emitidos diariamente
	#
	# Para ello calculas los emitidos en un año y los divide entre los 365 dias

	def gases_diarias
		return (gases_anuales / 365).round(3)
	end

	# Calcula el terreno consumido en un año
	#
	# Para ello suma todos los alimentos y devuelve la segunda posicion del array resultante

	def terreno
		if vacia
			return 0
		else
			resultado = [0,0]
			aux = @head

			while aux != @tail
				resultado = aux.valor + resultado
				aux = aux.next
			end
			
			resultado = aux.valor + resultado

			return resultado[1]
		end
	end

	# Metodo necesario para incluir el el modulo Enumerable
	#
	# Accede al valor de cada nodo de la lista

	def each
		aux = @head

		while aux != nil
			yield aux.valor
			aux = aux.next
		end

	end

	# Calcula el tamano de la lista
	#
	# Recorre los nodos de la lista incrementando un contador

	def size
		i = 0
		aux = @head

		while aux != nil
			i += 1
			aux = aux.next
		end

		return i
	end

	# Metodo para acceder al elemento de la lista en una posicion determinada
	#
	# ==== Parametros
	#
	# * +index+ - Posicion del elemento en la lista

	def [] (index)
		if index >= size
			return nil
		else
			aux = @head
			i = index

			while i != 0
				aux = aux.next
				i -= 1
			end

			return aux
		end
	end

	# Metodo que devuelve un array con los datos de los nodos
	#
	# Recorre todos los nodos y va insertando sus datos en el array

	def valores
		array = Array.new(size)
		aux = @head
		i = 0

		while aux != nil
			array.insert(i ,aux.valor)
			i += 1
			aux = aux.next
		end

		return array
	end
end
