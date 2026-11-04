
// Typst custom formats typically consist of a 'typst-template.typ' (which is
// the source code for a typst template) and a 'typst-show.typ' which calls the
// template's function (forwarding Pandoc metadata values as required)
//
// This is an example 'typst-show.typ' file (based on the default template  
// that ships with Quarto). It calls the typst function named 'article' which 
// is defined in the 'typst-template.typ' file. 
//
// If you are creating or packaging a custom typst template you will likely
// want to replace this file and 'typst-template.typ' entirely. You can find
// documentation on creating typst templates here and some examples here:
//   - https://typst.app/docs/tutorial/making-a-template/
//   - https://github.com/typst/templates
#show: doc => flyer(
$if(title)$
  title: [$title$],
$endif$
$if(by-author)$
  authors: (
$for(by-author)$
$if(it.name.literal)$
    ( name: [$it.name.literal$],
      affiliation: [$for(it.affiliations)$$it.name$$sep$, $endfor$],
      email: [$it.email$] ),
$endif$
$endfor$
    ),
$endif$
$if(date)$
  date: [$date$],
$endif$
$if(lang)$
  lang: "$lang$",
$endif$
$if(region)$
  region: "$region$",
$endif$
$if(mainfont)$
  font: ("$mainfont$",),
$elseif(brand.typography.base.family)$
  font: $brand.typography.base.family$,
$endif$
$if(title)$
$if(brand.typography.headings.family)$
  heading-family: $brand.typography.headings.family$,
$endif$
$if(brand.typography.headings.weight)$
  heading-weight: $brand.typography.headings.weight$,
$endif$
$if(brand.typography.headings.style)$
  heading-style: "$brand.typography.headings.style$",
$endif$
$if(brand.typography.headings.color)$
  heading-color: $brand.typography.headings.color$,
$endif$
$if(brand.typography.headings.line-height)$
  heading-line-height: $brand.typography.headings.line-height$,
$endif$
$endif$

$if(course.title)$
  course-title: "$course.title$",
$endif$
$if(course.catalog-title)$
  course-catalog-title: "$course.catalog-title$",
$endif$

$if(course.number)$
  course-number: "$course.number$",
$endif$
$if(course.description)$
  description: "$course.description$",
$endif$
$if(course.short-description)$
  short-description: "$course.short-description$",
$endif$
$if(flyer-image.path)$
  image-path: "$flyer-image.path$",
$endif$
$if(flyer-image.attribution)$
  image-attribution: "$flyer-image.attribution$",
$endif$

$if(course-url)$
  url: "$course-url$",
$endif$
$if(course.instructor.name)$
  instructor: "$course.instructor.name$",
$endif$
$if(course.instructor.office)$
  office: "$course.instructor.office$",
$endif$
$if(course.term)$
  course-term: "$course.term$",
$endif$
$if(course.year)$
  course-year: "$course.year$",
$endif$
$if(course.prerequisites)$
  prerequisites: "$course.prerequisites$",
$endif$
$if(accent-color)$
  accent-color: $accent-color$,
$endif$
$if(course.meeting)$
  meetings: (
  $for(course.meeting)$
    (
      time: [$it.time$],
      place: [$it.place$],
    ),
  $endfor$
  ),
$endif$

  doc,
)
