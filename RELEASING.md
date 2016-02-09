# Releasing a new version

## Checklist

* Run mix test
* Ensure `CHANGELOG.md` is up-to-date
* Update version in `mix.exs`
* Create a commit:

      git commit -a -m "Bump version to 0.X.Y"
      git tag -l v0.X.Y
      mix hex.publish
      git push origin master --tags
