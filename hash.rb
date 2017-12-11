# Array
list = Array.new
# list = []
list[0] = "Hello"
list[1] = "Hi"
# puts list

# Hash
# count = {}는 count = {"1key" =>nill}로 만들어진다.
# 여기서 0의 의미는? 초기화
count = Hash.new(0)
# Hash.new(초기값)는 count = {"1key"=>0}으로 만들어짐. 초기값을 만들 수 있음
count["1key"] += 1
count["2key"] += 1
count["3key"] += 1

puts count
