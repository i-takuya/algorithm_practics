n = STDIN.gets.to_i
A = STDIN.gets.split(' ').map(&:to_i)
q = STDIN.gets.to_i
M = STDIN.gets.split(' ').map(&:to_i)
ans = []
# force serach
M.each_with_index do |m, j| 
  for i in 0..n do
    #ret = A.combination(i).to_a.map{|a|a.inject{|sum, n| sum + n}};
    p = proc {|a| a.inject{|sum, n|sum+n}}
    # to_proc generate Proc object
    # &p means that pass proc object as block
    ret = A.combination(i).to_a.map(&p)
    if (ret.include? m) then
      ans[j] = "yes"
    end
  end
  if ans[j] != 'yes'
    ans[j] = 'no'
  end
end

print ans
