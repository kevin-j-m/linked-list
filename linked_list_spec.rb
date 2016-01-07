require "minitest/autorun"
require_relative "linked_list"

describe LinkedList do
  before do
    @linked_list = LinkedList.new
  end

  describe "#initialize" do
    it "sets up an empty linked list with no arguments passed to it" do
      @linked_list.size.must_equal 0
      @linked_list.get(0).must_be_nil
    end

    it "adds enumerable elements to the list to start" do
      array = [1, 2, 3]
      @linked_list = LinkedList.new(array)

      @linked_list.size.must_equal array.size
      @linked_list.get(0).must_equal array.first
    end
  end

  describe "#add" do
    it "adds an initial element" do
      first_element = "new"
      @linked_list.add(first_element)

      @linked_list.get(0).must_equal(first_element)
    end

    it "provides the new size of the list" do
      first_element = "Hydrogem"
      second_element = "Helium"

      @linked_list.add(first_element)

      @linked_list.add(second_element).must_equal 2
    end
  end

  describe "#get" do
    it "retrieves the element at the specified index" do
      first = "Hydrogen"
      second = "Helium"
      @linked_list = LinkedList.new([first, second])

      @linked_list.get(1).must_equal(second)
    end

    it "returns nil if there are no elements in the list" do
      @linked_list.get(0).must_be_nil
    end
    it "returns nil if there is no element at the specified index" do
      @linked_list.add("initial data")

      @linked_list.get(7).must_be_nil
    end
  end

  describe "#remove" do
    it "removes the first element" do
      initial = "initial"
      additional = "additional"
      @linked_list = LinkedList.new([initial, additional])

      @linked_list.remove(0)

      @linked_list.size.must_equal 1
      @linked_list.get(0).must_equal additional
    end

    it "creates an empty list if the only element is removed" do
      initial_element = "initial"
      @linked_list.add(initial_element)

      @linked_list.remove(0)

      @linked_list.empty?.must_equal true
      @linked_list.get(0).must_be_nil
    end

    it "removes the last element" do
      initial = "initial"
      additional = "additional"
      @linked_list = LinkedList.new([initial, additional])

      @linked_list.remove(1)

      @linked_list.size.must_equal 1
      @linked_list.get(0).must_equal initial
      @linked_list.get(1).must_be_nil
    end

    it "removes a middle element" do
      initial = "initial"
      additional = "additional"
      final = "final"
      @linked_list = LinkedList.new([initial, additional, final])

      @linked_list.remove(1)

      @linked_list.size.must_equal 2
      @linked_list.get(1).must_equal final
    end

    it "does nothing if there is no element at that index" do
      first_element = "first"
      @linked_list.add(first_element)

      @linked_list.remove(2)

      @linked_list.size.must_equal 1
      @linked_list.get(0).must_equal first_element
    end

    it "does nothing if there are no elements in the list" do
      @linked_list.remove(1)

      @linked_list.size.must_equal 0
      @linked_list.get(0).must_be_nil
    end
  end

  describe "#empty?" do
    it "is empty if there are no elements" do
      @linked_list.empty?.must_equal true
    end

    it "is not empty if elements are in the list" do
      @linked_list.add("new")

      @linked_list.empty?.must_equal false
    end
  end

  describe "#size" do
    it "is 0 if no elements have been added" do
      @linked_list.size.must_equal 0
    end

    it "increments to the proper size as items are added" do
      @linked_list.add("one")
      @linked_list.add("two")

      @linked_list.size.must_equal 2
    end

    it "decrements to the proper size as items are removed" do
      @linked_list = LinkedList.new(%w(one two))
      @linked_list.remove(1)

      @linked_list.size.must_equal 1
    end
  end

  describe "#reverse" do
    it "does nothing with no elements" do
      @linked_list.reverse

      @linked_list.size.must_equal 0
    end

    it "is unchanged with one element" do
      first = "first"
      @linked_list.add(first)

      @linked_list.reverse

      @linked_list.size.must_equal 1
      @linked_list.get(0).must_equal first
    end

    it "reverses the order with many elements" do
      @linked_list = LinkedList.new((1..5).to_a)

      @linked_list.get(0).must_equal 1
      @linked_list.get(4).must_equal 5

      @linked_list.reverse

      5.times do |x|
        @linked_list.get(x).must_equal(5 - x)
      end
    end
  end

  describe "#to_a" do
    it "provides an empty array with no elements" do
      @linked_list.to_a.must_equal([])
    end

    it "converts the list to an array with elements in order" do
      array = [1, 2, 3]
      @linked_list = LinkedList.new(array)

      @linked_list.to_a.must_equal(array)
    end
  end

  describe "#each" do
    it "yields each element to the block" do
      @linked_list = LinkedList.new(%w(a b c d e))
      result = ""

      @linked_list.each { |e| result << e }

      result.must_equal("abcde")
    end
  end
end
