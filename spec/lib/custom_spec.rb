# frozen_string_literal: true

require "rails_helper"

# name: topic_marked unit test
# author: Lindsey Tam
# date: July 13 2020
# description: This script handles the unit testing for the backend component of the plugin. It ensures that the
#              topic_marked status is being updated correctly
# run with: bundle exec rake "plugin:spec[discourse-custom-button]"


describe ::DiscourseCustomTopic::Custom do
  DiscourseCustomTopic::PLUGIN_NAME ||= "custom-button".freeze

  let(:topic) { Fabricate(:topic) }

  before do

    SiteSetting.custom_topic_button_enabled = true
    topic.custom_fields['topic_marked'] = true
    topic.save!

  end

  context "When testing the Put request valid input" do

    it "Change from true to false and false to true" do
      output = described_class.custom(topic)
      expect(output).to eq(false)

      # initialize topic_marked as false, expected output is true
      topic.custom_fields['topic_marked'] = false
      topic.save!
      output = described_class.custom(topic)
      expect(output).to eq(true)

    end

  end

end
