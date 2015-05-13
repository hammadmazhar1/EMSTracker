class Case < ActiveRecord::Base
	attr_accessible :time_called, :time_resolved, :patient, :mfr, :location, :details, :day_called, :day_resolved
end