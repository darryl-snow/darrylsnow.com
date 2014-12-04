# yourweb.expert

My personal website

## Development instructions

### Client

```
gulp
```

### Server

```
npm start
```

### Deployment Instructions

### Client

```
gulp deploy
deploy
```

> The github pages submodule is in the client/public folder to for the `deploy` command to work, add this to the bash profile: `alias deploy="cd client/public; git commit -a -m 'deploy' && git push; git checkout gh-pages; git merge master; git push origin gh-pages; git checkout master; cd ../../"`

> The gulp plugin for inlining critical CSS unfortunately strips closing `</path>` tags from inline SVGs, so they have to be added back manually before deployment.

### Server

```
git push origin openshift
```