require_relative "person"
require_relative "employee"
require_relative "student"

class Menu
  CHOICES = ["A", "S", "D", "Q"]

  def initialize
    @people = []
  end

  def display
    menu_choice = ""
    while menu_choice != "Q"
      begin
        puts """Welcome to the Iron Yard Database. Please select one of the following:
        [A]dd     - Adds a new user
        [S]earch  - Searches Database of current users
        [D]elete  - Delete a current member of the database
        [Q]uit    -  Quits database """
        menu_choice = gets.chomp.upcase
        if menu_choice == "A"
          add
        elsif menu_choice == "S"
          search
        elsif menu_choice == "D"
          delete
        elsif menu_choice == "Q"

          return
        end
      end until CHOICES.include?(menu_choice)
    end
  end

  def search
    puts "What is name of the person you would like to search for?"
    search_name = gets.chomp.upcase
    found = @people.find {|person| person.name.include?(search_name)}
    if found == nil
      puts "#{search_name} is not in the database"
    elsif found.is_a?(Student)
      puts "Name: #{found.name}\n Age: #{found.age}\n Phone: #{found.phone}\n Address: #{found.address}\n Github: #{found.github}\n Slack: #{found.slack}, Scholarhips: #{found.scholarship}"
    elsif found.is_a?(Employee)
      puts "Name: #{found.name}\n Age: #{found.age}\n Phone: #{found.phone}\n Address: #{found.address}\n Github: #{found.github}\n Slack: #{found.slack}\n Salary: #{found.salary}\n Position: #{found.position}, Date Hired: #{found.date_hired},\n Tenure: #{found.tenure}"
      puts "Has been a #{found.position} for at least #{found.tenure} years."
    end
  end

  def delete
    puts "What is the name of the user you would like to delete??"
    delete_name = gets.chomp.upcase
    deleted = @people.find {|person| person.name.include?(delete_name)}
    if deleted == nil
      puts "#{delete_name} is not in the database"
    end
    @people.delete(deleted)
    puts "#{delete_name} has been removed from database."
  end

  def add
  print " Do you wish to add a [S]tudent or [E]mployee? : "
  person_type = gets.chomp.upcase
    if person_type == "S"
      print " What is the name of the student you wish to add? : "
      student_name = Student.new
      student_name.name = gets.chomp.upcase
      if @people.find {|person| person.name.include?(student_name.name)}
        puts "Student already exists"
      else
        print "What is their age? : "
        student_name.age = gets.chomp
        print "What is their phone number? : "
        student_name.phone = gets.chomp
        print "What is their address? : "
        student_name.address = gets.chomp
        print "What is their Github account information? : "
        student_name.github = gets.chomp
        print "What is their Slack account information? : "
        student_name.slack = gets.chomp
        print "Any scholarship information? : "
        student_name.scholarship = gets.chomp
        puts "#{student_name.name} has been added as a student!"
        @people << student_name
      end
    elsif person_type == "E"
      print " What is the name of the employee you wish to add? : "
      employee_name = Employee.new
      employee_name.name = gets.chomp.upcase
      if @people.find {|person| person.name.include?(employee_name.name)}
        puts "Employee already exists"
      else
        print "What is their age? : "
        employee_name.age = gets.chomp
        print "What is their phone number? : "
        employee_name.phone = gets.chomp
        print "What is their address? : "
        employee_name.address = gets.chomp
        print "What is their Github account information? : "
        employee_name.github = gets.chomp
        print "What is their Slack account information? : "
        employee_name.slack = gets.chomp
        print "What is their salary information?"
        employee_name.salary = gets.chomp
        print "What position did they hold?"
        employee_name.position = gets.chomp
        print " What is the date they were hired?"
        employee_name.date_hired = gets.chomp
        puts "#{employee_name.name} has been added as an employee!"
        @people << employee_name
      end
    else
      puts "Not a valid choice."

      return
    end
  end

end
