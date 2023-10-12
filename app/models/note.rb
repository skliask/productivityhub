# == Schema Information
#
# Table name: notes
#
#  id         :bigint           not null, primary key
#  title      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  project_id :bigint           not null
#
# Indexes
#
#  index_notes_on_project_id  (project_id)
#
# Foreign Keys
#
#  fk_rails_...  (project_id => projects.id)
#
class Note < ApplicationRecord
  belongs_to :project
  has_many :pages, dependent: :destroy
end
