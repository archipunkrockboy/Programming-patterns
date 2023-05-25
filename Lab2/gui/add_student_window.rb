# frozen_string_literal: true

require 'fox16'
require_relative './add_student_controller'
include Fox
class Add_student_window < FXDialogBox
  attr_accessor :ok_button, :name_field, :surname_field,
              :lastname_field, :git_field, :phone_field,
              :mail_field, :telegram_field, :ok_button

  def initialize(p)
    super(p, 'Добавить студента')
    add_input_textfields
    add_terminating_buttons
    add_event_on_textfields
  end

  def controller=(controller)
    @controller = controller
  end

  protected
  def add_terminating_buttons
    v_frame = FXVerticalFrame.new(self)
    @cancel_button = FXButton.new(v_frame, "Cancel")
    @cancel_button.connect(SEL_COMMAND) do
      self.close
    end

    @ok_button = FXButton.new(v_frame, "OK")
    @ok_button.connect(SEL_COMMAND) do
      @controller.add_student
    end

  end

  def add_input_textfields

    #matrix = FXMatrix.new(self, 2, :opts => MATRIX_BY_COLUMNS|LAYOUT_FILL)
    matrix = FXHorizontalFrame.new(self)
    FXLabel.new(matrix, "name:")
    @name_field = FXTextField.new(matrix, 14)

    FXLabel.new(matrix, "surname:" )
    @surname_field = FXTextField.new(matrix, 14)

    FXLabel.new(matrix, "lastname:" )
    @lastname_field = FXTextField.new(matrix, 14)

    FXLabel.new(matrix, "git:" )
    @git_field = FXTextField.new(matrix, 14)

    FXLabel.new(matrix, "phone:" )
    @phone_field = FXTextField.new(matrix, 14)

    FXLabel.new(matrix, "mail:" )
    @mail_field = FXTextField.new(matrix, 14)

    FXLabel.new(matrix, "telegram:" )
    @telegram_field = FXTextField.new(matrix, 14)
  end

  def add_event_on_textfields
    @name_field.connect(SEL_CHANGED) do
      @controller.change_button_state
    end

    @surname_field.connect(SEL_CHANGED) do
      @controller.change_button_state
    end

    @lastname_field.connect(SEL_CHANGED) do
      @controller.change_button_state
    end

    @git_field.connect(SEL_CHANGED) do
      @controller.change_button_state
    end

    @phone_field.connect(SEL_CHANGED) do
      @controller.change_button_state
    end

    @mail_field.connect(SEL_CHANGED) do
      @controller.change_button_state
    end

    @telegram_field.connect(SEL_CHANGED) do
      @controller.change_button_state
    end
  end

end


