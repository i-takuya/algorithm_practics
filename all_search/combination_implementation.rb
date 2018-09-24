## 多分こんな感じ

n = gets.to_i
arr = gets.split(',').map(&:to_i)
copy_arr = Marshal.load(Marshal.dump(arr))

def cmb2(a)
  result = []
  for i in 0..a.length - 2
    for j in i+1..a.length - 1
      result.push([a[i], a[j]])
    end
  end

  result
end

def cmbN(a, n = 2)
  result = []
  if (n == 1)
    return a
  end
  for i in 0..(a.length - (n - 1))
    tmp = a.shift
    copy_a = Marshal.load(Marshal.dump(a))
    tmp_a = cmbN(copy_a, n-1)

    tmp_a.each do |ta|
      if ta.kind_of? Array
        result.push([tmp, *ta])
      else
        result.push([tmp, ta])
      end
    end
  end

  result
end

# 配列と組み合わせ数Nを突っ込む.多分動いているはず・・・多分
# 計算量どれくらいだろO(input^n) : input is arr.length
# みたいな
A = cmbN(arr, n)
B = copy_arr.combination(n).to_a
p A == B
p A
