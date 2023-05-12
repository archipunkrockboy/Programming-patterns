# frozen_string_literal: true
require 'fox16'
require_relative  './page.rb'
require_relative './filter_area'
include Fox
class Main_window < FXMainWindow
  attr_reader :splitter
  def initialize(app)
    super(app, "Students", width: 900, height: 700)
    build_menu_bar
    @splitter = FXSplitter.new(self, opts: SPLITTER_HORIZONTAL|LAYOUT_FILL)
    Filter_area.new(splitter)
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

  def import_students(filename)

  end

end


if __FILE__ == $0
  FXApp.new do |app|
    Main_window.new(app)
    app.create
    app.run
  end
end