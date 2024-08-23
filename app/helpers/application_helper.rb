module ApplicationHelper
  def show_errors(object, field_name)
    return unless object.errors.any?
    puts object.errors.messages
    return if object.errors.messages[field_name].blank?

    object.errors.messages[field_name].join(', ')
  end
end
