module ApplicationHelper
  def bootstrap_class_for(type)
    list = {
      success: "alert-success",
      error: "alert-danger",
      alert: "alert-warning",
      notice: "alert-info"
    }

    list[type.to_sym]
  end
end
