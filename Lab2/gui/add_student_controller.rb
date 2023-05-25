# frozen_string_literal: true
require_relative '../Student_models/Student'

class Add_student_controller
  attr_reader :parent_controller
  def initialize(view, parent_controller)
    @view = view
    @parent_controller = parent_controller
    @view.ok_button.state = STATE_DOWN
    puts 'lastname_field:'
    puts @view.lastname_field.class
  end

  def add_student
    if check_valid
      @view.owner.controller.student_list.add_student(Student.from_hash(get_student_hash))
      parent_controller.refresh_data
      @view.close
    else
      @view.ok_button.state = STATE_DOWN
    end
  end

  def change_button_state
    if check_valid
      @view.ok_button.state = STATE_UP
    else
      @view.ok_button.state = STATE_DOWN
    end
  end

  def check_valid
    return false unless Student.valid_username?(@view.git_field.text) or @view.git_field.text == ""
    return false unless Student.valid_phone?(@view.phone_field.text) or @view.phone_field.text == ""
    return false unless Student.valid_mail?(@view.mail_field.text) or @view.mail_field.text == ""
    return false unless Student.valid_username?(@view.telegram_field.text) or @view.telegram_field.text == ""
    return false unless Student.valid_name?(@view.name_field.text)
    return false unless Student.valid_name?(@view.surname_field.text)
    return false unless Student.valid_name?(@view.lastname_field.text)
    true
  end

  def get_student_hash
    {
      "name": @view.name_field.text,
      "surname": @view.surname_field.text,
      "lastname": @view.lastname_field.text,
      "git": @view.git_field.text == ''? nil : @view.git_field.text,
      "phone": @view.phone_field.text == ''? nil : @view.phone_field.text,
      "mail": @view.mail_field.text == ''? nil : @view.mail_field.text,
      "telegram": @view.telegram_field.text == ''? nil : @view.telegram_field.text
    }
  end


end