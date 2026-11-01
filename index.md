---
title: '{{< var course.title >}}'
subtitle: "PHI {{< var course.number >}} ({{< var course.term >}} {{< var course.year >}})"
image: media/cover-image.svg
image-alt: "A gray rectangle."
image-title: "A placeholder image"
format:
  html:
    toc: false
    template-partials:
      - templates/empty/title-block.html
      - templates/empty/title-metadata.html
    format-links:
      - html
    include-in-header: 
      - text: |
          <style>
            h2.index-title {
              border-bottom: 0;
              padding-bottom: 0;
              margin-bottom: .2em;
              margin-top: 0;
            }
            h3.index-subtitle {
              margin-top: 0;
              margin-bottom: 1em;
              font-size: 1.2rem;
            }
          </style>
---

:::: {layout="[ 70, 30 ]"}

::: {#first-column}

## {{< meta title >}} {.index-title}

### {{< meta subtitle >}} {.index-subtitle}

I do not use Canvas.
This is our course webpage.
To keep on top of readings and assignments, you need to
check the [schedule](schedule.md), come to class, and pay attention to in-class announcements. 

There is no online grade book. If you want to know 
your grade, you can calculate it yourself, or come to my office hours and ask!

**Description.**
{{< var course.description >}} 


Class Meetings
:  {{< var course.meeting.1.time >}}, {{< var course.meeting.1.place >}}.

Office Hours
:   {{< var course.office-hours.time >}}, {{< var course.office-hours.place >}}

:::

::: {#second-column} 

![[{{< meta image-title >}}]{style="color: hsl(0,0%,75%); font-size: .9rem; text-align: center;"}]({{< meta image >}}){alt="{{< meta image-alt >}}" .lightbox }

:::

::::

