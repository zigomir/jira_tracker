require 'jira_tracker/version'
require 'yaml'
require 'pp'
require 'jira'

module JiraTracker

  @config = nil

  def self.run(issue, time_spent, comment)
    begin
      @config = YAML.load_file "#{Dir.home}/.jira_tracker.yml"
    rescue
      p 'Setting file jira_tracker.yml not found!'
      exit
    end

    options = {
        :username       => @config['username'],
        :password       => @config['password'],
        :site           => @config['site'],
        :context_path   => '',
        :rest_base_path => '/rest/api/2',
        :auth_type      => :basic
    }

    client = JIRA::Client.new(options)
    JiraTracker.worklog(issue, time_spent, comment, client)
  end

  def self.worklog(issue, time_spent = '0m', comment = '', client)
    jira_issue = JiraTracker.find do
      if issue.include?('-')
        client.Issue.find(issue)
      else
        project_name = JiraTracker.get_project_name_from_issue(issue)
        jql = "project = #{project_name} AND summary ~ \"#{@config['time_track_issue_summary']}\""
        client.Issue.jql(jql).first
      end
    end

    worklog = jira_issue.worklogs.build

    worklog.save({'timeSpent' => time_spent, 'comment' => comment})
    p "Thanks! #{time_spent} was added to #{jira_issue.key} - #{jira_issue.summary}"

    unless worklog.issue.timespent.nil?
      time_spent_till_now = worklog.issue.timespent / 3600
      p "Time spent on this issue before #{time_spent_till_now}h"
    end
  end

  def self.find
    begin
      return yield
    rescue JIRA::HTTPError => e
      p e.response
      exit
    end
  end

  def self.get_project_name_from_issue(issue)
    issue.split('-').first.upcase
  end

end
