# Devops Challenge #

## Demo ##

  ./go clean environment:vagrant node:bootstrap package:puppet node:puppet_apply
---

## All tasks ##
  rake clean                    # Remove any temporary products.
  rake environment:vagrant      # Setup vagrant environment e.g DEPLOY_USER, DEPLOY_KEY and DEPLOY_HOSTS
  rake node:bootstrap           # bootstraps the node(s) configured in DEPLOY_HOSTS
  rake node:puppet_apply[noop]  # runs puppet apply on the node(s) configured in DEPLOY_HOSTS
  rake package:puppet           # package puppet
---

## Completed Challenges ##

1. Given the WAR file available at this location: http://dl.dropbox.com/u/81233116/HelloWorld.war, deploy and run the application as a service on the box
2. Front the application with a web server such that hitting the url http://localhost:9080 will bring up the HelloWorld screen of the application
3. Redirect all 404 errors to a custom static page on the web server
4. Create a way to ensure that the application is available and running and, if it isn't, that the application gets restarted automatically
