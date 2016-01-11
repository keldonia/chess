class Employee
  attr_accessor :salary, :title, :manager
  attr_reader :name

  def initialize(name, salary = 0, title = nil, manager = nil)
    @name = name
    @salary = salary
    @title = title
    @manager = manager
    manager.subordinates << self unless manager.nil?
  end

  def bonus(multiplier)
    salary * multiplier
  end

end

class Manager < Employee
  attr_accessor :subordinates

  def initialize(name, salary = 0, title = nil, manager = nil)
    @subordinates = []
    super(name, salary, title, manager)
  end

  def bonus(multiplier)
    multiplier * sub_salary
  end

  def sub_salary
    accumulator = 0
    subordinates.each do |subord|
      accumulator += subord.salary
      accumulator += subord.sub_salary if subord.is_a?(Manager)
    end
    accumulator
  end
end

p ned = Manager.new("Ned", 1_000_000, "Founder")
p darren = Manager.new("Darren", 78_000, "TA Manager", ned)
p shawna = Employee.new("Shawna", 12_000, "TA", darren)
p david = Employee.new("David", 10_000, "TA", darren)

p ned.bonus(5) # => 500_000
p darren.bonus(4) # => 88_000
p david.bonus(3) # => 30_000
