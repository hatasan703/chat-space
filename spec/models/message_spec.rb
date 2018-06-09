require 'rails_helper'

RSpec.describe Message, type: :model do
  describe '#create' do
    body 'can save' do
    end

    body 'can not save' do
    end
  end
end
