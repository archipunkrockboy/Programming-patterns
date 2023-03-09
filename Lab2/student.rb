class Student
  attr_accessor :surname, :name, :lastname, :id
  attr_reader :phone, :tg, :mail, :git

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
  #валидаторы
  def self.valid_phone?(phone)
    phone.match(/^(\+7|8)((\(\d{3}\))|\d{3})\d{3}(-\d{2}-\d{2}|\d{4})$/)
  end
  def self.valid_mail?(mail)
    mail.match(/^[\w_\.\?!;'"]+@[1-9a-z]+\.(ru|com)$/)
  end

  #возможно стоит в будущем как-то объединить эти две валидации, тк проверка од
  def self.valid_tg?(tg)
    tg.match(/^@[a-z]\w*$/)
  end
  def self.valid_git?(git)
    git.match(/^@[a-z]\w*$/)
  end

  #сеттеры с проверкой
  def phone=(phone)
    raise ArgumentError, "Invalid phone value: #{phone}" if !phone.nil? && !Student.valid_phone?(phone)
    @phone = phone
  end

  def tg=(tg)
    raise ArgumentError, "Invalid telegram value: #{tg}" if !tg.nil? && !Student.valid_tg?(tg)
    @tg = tg
  end

  def mail=(mail)
    raise ArgumentError, "Invalid mail value: #{mail}" if !mail.nil? && !Student.valid_mail?(mail)
    @mail = mail
  end

  def git=(git)
    raise ArgumentError, "Invalid git value: #{git}" if !git.nil? && !Student.valid_git?(git)
    @git = git
  end

  #есть ли гит и любой контакт для связи?(почта, телеграм или номер телефона)
  def validate?
    !git.nil? && !(mail.nil? && tg.nil? && phone.nil?)
  end
end

