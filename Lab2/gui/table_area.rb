# frozen_string_literal: true
require 'fox16'
include Fox
class Table_area < FXVerticalFrame
  def initialize(p, *args, &blk)
    super
    build_table
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

end
