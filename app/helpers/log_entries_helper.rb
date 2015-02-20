module LogEntriesHelper
  def scoped_submenu_item(name, scope)
    submenu_item name, { scope: scope }, entries_scope == scope
  end
end
