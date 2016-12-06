#This is an array of students
students = [
{name: "Lord Voldemort", cohort: :november},
{name: "Doctor Robotnik", cohort: :november},
{name: "Freddy Vorhees", cohort: :november},
{name: "M Bison", cohort: :november},
{name: "Kefka", cohort: :november},
{name: "Terminator", cohort: :november},
{name: "The Riddler", cohort: :november},
{name: "Patrick Bateman", cohort: :november},
{name: "Robert Killgrave", cohort: :november},
{name: "Uchiha Sasuke", cohort: :november},
{name: "Yagami Light", cohort: :november}
]

def print_header
  puts "The students of Villains Academy"
puts "------------"
end

def print(students)
students.each do |student|
  puts "#{student[:name]} (#{student[:cohort]} cohort)"
end
end

def print_footer(names)
puts "Overall, we have #{names.count} great students."
end
# now, we call the methods

print_header
print(students)
print_footer(students)
