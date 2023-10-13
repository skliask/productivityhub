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
require 'rails_helper'

RSpec.describe Block, type: :model do
  it { is_expected.to belong_to :page }

  it { is_expected.to have_db_column :id }
  it { is_expected.to have_db_column :page_id }
  it { is_expected.to have_db_column :block_type }
  it { is_expected.to have_db_column :text }
  it { is_expected.to have_db_column :created_at }
  it { is_expected.to have_db_column :updated_at }

  it { is_expected.to validate_presence_of :text }
  it { is_expected.to validate_presence_of :block_type }
end
