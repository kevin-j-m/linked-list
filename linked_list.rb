require_relative "element"

class LinkedList
  def initialize
    @head = nil
  end

  def get(index)
    if @head
      current = @head
      iterations = 0
      index.times do
        if current.tail?
          break
        else
          current = current.next
        end
        iterations += 1
      end

      iterations == index ? current.data : nil
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

  def empty?
    !@head
  end
end
