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

By visiting any posts at /t/{post_id}.json, the format includes a custom field, called topic_marked. This custom field should correspond with the value of the button. 

## License
MIT
