# JiraTracker

Simple tool to track the time you spent on Jira issues.

## Installation and setup

```
gem install jira_tracker
rbenv rehash
jira_tracker initialize
```

## Usage

```
jira_tracker <ticket/project> <time-spent>
```

When you work on specific ticket

```
jira_tracker xoya-10 1h
```

When you don't have any ticket but you work on a project

```
jira_tracker xoya 1h
```


If you put `-` in a first argument, program will try to find a specific ticket, 
otherwise will look for a project with ticket that has summary `Time Tracking Ticket`. 

*You can specify a time unit after a time value 'X', such as Xw, Xd, Xh or Xm,
to represent weeks (w), days (d), hours (h) and minutes (m), respectively.*
