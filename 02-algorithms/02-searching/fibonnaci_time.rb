require 'benchmark'

def FibRec(n)
  if (n == 0)
    return 0
  elsif (n == 1)
    return 1
  else
    return FibRec(n-1) + FibRec(n-2)
  end
end

def FibIt(n)
  fib_0 = 0
  fib_1 = 1
  reptime = n-1
  reptime.times do
    temp = fib_0
    fib_0 = fib_1
    fib_1 = temp + fib_0
  end
  return fib_1
end

p "iterative fibonnaci"
puts Benchmark.measure {
  FibIt(20)
}

p "recursive fibonnaci"
puts Benchmark.measure {
  FibRec(20)
}
