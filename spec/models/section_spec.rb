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
require 'rails_helper'

RSpec.describe Section, type: :model do
  it { is_expected.to belong_to :project }
  it { is_expected.to have_many :tasks }

  it { is_expected.to have_db_column :id }
  it { is_expected.to have_db_column :project_id }
  it { is_expected.to have_db_column :title }
  it { is_expected.to have_db_column :created_at }
  it { is_expected.to have_db_column :updated_at }

  it { is_expected.to validate_presence_of :title }
end
