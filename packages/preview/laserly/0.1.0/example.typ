#import "@preview/laserly:0.1.0": legend, assemble, element, arrow, splitter, mirror

#context {
  let objs = assemble(stroke:1pt+gradient.linear(..color.map.turbo), (
    element("fiber_coupler", dist: 20pt, info_pos: top, info_num: 1),
    element("shutter", dist: 100pt),
    element("lambda-DIV-2", dist: 10pt),
    element("lambda-DIV-4"),
    mirror(rot: 5deg, info_pos: top, info_num: 2),
    element("lambda-DIV-2"),
    mirror(rot: 25deg, dist: 20pt),
    arrow(dir:-1, dist: 10pt),
    arrow(dir:1, dist: 20pt),
    element("shutter", dist: 10pt),
    element("lambda-DIV-2", dist: 20pt),
    splitter(
      info_pos: right,
      info_num: 4,
      rot: 0deg,
      (element("shutter"), element("lambda-DIV-2"), element("lambda-DIV-4"),
        splitter(
          rot: -10deg,
          (element("shutter"), element("lambda-DIV-2"), element("lambda-DIV-4")),

          (element("shutter"), mirror(rot: 45deg), element("lambda-DIV-2", info_pos: top, info_num: 3), element("lambda-DIV-4"))
        )),

      (element("shutter"), element("lambda-DIV-2"), element("lambda-DIV-4")),
    ),
  ))

  objs.content

  legend(objs.elements,
    labels: ("Input",
      "Weird angle",
      "This is where we split",
      "Just labeling the waveplate"),
    alt-text: (("Beamsplitter", "PBS"), ("Cavity", "Scanning Cavity"))
  )
}


#context {
  let objs = assemble((
    element("fiber_coupler", dist: -20pt),
    element("shutter"),
    element("fiber_coupler", rot: 180deg)
  ))

  objs.content
}
