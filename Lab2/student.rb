require 'json'
require_relative 'student_short'
class Student < Student_short
  attr_accessor :surname, :name, :lastname, :id
  attr_reader :phone, :tg, :mail, :git


  def initialize(surname:, name:, lastname:, id: nil, phone: nil, tg: nil, mail: nil, git: nil)
    self.surname = surname
    self.name = name
    self.lastname = lastname
    set_contacts(phone: phone, tg: tg, mail: mail)
  end

  def self.make_student_from_str(str)
    args = Student.get_hash(str)
    Student.new(surname: args["surname"], name: args["name"], lastname: args["lastname"], id: args["id"], git: args["git"], phone: args["phone"], tg: args["tg"], mail: args["mail"])
  end

  def to_s
    info = "surname: #{surname}, name: #{name}, lastname: #{lastname}, "
    info += "git: #{git}, " unless git.nil?
    info += "phone: #{phone}, " unless phone.nil?
    info += "tg: #{tg}, " unless tg.nil?
    info += "mail: #{mail}, " unless mail.nil?
    info = info.slice(0..info.size-3)
    info
  end

  #возвращает строку с фамилией, инициалами и контактом для связи
  def get_info
    info = ''
    info += '"surname_and_initials": "' + "#{surname} #{name[0]}. #{lastname[0]}." + '"'
    info += ', "git": "' + git + '"' if has_git?
    info += ', "contact": "' + get_contact + '"' if has_contact?
    '{'+info+'}'
  end

  #на вход строка, на выход json-строка
  def self.make_json_str(str)
    result = ''
    str.split(' ').each do |word|
      if word[-1] == ':'
        result += '"' + word.slice(0..word.size-2) + '": '
      else
        if word[-1] == ','
          result += '"' + word.slice(0..word.size-2) + '", '
        else result += '"' + word + '"'
        end
      end
    end
    '{' + result + '}'
  end
  def self.read_from_txt(path)
    result = []
    begin
    File.readlines(path).each do |str|
      result << make_student_from_str(make_json_str(str))
    end
    result
    rescue Errno::ENOENT
      p "No such file or directory: #{path}"
    end
  end
  def self.write_to_txt(students, path)
    begin
      file = File.open(path, 'w')
      students.each do |student|
        file.write("#{student.to_s}\n")
      end
    rescue IOError
      p "Error writing to file: #{path}"
    end
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

  def set_contacts(phone: nil, tg: nil, mail: nil)
    self.phone=(phone)
    self.tg=(tg)
    self.mail=(mail)
    @contact = get_contact
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

  def git=(git)
    raise ArgumentError, "Invalid git value: #{git}" if !git.nil? && !Student.valid_username?(git)
    @git = git
  end

  private
  def get_contact
    return self.phone unless self.phone.nil?
    return self.mail unless self.mail.nil?
    self.tg unless self.tg.nil?
    nil
  end
  
  def mail=(mail)
    raise ArgumentError, "Invalid mail value: #{mail}" if !mail.nil? && !Student.valid_mail?(mail)
    @mail = mail
  end

  def tg=(tg)
    raise ArgumentError, "Invalid telegram value: #{tg}" if !tg.nil? && !Student.valid_username?(tg)
    @tg = tg
  end

  def phone=(phone)
    raise ArgumentError, "Invalid phone value: #{phone}" if !phone.nil? && !Student.valid_phone?(phone)
    @phone = phone
  end
end





