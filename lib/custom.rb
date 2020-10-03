# frozen_string_literal: true

# name: custom function
# author: Lindsey Tam
# date: July 14 2020
# description: This script updates the topic_marked and last_posted_at status of a post

PLUGIN_NAME ||= "custom-button".freeze

class DiscourseCustomTopic::Custom
  class << self
    def custom(topic)

        # updates values for topic_marked and last_posted_at
        new_val = !topic.custom_fields['topic_marked']
        topic.custom_fields['topic_marked'] = new_val
        topic.last_posted_at = Time.zone.now
        topic.save!

        return new_val
      end
  end
end

