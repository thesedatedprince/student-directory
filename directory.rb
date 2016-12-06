#This is an array of students
students = [
"Lord Voldemort",
"Doctor Robotnik",
"Freddy Vorhees",
"M Bison",
"Kefka",
"Terminator",
"The Riddler",
"Patrick Bateman",
"Robert Killgrave",
"Uchiha Sasuke",
"Yagami Light"
]

def print_header
  puts "The students of Villains Academy"
puts "------------"
end

def print(names)
names.each do |name|
  puts name
end
end

def print_footer(names)
puts "Overall, we have #{names.count} great students."
end
# now, we call the methods

print_header
print(students)
print_footer(students)
