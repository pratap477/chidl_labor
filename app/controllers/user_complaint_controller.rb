class UserComplaintController < ApplicationController
  add_breadcrumb 'डॅशबोर्ड', :root_path
  add_breadcrumb 'सहत्व', :user_complaint_index_path
  before_filter :authenticate_user!

  def index
    @complaints = Complaint.all
  end
end
