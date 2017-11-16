class Employee
  attr_reader :name, :title, :salary, :boss
  def initialize(name, title, salary, boss)
    @name = name
    @title = title
    @salary = salary
    @boss = boss
  end

  def bonus(multiplier)
    @salary * multiplier
  end
end


class Manager < Employee
  attr_accessor :employees
  def initialize(name, title, salary, boss, employees =[])
    super(name, title, salary, boss)
    @employees = employees
  end

  def bonus(multiplier)
    total_salary * multiplier
  end

  def total_salary
    total_sal = 0
    employees.each do |employee|
      if employee.is_a?(Manager)
        total_sal += employee.salary
        total_sal += employee.total_salary
      else
        total_sal += employee.salary
      end
    end
    total_sal
  end
end



ned = Manager.new("Ned", "Founder", 1000000, nil)
darren = Manager.new("Darren", "TA Manager", 78000, ned)
shawna = Employee.new("Shawna", "TA", 12000, darren)
david = Employee.new("David", "TA", 10000,  darren)

ned.employees = [darren]
darren.employees = [shawna, david]

p ned.bonus(5)
p darren.bonus(4)
p david.bonus(3)
