# Instructions

You have access to two projects in REDCap now:

1. `REDCap API CDSI Dev Talk`: This is the project for which you just filled your
participation survey. Your response (including your secretphrase) and the
responses from everyone else are are stored in this project. This will be
referred to as the `Master Project`.
2. `CDSI Challenge for $YOURNETID`: A blank project that you will use to survey
all the other challenge participants. Feel free to rename this project. This
will be referred to as `Your Personal Project`.

Your task which is due on **Tuesday January 12, 2016 at midnight** is to build a
survey in Your Personal Project and send that survey to everyone whose name is
in the Master Project. 

## Building Your Personal Project

Like you, everyone whose name ends up in the Master Project has provided a
secretphrase while filling the participation survey. You will need to use REDCap
to send each person a personalized survey link which displays to them the
secretphrase that they have provided... to assure them that the survey is sent
by a fellow participant. 

To support that, your Your Personal Project will need to include at least the
following 4 variables all of which also exist in the Master Project:

* `first_name`
* `last_name`
* `email`
* `secretphrase`

You will also need to build a data capture form and enable it as a survey that goes
out to everyone based on their `email` field.

A good way to achieve personalization in the survey form is to use
a question of type 'descriptive' which is basically just text with no input
field. You can use REDCap's piping syntax to display to them the contents of the
other fields. For example the text that you would show in that 'descriptive' text
can have the following value where the square brackets are REDCap's way to pipe
values from the other fields:

```
Hello [first_name] [last_name], your secret phrase is: 
[secretphrase]
```

The **GOOD NEWS** is that I already made a template that you can use to
create all this. This is CSV file that has the metadata that you can uplaod to
REDCap to define forms and fields.

Download the file `resources/Individual_Project_Datadictionary_template.csv` in
this repository (link
[here](resources/Individual_Project_Datadictionary_template.csv)).

Go to Your Personal Project and click on **Project Setup**. In the portion that
says "Design your data collection instruments" click on the **Data Dictionary**
button. 

![Data Dictionary Import Button](resources/datadictionarybutton.png)

It will take you to a page where you can upload the template CSV file that I
made you. Be sure to commit your changes.

This will create 

## Entering the Roster and Keeping it Current
