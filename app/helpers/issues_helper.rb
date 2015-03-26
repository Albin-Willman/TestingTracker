module IssuesHelper
  def issues_back_path(issue)
    return test_suite_feature_path(issue.feature.test_suite, issue.feature) if issue.feature
    return test_suite_path(issue.test_suite) if issue.test_suite
    issues_path
  end

  def link_to_feature(feature)
    return if feature.nil?
    link_to feature.name, test_suite_feature_path(feature.test_suite, feature)
  end
end
