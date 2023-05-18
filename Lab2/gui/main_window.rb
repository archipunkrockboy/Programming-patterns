# frozen_string_literal: true
require 'fox16'
require_relative './filter_area'
require_relative './table_area'
require_relative './control_buttons'
require_relative './student_list_controller'
include Fox

class Main_window < FXMainWindow
  attr_reader :controller

  def initialize(app)
    super(app, "Students", width: 1100, height: 700)
    @controller = Student_list_controller.new(self)
    build_menu_bar
    main_frame = FXHorizontalFrame.new(self, opts: SPLITTER_HORIZONTAL|LAYOUT_FILL)
    Filter_area.new(main_frame)
    Table_area.new(main_frame, :opts => LAYOUT_SIDE_RIGHT)
    @switcher = FXSwitcher.new(self)
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
        import_students(dialog.filenames)
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



end


