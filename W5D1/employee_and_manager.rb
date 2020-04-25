class Employee
  attr_accessor :boss
  attr_reader :name, :title, :salary

  def initialize(name,title,salary,boss=nil)
    @name   = name
    @title  = title
    @salary = salary
    self.boss = boss
  end

  def boss=(boss)
    @boss = boss
    boss.add_employee(self) unless boss.nil?

    boss
  end

  def bonus(multiplier)
    bonus = salary * multiplier
  end
end

#bonus = (total salary of all sub-employees) * multiplier

class Manager < Employee
  attr_accessor :employees

  def initialize(name,title,salary,boss=nil)
    super(name,title,salary,boss)
    @employees = []
  end

  def add_employee(subordinate)
    employees << subordinate
    employees
  end

  def bonus(multiplier)
    bonus = total_subsalary * multiplier
  end

  protected
  
  def total_subsalary
    total_subsalary = 0
    self.employees.each do |employee|
      if employee.is_a?(Manager)
        total_subsalary += employee.salary + employee.total_subsalary
      else
        total_subsalary += employee.salary
      end
    end

    total_subsalary
  end
end

Ned    = Manager.new("Ned","Founder",1000000)
Darren = Manager.new("Darren","TA Manager",78000,Ned)
Shawana = Employee.new("Shawana","TA",12000,Darren)
David  = Employee.new("David","TA",10000,Darren)

puts Ned.bonus(5)
puts Darren.bonus(4)
puts David.bonus(3)
