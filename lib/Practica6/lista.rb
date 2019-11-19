
class Lista
	attr_reader :head, :tail

	def initialize (head)
		@head, @tail = head, head
	end

	def to_s
		"Head: #{@head}, Tail: #{@tail}"
	end
end
