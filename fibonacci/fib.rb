a = ARGV[0].to_i
$fib_array = []
$fib_array[0] = 1
$fib_array[1] = 1
def fib(n)
  if (n >= 2) then
    fib_n1 = if $fib_array[n-1] then 
      $fib_array[n-1] 
    else
      $fib_array[n-1] = fib(n-1)
      $fib_array[n-1]
    end
    fib_n2 = if $fib_array[n-2] then
      $fib_array[n-2]
    else
      $fib_array[n-2] = fib(n-2)
      $fib_array[n-2]
    end
  end

  if (n == 0 || n == 1) then
    return 1
  else
    return $fib_array[n-2] + $fib_array[n-1]
  end
end
# フィボナッチ by memoka saiki
print fib(a-1)
