# frozen_string_literal: true
require 'fox16'
require_relative '../student_models/student'
require_relative '../student_models/student_short'
require_relative './control_buttons'
include Fox
class Table_area < FXHorizontalFrame
  attr_reader :table, :page_buttons
  attr_accessor :row_count, :column_count, :control_buttons

  #page_buttons - кнопки, отвечающие за смену страниц
  # control_buttons - кнопки добавить, изменить, удалить
  def initialize(p, *args, &blk)
    super
    @left_frame = FXVerticalFrame.new(self)
    @right_frame = FXVerticalFrame.new(self)
    @table = build_table
    @control_buttons = Control_buttons.new(right_frame)
    @page_buttons = {}
    @row_count = 0
    @column_count = 0
    make_page_buttons
    buttons_control
  end

  def build_table
    frame = FXVerticalFrame.new(left_frame)
    table = FXTable.new(frame, :opts => LAYOUT_EXPLICIT, :width => 700, :height => 500)

    table.editable = false
    table
  end

  def make_page_buttons
    font = FXFont.new(app, "helvetica", 14)
    frame = FXHorizontalFrame.new(left_frame, :opts => LAYOUT_FILL)

    page_buttons["next_button"] = FXButton.new(frame, ">" ,
                               :opts => BUTTON_NORMAL|LAYOUT_RIGHT)
    page_buttons["prev_button"] = FXButton.new(frame, "<" ,
                               :opts => BUTTON_NORMAL|LAYOUT_LEFT)
    page_buttons["page_count"] = FXLabel.new(frame, "",
                              :opts=> LAYOUT_CENTER_X)


    page_buttons["next_button"].font = font
    page_buttons["prev_button"].font = font
    page_buttons["page_count"].font = font
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
      self.control_buttons.buttons_control(count_selected_rows)
    end
  end


  def count_selected_rows
    count = 0
    (0..self.row_count - 1).each do |i|
      count += 1 if table.rowSelected?(i)
    end
    count
  end
  private
  attr_reader :left_frame, :right_frame
end
