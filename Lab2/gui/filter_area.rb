# frozen_string_literal: true
require 'fox16'
include Fox
class Filter_area < FXVerticalFrame
  attr_reader :filters, :filter_frames
  def initialize(parent, *args, &blc)
    super(parent, *args, &blc)
    @filters = []
    @filter_frames = []

    text_field_of_surname_and_init
    make_filter("Git")
    make_filter("Telegram")
    make_filter("Mail")
    make_filter("Phone")
    drop_filters_button
  end

  def text_field_of_surname_and_init
    frame = FXVerticalFrame.new(self)
    frame.backColor = "green"
    FXLabel.new(frame, "Фамилия и инициалы")
    @surname_and_init_text_field = FXTextField.new(frame, 25)
  end

  def make_filter(parameter)
    frame = FXVerticalFrame.new(self, :padTop =>10, :padBottom => 10, :vSpacing => 10)
    frame.backColor = "yellow"
    FXLabel.new(frame, parameter)

    combobox = FXComboBox.new(frame, 23)
    combobox.fillItems(["Не важно", "Нет", "Да"])
    combobox.numVisible=(3)

    text_field = FXTextField.new(frame, 25)
    text_field.disable

    combobox.connect(SEL_COMMAND) do
      if combobox.currentItem == 0
        frame.backColor = "yellow"
        text_field.disable
      end

      if combobox.currentItem == 1
        frame.backColor = "red"
        text_field.disable
      end

      if combobox.currentItem == 2
        frame.backColor = "green"
        text_field.enable
      end
      filters.append(combobox)
      filter_frames.append(frame)
    end
    def drop_filters_button
      font = FXFont.new(app, "helvetica", 14)
      drop_button = FXButton.new(self, "Сбросить" ,
                                 :opts => BUTTON_NORMAL|LAYOUT_LEFT)
      drop_button.font = font
      drop_button.connect(SEL_COMMAND) do
        (0..filters.length - 1).each do |i|
          filters[i].currentItem = 0
          filter_frames[i].backColor = "yellow"
        end
      end
    end
  end
end
