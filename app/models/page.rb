# == Schema Information
#
# Table name: pages
#
#  id         :bigint           not null, primary key
#  title      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  note_id    :bigint           not null
#
# Indexes
#
#  index_pages_on_note_id  (note_id)
#
# Foreign Keys
#
#  fk_rails_...  (note_id => notes.id)
#
class Page < ApplicationRecord
  belongs_to :note
  has_many :blocks, dependent: :destroy
end
