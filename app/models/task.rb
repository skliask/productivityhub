# == Schema Information
#
# Table name: tasks
#
#  id          :bigint           not null, primary key
#  completed   :boolean
#  description :string(255)
#  due_date    :datetime
#  text        :string(255)
#  title       :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  section_id  :bigint           not null
#
# Indexes
#
#  index_tasks_on_section_id  (section_id)
#
# Foreign Keys
#
#  fk_rails_...  (section_id => sections.id)
#
class Task < ApplicationRecord
  belongs_to :section

  validates :title, presence: true
  validates :completed, presence: true
end
