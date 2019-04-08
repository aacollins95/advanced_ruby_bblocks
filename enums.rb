module Enumerable
  def my_each
    for i in 0...self.size
      yield(self[i])
    end
    return self
  end

  def my_each_with_index
    for i in 0...self.size
      yield(self[i],i)
    end
    return self
  end

  def my_select
    new = []
    self.my_each {|x| new.push(x) if yield(x)}
    return new
  end

  def my_all?
    count = 0
    self.my_each {|x| count += 1 if yield(x)}
    return count == self.size
  end

  def my_any?
    detected = false
    self.my_each {|x| detected = true if yield(x)}
    return detected
  end

  def my_none?
    undetected = true
    self.my_each {|x| undetected = false if yield(x)}
    return undetected
  end

  def my_count?
    count = 0
    self.my_each {|x| count += 1 if yield(x)}
    return count
  end

  def my_map
    new = []
    self.my_each {|x| new.push(yield(x))}
    return new
  end

  def my_inject(base=self[0])
    self.my_each {|x| base = yield(base,x)}
    return base
  end

end

arr = [1,2,3,4,5]
#arr.my_each {|n| puts n**2}
#arr.my_each_with_index {|val,i| puts "#{val}: #{i}"}
#print arr.select {|n| n % 2 == 0}
#print arr.my_all? {|n| n > 1}
#print arr.my_any? {|n| n == 6}
#print arr.my_none? {|n| n == 5}
#print arr.my_count? {|n| n > 5}
#print arr.my_map {|n| n ** 5}
print arr.my_inject {|prod,n| n*prod}
