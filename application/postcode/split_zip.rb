#encoding: utf-8
t0 = Time.now
open("01HOKKAIc.CSV").each{|line|
  line.chomp!
  line.split(",")
}

p Time.now - t0