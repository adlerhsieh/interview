persons = [
  { name: 'John', age: 30 },
  { name: 'Beck', age: 24 },
  { name: 'Carl', age: 27 }
]

sum_a = persons.inject(0) {|result, person| 
  result + person[:age] 
}

sum_b = persons.each_with_object(0) {|person, result|
  result + person[:age]
}

sum_a == sum_b
