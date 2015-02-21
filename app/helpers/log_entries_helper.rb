module LogEntriesHelper
  def scoped_submenu_item(name, scope)
    submenu_item name, { scope: scope }, entries_scope == scope
  end

  def maybe_edit_link(entry)
    return unless admin?
    content_tag :div, class: 'pull-right' do
      link_to 'Edit', polymorphic_url([:admin, entry], action: :edit), class: 'btn btn-default btn-xs'
    end
  end
end
