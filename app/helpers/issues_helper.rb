module IssuesHelper
  def issues_back_path(issue)
    return test_suite_feature_path(issue.feature.test_suite, issue.feature) if issue.feature
    return test_suite_path(issue.test_suite) if issue.test_suite
    issues_path
  end
end
