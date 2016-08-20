class Section < ApplicationRecord
  has_one :section, through: :user_section
  has_one :user_section
end
