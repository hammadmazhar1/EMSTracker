class User < ActiveRecord::Base
	has_secure_password
	attr_accessible :username,:password_digest,:password,:password_confirmation,:name,:phoneno, :rollno, :gender,:mfr
end
