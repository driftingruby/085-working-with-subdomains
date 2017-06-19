# == Schema Information
#
# Table name: blogs
#
#  id         :integer          not null, primary key
#  name       :string
#  subdomain  :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Blog < ApplicationRecord
  validates :subdomain, 
            exclusion: { in: %w(www), 
            message: "%{value} is reserved." }, 
            presence: true, 
            uniqueness: true
  before_validation :sanitize_subdomain
  has_many :posts

  private

  def sanitize_subdomain
    self.subdomain = self.subdomain.parameterize
  end
end
