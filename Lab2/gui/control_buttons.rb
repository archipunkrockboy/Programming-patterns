# frozen_string_literal: true
require 'fox16'
require_relative 'add_student_window'
include Fox
class Control_buttons < FXVerticalFrame
  attr_reader :buttons
  def initialize(p, *args, &blk)
    super
    @buttons = {}
    make_table_buttons
  end
  def make_table_buttons
    add_button = FXButton.new(self, "Добавить" ,
                              :opts => BUTTON_NORMAL|LAYOUT_LEFT)
    delete_button = FXButton.new(self, "Удалить" ,
                                 :opts => BUTTON_NORMAL|LAYOUT_LEFT)
    change_button = FXButton.new(self, "Изменить" ,
                                 :opts => BUTTON_NORMAL|LAYOUT_LEFT)
    update_button = FXButton.new(self, "Обновить" ,
                                 :opts => BUTTON_NORMAL|LAYOUT_LEFT)
    buttons["add_button"] = add_button
    buttons["update_button"] = update_button
    buttons["delete_button"] = delete_button
    buttons["change_button"] = change_button
    delete_button.disable
    change_button.disable

  end

  def buttons_control(selected_rows_count)
    if selected_rows_count == 0
      buttons["delete_button"].disable
      buttons["change_button"].disable
    end
    if selected_rows_count == 1
      buttons["delete_button"].enable
      buttons["change_button"].enable
    end
    if selected_rows_count > 1
      buttons["delete_button"].enable
      buttons["change_button"].disable
    end
  end

end
