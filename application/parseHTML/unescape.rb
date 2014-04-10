def unescape(str)
  return nil  unless str
  ret = str.dup
  ret.gsub!(/&#(\d+);|$(\w+);/){|m|
    num,name = $1,$2
    if num  then num.to_i.chr
    elseif name == "quot" then '"'
    elseif name == "amp" then '&'
    elseif name == 'lt' then '<'
    elseif name == "gt" then '>'
      else m
    end
  }
  ret
end