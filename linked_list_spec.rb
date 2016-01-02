require "minitest/autorun"
require_relative "linked_list"

describe LinkedList do
  before do
    @linked_list = LinkedList.new
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
      first_element = "Hydrogen"
      second_element = "Helium"

      @linked_list.add(first_element)
      @linked_list.add(second_element)

      @linked_list.get(1).must_equal(second_element)
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
      initial_element = "initial"
      additional_element = "additional"
      @linked_list.add(initial_element)
      @linked_list.add(additional_element)

      @linked_list.remove(0)

      @linked_list.size.must_equal 1
      @linked_list.get(0).must_equal additional_element
    end

    it "creates an empty list if the only element is removed" do
      initial_element = "initial"
      @linked_list.add(initial_element)

      @linked_list.remove(0)

      @linked_list.empty?.must_equal true
      @linked_list.get(0).must_be_nil
    end

    it "removes the last element" do
      initial_element = "initial"
      additional_element = "additional"
      @linked_list.add(initial_element)
      @linked_list.add(additional_element)

      @linked_list.remove(1)

      @linked_list.size.must_equal 1
      @linked_list.get(0).must_equal initial_element
      @linked_list.get(1).must_be_nil
    end

    it "removes a middle element" do
      initial_element = "initial"
      additional_element = "additional"
      final_element = "final"
      @linked_list.add(initial_element)
      @linked_list.add(additional_element)
      @linked_list.add(final_element)

      @linked_list.remove(1)

      @linked_list.size.must_equal 2
      @linked_list.get(1).must_equal final_element
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
      @linked_list.add("one")
      @linked_list.add("two")
      @linked_list.remove(1)

      @linked_list.size.must_equal 1
    end
  end
end
