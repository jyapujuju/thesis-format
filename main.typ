// Import the package
// #import "@preview/modern-wku-thesis:0.1.0": graduate-thesis
#import "./src/lib.typ":graduate-thesis
#import "./src/chapters/intros.typ": *

#show: graduate-thesis.with(
  title: [Evaluating Gated Linear Attention for Efficient and High-Quality Nepali Text-to-Speech],
  author: "Rabin Shrestha",
  symbol_number: [LC0003001512],
  degree: [Phoenix College of Management],
  department: [Computer Science and Multimedia Department],
  university: [Lincoln University College, Malaysia],
  supervisor: [Mr. Bijya Mishra],
  month: [April],
  day: [20],
  year: [2025],
  degree-year: [2025],
  program-type: [Master of Science],
  dedication: dedication,
  declaration: declaration,
  organization: organization,
  recommendation: recommendation,
  certificate: certificate,
  acknowledgements: acknowledgements,
  bibliography: bibliography("refs.bib"),
  acronyms: (
    "TMS": "Traceability Management System",
    "RE": "Regular Expression",
    "CSV": "Comma-Separated Values",
    "JSON": "JavaScript Object Notation",
    "XML": "eXtensible Markup Language",
    "HTML": "HyperText Markup Language",
    "CSS": "Cascading Style Sheets",
    "JS": "JavaScript",
    "SQL": "Structured Query Language",
    "DB": "Database",
    "UI": "User Interface",
    "UX": "User Experience",
    "API": "Application Programming Interface",
    "HTTP": "Hypertext Transfer Protocol",
    "HTTPS": "Hypertext Transfer Protocol Secure",
    "TCP": "Transmission Control Protocol",
    "IP": "Internet Protocol",
    "DNS": "Domain Name System",
    "SMTP": "Simple Mail Transfer Protocol",
    "POP3": "Post Office Protocol version 3",
    "IMAP": "Internet Message Access Protocol",
  ),
)
// THE CONTENT GOES HERE
= Introduction

#lorem(20)

using References @brown2022algorithms, @anderson2023blockchain, try add figure and use it @fig:1, as log as table: @tb:1.

#figure(
  image("src/assets/logo.png"),
  caption: [Example Figure],
)<fig:1>

#figure(
  table(
    columns: 5,
    stroke: (x,y)=>
    if y==0 {
      (top:1pt)
      (bottom:0.5pt)
    },
    [*Heading 1*],[*Heading 2*],[*Heading 3*],[*Heading 4*],[*Heading 5*],
    [R1,C1],[R1,C2],[R1,C3],[R1,C4],[R1,C5],
    [R2,C1],[R2,C2],[R2,C3],[R2,C4],[R2,C5],
    table.hline()
  ),
  caption: [Example Table],
)<tb:1>

#lorem(200)

#lorem(150)
== Second heading
=== Third heading
==== Fourth heading
= Background
#lorem(2000)