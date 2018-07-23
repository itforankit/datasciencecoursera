# Find OAuth settings for github:
# http://developer.github.com/v3/oauth/
library(httr)
github <- oauth_endpoints("github")

# Replace your key and secret below.
myapp <- oauth_app("github",
                   key = "dcfedd66ae24349da330",
                   secret = "a28c8fe8546a2160f7e4856397a95300fb3ca436")

# Get OAuth credentials
github_token <- oauth2.0_token(github, myapp)

# Use the API
gtoken <- config(token = github_token)

req <- with_config(gtoken, GET("https://api.github.com/users/jtleek/repos"))

stop_for_status(req)

repo_list <- content(req)
answer1 <- c() 
for (i in 1:length(repo_list)) {
  repo <- repo_list[[i]]
  if (repo[["name"]] == "datasharing") {
    answer1 = repo
    break
  }
}

# Expected output: The repository 'datasharing' was created at 2013-11-07T13:25:07Z
if (length(answer1) == 0) {
  message("No such repository found: 'datasharing'")
} else {
  message("The repository 'datasharing' was created at", answer1$created_at)
}