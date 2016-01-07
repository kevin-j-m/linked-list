require_relative "element"

class LinkedList
  include Enumerable

  attr_reader :size

  def initialize(elements = nil)
    set_initial_state(elements)
  end

  def get(index)
    get_element(index).data
  end

  def add(data)
    element = Element.new(data)

    if empty?
      @head = element
    else
      tail_element.next = element
    end

    @size += 1
  end

  def remove(index)
    element_to_remove = get_element(index)

    return @size if element_to_remove.nil?

    next_element = element_to_remove.next

    if element_to_remove == @head
      @head = next_element
    else
      prior_element = get_element(index - 1)

      prior_element.next = next_element
    end

    @size -= 1
  end

  def empty?
    !@head
  end

  def reverse
    reversed_array = to_a.reverse
    set_initial_state(reversed_array)
  end

  def to_a
    array = []
    each { |e| array << e }
    array
  end

  def each
    @size.times do |i|
      yield get(i)
    end
  end

  private

  def set_initial_state(elements)
    @head = nil
    @size = 0

    elements.each { |e| add(e) } if elements
  end

  def get_element(index)
    if size >= index + 1
      current = @head
      index.times do
        current = current.next
      end
    end

    current || NilElement.new
  end

  def tail_element
    get_element(size - 1)
  end
end
