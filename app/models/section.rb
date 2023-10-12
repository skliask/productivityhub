# == Schema Information
#
# Table name: sections
#
#  id         :bigint           not null, primary key
#  title      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  project_id :bigint           not null
#
# Indexes
#
#  index_sections_on_project_id  (project_id)
#
# Foreign Keys
#
#  fk_rails_...  (project_id => projects.id)
#
class Section < ApplicationRecord
  belongs_to :project
  has_many :tasks, dependent: :destroy

  validates :title, presence: true
end
