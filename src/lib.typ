#let graduate-thesis(
  head: [Report for the Degree of Master of Computer Science],
  cover_footer: [Research project for the Degree of Master of Computer Science],
  title: [thesis title],
  author: "author name",
  symbol_number: [],
  degree: [MS of Computer Information Systems],
  department: [College of Science, Mathematics and Technology],
  university: [Wenzhou-Kean University],
  supervisor: [Supervisor Name],
  day: [day],
  month: [Month],
  year: [Year],
  degree-year: [Year],
  program-type: [Master of Computer Information Systems],
  degree-type: [Master],
  degree-department: [College of Science, Mathematics and Technology],
  abstract: none,
  keywords: none,
  dedication: none,
  declaration: none,
  recommendation: none,
  acknowledgements: none,
  organization: none,
  certificate: none,
  acronyms:(:),
  bibliography: none,
  body
)={
  set document(title: title, author: author)
  // 初始设置：前置章节不显示任何编号
  set heading(numbering: none)
  set page(
    margin: (
      left: 1.6in,  // Always 1.6 on the left, regardless of page number
      right: 1in,
      top: 1in,
      bottom: 1in,
    ),
  )
  
  // 设置标题字号和间距
  show heading: it => {
    let sizes = (25pt, 18pt, 15pt, 12pt, 12pt, 12pt)
    let spacings = (2em, 1.6em, 1.3em, 1.1em, 1em, 1em)
    let level = it.level - 1
    let size = if level < sizes.len() { sizes.at(level) } else { 12pt }
    let spacing = if level < spacings.len() { spacings.at(level) } else { 1em }
    
    // Check if this is a content level 1 heading (Chapter X)
    let is-chapter = false
    let chapter-number = 0
    
    if it.level == 1 and it.numbering != none {
      let numbering-result = numbering(it.numbering, ..counter(heading).get())
      if type(numbering-result) == str and numbering-result.starts-with("Chapter ") {
        is-chapter = true
        // Extract chapter number
        let chapter-str = numbering-result.slice(8) // Remove "Chapter " prefix
        chapter-number = int(chapter-str)
      }
    }
    
    // Add pagebreak before Chapter 2 and onwards
    if is-chapter and chapter-number >= 2 {
      pagebreak()
    }
    
    v(spacing, weak: true)
    
    // Apply center alignment for all content level 1 headings (Chapter X)
    if it.level == 1 and is-chapter {
      align(center)[
        #text(size: size, weight: "bold")[#it]
      ]
    } else {
      text(size: size, weight: "bold")[#it]
    }
    
    v(spacing, weak: true)
  }
  
  // 设置表格标题样式：10pt，粗体，位于表格上方
  show figure.where(kind: table): set figure.caption(position: top)
  show figure.caption.where(kind: table): it => {
    text(size: 10pt, weight: "bold")[#it]
  }

  show figure.caption.where(kind: image): it=>{
    text(size: 10pt, weight: "bold")[#it]
  }
  
  // COVER PAGE ------------ ************************************* 1
  set text(size: 16pt)

  align(center)[
    #text[#head]
    
    #text(size: 20pt, weight: "bold")[#title]
    
    #v(4em)
    #image("assets/logo.png", width: 100pt)
    #v(4em)
    
    
    #text(weight: "bold")[#author]
    
    #text(weight: "bold")[#symbol_number]
    #v(3em)

    
    
    #text(weight: "bold")[#degree]    
    
    #department
    
    #university
    
    #month #year
    
    // #v(2em)
    
    // Supervised By: \ *#supervisor*
    
    #v(4em)

    #text[#cover_footer]

  ]
  pagebreak()
  
  // COVER PAGE ------------ ************************************* 2
  set text(size: 16pt)
  set page(numbering: "i")
  counter(page).update(1)
  align(center)[
    #text(size: 20pt, weight: "bold")[#title]
    
    #v(5em)

    #text(weight: "bold")[Supervised by #supervisor]
    
    #text[A report submitted in partial fulfilment of the requirements for the degree of Master of Computer Science]
        
    #v(5em)
        
    #text(weight: "bold")[#author]
    
    #text(weight: "bold")[#symbol_number]
    #v(5em)

        #text(weight: "bold")[#degree]    
    
    #department
    
    #university
    
    #month #year
  ]
  

  
  // grid(
  //   columns: (1fr, 1fr),
  //   column-gutter: auto,
  //   row-gutter: 1.5em,
  //   align: (left, right),
  //   [
  //     #program-type (#degree-year)
  //     #linebreak()
  //     #degree-department
  //   ],
  //   [
  //     #university
  //     #linebreak()
  //     Wenzhou, China
  //   ],
  // )
  // v(5em)
  // grid(
  //   columns: (0.5fr, 1fr),
  //   column-gutter: auto,
  //   row-gutter: 3em,
  //   align: (left, left),
  //   [
  //     TITLE:
  //   ],
  //   [
  //     #title
  //   ],
  //   [
  //     AUTHOR:
  //   ],
  //   [
  //     #author
  //     #linebreak()
  //     #degree-type, (#degree-department)
  //     #linebreak()
  //     #university
  //     #linebreak()
  //     Wenzhou, China
  //   ],
  //   [
  //     SUPERVISORS:
  //   ],
  //   [
  //     #supervisor
  //   ],
  //   // Number of pages row - auto-generated
  //   [
  //     NUMBER OF PAGES:
  //   ],
  //   [
  //     #context {
  //       let total-pages = counter(page).final().first()
  //       total-pages
  //     }
  //   ]
  // )
  pagebreak()

  // COVER Dedication ------------ ************************************* 3
  set text(size: 12pt)
  set par(justify: true, leading: 1em, spacing: 2.5em)
  if dedication != none {
    text(size: 12pt, weight: "bold")[Dedication]
        
    v(.1em)
    
    [#dedication]

    v(4em)
    [Signature]
    linebreak()
    text(size: 12pt)[Name of the Student : ] + [#author]
    linebreak()
    text(size: 12pt)[Registration Number : ] + [#symbol_number]
    linebreak()
    text(size: 12pt)[Date : ] + [ #day ] + [ #month ] + [ #year ]


    if keywords != none {
      text(weight: "bold")[Keywords: ] + [#keywords]
    }
    
    pagebreak()
  }
  
  // COVER Declaration ------------ ************************************* 4
  if declaration != none {
    text(size: 12pt, weight: "bold")[Declaration]
        
    v(.1em)

    [#declaration]
  

    v(4em)
    [Signature]
    linebreak()
    text(size: 12pt)[Name of the Student : ] + [#author]
    linebreak()
    text(size: 12pt)[Registration Number : ] + [#symbol_number]
    linebreak()
    text(size: 12pt)[Date : ] + [ #day ] + [ #month ] + [ #year ]

    if keywords != none {
      text(weight: "bold")[Keywords: ] + [#keywords]
    }
    
    pagebreak()
  }


    // COVER Recommendation ------------ ************************************* 4
  if recommendation != none {
    text(size: 12pt, weight: "bold")[Recommendation]
        
    v(.1em)

    [#recommendation]
  

    v(4em)
    [Signature]
    linebreak()
    text(size: 12pt)[Name of the Supervisor : ] + [#supervisor]
    linebreak()
    text(size: 12pt)[Organization : ] + [#organization]
    linebreak()
    text(size: 12pt)[Date : ] + [ #day ] + [ #month ] + [ #year ]

    if keywords != none {
      text(weight: "bold")[Keywords: ] + [#keywords]
    }
    
    pagebreak()
  }

  // COVER Certificate ------------ ************************************* 4
  if certificate != none {
    text(size: 12pt, weight: "bold")[Certificate]
        
    v(.1em)

    [#certificate]
  

    v(4em)
    [External examiner]
    v(4em)
    [Supervisor]

    if keywords != none {
      text(weight: "bold")[Keywords: ] + [#keywords]
    }
    
    pagebreak()
  }

  // COVER Acknowledgement ------------ ************************************* 4
  if acknowledgements != none {
    text(size: 12pt, weight: "bold")[Acknowledgements]
        
    v(.1em)

    [#acknowledgements]
  

    v(4em)
    [Signature]
    linebreak()
    text(size: 12pt)[Name of the Student : ] + [#author]
    if keywords != none {
      text(weight: "bold")[Keywords: ] + [#keywords]
    }
    
    pagebreak()
  }
  
  // 设置目录缩进
  show outline.entry.where(level: 1): it => {
    v(12pt, weak: true)
    strong(it)
  }
  show outline.entry.where(level: 2): it => {
    pad(left: -4em, it)
  }
  show outline.entry.where(level: 3): it => {
    pad(left: -5em, it)
  }
  show outline.entry.where(level: 4): it => {
    pad(left: -5em, it)
  }
  
  outline(title: text(size: 25pt, weight: "bold")[Table of Contents])
  pagebreak()
  
  // Add List of Figures as a heading so it appears in TOC
  heading(level: 1, numbering: none)[List of Figures]
  outline(title: none, target: figure.where(kind: image))
  pagebreak()
  
  // Add List of Tables as a heading so it appears in TOC
  heading(level: 1, numbering: none)[List of Tables]
  outline(title: none, target: figure.where(kind: table))
  pagebreak()

  if acronyms != none {
    [= Definition of Acronyms]
    
    // Create table from acronyms dictionary wrapped in figure
    figure(
      table(
         columns: (20%, 80%),
         stroke: 0.5pt,
         align: (center, left),
         table.header(
           [*Acronym*], [*Definition*]
         ),
        ..acronyms.pairs().map(((key, value)) => (key, value)).flatten()
      ),
      caption: [Definition of Acronyms],
      kind: table
    )
    
    pagebreak()
  }
  // Main content - Arabic numerals starting from 1
  set page(numbering: "1")
  counter(page).update(1)
  
  // 重置章节计数器并设置正文标题编号：显示 "Chapter"
  counter(heading).update(0)
  set heading(numbering: (..nums) => {
    let level = nums.pos().len()
    if level == 1 {
      "Chapter " + str(nums.pos().at(0))
    } else if level == 2 {
      str(nums.pos().at(0)) + "." + str(nums.pos().at(1))
    } else if level == 3 {
      // Level 3: A.B.C format
      let letters = ("A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z")
      letters.at(nums.pos().at(2) - 1)+"."
    } else if level == 4 {
      // Level 4: just a dot
      "•"
    } else {
      nums.pos().map(str).join(".")
    }
  })
  
  show std.bibliography: set text(12pt)
  show std.bibliography: set par(spacing: 1em, leading: 0.5em)
  set std.bibliography(title: [References], style: "ieee")
  
  body
  // 使用相对于调用文件的路径
  pagebreak()
  bibliography
}