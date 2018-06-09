require 'rails_helper'

RSpec.describe Message, type: :model do
  describe '#create' do
    body 'can save' do

      it 'is valid with body' do
        expect(build(:message, image:  nil)).to be_valid
      end

      it 'is valid with image' do
        expect(build(:message, body:  nil)).to be_valid
      end

      it 'is valid with body and image' do expect(build(:message)).to be_valid
      end
    end

    body 'can not save' do
      it 'is invalid without body and image' do
        message = build(:message, body: nil, image: nil)
        message.valid?
        expect(message.errors[:body_or_image]).to include('を入力してください')
      end

       it 'is invalid without group_id' do
        message = build(:message, group_id: nil)
        message.valid?
        expect(message.errors[:group]).to include('を入力してください')
      end
    end
  end
end
