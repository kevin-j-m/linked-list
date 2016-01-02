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
end
