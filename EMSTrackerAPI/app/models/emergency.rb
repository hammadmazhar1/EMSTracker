class Emergency < ActiveRecord::Base
	belongs_to :mfr
	belongs_to :user
	attr_accessible :location, :severity, :resolve_time, :hospital_visited, :created_at, :updated_at
end
