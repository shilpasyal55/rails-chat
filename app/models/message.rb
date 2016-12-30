# frozen_string_literal: true
class Message < ApplicationRecord
  validates :body, presence: true
  belongs_to :user
  after_create :broadcast

  private

  def broadcast
    ActionCable.server.broadcast('chat', as_json.merge(action: 'CreateMessage'))
  end
end
