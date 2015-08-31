class DashboardController < ApplicationController
  add_breadcrumb 'डॅशबोर्ड', :root_path
  before_filter :authenticate_user!
  before_filter :authenticate_user!

  def index
    @raids = Raid.all
  end
end
