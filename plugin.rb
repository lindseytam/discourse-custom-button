# name: custom-button
# author: Lindsey Tam
# date: June 18 2020
# description: This script handles the backend component of the plugin, such as creating the a custom
#              field and monitoring its status
# acknowledgements: this code was inspired by the following:
#       https://github.com/jannolii/discourse-bump-topic
#       https://github.com/techAPJ/discourse-custom-topic-button/blob/master/plugin.rb
#       https://github.com/eviltrout/purple-tentacle


enabled_site_setting :custom_topic_button_enabled

PLUGIN_NAME ||= "custom-button".freeze

after_initialize do

  # create custom field value of bool
  Topic.register_custom_field_type('topic_marked', :boolean)

  require_dependency 'topic_view_serializer'

  # create custom field of topic_marked, initialize it to false if it has no value
  add_to_serializer(:topic_view, :topic_marked, false) {
         if object.topic.custom_fields['topic_marked'] == nil then
            object.topic.custom_fields['topic_marked'] = false
         end
         object.topic.custom_fields['topic_marked'] if object.topic
  }

  # last_posted_at is an existing field, but we want to be able to update it
  add_to_serializer(:topic_view, :last_posted_at, false) {
           object.topic.last_posted_at
    }

  # only staff / admin should be able to see button
  add_to_serializer(:current_user, :can_see_topic_group_button?) do
      return true if scope.is_staff?
    end

  # gives ability to track / change topic_marked status
  PostRevisor.track_topic_field(:topic_marked) do |tc, topic_marked|
    tc.record_change('topic_marked', tc.topic.topic_marked, topic_marked)
    tc.topic.topic_marked = topic_marked
  end

  # gives ability to track / change last_posted_at status
  PostRevisor.track_topic_field(:last_posted_at) do |tc, last_posted_at|
      tc.record_change('last_posted_at', tc.topic.last_posted_at, last_posted_at)
      tc.topic.last_posted_at = last_posted_at
    end

  # necessary because topic_marked is a custom field in topic
  PostRevisor.track_topic_field(:custom_fields) do |tc, custom_fields|
    tc.record_change('custom_fields', tc.topic.custom_fields, custom_fields)
    tc.topic.custom_fields = custom_fields
  end

  module ::DiscourseCustomTopic
    class Engine < ::Rails::Engine
      engine_name PLUGIN_NAME
      isolate_namespace DiscourseCustomTopic
    end
  end

  # creates a custom endpoint for us to call later
  DiscourseCustomTopic::Engine.routes.draw do
    put "/custom" => "custom#custom"
    resources :topic_id, :custom
  end

  # creates a custom endpoint for us to call later
  Discourse::Application.routes.append do
    mount ::DiscourseCustomTopic::Engine, at: "/topic"
  end

  ["../lib/custom_controller.rb",
   "../lib/custom.rb"
  ].each { |path| require File.expand_path(path, __FILE__) }

end






