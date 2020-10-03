/*
 * Created: June 18 2020
 * Author: Lindsey Tam
 * Description: This function handles the behavior of the button when clicked. It sends a PUT request to
                Discourse to change the status of a post's is_marked status
 */

import { popupAjaxError } from 'discourse/lib/ajax-error';
import { ajax } from 'discourse/lib/ajax';

export default {
  actions: {
    clickButton(topic) {

      // sends a PUT request to Discourse, input is topic id (int)
      ajax( "/topic/custom", {
        type: "PUT",
        data: JSON.stringify({topic_id: topic.id}),
        contentType: "application/json"
      }).then((result) => {

        // is_marked status is changed and post's last_posted_at value is updated
        topic.set('topic_marked', result.topic_marked);
        topic.set('last_posted_at', result.last_posted_at);
      }).catch(() => {
        bootbox.alert(I18n.t('custom_topic.error'));
      });
    }
  }
};
