class ProfImage < ApplicationRecord
	belongs_to :user
	attachment :image
end
