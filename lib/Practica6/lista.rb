Nodo = Struct.new(:valor, :next, :prev)

class Lista
	attr_reader :head, :tail

	def initialize (head)
		@head, @tail = head, head
	end

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

	def vacia
		head == nil
	end

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
end
