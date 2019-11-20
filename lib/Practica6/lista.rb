Nodo = Struct.new(:valor, :next, :prev)

class Lista
	attr_reader :head, :tail

	def initialize (head)
		@head, @tail = head, head
	end

	def to_s
		"Head: #{@head}, Tail: #{@tail}"
	end

	def vacia
		head == nil
	end
end
