# Releasing a new version

## Checklist

* Run mix test
* Ensure `CHANGELOG.md` is up to date
* Update version in `mix.exs`
* Create a commit:

      git add .
      git commit -m "Bump version to 0.0.1"
      git tag v0.0.1
      mix hex.publish
      git push origin master --tags
