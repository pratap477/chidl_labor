class HomesController < ApplicationController
  before_filter :set_locale


  layout 'home'

  def index

  end

  def about_us

  end

  def child_labor

  end

  def child_welfare_committee

  end

  def employee_guides

  end

  def be_valunteer

  end

  def donate

  end

  def contact_us

  end

  def complaint
    if request.post?
      params_user_complaint= params[:user_complaint]
      @user_complaint = UserComplaint.new(:complainer_name=> params_user_complaint[:complainer_name], :contact_number => params_user_complaint[:contact_number],:complainer_email => params_user_complaint[:complainer_email],
                                          :complaint_area => params_user_complaint[:complaint_area], :complaint_subject => params_user_complaint[:complaint_subject],:last_seen_date => params_user_complaint[:last_seen_date], :update_on_email => params_user_complaint[:update_on_email],
                                          :name_of_employee => params_user_complaint[:name_of_employee],:employee_address_details => params_user_complaint[:employee_address_details], :complaint_description => params_user_complaint[:complaint_description])
     if @user_complaint.save
     redirect_to homes_complaint_path ,:notice =>  "Your Complaint save successfully."
     else
       render '/homes/complaint'
     end
    end
  end

  def set_locale
    I18n.locale = :en
  end

end
