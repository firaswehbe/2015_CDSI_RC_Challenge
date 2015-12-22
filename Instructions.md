# Instructions

You have access to two projects in REDCap now:

1. `REDCap API CDSI Dev Talk`: (Read-only) This is the project for which you
just filled your participation survey. Your response (including your
secretphrase) and the responses from everyone else are are stored in this
project. This will be referred to as the `Master Project`.
2. `CDSI Challenge for $YOURNETID`: A blank project that you will use to survey
all the other challenge participants. Feel free to rename this project. This
will be referred to as `Your Personal Project`.

Your task which is due on **Tuesday January 12, 2016 at midnight** is to build a
survey in Your Personal Project and send that survey to everyone whose name is
in the Master Project. To ensure that we have survey participation, you also
have to respond to 50% or more of the surveys that you receive from other
participants. 


## Building Your Personal Project

### Defining the Forms and Data Elements

Like you, everyone whose name ends up in the Master Project has provided a
secretphrase while filling the participation survey. You will need to use REDCap
to send each person a personalized survey link which displays to them the
secretphrase that they have provided. This is to assure them that the survey is sent
by a fellow participant. 

To support that, you will need to build Your Personal Project in a way 
way that captures their names, email, and secret phrase of your colleagues. 

You will also need to build a data capture form and enable it as a survey that goes
out to everyone based on a designated email field. (I will describe below how to
enable a form as a survey and how to designate an email field.)

The **GOOD NEWS** is that I already made a template that you can use to
create all this. This is CSV file that has the metadata that you can uplaod to
REDCap to define forms and fields.

Download the file `resources/Individual_Project_Datadictionary_template.csv`
from this repository (link
[here](resources/Individual_Project_Datadictionary_template.csv)).  

Go to Your Personal Project and click on **Project Setup**. In the portion that
says "Design your data collection instruments" click on the **Data Dictionary**
button. 

![Data Dictionary Import Button](resources/datadictionarybutton.png)

It will take you to a page where you can upload the template CSV file that I
made you. Be sure to commit your changes.

If all goes well, Your Personal Project should now contain 2 forms.

`Participant Roster` form with the following fields:

* `record_id`
* `first_name`
* `last_name`
* `email`
* `secretphrase`

`Participant Survey` form with the following fields:

* `show_info`: a descriptive field as described below
* `sample_1`: a simple text field that you will need to modify
* `sample_2`: a simple text field that you will need to modify
* `sample_3`: a simple text field that you will need to modify

### Personalizing Your Survey Using the Secretphrase

A good way to achieve personalization in the survey form is to use a question of
type 'descriptive' which is basically just text with no input field. (e.g. the
`show_info` above) You can use REDCap's piping syntax to display to them the
contents of the other fields. For example the text that you would show in that
'descriptive' text can have the following value. The square brackets are
REDCap's syntax to pipe values from the other fields:

```
Hello [first_name] [last_name], your secret phrase is: 
[secretphrase]
```

### Enabling the Survey

Make sure you enable surveys for Your Personal Project. Your project should look
like this:

![Enable Survey](resources/usersurvey.png)

Then enable the `Participant Survey` form as a survey in the **Online
Designer**. 

![Enable Participant Survey as a Survey](resources/enableparticipantsurvey.png)

Finally, designate the `email` field in the `Participant Roster` form as the
survey invitation field. This way you can use REDCap's built in survey managment
interface to create and send personalized invitations containing a survey link
unique to each person. Once you designate your survey invitation field, Your
Personal Project set up page should look like this:

![Designate email as the survey invitation field](resources/designateemail.png)

### Build Your Own Survey Questions

You have what you need in terms of infrastructure. Now it's up to you to build
the survey

## Entering the Roster and Keeping it Current

Disable auto-numbering so you can use `record_id` from the Master Project.

![Disable auto-numbering of records](resources/disableautonum.png)
