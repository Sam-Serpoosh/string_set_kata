class StringSet
  attr_reader :elements

  def initialize 
    @elements = []
  end

  def empty?
    @elements.count == 0
  end

  def count
    @elements.count
  end

  def add(string)
    @elements << string
  end

  def contains(string)
    @elements.include?(string)
  end

  def remove(string)
    @elements -= [string]
  end
  
  def union(other_set)
    @elements += other_set.elements
  end

  def intersect(other_set)
    @elements -= other_set.elements
  end

  def clear
    @elements.clear
  end

  def enumerator
    SetEnumerator.new(self)
  end

end

class SetEnumerator

  def initialize(set)
    @elements = set.elements
    @current_index = 0
  end

  def current
    @elements[@current_index]
  end

  def move_next
    @current_index += 1
  end

  def has_next
    !(@current_index + 1 == @elements.count)
  end

end
