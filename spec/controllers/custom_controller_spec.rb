# frozen_string_literal: true

require "rails_helper"

# name: application controller unit test
# author: Lindsey Tam
# date: June 18 2020
# description: This script handles the unit testing for the backend component of the plugin
# run with: bundle exec rake "plugin:spec[discourse-custom-button]"


describe ::DiscourseCustomTopic::CustomController do

  DiscourseCustomTopic::PLUGIN_NAME ||= "custom-button".freeze
  routes { ::DiscourseCustomTopic::Engine.routes }

  let!(:user) { log_in }
  let(:topic) { Fabricate(:topic) }


  before do
    Jobs.run_immediately!
    SiteSetting.custom_topic_button_enabled = true
  end

  context "When testing the Put request valid input" do

    it "Successful request with valid param int, topic_marked is false" do

      get :custom, params: { topic_id: topic.id }, format: :json
      expect(response).to be_successful
      expect(topic.id.class).to eq(Integer)
      json = JSON.parse(response.body)
      expect(json.length).to eq(2)
      expect(json.class).to eq(Hash)
      expect(json['last_posted_at']).to be_truthy
      expect(json['topic_marked'].class).to eq(TrueClass)

    end

    it "Successful request with valid param int, topic_marked is true" do

      topic.custom_fields['topic_marked'] = true
      topic.save!
      get :custom, params: { topic_id: topic.id }, format: :json
      expect(response).to be_successful
      expect(topic.id.class).to eq(Integer)
      json = JSON.parse(response.body)
      expect(json.length).to eq(2)
      expect(json.class).to eq(Hash)
      expect(json['last_posted_at']).to be_truthy
      expect(json['topic_marked'].class).to eq(FalseClass)

    end

  end

  context "When testing the Put request invalid input" do

    it "ArgumentError with param input str" do

      get :custom, params: { topic_id: "happy" }, format: :json
      json = JSON.parse(response.body)
      expect(json.length).to eq(1)
      expect(json['errors']).to be_truthy
      expect(json['errors']).to eq(["topic_id should be a positive integer"])

    end

    it "ArgumentError with incorrect input" do

      get :custom, params: { id: topic.id }, format: :json
      json = JSON.parse(response.body)
      expect(json.length).to eq(1)
      expect(json['errors']).to be_truthy
      expect(json['errors']).to eq(["topic_id should be a positive integer"])

    end

    it "ArgumentError with param input hash" do

      get :custom, params: { topic_id: {topic_id: topic.id} }, format: :json
      json = JSON.parse(response.body)
      expect(json.length).to eq(1)
      expect(json['errors']).to be_truthy
      expect(json['errors']).to eq(["topic_id should be a positive integer"])

    end

    it "ArgumentError with param input list" do

      get :custom, params: {topic_id: [topic_id: topic.id] }, format: :json
      json = JSON.parse(response.body)
      expect(json.length).to eq(1)
      expect(json['errors']).to be_truthy
      expect(json['errors']).to eq(["topic_id should be a positive integer"])

    end

  end

end
