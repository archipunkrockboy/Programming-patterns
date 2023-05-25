# frozen_string_literal: true
require 'fox16'
require_relative './filter_area'
require_relative './table_area'
require_relative './control_buttons'
require_relative './student_list_controller'
require_relative '../student_list_models/student_list_file_adapter'
require_relative './add_student_window'
include Fox

class Main_window < FXMainWindow
  attr_reader :controller, :table_area

  def initialize(app)
    super(app, "Students", width: 1100, height: 700)
    build_menu_bar
    @main_frame = FXHorizontalFrame.new(self, opts: SPLITTER_HORIZONTAL|LAYOUT_FILL)
    @filter_area = Filter_area.new(@main_frame)
    @table_area = Table_area.new(@main_frame, :opts => LAYOUT_SIDE_RIGHT)
    previous_page
    next_page
    @controller = Student_list_controller.new(self)
    controller.refresh_data
    manage_add_button
  end

  def build_menu_bar
    menu_bar = FXMenuBar.new(self, LAYOUT_SIDE_TOP|LAYOUT_FILL_X)
    file_menu = FXMenuPane.new(self)
    FXMenuTitle.new(menu_bar, "Файл", popupMenu: file_menu)
    import_cmd = FXMenuCommand.new(file_menu, "Импортировать из...")
    import_cmd.connect(SEL_COMMAND) do
      dialog = FXFileDialog.new(self, "Импорт студентов")
      dialog.selectMode = SELECTFILE_MULTIPLE
      dialog.patternList = ["Source (*.txt, *.yaml, *.json)"]
      if dialog.execute != 0
        p dialog.filenames
      end
    end

    exit_cmd = FXMenuCommand.new(menu_bar, "Выход")
    exit_cmd.connect(SEL_COMMAND) do
      exit
    end

  end

  def create
    super
    show(PLACEMENT_SCREEN)
  end


  def set_table_parameters(column_names, row_count)
    table_area.column_count = column_names.length
    table_area.row_count = row_count
    table_area.table.setTableSize(table_area.row_count, table_area.column_count)

    (0..table_area.column_count-1).each do |i|
      table_area.table.setColumnText(i, column_names[i])
    end
  end

  def set_table_data(data)
    (0..data.table.length - 1).each do |i|
      (0..data.table[i].length - 1).each do |j|
        table_area.table.setItemText(i, j, data.table[i][j].to_s)
      end
    end
  end

  def previous_page
    self.table_area.page_buttons["prev_button"].connect(SEL_COMMAND) do
      self.controller.previous_page
    end
  end

  def next_page
    self.table_area.page_buttons["next_button"].connect(SEL_COMMAND) do
      self.controller.next_page
    end
  end

  def show_pages(current, max)
    self.table_area.page_buttons["page_count"].text = "#{current}/#{max}"
  end

  def manage_add_button
    table_area.control_buttons.buttons["add_button"].connect(SEL_COMMAND) do
      controller.show_add_student_window
    end
  end

end


