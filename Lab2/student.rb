class Student
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

  def id
    @id
  end

  def id=(id)
    @id = id
  end

  def surname
    @surname
  end

  def surname=(surname)
    @surname = surname
  end
  def name
    @name
  end

  def name=(name)
    @name = name
  end

  def lastname
    @lastname
  end

  def lastname=(lastname)
    @lastname = lastname
  end

  def phone
    @phone
  end

  def phone=(phone)
    @phone = phone
  end

  def tg
    @tg
  end

  def tg=(tg)
    @tg = tg
  end

  def mail
    @mail
  end

  def mail=(mail)
    @mail = mail
  end

  def git
    @git
  end

  def git=(git)
    @git = git
  end


end

a = Student.new(1, 2, 3,  {id: 5, mail: 7})
