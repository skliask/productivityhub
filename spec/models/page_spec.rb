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
require 'rails_helper'

RSpec.describe Page, type: :model do
  it { is_expected.to belong_to :note }
  it { is_expected.to have_many :blocks }

  it { is_expected.to have_db_column :id }
  it { is_expected.to have_db_column :note_id }
  it { is_expected.to have_db_column :title }
  it { is_expected.to have_db_column :created_at }
  it { is_expected.to have_db_column :updated_at }

  it { is_expected.to validate_presence_of :title }
end
