require 'csv'

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
  puts "3. Save the list"
  puts "4. Load the list"
  puts "9. Exit"
end

def show_students
  print_header
  print_students_list
  print_footer
end

def options_list(selection)
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
    puts "Exiting Program."
    exit
  else
    puts "I don't know what you meant, try again."
  end
end

def interactive_menu
  loop do
    print_menu
    options_list(STDIN.gets.chomp)
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
  puts "What would you like to save the file as?"
  your_file = gets.chomp
  file = File.open(your_file, "w") do |f3|
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    f3.puts csv_line
  end
end
  puts "File succesfully saved."
end

def load_students(filename = "students.csv")
  puts "What file would you like to load? Leave blank for default students.csv."
  filename = gets.chomp
  if filename == ""
    filename = "students.csv"
  end
  file = CSV.foreach(filename) do |f2|
    @name, cohort
    add_students
  end
  puts "File successfully loaded."
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
