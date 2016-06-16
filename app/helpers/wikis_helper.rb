module WikisHelper
  def user_is_authorized_to_edit_wikis
    policy(@wiki).edit?
  end
end
