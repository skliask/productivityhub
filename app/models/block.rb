# == Schema Information
#
# Table name: blocks
#
#  id         :bigint           not null, primary key
#  block_type :integer          default("text"), not null
#  text       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  page_id    :bigint           not null
#
# Indexes
#
#  index_blocks_on_page_id  (page_id)
#
# Foreign Keys
#
#  fk_rails_...  (page_id => pages.id)
#
class Block < ApplicationRecord
  enum :block_type, { text: 0, heading: 1, code: 2, warning: 3 }
  belongs_to :page

  validates :text, presence: true
  validates :block_type, presence: true
end
