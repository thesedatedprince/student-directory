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

#This prints the students by index number in the array
puts "The students of Villains Academy"
puts "------------"
students.each do |student|
  puts student
end

# next, we print the total number of students
puts "Overall, we have #{students.count} great students."
