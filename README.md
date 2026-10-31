## Instructions for Me

This is a template for my course websites.

Here are some notes for getting up and running.

Start by running,

```bash
quarto use template dsanson/course-template
```

Edit `_variables.yml`. There are some yaml keys that cannot be populated using Quarto variables. These have been marked with the placeholder XXX. So,

```bash
rg XXX
```

to find and replace.

Note that the pre-render script in `_quarto.yml` assumes that `generate_references` is available in PATH, and `generate_references` makes
assumptions about the location of a global bibilography json file.

Move `gitignore` and `github` to `.gitignore` and `.github`:

```bash
mv gitignore .gitignore
mv github .github
```

Re-install extensions. Quarto 1.11 [should fix this bug](https://github.com/quarto-dev/quarto-cli/pull/14010).

Commit changes and push to a new github repo:

```bash
gh repo create XXX --source=. --public --remote=origin --push
```

Publish locally to gh-pages branch:

```bash
quarto publish gh-pages
```

Push to github. Double-check that the github action is building properly and the Github Pages settings are correct and the Github Pages settings are correct and the Github Pages settings are correct and the Github Pages settings are correct.


Note that currently this is set to produce pdf ua-1 and uses the `math-alt.lua` filter to add raw latex as alt text for inline math. Once typst merges ua-2 support, this should no longer be necessary.






