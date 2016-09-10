USERNAME = "mjmuir"
PASSWORD = "your-personal-access-token"

GitHubApi = require "github"

github = new GitHubApi
  protocol: "https"
  host: "gits-15.sys.kth.se"
  pathPrefix: "/api/v3"
  Promise: require "bluebird"

github.authenticate
  type: "basic"
  username: USERNAME
  password: PASSWORD

repos = ["week-1"]
labels =
  "style": "AB4523"
  "documentation": "EF1212"

for r in repos
  for n, c of labels
    do ->
      [repo, name, color] = [r, n, c]
      github.issues.createLabel(
        user: "inda-16"
        repo: repo
        name: name
        color: color
      )
        .then -> console.log "#{name} label was added to #{repo}"
        .catch -> console.log "#{name} label was already present in #{repo}"

