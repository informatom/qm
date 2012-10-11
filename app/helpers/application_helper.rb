module ApplicationHelper

  def bootstrap_error(instance, model_class)
    if instance && instance.errors.any?
      flash_messages = []
      flash_messages << content_tag(:h4, t("error"))
      flash_messages << content_tag(:p, pluralize(instance.errors.count, t("error")) + t("helpers.error_message", :model => model_class.model_name.human) )
      list_items = []
      instance.errors.full_messages.each do |message|
        list_items << content_tag(:li, message)
      end
      flash_messages << content_tag(:ul, list_items.join("\n").html_safe)
      complete_message = flash_messages.join("\n").html_safe
      content_tag(:div, link_to("x", "#", :class => "close", "data-dismiss" => "alert") + complete_message, :class => "alert alert-block fade in alert-error") if flash_messages
    end
  end

  def textile(text)
    if text
      raw(RedCloth.new(strip_tags(text)).to_html)
    end
  end

  def differtextile(text)
    if text
      raw(RedCloth.new(text).to_html)
    end
  end

  def icon_(value)
    raw("<i class='icon-#{value}'></i> &nbsp;")
  end

  def icon(value)
    raw("<i class='icon-#{value}'></i>")
  end

  def icons(values)
    output = []
    values.each do |value|
      output << "<i class='icon-#{value}'></i>"
    end
    output << " &nbsp; "
    raw(output.join)
  end

  def logged_in_as
    if current_user
      current_user.firstname + " " + current_user.lastname
    else
      "anonymous"
    end
  end

  def admin?
    current_user && current_user.has_role?(:admin)
  end

  def checkbox(value)
    check_box_tag("", "", value, :disabled => true)
  end

  def process_modell
    if @any_process = BusinessProcess.where(company_id: current_company.id).first
      @any_process.root
    end
  end

  def username(id)
    if user = User.find_by_id(id)
      user.shortname
    end
  end

  def active(cont, action="none", inverse = false)
    if inverse == true
      if cont == controller.controller_name && action != controller.action_name
        "class=active"
      end
    else
      if action == "none"
        if cont == controller.controller_name
          "class=active"
        end
      else
        if cont == controller.controller_name && action == controller.action_name
          "class=active"
        end
      end
    end
  end

  def domain_helper
    unless request.subdomain == "qm"
      if !request.subdomain.empty?
        content_tag :div, "Domain: http://#{request.subdomain}.#{request.domain}", class: "alert alert-block fade in alert-info"
      elsif request.domain
        content_tag :div, "Domain: http://#{request.domain}", class: "alert alert-block fade in alert-info"
      else
        content_tag :div, "Domain: http://#{request.ip}", class: "alert alert-block fade in alert-info"
      end
    end
  end

  def created(object)
    output = ""
    output << username(object.created_by) if object.created_by
    output << " " if object.created_by
    output << l( object.created_at, :format => :timestamp )
  end

  def updated(object)
    output = ""
    output << username(object.updated_by) if object.updated_by
    output << " " if object.updated_by
    output << l( object.updated_at , :format => :timestamp )
  end

  def header(version)
    output = "<dt>"
    output << content_tag("h3", username(version.whodunnit))
    output << "</dt><dd>"
    output << content_tag("h3", l( version.created_at, :format => :timestamp ))
    output << "</dd>"
  end

  def versioning_helper(object)
    render partial: "shared/versioning_helper", locals: { :object => object }
  end
end
