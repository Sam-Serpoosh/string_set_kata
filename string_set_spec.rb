require './string_set'

describe "string set" do

  let(:set) { StringSet.new }

  it "is empty at creation" do
    set.should be_empty
  end

  it "adds string element" do
    set.add("hello")
    set.elements.should include("hello")
  end

  it "is not empty after adding a string" do
    set.add("hello")
    set.should_not be_empty
  end

  it "detects whether contains a string" do
    set.contains("hello").should be_false

    set.add("hello")
    set.contains("hello").should be_true
  end

  it "does nothing when remove from a empty set" do
    set.should be_empty
    set.remove("hello")
    set.should be_empty
  end

  it "removes the element form the set" do
    set.add("hello")
    set.remove("hello")
    set.should be_empty
  end

  it "removes the specified element from the set" do
    set.add("hello")
    set.add("bye")
    set.remove("bye")
    set.contains("bye").should be_false
    set.contains("hello").should be_true
  end

  it "unions with another set" do
    other_set = StringSet.new
    other_set.add("hello")
    set.add("bye")
    set.union(other_set)
    set.count.should == 2
    set.contains("hello").should be_true
    set.contains("bye").should be_true
  end

  it "intersects sets" do
    other_set = StringSet.new
    other_set.add("first")
    other_set.add("second")
    set.add("first")
    set.add("second")
    set.add("third")
    set.intersect(other_set)
    set.count.should == 1
    set.contains("third").should be_true
  end

  it "clears the set" do
    set.add("element")
    set.clear
    set.count.should == 0
  end 

  it "enumerates through elements" do
    set.add("first")
    set.add("second")
    set.add("third")

    enumerator = set.enumerator
    while enumerator.has_next
      enumerator.move_next
    end
    enumerator.current.should == "third"
  end

end


describe "Enumerator For Sets" do

  let(:set) { StringSet.new }

  it "gets the first element" do
    set.add("first")
    set.add("second")
    enumerator = set.enumerator
    enumerator.current.should == "first"
  end

  it "move to the next element" do
    set.add("first")
    set.add("second")
    enumerator = set.enumerator
    enumerator.current.should == "first"
    enumerator.move_next
    enumerator.current.should == "second"
  end

  it "detects whether next element exists or not" do
    set.add("first")
    enumerator = set.enumerator
    enumerator.has_next.should be_false
    set.add("second")
    enumerator = set.enumerator
    enumerator.has_next.should be_true
  end

end
