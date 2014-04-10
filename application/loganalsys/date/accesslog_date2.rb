# 查询每天的访问数 - 日期正规化

MONTH = { 'jan' => 1, 'feb' => 2, 'mar' => 3, 'apr' =>4,
          'may' => 5,'jun' => 6, 'jul' =>7,'aug' => 8,
          'sep' => 9, 'oct' => 10,'nov' => 11,'dec' => 12
}

while line = gets()
  datetime = line.chmop.split[3]
  if %r|\[(\d+)/(\w+)/(\d+)| =~ datetime
    day, month, year = $1, MONTH[$2.downcase], $3
    print "#{year}/#{month}/#{day}\n"
  end
end