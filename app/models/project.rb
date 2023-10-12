# == Schema Information
#
# Table name: projects
#
#  id          :bigint           not null, primary key
#  description :text(65535)
#  title       :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Project < ApplicationRecord
  has_many :sections, dependent: :destroy
  has_many :notes, dependent: :destroy

  validates :title, presence: true
  validates :title, uniqueness: true
end
