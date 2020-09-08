appraise "ar60" do
  gem "activerecord", "~> 6.0.0"
end

appraise "ar61" do
  git_source(:github) do |repo_name|
    repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
    "https://github.com/#{repo_name}.git"
  end

  gem "activerecord", github: "rails/rails"
  gem "rgeo-activerecord", github: "rgeo/rgeo-activerecord"
end
