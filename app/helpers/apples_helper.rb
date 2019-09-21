module ApplesHelper
  def choose_new_or_edit
    if action_name == 'new' || action_name == 'confirm'
      confirm_apples_path
    elsif action_name == 'edit'
      apple_path
    end
  end
end
