class Student

  def initialize(name, grade)
    @name = name
    @grade = grade
  end

  def better_grade_than?(student)
    self.grade > student.grade 
  end

  def name
    @name
  end 

  protected

  def grade
    @grade
  end


end

joe = Student.new('Joe', 200)
bob = Student.new('Bob', 150)

p joe.name
p bob.name

puts "Well done!" if joe.better_grade_than?(bob)

puts bob.better_grade_than?(joe)
