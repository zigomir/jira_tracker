# JiraTracker

Simple tool to track the time you spent on Jira issues.

## Installation and setup

```bash
gem install jira_tracker
rbenv rehash
jira_tracker initialize
```

## Usage

```bash
jira_tracker <ticket/project> <time-spent> "<comment>"
```

When you work on specific ticket

```bash
jira_tracker xoya-10 1h "test comment"
```

When you don't have any ticket but you work on a project

```bash
jira_tracker xoya 1h "test comment"
```

If you put `-` (dash, like `xoya-10`) in a first argument, program will try to find a specific ticket, 
otherwise will look for a project with ticket that has summary `Time Tracking Ticket`. 

*You can specify a time unit after a time value 'X', such as Xw, Xd, Xh or Xm,
to represent weeks (w), days (d), hours (h) and minutes (m), respectively.*


## Developer docs for JIRA REST api

[Worklog POST request](https://docs.atlassian.com/jira/REST/latest/#idp2062512)
