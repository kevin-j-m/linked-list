class Element
  attr_reader :data
  attr_accessor :next

  def initialize(data)
    @data = data
    @next = nil
  end

  def tail?
    !@next
  end
end
