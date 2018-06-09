require 'rails_helper'

RSpec.describe Message, type: :model do
  describe '#create' do
    body 'can save' do
      it 'is valid with body' do
        expect(build(:message, image:  nil)).to be_valid
      end
    end

    body 'can not save' do
    end
  end
end
