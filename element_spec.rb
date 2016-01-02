require "minitest/autorun"
require_relative "element"

describe Element do
  describe "#data" do
    it "provides the data initialized in the element" do
      data = "Boron"
      element = Element.new(data)

      element.data.must_equal data
    end
  end

  describe "#next" do
    it "has no next element by default" do
      element = Element.new("Hydrogen")

      element.next.must_be_nil
    end

    it "provides the next element if one has ben set" do
      element = Element.new("Hydrogen")
      next_element = element.next = Element.new("Helium")

      element.next.must_equal next_element
    end
  end

  describe "#tail?" do
    it "responds as the tail if there are not other elements" do
      element = Element.new("no other elements here")

      element.tail?.must_equal true
    end

    it "is not the tail if there is a next element" do
      element = Element.new("not the last")
      element.next = Element.new("the last")

      element.tail?.must_equal false
    end
  end
end
