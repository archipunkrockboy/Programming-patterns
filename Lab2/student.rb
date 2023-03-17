require 'json'

class Student
  attr_accessor :surname, :name, :lastname, :id
  attr_reader :phone, :tg, :mail, :git

  def initialize(surname:, name:, lastname:, id: nil, phone: nil, tg: nil, mail: nil, git: nil)
    self.surname = surname
    self.name = name
    self.lastname = lastname
    self.id = id
    self.git = git
    set_contacts(phone: phone, tg: tg, mail: mail)
  end

  def self.make_student_from_str(str)
    begin
      info = JSON.parse(str)
      raise ArgumentError, "#{str} doesn't contain information about student!" if info.nil?
      Student.new(surname: info["surname"], name: info["name"], lastname: info["lastname"], id: info["id"], git: info["git"], phone: info["phone"], tg: info["tg"], mail: info["mail"])
    rescue JSON::ParserError
      p "Unable to extract data from #{str}"
    end
  end

  def show_info
    print "id: #{id}\nsurname: #{surname}\nname: #{name}\nlastname: #{lastname}
git: #{git}\nphone: #{phone}\ntg: #{tg}\nmail: #{mail}"
  end

  #валидаторы
  def self.valid_phone?(phone)
    phone.match(/^(\+7|8)((\(\d{3}\))|\d{3})\d{3}(-\d{2}-\d{2}|\d{4})$/)
  end
  def self.valid_mail?(mail)
    mail.match(/^[\w_\.\?!;'"]+@[1-9a-z]+\.(ru|com)$/)
  end

  def self.valid_username?(username)
    username.match(/^@[a-z]\w*$/)
  end

  def self.valid_name?(name)
    raise ArgumentError, "The argument must be String, not #{name.class}!" unless name.is_a?(String)
    name.match(/^[a-zA-Z]+/)
  end
  #есть ли гит и любой контакт для связи?(почта, телеграм или номер телефона)
  def validate?
    has_git? && has_contact?
  end

  def has_git?
    !git.nil?
  end

  def has_contact?
    !mail.nil? || !tg.nil? || !phone.nil?
  end

  def set_contacts(phone: nil, tg: nil, mail: nil)
    self.phone=(phone)
    self.tg=(tg)
    self.mail=(mail)
  end

  #сеттеры с проверкой

  def surname=(surname)
    raise ArgumentError, "Invalid surname value: #{surname}" if surname.nil? || !Student.valid_name?(surname)
    @surname = surname
  end

  def name=(name)
    raise ArgumentError, "Invalid name value: #{name}" if name.nil? || !Student.valid_name?(name)
    @name = name
  end
  def lastname=(lastname)
    raise ArgumentError, "Invalid lastname value: #{lastname}" if lastname.nil? || !Student.valid_name?(lastname)
    @lastname = lastname
  end
  def phone=(phone)
    raise ArgumentError, "Invalid phone value: #{phone}" if !phone.nil? && !Student.valid_phone?(phone)
    @phone = phone
  end

  def mail=(mail)
    raise ArgumentError, "Invalid mail value: #{mail}" if !mail.nil? && !Student.valid_mail?(mail)
    @mail = mail
  end

  def tg=(tg)
    raise ArgumentError, "Invalid telegram value: #{tg}" if !tg.nil? && !Student.valid_username?(tg)
    @tg = tg
  end

  def git=(git)
    raise ArgumentError, "Invalid git value: #{git}" if !git.nil? && !Student.valid_username?(git)
    @git = git
  end

  #возвращает строку с фамилией, инициалами и контактом для связи
  def get_info
    get_surname_and_initials + get_contacts
  end
  def get_contacts
    contacts = ""
    contacts += "git: #{git} "  if has_git?
    contacts += "mail: #{mail} " unless mail.nil?
    contacts += "tg: #{tg} " unless tg.nil?
    contacts += "phone: #{phone} " unless phone.nil?
    contacts
  end
  def get_surname_and_initials
    "#{surname} #{name[0]}. #{lastname[0]}. "
  end
end


