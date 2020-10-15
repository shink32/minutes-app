class ContentChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'content_channel'
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
