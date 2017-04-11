module MainHelper
  def tab_select(name, controller)
    'active' if name == controller
  end
end
