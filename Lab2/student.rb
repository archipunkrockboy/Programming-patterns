class Student
  attr_reader :surname, :name, :lastname,
              :id, :phone, :tg, :mail, :git
  attr_writer :surname, :name, :lastname,
              :id, :phone, :tg, :mail, :git
  def initialize(surname, name, lastname, optional_parameters={})
    self.surname = surname
    self.name = name
    self.lastname = lastname
    self.id = optional_parameters[:id]
    self.phone = optional_parameters[:phone]
    self.tg = optional_parameters[:tg]
    self.mail = optional_parameters[:mail]
    self.git = optional_parameters[:git]
  end
  
end

a = Student.new(1, 2, 3,  {id: 5, mail: 7})
