require_relative "person"

class Employee < Person
  attr_accessor :salary,
                :position,
                :date_hired,
                :tenure
end
