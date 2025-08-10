return function(n)
  local res = ""

  if n % 3 == 0 then
    res = res .. "Pling"
  end
  if n % 5 == 0 then
    res = res .. "Plang"
  end

  if n % 7 == 0 then
    res = res .. "Plong"
  end

  if res == "" then
    res = tostring(n)
  end

  return res
end
