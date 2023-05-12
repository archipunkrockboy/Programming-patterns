# frozen_string_literal: true
require 'fox16'
require_relative '../student_models/student'
require_relative '../student_models/student_short'
include Fox
class Table_area < FXVerticalFrame
  attr_reader :table
  def initialize(p, *args, &blk)
    super
    @table = build_table
    test_filling
    make_buttons
  end

  def build_table
    frame = FXVerticalFrame.new(self)
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

  def make_buttons
    font = FXFont.new(app, "helvetica", 14)
    frame = FXHorizontalFrame.new(self, :opts => LAYOUT_FILL)
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


end
