require_relative "element"

class LinkedList
  attr_reader :size

  def initialize
    @head = nil
    @size = 0
  end

  def get(index)
    get_element(index).data
  end

  def add(data)
    element = Element.new(data)
    @size += 1

    if empty?
      @head = element
    else
      current = @head
      until current.tail?
        current = current.next
      end

      current.next = element
    end
  end

  def empty?
    !@head
  end

  private

  def get_element(index)
    if size >= index + 1
      current = @head
      index.times do
        current = current.next
      end
    end

    current || NilElement.new
  end
end
