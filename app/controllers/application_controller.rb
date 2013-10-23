class ApplicationController < ActionController::Base
  protect_from_forgery

	include SessionsHelper

  before_filter :authenticate #das ist einfac eine methode die wir hier kreieren und so nennen um zu testen ob der user schon eingeloggt ist
	#die methode ist im sessions_helper geschrieben dann


end
