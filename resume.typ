#set page(
  paper: "us-letter",
  margin: (x: 0.55in, top: 0.5in, bottom: 0.5in),
)

#set text(
  font: "Liberation Sans",
  size: 9.5pt,
  fill: rgb("#1f2937"),
  spacing: 120%,
)

#set par(justify: false, leading: 0.52em)

// --- Color Palette ---
#let primary = rgb("#0f172a")
#let accent = rgb("#1e3a8a")
#let muted = rgb("#475569")
#let line-rule = rgb("#cbd5e1")

// --- Helper Functions ---
#let section-heading(title) = {
  v(6pt)
  text(fill: accent, weight: "bold", size: 10pt)[#upper(title)]
  v(-3pt)
  line(length: 100%, stroke: 0.6pt + line-rule)
  v(2pt)
}

#let role-item(title, company, location, dates) = {
  block(width: 100%, inset: (bottom: 2pt))[
    #grid(
      columns: (1fr, auto),
      [*#company* -- #text(style: "italic")[#title]],
      [#text(fill: muted, size: 8.5pt)[#dates]],
    )
    #v(-2pt)
    #grid(
      columns: (1fr, auto),
      [],
      [#text(fill: muted, size: 8.5pt, style: "italic")[#location]],
    )
  ]
}

#let project-item(name, tags) = {
  block(width: 100%, inset: (bottom: 1pt))[
    *#name* #h(4pt) | #h(4pt) #text(fill: muted, size: 8.5pt, style: "italic")[#tags]
  ]
}

// --- Header ---
#align(center)[
  #text(size: 18pt, weight: "bold", fill: primary)[ZACHARY GERBI] \
  #v(2pt)
  #text(size: 8.5pt, fill: muted)[
    #link("https://github.com/zgerbi")[github.com/zgerbi] #h(6pt) | #h(6pt)
    #link("mailto:zachary.gerbi@gmail.com")[zachary.gerbi@gmail.com] #h(6pt) | #h(6pt)
    (321) 591-4790
  ]
]

// --- Experience ---
#section-heading("Employment & Leadership Experience")

#role-item(
  "Software Engineer I",
  "Universal Avionics",
  "Duluth, GA",
  "September 2023 – June 2026",
)
- Developed and implemented embedded C++ software for safety-critical avionics systems.
- Delivered full-stack development on connected avionics apps for iPad, powering data-driven fleet and post-flight telemetry analysis with AWS.
- Collaborated with systems and hardware engineers to integrate new avionics components across diverse aircraft configurations.
- Enforced software development, verification, and documentation standards compliant with DO-178B.

#v(4pt)
#role-item(
  "Software Engineer Intern",
  "Epsilon C5I",
  "Largo, FL",
  "May 2022 – August 2022",
)
- Synchronized software deliverables on a $280M defense contract using Python, C++, and Jenkins CI pipelines.
- Optimized source code storage strategies to reduce repository footprint by 38%.
- Collaborated within an Agile cross-functional team in an enterprise SAFe environment.
- Presented Sprint and Epic retrospectives to engineering leads and executive stakeholders.
- Held and maintained an active DOD Secret Clearance.

// --- Technical Skills ---
#section-heading("Technical Skills & Accreditations")

#list(
  marker: none,
  body-indent: 0pt,
  [*Languages:* C++, C\#, Java, Python, Swift, Kaitai, MATLAB, SQL],
  [*Cloud & Frameworks:* Amazon Web Services (AWS Glue, Lambda), React, PyTorch Lightning, JUCE],
  [*Embedded & Hardware:* Quartus, Waveforms, DO-178B Standards],
  [*Developer Tools & CI/CD:* Git, Jenkins, Unity, Linux, Windows, macOS, Atlassian Ecosystem],
  [*AI Tooling & Credentials:* Ollama, GitHub Copilot, Gemini | SolidWorks Certified, DOD Secret Clearance (Held)],
)

// --- Projects ---
#section-heading("Projects")

#project-item("UA FlightReview", "Connected Avionics Flight Data Analysis | React, Swift, C#, AWS")
- Ingests and visualizes FDR and FMS telemetry across fleet aircraft for pilots and maintenance crews to diagnose performance metrics and safety anomalies.
- Built with a React web interface backed by a modular Swift upload framework, processing telemetry via AWS Glue and Lambda.

#v(3pt)
#project-item("GatorBones", "AI/ML Image Segmentation | Python, PyTorch Lightning, CUDA")
- Built a radiographic segmentation pipeline for UF's BRIO Lab to infer bone and joint coordinates from canine X-rays.
- Implemented a SwinUNETR transformer architecture in PyTorch Lightning augmented with a Boundary Patch Refinement layer, trained across 1,000+ scans on UF's HiPerGator supercomputer.

#v(3pt)
#project-item("Soundstage", "VST3 Spatial Audio Plugin | C++, JUCE")
- Engineered a real-time 3D spatialization audio plugin applying Head-Related Transfer Functions (HRTF) from the CIPIC database.
- Implemented real-time dynamic audio placement responsive to MIDI inputs and on-screen controls.

// --- Education ---
#section-heading("Education")

#grid(
  columns: (1fr, auto),
  [*University of Florida* -- #text(style: "italic")[B.S. in Computer Science, Minor in Digital Arts & Sciences]],
  [#text(fill: muted, size: 8.5pt)[August 2018 – August 2023]],
)
#v(-2pt)
#grid(
  columns: (1fr, auto),
  [Dean's List (2022–2023)],
  [#text(fill: muted, size: 8.5pt, style: "italic")[Gainesville, FL]],
)
#v(2pt)
#text(size: 8.5pt)[*Coursework:* Data Structures & Algorithms, Operating Systems, Software Engineering, Digital Logic, 3D Audio, Database Systems, Computer Networking, Numerical & Data Analysis, Blockchain Development, UI/UX Design, Game Development.]
