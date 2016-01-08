# rrj984 contribution

I hacked together a little ruby script to pull the participants from the master project then move the consented ones over to my individual project

For testing I found is useful to delete all data from my project after botched import attempts.  You can find this under project setup>other functionality

The logging in the left pane was also useful to track successful imports

When pulling data from master project it was handy to define only the fields I needed with the optional 'fields' parameter

I found when importing, the schema must match _exactly_ or else you will get a 400 error

Tokens are saved locally then imported to YAML to keem them out of code and version controll

Not pretty, but it works...

```ruby
require 'rest-client'
require 'yaml'
require 'csv'

creds = YAML.load_file(ENV['HOME']+'/.credentials')
@master_token = creds['rc2_478']
@individual_token = creds['rc2_488']
@test = creds['rc2_489']

def master_data
  rcdata = RestClient.post "https://redcap2.nubic.northwestern.edu/redcap/api/", 
    :token => @master_token, 
    :content  => 'record', 
    :format =>  'csv',
    :fields => ['record_id', 'first_name', 'last_name', 'email', 'agree_y', 'secretphrase']
end

def consented_participants
  data = CSV.parse(master_data)
  data.keep_if { |a| a[4] == '1' }
  data.unshift(['record_id', 'first_name', 'last_name', 'email', 'agree_y', 'secretphrase'])
  csv_string = CSV.generate do |csv|
   data.each do |d|
     csv << d
   end
  end
  puts csv_string
  csv_string
end

#move consented participants into individual project
def load_roster
  rcdata = RestClient.post "https://redcap2.nubic.northwestern.edu/redcap/api/", 
    token: @individual_token,
    content: 'record',
    format: 'csv',
    type: 'flat',
    overwriteBehavior: 'normal',
    data: consented_participants,
    returnContent: 'count',
    returnFormat: 'json'
end
master_data
load_roster
```
