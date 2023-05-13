# frozen_string_literal: true
require 'fox16'
require_relative '../student_models/student'
require_relative '../student_models/student_short'
require_relative './control_buttons'
include Fox
class Table_area < FXHorizontalFrame
  attr_reader :table, :left_frame, :right_frame, :control
  def initialize(p, *args, &blk)
    super
    @left_frame = FXVerticalFrame.new(self)
    @right_frame = FXVerticalFrame.new(self)
    @table = build_table
    @control = Control_buttons.new(right_frame)
    test_filling
    make_page_buttons
    buttons_control
  end

  def build_table
    frame = FXVerticalFrame.new(left_frame)
    table = FXTable.new(frame, :opts => LAYOUT_EXPLICIT, :width => 700, :height => 500)
    table.setTableSize(20, 6)
    table.setColumnText(0, "id")
    table.setColumnText(1,'shortname')
    table.setColumnText(2,'git')
    table.setColumnText(3,'phone')
    table.setColumnText(4,'mail')
    table.setColumnText(5,'telegram')
    table.editable = false
    table
  end

  def make_page_buttons
    font = FXFont.new(app, "helvetica", 14)
    frame = FXHorizontalFrame.new(left_frame, :opts => LAYOUT_FILL)

    next_button = FXButton.new(frame, ">" ,
                               :opts => BUTTON_NORMAL|LAYOUT_RIGHT)
    prev_button = FXButton.new(frame, "<" ,
                               :opts => BUTTON_NORMAL|LAYOUT_LEFT)
    pages_count = FXLabel.new(frame, "1/1",
                              :opts=> LAYOUT_CENTER_X)

    next_button.font = font
    prev_button.font = font
    pages_count.font = font
  end



  def test_filling
    list = [['1', "Манукьян А.В.", "@git",    "+79189315711", "mail@mail.ru", "@telega"],
            ['1', "Анукьян С. Д.", "@gitTTT", "+79181234714", "google@google.com", "@tg"],
            ['1', "Нукьян Е.Ж.", "@gitik", "+79182718301", "yandex@yandex.ru", "@tgtgtg"]]
    (0..list.length - 1).each do |i|
      (0..list[i].length - 1).each do |j|
        table.setItemText(i, j, list[i][j])
      end
    end
  end

  def buttons_control
    table.connect(SEL_SELECTED) do |sender, selector, data|
      control.buttons_control(count_selected_rows)
    end
  end


  def count_selected_rows
    count = 0
    (0..19).each do |i|
      count += 1 if table.rowSelected?(i)
    end
    count
  end
end
