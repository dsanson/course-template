#import "@preview/cades:0.3.1": qr-code

#let flyer(
  title: none,
  authors: none,
  keywords: (),
  date: none,
  lang: "en",
  region: "US",
  font: "Libertinus Serif",
  title-size: 1.5em,
  subtitle-size: 1.25em,
  heading-family: none,
  heading-weight: "bold",
  heading-style: "normal",
  heading-color: black,
  heading-line-height: 0.65em,
  mathfont: none,
  codefont: none,
  linestretch: 1,
  sectionnumbering: none,
  linkcolor: none,
  citecolor: none,
  filecolor: none,

  course-title: none,
  course-number: none,
  description: none,
  image-path: "media/cover-image.svg",
  url: none,
  instructor: none,
  office: none,
  meetings: (),
  course-term: none,
  course-year: none,
  prerequisites: none,
  accent-color: teal,
  light-accent-color: none,
  doc,
) = {
  set page(
    paper: "us-letter",
    margin: (top: 0.35in, bottom: 0.35in, left: 0.48in, right: 0.48in),
    footer: [],
  )
  set text(font: font, size: 10pt, fill: black)
  set par(leading: 0.5em)
  let light-accent-color = if light-accent-color == none {
    accent-color.lighten(80%)
  } else {
    light-accent-color
  }

  // decorative underlay
  place(
    top + center,
    dy: 2.66in,
    rect(
      width: 100%,
      height: 7.64in,
      fill: light-accent-color,
    )
  )

  // course title block
  place(
    top + center,
    dy: .5in,
  )[
    #block(height: 2in, clip: true)[
      #set align(center)
      #set par(leading: .2em)
      #set par(spacing: .4em)
      #set text(size: 28pt, weight: "bold")
      #text(fill: accent-color)[#smallcaps[phi]]
      #text[#course-number]

      #text(size: 28pt, weight: "bold", fill: black)[#smallcaps[#course-title]]
    ]
  ]

  place(
    top + center,
    dy: 2in,
  )[
    #if image-path != none {
      image(image-path, width: 100% - .66in, height: 3in, fit: "cover")
    }
  ]
 
  place(
    top + center,
    dy: 5in,
  )[
    // Course description and meeting details
    #block(
      width: 100%,
      inset: .33in,
      height: 5in,
      clip: true,
    )[
      #grid(
        columns: (1.5fr, 0.5fr),
        gutter: 0.16in,

        block(
        )[
          #set align(left)
          #text(size: 14pt, weight: "bold")[About the course]
          #v(0.08in)
          #description

          #if prerequisites != none  { 
            text(weight: "bold")[Prerequisites.]
            text[ #prerequisites]
          }
        ],

        block(
          height: 100%,
        )[
          #set text(size: 9pt)
          #set align(right)

          #line(length: 100%, stroke: 0.8pt)
          #text(weight: "bold")[Instructor]\ 
          #text[#instructor]\ 
          #text[#office]
          #v(0.08in)

          #text(weight: "bold")[Times]\ 
          #for meeting in meetings [
            #par[
              #meeting.time \
              #meeting.place
            ]
          ]
          #line(length: 100%, stroke: 0.8pt)

        ],
      )
    ]
  ]

  place(
    bottom + right,
    dx: -.33in,
    dy: -.33in,
  )[
    #qr-code(url, width: 1in, height: 1in)
  ]


}
