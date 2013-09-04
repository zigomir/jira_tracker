require 'jira_tracker/version'
require 'pp'
require 'jira'

module JiraTracker

  # Consider the use of :use_ssl and :ssl_verify_mode options if running locally
  # for tests.
  username = ''
  password = ''

  options = {
    :username       => username,
    :password       => password,
    :site           => 'https://astina.atlassian.net',
    :context_path   => '',
    :rest_base_path => '/rest/api/2',
    :auth_type      => :basic
  }

  client = JIRA::Client.new(options)

  # Show all projects
  begin
    #projects = client.Project.all
    #
    #projects.each do |project|
    #  puts "Project -> key: #{project.key}, name: #{project.name}"
    #end

    issue = client.Issue.find('XOYA-10')
    #puts issue

    worklog = issue.worklogs.build
    worklog.save({'timeSpent' => '1h'})

  rescue JIRA::HTTPError => e
    puts e.response
  end
end
