class OpenImageProcessingChannel < ApplicationCable::Channel
  def subscribed
    stream_from "open_image_processing_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
