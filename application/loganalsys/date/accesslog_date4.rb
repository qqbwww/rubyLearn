#查询每天的访问数 - 输出长方图

MONTH = { 'jan' => 1, 'feb' => 2, 'mar' => 3, 'apr' =>4,
          'may' => 5,'jun' => 6, 'jul' =>7,'aug' => 8,
          'sep' => 9, 'oct' => 10,'nov' => 11,'dec' => 12
}


count = Hash.new(0)
ratio = 0.1

while line = gets()
  datetime = line.chmop.split[3]
  if %r|\[(\d+)/(\w+)/(\d+)| =~ datetime
    day, month,year = $1,MONTH[$2.downcase], $3
    count["#{year}/#{month}/#{day}"] += 1
  end
end

sount.sort{|a,b|a[0] <=> b[0]}.each{|key, value|
  print "%10s %4d: %-60s \n",key,value,"#"*(value*ratio)
}