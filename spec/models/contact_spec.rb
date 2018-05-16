require 'rails_helper'

describe Contact do
  describe 'validations' do
    it { is_expected.to validate_presence_of :full_name }
    it { is_expected.to validate_presence_of :email }
    it { is_expected.to validate_presence_of :position }
  end
  describe 'relationships' do
    it { is_expected.to belong_to :company }
  end
end
