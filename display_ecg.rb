require 'csv'
require 'chartkick'

url = 'test.csv'

array = []

CSV.foreach(url) do |line|
  array << [line[0], line[1]]
end

p line_chart "test"