module ApplicationHelper
  def is_active_controller(controller_name)
    (params[:controller].eql? controller_name) ? 'active' : nil
  end

  def total_fir(year)
    @raids.select { |d| d.datetime.strftime('%Y').eql? year }.count
  end

  def victam_in_jail_cl(year)
    @raids.select \
   { |d| (d.datetime.strftime('%Y').eql? year) && (d.childlabours.present?) }.count
  end

  def free_child_labour(year)
    count = 0
    @raids.each \
    { |d| (count += d.childlabours.count if d.datetime.strftime('%Y').eql? year) }
    count
  end

  def victam_in_jail_cb(year)
    @raids.select \
   { |d| (d.datetime.strftime('%Y').eql? year) && (d.childbeggers.present?) }.count
  end

  def free_child_begger(year)
    count = 0
    @raids.each \
    { |d| (count += d.childbeggers.count if d.datetime.strftime('%Y').eql? year) }
    count
  end

  def child_labours(raid)
    name = ''
    age = ''
    raid.childlabours.each_with_index do |c, i|
      name += "#{i + 1}. #{c.full_name}<br/>"
      age += "#{c.age}<br/>"
    end
    [name, age]
  end

  def child_beggers(raid)
    name = ''
    age = ''
    raid.childbeggers.each_with_index do |c, i|
      name += "#{i + 1}. #{c.full_name}<br/>"
      age += "#{c.age}<br/>"
    end
    [name, age]
  end

  def law_checked(id)
    emp_sec = @employer.employer_sections.first
    return false unless emp_sec
    emp_sec.laws.split(', ').include? id.to_s
  end

  def act_checked(id)
    emp_sec = @employer.employer_sections.first
    return false unless emp_sec
    emp_sec.acts.split(', ').include? id.to_s
  end

  def section_checked(id)
    emp_sec = @employer.employer_sections.first
    return false unless emp_sec
    emp_sec.sections.split(', ').include? id.to_s
  end

  def bootstrap_class_for flash_type
    { success: "alert-success", error: "alert-error", alert: "alert-warning", notice: "alert-info" }[flash_type.to_sym] || flash_type.to_s
  end

  def flash_messages(opts = {})
    flash.each do |msg_type, message|
      concat(content_tag(:div, message, class: "alert #{bootstrap_class_for(msg_type)} fade in") do
               concat content_tag(:button, 'x', class: "close", data: { dismiss: 'alert' })
               concat message
             end)
    end
    nil
  end
end
