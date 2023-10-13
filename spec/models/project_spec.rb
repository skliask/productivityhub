# == Schema Information
#
# Table name: projects
#
#  id          :bigint           not null, primary key
#  description :text(65535)
#  title       :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
require 'rails_helper'

RSpec.describe Project, type: :model do
  it { is_expected.to have_many :notes }
  it { is_expected.to have_many :sections }

  it { is_expected.to have_db_column :id }
  it { is_expected.to have_db_column :description }
  it { is_expected.to have_db_column :title }
  it { is_expected.to have_db_column :created_at }
  it { is_expected.to have_db_column :updated_at }

  it { is_expected.to validate_presence_of :title }
  it { is_expected.to validate_uniqueness_of(:title).case_insensitive }
end
