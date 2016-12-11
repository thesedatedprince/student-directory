@students =[]
#This method controls student input
def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice."
  #first, we ask for the first name
  @name = STDIN.gets.chomp
  while !@name.empty? do
    #add the student hash to the array
    add_students
    puts "Now we have #{@students.count} students."
    # Now we ask for another name from the user
    @name = STDIN.gets.chomp
    end
  end

def add_students
  cohort = :november
  @students << {name: @name, cohort: cohort.to_sym}
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
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
  when "4"
    load_students
  when "9"
    exit
  else
    puts "I don't know what you meant, try again."

  end
end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def print_header
  puts "The students of Villains Academy"
puts "------------"
end



def print_students_list
@students.each do |student|
  puts "#{student[:name]} (#{student[:cohort]} cohort)"
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

def load_students(filename = "students.csv")
  file = File.open(filename, "r")
  file.readlines.each do |line|
    @name, cohort = line.chomp.split(',')
    add_students
  end
  file.close
end

def try_load_students
  filename = ARGV.first
  if filename.nil?
    load_students("students.csv")
  else File.exists?(filename)
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}"
  end
end
  # now, we call the methods
try_load_students
interactive_menu
