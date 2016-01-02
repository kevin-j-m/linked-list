require_relative "element"

class LinkedList
  def initialize
    @head = nil
  end

  def get(index)
    if @head
      current = @head
      index.times do
        if current.tail?
          break
        else
          current = current.next
        end
      end
      current.data
    end
  end

  def add(data)
    element = Element.new(data)
    if @head
      current = @head
      until current.tail?
        current = current.next
      end

      current.next = element
    else
      @head = element
    end
  end
end
