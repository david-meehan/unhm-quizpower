INSERT INTO questionAnswer VALUES(NULL, "The perception of moving an object on a screen is achieved by:", "Show object at different locations at set time intervals.");
INSERT INTO questionTopicMapping VALUES(LAST_INSERT_ID(), (SELECT topicID FROM topic WHERE topicName="animation" AND courseID = 1));

INSERT INTO questionAnswer VALUES(NULL, "Roughly, how many pixels does the width of a phone screen have?", "300");
INSERT INTO questionTopicMapping VALUES(LAST_INSERT_ID(), (SELECT topicID FROM topic WHERE topicName="animation" AND courseID = 1));

INSERT INTO questionAnswer VALUES(NULL, "What does the following call do: call PhotoCanvas.DrawCircle(10, 20, 1)", "Draws a circle at position (10, 20) with a radius 1 pixel.");
INSERT INTO questionTopicMapping VALUES(LAST_INSERT_ID(), (SELECT topicID FROM topic WHERE topicName="animation" AND courseID = 1));

INSERT INTO questionAnswer VALUES(NULL, "What operations are in the Logic drawer?", "and, or, not, test for equality of everything (not only numbers)");
INSERT INTO questionTopicMapping VALUES(LAST_INSERT_ID(), (SELECT topicID FROM topic WHERE topicName="expressions" AND courseID = 1));

INSERT INTO questionAnswer VALUES(NULL, "Name two Canvas blocks for painting", "DrawCirlce, DrawLine");
INSERT INTO questionTopicMapping VALUES(LAST_INSERT_ID(), (SELECT topicID FROM topic WHERE topicName="architecture" AND courseID = 1));

INSERT INTO questionAnswer VALUES(NULL, "An app’s components have specific characteristics for which designers specify values. What are they called?", "properties");
INSERT INTO questionTopicMapping VALUES(LAST_INSERT_ID(), (SELECT topicID FROM topic WHERE topicName="components" AND courseID = 1));

INSERT INTO questionAnswer VALUES(NULL, "There are two kinds of App Inventor's components.", "visble and non-visible");
INSERT INTO questionTopicMapping VALUES(LAST_INSERT_ID(), (SELECT topicID FROM topic WHERE topicName="components" AND courseID = 1));

INSERT INTO questionAnswer VALUES(NULL, "A canvas object is a table of ...", "pixels");
INSERT INTO questionTopicMapping VALUES(LAST_INSERT_ID(), (SELECT topicID FROM topic WHERE topicName="components" AND courseID = 1));

INSERT INTO questionAnswer VALUES(NULL, "Visible objects of an app respond to events from users. Name three events generated via user interface. ", "Click on a button, touch or drag on the screen, type in a text area");
INSERT INTO questionTopicMapping VALUES(LAST_INSERT_ID(), (SELECT topicID FROM topic WHERE topicName="components" AND courseID = 1));

INSERT INTO questionAnswer VALUES(NULL, "Mobile device built-in functionality is represented by App Inventor's non-visible components. Name four. ", "Clock, location sensor, camera, player, texting");
INSERT INTO questionTopicMapping VALUES(LAST_INSERT_ID(), (SELECT topicID FROM topic WHERE topicName="components" AND courseID = 1));

INSERT INTO questionAnswer VALUES(NULL, "Non-visible components of an app model ...", "built-in functionality of the mobile device such as knowing its location, playing sounds, sending messages. ");
INSERT INTO questionTopicMapping VALUES(LAST_INSERT_ID(), (SELECT topicID FROM topic WHERE topicName="components" AND courseID = 1));

INSERT INTO questionAnswer VALUES(NULL, "Visible components are grouped based on their purpose. Name five groups of related components.", "Media, Animation, Social, Sensors, ScreenArrangement");
INSERT INTO questionTopicMapping VALUES(LAST_INSERT_ID(), (SELECT topicID FROM topic WHERE topicName="components" AND courseID = 1));

INSERT INTO questionAnswer VALUES(NULL, "What does “fill parent” value do when given to the width of a Canvas object?", "Sets the width of the canvas to the width of the device screen.");
INSERT INTO questionTopicMapping VALUES(LAST_INSERT_ID(), (SELECT topicID FROM topic WHERE topicName="components" AND courseID = 1));

INSERT INTO questionAnswer VALUES(NULL, "Can sprites be placed within larger scenes that are not Canvas objects? ", "No, the only container for sprites are canvas objects.");
INSERT INTO questionTopicMapping VALUES(LAST_INSERT_ID(), (SELECT topicID FROM topic WHERE topicName="components" AND courseID = 1));

INSERT INTO questionAnswer VALUES(NULL, "Events that App Inventor's components capture are ...", "user-initiated events, initialization event, timer event, animation events, device hardware generated events (location sensor, camera, texting, etc.)");
INSERT INTO questionTopicMapping VALUES(LAST_INSERT_ID(), (SELECT topicID FROM topic WHERE topicName="events" AND courseID = 1));

INSERT INTO questionAnswer VALUES(NULL, "What triggers a timer event?", "passing of time.");
INSERT INTO questionTopicMapping VALUES(LAST_INSERT_ID(), (SELECT topicID FROM topic WHERE topicName="events" AND courseID = 1));

INSERT INTO questionAnswer VALUES(NULL, "What component handles timer events?", "clock component");
INSERT INTO questionTopicMapping VALUES(LAST_INSERT_ID(), (SELECT topicID FROM topic WHERE topicName="events" AND courseID = 1));

INSERT INTO questionAnswer VALUES(NULL, "Comparison operations are ...", ">, >=, <, <=, !=, =");
INSERT INTO questionTopicMapping VALUES(LAST_INSERT_ID(), (SELECT topicID FROM topic WHERE topicName="expressions" AND courseID = 1));

INSERT INTO questionAnswer VALUES(NULL, "Arithmetic operations are ...", "'+, -, *, /");
INSERT INTO questionTopicMapping VALUES(LAST_INSERT_ID(), (SELECT topicID FROM topic WHERE topicName="expressions" AND courseID = 1));

INSERT INTO questionAnswer VALUES(NULL, "A boolean or logical expression evaluates to ...", "true or false");
INSERT INTO questionTopicMapping VALUES(LAST_INSERT_ID(), (SELECT topicID FROM topic WHERE topicName="expressions" AND courseID = 1));


INSERT INTO questionAnswer VALUES(NULL, "What is the index of an element in a list?", "The index is the position of that element in the list. ");
INSERT INTO questionTopicMapping VALUES(LAST_INSERT_ID(), (SELECT topicID FROM topic WHERE topicName="lists" AND courseID = 1));

INSERT INTO questionAnswer VALUES(NULL, "What type of values does an index have?", "positive integer values");
INSERT INTO questionTopicMapping VALUES(LAST_INSERT_ID(), (SELECT topicID FROM topic WHERE topicName="lists" AND courseID = 1));

INSERT INTO questionAnswer VALUES(NULL, "The block to select an element from a list is...", "selectListItem(list, index)");
INSERT INTO questionTopicMapping VALUES(LAST_INSERT_ID(), (SELECT topicID FROM topic WHERE topicName="lists" AND courseID = 1));

INSERT INTO questionAnswer VALUES(NULL, "What is a valid range of index values?", "1 to length of the list");
INSERT INTO questionTopicMapping VALUES(LAST_INSERT_ID(), (SELECT topicID FROM topic WHERE topicName="lists" AND courseID = 1));

INSERT INTO questionAnswer VALUES(NULL, "Named sequences of blocks are called ...", "procedures");
INSERT INTO questionTopicMapping VALUES(LAST_INSERT_ID(), (SELECT topicID FROM topic WHERE topicName="procedures" AND courseID = 1));

INSERT INTO questionAnswer VALUES(NULL, "Are functions procedures?", "Yes");
INSERT INTO questionTopicMapping VALUES(LAST_INSERT_ID(), (SELECT topicID FROM topic WHERE topicName="procedures" AND courseID = 1));

INSERT INTO questionAnswer VALUES(NULL, "Are event handlers procedures?", "Yes");
INSERT INTO questionTopicMapping VALUES(LAST_INSERT_ID(), (SELECT topicID FROM topic WHERE topicName="procedures" AND courseID = 1));

INSERT INTO questionAnswer VALUES(NULL, "Are expressions procedures?", "No");
INSERT INTO questionTopicMapping VALUES(LAST_INSERT_ID(), (SELECT topicID FROM topic WHERE topicName="procedures" AND courseID = 1));

INSERT INTO questionAnswer VALUES(NULL, "What built-in functionality in a mobile device is used for timer events?", "Device's internal clock");
INSERT INTO questionTopicMapping VALUES(LAST_INSERT_ID(), (SELECT topicID FROM topic WHERE topicName="sensors" AND courseID = 1));

INSERT INTO questionAnswer VALUES(NULL, "An app’s behavior is implemented as a set of ...", "event handlers");
INSERT INTO questionTopicMapping VALUES(LAST_INSERT_ID(), (SELECT topicID FROM topic WHERE topicName="software-development" AND courseID = 1));

INSERT INTO questionAnswer VALUES(NULL, "Data types in App Inventor are ...", "numeric, true, false, text, Color, list, and object of any component");
INSERT INTO questionTopicMapping VALUES(LAST_INSERT_ID(), (SELECT topicID FROM topic WHERE topicName="variables" AND courseID = 1));

INSERT INTO questionAnswer VALUES(NULL, "How are variables physically represented in the device on which the app is running?", "Device's memory cells");
INSERT INTO questionTopicMapping VALUES(LAST_INSERT_ID(), (SELECT topicID FROM topic WHERE topicName="variables" AND courseID = 1));

INSERT INTO questionAnswer VALUES(NULL, "Difference between variables and a component’s properties is ...", "Variables are named by the developer while the properties are already defined within the component.");
INSERT INTO questionTopicMapping VALUES(LAST_INSERT_ID(), (SELECT topicID FROM topic WHERE topicName="variables" AND courseID = 1));

INSERT INTO questionAnswer VALUES(NULL, "When a component is dragged into the Designer, information about that component is stored in the component’s ...", "properties");
INSERT INTO questionTopicMapping VALUES(LAST_INSERT_ID(), (SELECT topicID FROM topic WHERE topicName="variables" AND courseID = 1));