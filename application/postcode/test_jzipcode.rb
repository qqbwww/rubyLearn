require 'zjipcode'
require "nkf"

t0 = Time.now
code = ARGV[0] || "10000000"
if rows = JZipCode.find(code)
  rows.each{|row|
    address = row[6] + row[7]
    unless /^\210\310\211\272\202\311/ =~ row[8]
      address << row[8]
    end
    puts NKF.nkf("-u",address)
  }
end

p Time.now - t0