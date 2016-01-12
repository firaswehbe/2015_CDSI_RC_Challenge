require 'net/http'
require 'uri'
require 'yaml'
require 'json'

@config =  YAML.load(File.open('config.yml'))
@uri   = URI.parse(@config[:uri])

def get_master_data
  data = {
    token: @config[:master_token],
    content: 'record',
    format: 'json',
    type: 'flat',
    fields: "'record_id','agree_y','email','first_name','last_name','secretphrase'",    # ???
    rawOrLabel: 'raw',
    rawOrLabelHeaders: 'raw',
    exportCheckboxLabel: 'false',
    exportSurveyFields: 'false',
    exportDataAccessGroups: 'false',
    returnFormat: 'json'
  }
  response = Net::HTTP.post_form(@uri, data)

  case response
  when Net::HTTPSuccess then
    JSON.parse(response.body)
  else
    raise response.value
  end
end

def load_roster
  agreed_participants_data = get_master_data.select{|r| r['agree_y'] == '1'}
  data = {
    token: @config[:individual_token],
    content: 'record',
    format: 'json',
    type: 'flat',
    overwriteBehavior: 'normal',
    data:  JSON.dump(agreed_participants_data),
    returnContent: 'ids',
    returnFormat: 'json',
  }

  response = Net::HTTP.post_form(@uri, data)

  case response
  when Net::HTTPSuccess then
    puts 'Success! Records inserted:'
    puts JSON.parse(response.body)
  else
    raise response.value
  end
end

load_roster
