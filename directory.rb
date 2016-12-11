@students =[]
#This method controls student input
def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice."
  #first, we ask for the first name
  name = gets.chop
  puts "Now enter #{name}'s cohort"
  cohort = gets.chop
  if cohort == ''
    cohort = 'November'
  end
  until cohort.capitalize == 'January' || cohort.capitalize == 'February' ||
    cohort.capitalize == 'March' || cohort.capitalize == 'April' ||
    cohort.capitalize == 'May' || cohort.capitalize == 'June' ||
    cohort.capitalize == 'July' || cohort.capitalize =='August' ||
    cohort.capitalize == 'September' || cohort.capitalize =='October' ||
    cohort.capitalize =='November' || cohort.capitalize == 'December'
    puts "I think you made a typo. Please re-enter"
    cohort = gets.chop
  end
  puts "Now enter #{name}'s hobby."
  hobby = gets.chop
  puts "Now enter #{name}'s country of birth."
  country = gets.chop
  puts "Now enter #{name}'s height."
  height = gets.chop
  # While name is not empty, we repeat this code
  while !name.empty? do
    #add the student hash to the array
    @students << {name: name, cohort: cohort, hobby: hobby, country: country,
                height: height}
    puts "Now we have #{@students.count} students."
    # Now we ask for another name from the user
    puts "Please type in the next student or hit enter to finish"
    name = gets.chomp
    if name == ''
      break
    end
    puts "Now enter #{name}'s cohort"
    cohort = ''
    cohort = gets.chomp
    if cohort == ''
      cohort = 'November'
    end
    until cohort.capitalize == 'January' || cohort.capitalize == 'February' ||
      cohort.capitalize == 'March' || cohort.capitalize == 'April' ||
      cohort.capitalize == 'May' || cohort.capitalize == 'June' ||
      cohort.capitalize == 'July' || cohort.capitalize =='August' ||
      cohort.capitalize == 'September' || cohort.capitalize =='October' ||
      cohort.capitalize =='November' || cohort.capitalize == 'December'
      puts "I think you made a typo. Please re-enter"
      cohort = gets.chomp
    end
    puts "Now enter #{name}'s hobby"
    hobby = gets.chomp
    puts "Now enter #{name}'s country of birth"
    country = gets.chomp
    puts "Now enter #{name}'s height."
    height = gets.chomp
    end
  end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "9. Exit"
end

def show_students
  print_header
  print_students_list
  print_footer
end

def process(selection)
  case selection
  when "1"
    students = input_students
  when "2"
    show_students
  when "3"
    save_students
  when "9"
    exit
  else
    puts "I don't know what you meant, try again."

  end
end

def interactive_menu
  loop do
    print_menu
    process(gets.chomp)
  end
end

def print_header
  puts "The students of Villains Academy"
puts "------------"
end

=begin

commented out to rewrite method using while loop

def print(students)
students.each_with_index.select do |student, index|
  if student[:name].downcase.start_with?('h') && student[:name].length <= 12
  puts "#{index}. #{student[:name]} (#{student[:cohort]} cohort)"
  end
end
end
=end

def print_students_list
  if @students.length == 0
    puts "There are no students."
  else

  @students.sort!{|a, b| a[:cohort]<=>b[:cohort]}
  count = 0
  until count == @students.length

@students.each do |student|
  puts "#{student[:name]}
  (#{student[:cohort]} cohort)
  (Hobbies: #{student[:hobby]})
  (Country of Birth: #{student[:country]})
  (Height: #{student[:height]})".center(50)
  count += 1
end
end
end
end


def print_footer
puts "Overall, we have #{@students.count} great students."
end

def save_students
  file = File.open("students.csv", "w")
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

# now, we call the methods

interactive_menu
