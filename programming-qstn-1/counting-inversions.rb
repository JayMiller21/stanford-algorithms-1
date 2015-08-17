# Read file to array
starting_ary = IO.readlines('./IntegerArray.txt')
starting_ary.map! { |x|
  x.strip.to_i
}


def merge_and_count_split_inv(a,b)
  
  split_inv_count = 0
  n = a.length + b.length
  c = Array.new(n)
  i = 0
  j = 0

  for k in 0..n-1
    if a[i].nil?
      c[k] = b[j]
      j += 1
    elsif b[j].nil?
      c[k] = a[i]
      i += 1
    elsif a[i] < b[j]
      c[k] = a[i]
      i += 1
    elsif b[j] < a[i]
      c[k] = b[j]
      j += 1
      split_inv_count += a[i..-1].length
    end
  end

  return [c,split_inv_count]

end


def sort_and_count_inv(array)
 
  n = array.length
  inv_count = 0

  if n >= 2
    a = array[0..n/2-1]
    b = array[n/2..n-1]
    if a.length >= 2 
      a_ary = sort_and_count_inv(a)
      a = a_ary[0]
      inv_count += a_ary[1]
    end
    if b.length >= 2 
      b_ary = sort_and_count_inv(b)
      b = b_ary[0]
      inv_count += b_ary[1]
    end
    c_ary = merge_and_count_split_inv(a,b)
    c = c_ary[0]
    inv_count += c_ary[1]
    [c,inv_count]
  else
    [array,0]
  end

end
