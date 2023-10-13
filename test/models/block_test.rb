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
require "test_helper"

class BlockTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
