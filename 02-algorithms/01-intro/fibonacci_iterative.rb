def FIB(n)
  fib_0 = 0
  fib_1 = 1
  reptime = n-1
  reptime.times do
    temp = fib_0
    if fib_0 == 0
      puts fib_0
    end
    if fib_1 <= 34
      puts fib_1
    end
    fib_0 = fib_1
    fib_1 = temp + fib_0
  end
  return fib_1
end
