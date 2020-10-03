## Discourse Custom Button

This is a simple plugin that creates a custom button and a custom field, called topic_marked, for each topic.

## Installation

Follow the [plugin installation guide](https://meta.discourse.org/t/install-a-plugin/19157).

## After Installation

After visiting /admin/plugins, you should see 'custom-button' as one of the plugins.

![alt text](https://drive.google.com/uc?export=view&id=1QfTqC6vtkXNOSmJkF6S2wy0-GOUtLKhi)

If you click on it, it should open up the following settings. Check 'Enable custom button plugin' to start using the plugin 

![alt text](https://drive.google.com/uc?export=view&id=1cN4MUjVOVFf2gDi9nceUIoVnN5er_p83)

## How to use

If a new topic is created, the default topic_marked status is false, resulting in the following:

![alt text](https://drive.google.com/uc?export=view&id=1-lz2E6DUAPcCTrad7eOhfKzTK-wt5rQa)

The topic_marked status of a topic can be changed by clicking the button, resulting in the following:

![alt text](https://drive.google.com/uc?export=view&id=1LZJXwpO_9a1hNlIMtshu18OnMZjufykI)

By visiting any posts at /t/{post_id}.json, the format includes a custom field, called topic_marked. This custom field should correspond with the value of the button. For example, if a post is labeled as unmarked, below is the following output

```yaml
{
  "post_stream": {
    "posts": [
      {
        "id": 217,
        "name": null,
        "username": "lindsey.tam",
        "avatar_template": "/letter_avatar_proxy/v4/letter/l/ad7895/{size}.png",
        "created_at": "2020-07-15T16:40:32.795Z",
        "cooked": "<p>This post body is used to test the custom button plugin</p>",
        "post_number": 1,
        "post_type": 1,
        "updated_at": "2020-07-15T18:39:55.215Z",
        "reply_count": 0,
        "reply_to_post_number": null,
        "quote_count": 0,
        "incoming_link_count": 0,
        "reads": 1,
        "readers_count": 0,
        "score": 0.2,
        "yours": true,
        "topic_id": 93,
        "topic_slug": "test-the-usage-of-the-custom-button-plugin",
        "display_username": null,
        "primary_group_name": null,
        "primary_group_flair_url": null,
        "primary_group_flair_bg_color": null,
        "primary_group_flair_color": null,
        "version": 2,
        "can_edit": true,
        "can_delete": false,
        "can_recover": false,
        "can_wiki": true,
        "read": true,
        "user_title": null,
        "actions_summary": [
          {
            "id": 3,
            "can_act": true
          },
          {
            "id": 4,
            "can_act": true
          },
          {
            "id": 8,
            "can_act": true
          },
          {
            "id": 7,
            "can_act": true
          }
        ],
        "moderator": false,
        "admin": true,
        "staff": true,
        "user_id": 1,
        "hidden": false,
        "trust_level": 4,
        "deleted_at": null,
        "user_deleted": false,
        "edit_reason": null,
        "can_view_edit_history": true,
        "wiki": false,
        "reviewable_id": 0,
        "reviewable_score_count": 0,
        "reviewable_score_pending_count": 0
      }
    ],
    "stream": [
      217
    ]
  },
  "timeline_lookup": [
    [
      1,
      0
    ]
  ],
  "suggested_topics": [
    {
      "id": 91,
      "title": "This is a test post on a developer env",
      "fancy_title": "This is a test post on a developer env",
      "slug": "this-is-a-test-post-on-a-developer-env",
      "posts_count": 1,
      "reply_count": 0,
      "highest_post_number": 1,
      "image_url": null,
      "created_at": "2020-07-10T15:28:16.710Z",
      "last_posted_at": "2020-07-10T15:28:16.903Z",
      "bumped": true,
      "bumped_at": "2020-07-10T15:28:16.903Z",
      "archetype": "regular",
      "unseen": false,
      "last_read_post_number": 1,
      "unread": 0,
      "new_posts": 0,
      "pinned": false,
      "unpinned": null,
      "visible": true,
      "closed": false,
      "archived": false,
      "notification_level": 3,
      "bookmarked": false,
      "liked": false,
      "thumbnails": null,
      "like_count": 0,
      "views": 3,
      "category_id": 1,
      "featured_link": null,
      "posters": [
        {
          "extras": "latest single",
          "description": "Original Poster, Most Recent Poster",
          "user": {
            "id": 1,
            "username": "lindsey.tam",
            "name": null,
            "avatar_template": "/letter_avatar_proxy/v4/letter/l/ad7895/{size}.png"
          }
        }
      ]
    },
    {
      "id": 73,
      "title": "Please work please work please work please work PLEASE",
      "fancy_title": "Please work please work please work please work PLEASE",
      "slug": "please-work-please-work-please-work-please-work-please",
      "posts_count": 1,
      "reply_count": 0,
      "highest_post_number": 1,
      "image_url": null,
      "created_at": "2020-06-26T01:05:26.923Z",
      "last_posted_at": "2020-06-26T15:07:10.433Z",
      "bumped": true,
      "bumped_at": "2020-06-26T01:05:27.101Z",
      "archetype": "regular",
      "unseen": false,
      "last_read_post_number": 1,
      "unread": 0,
      "new_posts": 0,
      "pinned": false,
      "unpinned": null,
      "visible": true,
      "closed": false,
      "archived": false,
      "notification_level": 3,
      "bookmarked": false,
      "liked": false,
      "thumbnails": null,
      "like_count": 0,
      "views": 4,
      "category_id": 7,
      "featured_link": null,
      "posters": [
        {
          "extras": "latest single",
          "description": "Original Poster, Most Recent Poster",
          "user": {
            "id": 1,
            "username": "lindsey.tam",
            "name": null,
            "avatar_template": "/letter_avatar_proxy/v4/letter/l/ad7895/{size}.png"
          }
        }
      ]
    },
    {
      "id": 89,
      "title": "This is a fake topic used for testing on a developer env",
      "fancy_title": "This is a fake topic used for testing on a developer env",
      "slug": "this-is-a-fake-topic-used-for-testing-on-a-developer-env",
      "posts_count": 2,
      "reply_count": 0,
      "highest_post_number": 3,
      "image_url": null,
      "created_at": "2020-07-10T15:20:11.798Z",
      "last_posted_at": "2020-07-14T19:15:31.031Z",
      "bumped": true,
      "bumped_at": "2020-07-10T15:22:17.189Z",
      "archetype": "regular",
      "unseen": false,
      "last_read_post_number": 3,
      "unread": 0,
      "new_posts": 0,
      "pinned": false,
      "unpinned": null,
      "visible": true,
      "closed": false,
      "archived": false,
      "notification_level": 3,
      "bookmarked": false,
      "liked": false,
      "thumbnails": null,
      "like_count": 0,
      "views": 5,
      "category_id": 7,
      "featured_link": null,
      "posters": [
        {
          "extras": "latest single",
          "description": "Original Poster, Most Recent Poster",
          "user": {
            "id": 1,
            "username": "lindsey.tam",
            "name": null,
            "avatar_template": "/letter_avatar_proxy/v4/letter/l/ad7895/{size}.png"
          }
        }
      ]
    },
    {
      "id": 88,
      "title": "This is a long title to test the plugin button",
      "fancy_title": "This is a long title to test the plugin button",
      "slug": "this-is-a-long-title-to-test-the-plugin-button",
      "posts_count": 1,
      "reply_count": 0,
      "highest_post_number": 1,
      "image_url": null,
      "created_at": "2020-07-09T01:23:38.306Z",
      "last_posted_at": "2020-07-14T19:22:11.164Z",
      "bumped": true,
      "bumped_at": "2020-07-09T01:23:38.560Z",
      "archetype": "regular",
      "unseen": false,
      "last_read_post_number": 1,
      "unread": 0,
      "new_posts": 0,
      "pinned": false,
      "unpinned": null,
      "visible": true,
      "closed": false,
      "archived": false,
      "notification_level": 3,
      "bookmarked": false,
      "liked": false,
      "thumbnails": null,
      "like_count": 0,
      "views": 6,
      "category_id": 7,
      "featured_link": null,
      "posters": [
        {
          "extras": "latest single",
          "description": "Original Poster, Most Recent Poster",
          "user": {
            "id": 1,
            "username": "lindsey.tam",
            "name": null,
            "avatar_template": "/letter_avatar_proxy/v4/letter/l/ad7895/{size}.png"
          }
        }
      ]
    },
    {
      "id": 90,
      "title": "This is a test topic on a developer env",
      "fancy_title": "This is a test topic on a developer env",
      "slug": "this-is-a-test-topic-on-a-developer-env",
      "posts_count": 5,
      "reply_count": 0,
      "highest_post_number": 9,
      "image_url": null,
      "created_at": "2020-07-10T15:23:18.839Z",
      "last_posted_at": "2020-07-10T20:33:43.557Z",
      "bumped": true,
      "bumped_at": "2020-07-10T20:33:43.557Z",
      "archetype": "regular",
      "unseen": false,
      "last_read_post_number": 9,
      "unread": 0,
      "new_posts": 0,
      "pinned": false,
      "unpinned": null,
      "visible": true,
      "closed": false,
      "archived": false,
      "notification_level": 2,
      "bookmarked": false,
      "liked": true,
      "thumbnails": null,
      "like_count": 1,
      "views": 5,
      "category_id": 1,
      "featured_link": null,
      "posters": [
        {
          "extras": null,
          "description": "Original Poster",
          "user": {
            "id": 9,
            "username": "1234",
            "name": "lindsey",
            "avatar_template": "/letter_avatar_proxy/v4/letter/1/a5b964/{size}.png"
          }
        },
        {
          "extras": "latest",
          "description": "Most Recent Poster",
          "user": {
            "id": -2,
            "username": "discobot",
            "name": "discobot",
            "avatar_template": "/user_avatar/localhost/discobot/{size}/2_2.png"
          }
        }
      ]
    }
  ],
  "id": 93,
  "title": "Test the usage of the custom button plugin",
  "fancy_title": "Test the usage of the custom button plugin",
  "posts_count": 1,
  "created_at": "2020-07-15T16:40:32.477Z",
  "views": 1,
  "reply_count": 0,
  "like_count": 0,
  "last_posted_at": "2020-07-15T18:45:53.884Z",
  "visible": true,
  "closed": false,
  "archived": false,
  "has_summary": false,
  "archetype": "regular",
  "slug": "test-the-usage-of-the-custom-button-plugin",
  "category_id": 2,
  "word_count": 11,
  "deleted_at": null,
  "user_id": 1,
  "featured_link": null,
  "pinned_globally": false,
  "pinned_at": null,
  "pinned_until": null,
  "image_url": null,
  "draft": null,
  "draft_key": "topic_93",
  "draft_sequence": 3,
  "posted": true,
  "unpinned": null,
  "pinned": false,
  "current_post_number": 1,
  "highest_post_number": 1,
  "last_read_post_number": 1,
  "last_read_post_id": 217,
  "deleted_by": null,
  "has_deleted": false,
  "actions_summary": [
    {
      "id": 4,
      "count": 0,
      "hidden": false,
      "can_act": true
    },
    {
      "id": 8,
      "count": 0,
      "hidden": false,
      "can_act": true
    },
    {
      "id": 7,
      "count": 0,
      "hidden": false,
      "can_act": true
    }
  ],
  "chunk_size": 20,
  "bookmarked": false,
  "topic_timer": null,
  "private_topic_timer": null,
  "message_bus_last_id": 4,
  "participant_count": 1,
  "show_read_indicator": false,
  "thumbnails": null,
  "topic_marked": false,
  "details": {
    "notification_level": 3,
    "notifications_reason_id": 1,
    "can_move_posts": true,
    "can_edit": true,
    "can_delete": true,
    "can_remove_allowed_users": true,
    "can_invite_to": true,
    "can_invite_via_email": true,
    "can_create_post": true,
    "can_reply_as_new_topic": true,
    "can_flag_topic": true,
    "can_convert_topic": true,
    "can_review_topic": true,
    "can_remove_self_id": 1,
    "participants": [
      {
        "id": 1,
        "username": "lindsey.tam",
        "name": null,
        "avatar_template": "/letter_avatar_proxy/v4/letter/l/ad7895/{size}.png",
        "post_count": 1,
        "primary_group_name": null,
        "primary_group_flair_url": null,
        "primary_group_flair_color": null,
        "primary_group_flair_bg_color": null
      }
    ],
    "created_by": {
      "id": 1,
      "username": "lindsey.tam",
      "name": null,
      "avatar_template": "/letter_avatar_proxy/v4/letter/l/ad7895/{size}.png"
    },
    "last_poster": {
      "id": 1,
      "username": "lindsey.tam",
      "name": null,
      "avatar_template": "/letter_avatar_proxy/v4/letter/l/ad7895/{size}.png"
    }
  }
}
```

## License
MIT
