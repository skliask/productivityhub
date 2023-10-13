# == Schema Information
#
# Table name: tasks
#
#  id          :bigint           not null, primary key
#  completed   :boolean          default(FALSE), not null
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
require 'rails_helper'

RSpec.describe Task, type: :model do
  it { is_expected.to belong_to :section }

  it { is_expected.to have_db_column :id }
  it { is_expected.to have_db_column :section_id }
  it { is_expected.to have_db_column :completed }
  it { is_expected.to have_db_column :description }
  it { is_expected.to have_db_column :due_date }
  it { is_expected.to have_db_column :text }
  it { is_expected.to have_db_column :title }
  it { is_expected.to have_db_column :created_at }
  it { is_expected.to have_db_column :updated_at }

  it { is_expected.to validate_presence_of :title }
  it { is_expected.to validate_presence_of :completed }
end
