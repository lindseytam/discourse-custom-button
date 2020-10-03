/*
 * Created: June 18 2020
 * Author: Lindsey Tam
 * Description: This script handles all unit testing for the UI of the plugin. It is checking for the following:
                1. Button is initialized correctly (class, text, icon)
                2. Button's behavior after-click is correct (class, text, icon)
                3. Only admin can see the button
                4. Only logged-in admin can see the button

 * Run the code:
          http://localhost:3000/qunit?module=Acceptance%3A%Custom%20button
          http://localhost:3000/qunit?module=Acceptance%3A%Custom%20button%20not%20logged%20in
          rake plugin:qunit['discourse-custom-plugin']
 */

import { acceptance, updateCurrentUser, loggedInUser } from "helpers/qunit-helpers";

acceptance("Custom button", { loggedIn: true });
QUnit.test("Custom", async assert => {

  // determine user status + set settings
  const user_status = loggedInUser()['admin']
  var can_see_button = (user_status) ? true: false;
  Discourse.SiteSettings.custom_topic_button_allowed_group = can_see_button

  // non admin should not see the button
  if (can_see_button == false) {
    assert.ok(!exists("#custom-button"), "Non admin should not see the custom button");
  } else {

  updateCurrentUser({can_see_topic_group_button: true});

  // make sure the button exists
  await visit("/t/internationalization-localization/280");
  assert.ok(exists("#custom-button"), "Admin should see the custom button");
  const current_value = document.getElementById("custom-button").innerText.trim();
  const og_class = document.getElementById("custom-button").className.trim();
  const icon_class = document.getElementById("custom-button").classList[2]
  const title = document.getElementById("custom-button").title;

  // ensure button value is valid (label, class, icon, title)
  var expected_values = ['Marked','Unmarked'];
  var expected_class = ["btn custom-topic-button btn btn-icon-text ember-view",
                        "btn-primary custom-topic-button btn btn-icon-text ember-view"]
  var expected_title = ["This is a marked post. Click to unmark it.",
                        "This is not a marked post. Click to mark it."]
  assert.ok(expected_values.indexOf(current_value) !== -1, 'Check before-click button value')
  assert.ok(expected_class.indexOf(og_class) !== -1, 'Check before-click button class')
  assert.equal("btn-icon-text", icon_class,'Check before-click button class')
  assert.ok(expected_title.indexOf(title) !== -1, 'Check before-click button title')

  // ensure button values after click is valid (label, class, title)
  click('#custom-button');
  var alt_value = (current_value == "Marked") ? 'Unmarked' : 'Marked';
  var alt_class = (og_class == "btn custom-topic-button btn btn-icon-text ember-view") ?
                  "btn-primary custom-topic-button btn btn-icon-text ember-view" :
                  'btn custom-topic-button btn btn-icon-text ember-view';
  var alt_title = (title == "This is not a marked post. Click to mark it.") ?
                    "This is not a marked post. Click to mark it." :
                    'This is a marked post. Click to unmark it.';
  assert.notEqual(current_value, alt_value, "Check after-click button value");
  assert.notEqual(og_class, alt_class, "Check after-click button class");
  assert.notEqual(title, alt_title, "Check after-click button title");
  }
});

acceptance("Custom button not logged in");
QUnit.test("Custom non logged in", async assert => {

  // cannot see button if user is not logged in
  await visit("/t/internationalization-localization/280");
  assert.ok(!exists("#custom-button"), "Non-Admin should not see the custom button");

});



