class Channel < ApplicationRecord

	has_many :discussions
	has_many :user, through: :discussions


end
