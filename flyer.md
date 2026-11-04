---
title: "Flyer for {{< meta course.title >}}"
accent-color: blue
course-url: "`{{< meta course.url >}}`{=typst}"
flyer-image:
  path: "media/cover-image.png"
  attribution: "`@underwaterbasketweaving8816`{=typst}"

format:
  typst:
    pdf-standard: a-4
    citeproc: false
    template-partials:
      - templates/flyer/typst-template.typ
      - templates/flyer/typst-show.typ
    filters: []
    mainfont: "Libertinus Sans"
    font-paths:
      - fonts
---

**Blurb**. If 'course.description' or 'course.prerequisites' are defined in your project's metadata, they will be used here. But you can also just
add material directly to the flier, like this blurb.
