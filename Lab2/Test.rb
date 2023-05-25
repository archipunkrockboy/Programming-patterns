require 'minitest/autorun'
require_relative './student_models/student'
class StudentTest < Minitest::Test
  def setup
    @student = Student.new(surname: 'Месси', name: 'Лионель', lastname: 'Иванович',
                           id: 10, phone: '+79995554433', tg: '@tgtgtgt', mail: 'oppo@gmail.com', git: '@gittt')
  end

  def teardown
    # Do nothing
  end

  def test_student_init_all_params_correct
    assert @student.surname == 'Месси'
    assert @student.name == 'Лионель'
    assert @student.lastname == 'Иванович'
    assert @student.id == 10
    assert @student.phone == '+79995554433'
    assert @student.tg == '@tgtgtgt'
    assert @student.mail == 'oppo@gmail.com'
    assert @student.git == '@gittt'
  end

  def test_student_empty_options
    Student.new(surname: 'Сергеев', name: 'Сергей', lastname: 'Сергеевич')
  end


  def test_student_has_contacts
    assert @student.has_contact? == true
  end

  def test_student_has_git
    assert @student.has_git? == true
  end

  def test_student_valid_mail?
    assert Student.valid_mail?("mail@mail.ru") == true
  end

  def test_student_valid_tg
    assert Student.valid_username?("@tgtgtgtg") == true
  end

  def test_student_valid_tg
    assert Student.valid_username?("@tgtgtgtg") == true
  end

  def test_student_last_name_and_initials

    assert @student.surname_and_initials == nil
  end



end