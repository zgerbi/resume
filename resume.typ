#set page(
  paper: "us-letter",
  margin: (x: 0.5in, top: 0.4in, bottom: 0.4in),
)

// Font stack: Modern clean sans-serif with cross-platform fallbacks
#set text(
  font: ("Avenir Next", "Helvetica Neue", "Arial"),
  size: 9pt,
  fill: rgb("#334155"),
  spacing: 105%,
)

#set par(justify: false, leading: 0.52em)

// --- Color System (Executive Slate & Tech Royal Blue) ---
#let c-primary = rgb("#0f172a")     // Slate 900
#let c-body = rgb("#334155")        // Slate 700
#let c-muted = rgb("#64748b")       // Slate 500
#let c-accent = rgb("#1d4ed8")      // Royal Blue 700
#let c-border = rgb("#e2e8f0")      // Slate 200
#let c-chip-bg = rgb("#f1f5f9")     // Slate 100
#let c-chip-text = rgb("#1e293b")   // Slate 800

// --- SVG Icons ---
#let icon-mail(color: c-muted, size: 8pt) = box(baseline: 15%, height: size)[
  #image(
    bytes(
      "<svg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 24 24' fill='none' stroke='"
        + color.to-hex()
        + "' stroke-width='2' stroke-linecap='round' stroke-linejoin='round'><rect width='20' height='16' x='2' y='4' rx='2'/><path d='m22 7-8.97 5.7a1.94 1.94 0 0 1-2.06 0L2 7'/></svg>",
    ),
    format: "svg",
    height: size,
  )
]

#let icon-phone(color: c-muted, size: 8pt) = box(baseline: 15%, height: size)[
  #image(
    bytes(
      "<svg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 24 24' fill='none' stroke='"
        + color.to-hex()
        + "' stroke-width='2' stroke-linecap='round' stroke-linejoin='round'><path d='M22 16.92v3a2 2 0 0 1-2.18 2 19.79 19.79 0 0 1-8.63-3.07 19.5 19.5 0 0 1-6-6 19.79 19.79 0 0 1-3.07-8.67A2 2 0 0 1 4.11 2h3a2 2 0 0 1 2 1.72 12.84 12.84 0 0 0 .7 2.81 2 2 0 0 1-.45 2.11L8.09 9.91a16 16 0 0 0 6 6l1.27-1.27a2 2 0 0 1 2.11-.45 12.84 12.84 0 0 0 2.81.7A2 2 0 0 1 22 16.92z'/></svg>",
    ),
    format: "svg",
    height: size,
  )
]

#let icon-github(color: c-muted, size: 8pt) = box(baseline: 15%, height: size)[
  #image(
    bytes(
      "<svg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 24 24' fill='none' stroke='"
        + color.to-hex()
        + "' stroke-width='2' stroke-linecap='round' stroke-linejoin='round'><path d='M15 22v-4a4.8 4.8 0 0 0-1-3.5c3 0 6-2 6-5.5.08-1.25-.27-2.48-1-3.5.28-1.15.28-2.35 0-3.5 0 0-1 0-3 1.5-2.64-.5-5.36-.5-8 0C6 2 5 2 5 2c-.3 1.15-.3 2.35 0 3.5A5.403 5.403 0 0 0 4 9c0 3.5 3 5.5 6 5.5-.39.49-.68 1.05-.85 1.65-.17.6-.22 1.23-.15 1.85v4'/><path d='M9 18c-4.51 2-5-2-7-2'/></svg>",
    ),
    format: "svg",
    height: size,
  )
]

#let icon-map(color: c-muted, size: 8pt) = box(baseline: 15%, height: size)[
  #image(
    bytes(
      "<svg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 24 24' fill='none' stroke='"
        + color.to-hex()
        + "' stroke-width='2' stroke-linecap='round' stroke-linejoin='round'><path d='M20 10c0 4.993-5.539 10.193-7.399 11.799a1 1 0 0 1-1.202 0C9.539 20.193 4 14.993 4 10a8 8 0 0 1 16 0'/><circle cx='12' cy='10' r='3'/></svg>",
    ),
    format: "svg",
    height: size,
  )
]

// --- Pill Chip ---
#let chip(text-content) = {
  box(
    fill: c-chip-bg,
    inset: (x: 4.5pt, y: 2pt),
    radius: 3pt,
    baseline: 10%,
  )[#text(size: 7.5pt, weight: "medium", fill: c-chip-text)[#text-content]]
}

// --- Section Header ---
#let section(title) = {
  v(8pt)
  block(
    width: 100%,
    stroke: (bottom: 1pt + c-border),
    inset: (bottom: 3pt),
  )[
    #grid(
      columns: (auto, 1fr),
      gutter: 6pt,
      align: horizon,
      [
        #box(width: 3pt, height: 9.5pt, fill: c-accent, radius: 1.5pt)
      ],
      [
        #text(
          fill: c-primary,
          weight: "bold",
          size: 9.5pt,
          tracking: 0.1em,
        )[#upper(title)]
      ],
    )
  ]
  v(4pt)
}

// --- Experience Entry (Clean 2-row layout) ---
#let role(title, company, location, dates) = {
  block(width: 100%, inset: (bottom: 2pt))[
    #grid(
      columns: (1fr, auto),
      row-gutter: 1.5pt,
      [
        #text(weight: "bold", size: 9.5pt, fill: c-primary)[#company]
        #text(fill: c-muted)[ · ]
        #text(weight: "semibold", size: 9pt, fill: c-accent)[#title]
      ],
      [
        #text(fill: c-muted, size: 8.5pt, weight: "medium")[#dates]
      ],

      [
        #text(fill: c-muted, size: 8pt)[#icon-map(size: 7pt) #location]
      ],
      [],
    )
  ]
}

// --- Project Entry ---
#let project(title, subtitle: none, tech-list) = {
  block(width: 100%, inset: (bottom: 2pt))[
    #grid(
      columns: (1fr, auto),
      gutter: 8pt,
      align: horizon,
      [
        #text(weight: "bold", size: 9.5pt, fill: c-primary)[#title]
        #if subtitle != none [
          #text(fill: c-muted)[ · ]
          #text(style: "italic", size: 8.5pt, fill: c-body)[#subtitle]
        ]
      ],
      [
        #align(right)[
          #for t in tech-list [
            #chip(t)
            #h(1.5pt)
          ]
        ]
      ],
    )
  ]
}

// Custom Bullet
#set list(
  marker: [
    #box(baseline: 10%, circle(radius: 1.8pt, fill: c-accent))
  ],
  spacing: 6.5pt,
)

// ==========================================
//               HEADER
// ==========================================
#align(center)[
  #text(size: 22pt, weight: "bold", fill: c-primary, tracking: 0.05em)[ZACHARY GERBI] \
  #v(2pt)
  #text(size: 10pt, weight: "semibold", fill: c-accent)[Software Engineer]
  #text(size: 10pt, fill: c-muted)[ · Embedded & Cloud Systems] \
  #v(5pt)
  #grid(
    columns: (auto, auto, auto, auto),
    gutter: 15pt,
    align: center + horizon,
    [#icon-mail() #h(2.5pt) #link("mailto:zachary.gerbi@gmail.com")[zachary.gerbi\@gmail.com]],
    [#icon-phone() #h(2.5pt) (321) 591-4790],
    [#icon-github() #h(2.5pt) #link("https://github.com/zgerbi")[github.com/zgerbi]],
    [#icon-map() #h(2.5pt) Seattle, WA],
  )
]

#v(2pt)

// ==========================================
//          PROFESSIONAL EXPERIENCE
// ==========================================
#section("Professional Experience")

#role(
  "Software Engineer I",
  "Universal Avionics",
  "Duluth, GA",
  "Sept 2023 – June 2026",
)
- Developed and deployed embedded C++ software for safety-critical avionics flight display components.
- Partnered with systems and hardware engineering teams to integrate components across diverse aircraft airframes.
- Enforced strict DO-178B software development, peer code review, and verification standards.
- Full-stack development on connected avionics iPad applications for data-driven fleet and post-flight telemetry analysis with AWS.

#v(5pt)
#role(
  "Software Engineer Intern",
  "Epsilon C5I",
  "Largo, FL",
  "May 2022 – Aug 2022",
)
- Synchronized software integration on a \$280M defense contract utilizing Python, C++, and automated Jenkins pipelines.
- Reduced Git repository footprint by 38% through optimized artifact caching and source storage restructuring.
- Participated in cross-functional Agile rituals and retrospectives within an enterprise SAFe framework.
- Maintained DOD Secret clearance throughout tenure for secure defense workflows.

// ==========================================
//          TECHNICAL EXPERTISE
// ==========================================
#section("Technical Expertise")

#grid(
  columns: (115pt, 1fr),
  row-gutter: 5pt,
  column-gutter: 12pt,
  align: (left + horizon, left + horizon),
  [#text(weight: "bold", size: 8.5pt, fill: c-primary)[Languages]],
  [
    #chip("C++") #chip("C#") #chip("Java") #chip("Python") #chip("Swift") #chip("Kaitai") #chip("MATLAB") #chip("SQL")
  ],

  [#text(weight: "bold", size: 8.5pt, fill: c-primary)[Cloud & Frameworks]],
  [
    #chip("AWS (Glue, Lambda)") #chip("React") #chip("JUCE")
  ],

  [#text(weight: "bold", size: 8.5pt, fill: c-primary)[Developer Tools]],
  [
    #chip("Git") #chip("Linux") #chip("macOS") #chip("Windows") #chip("Atlassian Ecosystem") #chip(
      "AI Tools (Ollama, Copilot, Gemini)",
    )
  ],

  [#text(weight: "bold", size: 8.5pt, fill: c-primary)[Standards & Practices]],
  [
    DO-178B Compliance #text(fill: c-muted)[ · ] SAFe Agile #text(fill: c-muted)[ · ] SolidWorks Certified #text(fill: c-muted)[ · ] Former DOD Secret Clearance
  ],
)

// ==========================================
//          FEATURED PROJECTS
// ==========================================
#section("Featured Projects")

#project(
  "UA FlightReview",
  subtitle: "Connected Avionics Flight Data Analysis",
  ("React", "Swift", "C#", "AWS Glue", "AWS Lambda"),
)
- Built an iPad application for pilots and maintenance personnel to upload and analyze FDR and FMS telemetry across aircraft fleets.
- Developed a React interface for flight metric visualization, backed by a custom Swift upload framework and AWS Glue/Lambda cloud processing.

#v(5pt)
#project(
  "GatorBones",
  subtitle: "AI/ML Image Segmentation",
  ("Python", "MONAI", "CUDA"),
)
- Developed an image recognition model for UF's BRIO Lab to determine bone and joint placements from canine X-rays.
- Implemented a SwinUNETR transformer architecture with Boundary Patch Refinement; trained on 1,000+ scans using UF's HiPerGator supercomputer and NVIDIA CUDA.

#v(5pt)
#project(
  "Soundstage",
  subtitle: "VST3 Audio Plugin",
  ("C++", "JUCE"),
)
- Built a real-time VST3 audio plugin using the JUCE framework that processes audio to simulate 3D spatial location in virtual space.
- Implemented Head-Related Transfer Functions (HRTF) from the CIPIC database, controlled by live MIDI inputs or interactive GUI controls.

// ==========================================
//               EDUCATION
// ==========================================
#section("Education")

#grid(
  columns: (1fr, auto),
  row-gutter: 2pt,
  [
    #text(weight: "bold", size: 9.5pt, fill: c-primary)[University of Florida]
    #text(fill: c-muted)[ · ]
    #text(style: "italic", fill: c-body)[B.S. in Computer Science]
  ],
  [
    #text(fill: c-muted, size: 8.5pt, weight: "medium")[Aug 2018 – Aug 2023]
  ],

  [
    Minor in Digital Arts & Sciences | Dean's List (2022–2023)
  ],
  [
    #text(fill: c-muted, size: 8pt)[#icon-map(size: 7pt) Gainesville, FL]
  ],
)

#v(4pt)
#text(size: 8.5pt, fill: c-muted)[
  #text(weight: "semibold", fill: c-primary)[Key Coursework:] Data Structures & Algorithms, Operating Systems, Software Engineering, Digital Logic, 3D Audio, Database Systems, Computer Networking, Numerical Analysis.
]
