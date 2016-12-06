#This method controls student input
def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice."
  #We create an empty array
  students =[]
  #first, we ask for the first name
  name = gets.chomp
  # While name is not empty, we repeat this code
  while !name.empty? do
    #add the student hash to the array
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} students."
    # Now we ask for another name from the user
    name = gets.chomp
    end
  #And we return the array of students
  students
  end

def print_header
  puts "The students of Villains Academy"
puts "------------"
end

def print(students)
students.each_with_index.select do |student, index|
  if student[:name].downcase.start_with?('h')
  puts "#{index}. #{student[:name]} (#{student[:cohort]} cohort)"
  end
end
end

def print_footer(names)
puts "Overall, we have #{names.count} great students."
end
# now, we call the methods

students = input_students
print_header
print(students)
print_footer(students)
