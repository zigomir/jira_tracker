require "spec_helper"

describe JiraTracker do

  context "structure" do
    subject { JiraTracker }
    it { should respond_to :run, :worklog, :find, :get_project_name_from_issue }
  end

end
