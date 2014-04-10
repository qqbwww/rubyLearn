#查询每天的访问数 - 针对文件 命令使用方式 ruby accesslog_file.rb 路径样式< 日志文件
MONTH = { 'jan' => 1, 'feb' => 2, 'mar' => 3, 'apr' =>4,
          'may' => 5,'jun' => 6, 'jul' =>7,'aug' => 8,
          'sep' => 9, 'oct' => 10,'nov' => 11,'dec' => 12
}

#获取路径样式
pattern = ARGV.shift
count = Hash.new(0)

while line = gets()
  column = line.chmop.split
  path = column[6]
  next if path !~ pattern
  if %r|\[(\d+)/(\w+)/(\d+)| =~ datetime
    day,month,year = $1, MONTH[$2.downcase], $3
    count["#{year}/#{month}/#{day}"] += 1
  end
end

count.sort{|a,b| a[0] <=> b[0]}.each{|key,value|
  print key, ":", value, "\n"
}
