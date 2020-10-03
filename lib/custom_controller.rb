# name: application controller
# author: Lindsey Tam
# date: July 14 2020
# description: This script defines the inputs / outputs of our custom endpoint

require_dependency "application_controller"
PLUGIN_NAME ||= "custom-button".freeze

class DiscourseCustomTopic::CustomController < ::ApplicationController
  requires_plugin PLUGIN_NAME

  before_action :ensure_logged_in

  def custom
    # format output response of post_request

    begin

      # ensure input is of type int: topic_id gets converted into a string by default
      convert_id = true if (Integer(topic_id) and Integer(topic_id) > 0) rescue false
      unless convert_id
        raise ArgumentError.new("topic_id should be a positive integer")
      end

      topic = Topic.find_by_id(topic_id)
      new_val = DiscourseCustomTopic::Custom.custom(topic)
      render json: { topic_marked: new_val,
                     last_posted_at: Time.zone.now}
    rescue StandardError => e
      render_json_error e.message
    end

  end

  private
  def topic_id
    # defines input to our PUT request
    params.require(:topic_id)
  end

end

