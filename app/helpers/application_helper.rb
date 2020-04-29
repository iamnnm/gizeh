module ApplicationHelper
  def bootstrap_class_for(type)
    list = {
      success: "alert-massage-success",
      error: "alert-massage-danger",
      alert: "alert-massage-warning",
      notice: "alert-massage-info"
    }

    list[type.to_sym]
  end
end
