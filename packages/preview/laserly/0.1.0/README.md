Laserly
===

A package to render 2D laser optic assemblies, which can be used in theses or documentations. Previously, I created these assemblies in inkscape, which becomes bothersome when the assembly needs to be changed. Being able to program the assembly makes it easy to insert new optical elements and the alignment will always be guaranteed.

General usage
---

```
#import "@local/laserly:0.1.0": assemble, element

#context {
  let objs = assemble((
    element("fiber_coupler", dist: -20pt),
    element("shutter"),
    element("fiber_coupler", rot: 180deg)
  ))

  objs.content
}
```

With this example, a new assembly is created which contains a fiber coupler (as laser output), a shutter and a second fiber coupler (as laser input). A more thorough example is given in ``example.typ``.# Documentation

## Functions

### `assemble`
The main function used to create an assembly. The `objs` parameter requires function calls to `element(...)`, `mirror(...)`, `splitter(...)`, or `arrow(...)`.
Its return value is used to render the assembly.

**Optional Parameters:**
- `rot` [degrees, default: `0deg`]: Global rotation of the assembly
- `stroke` [stroke, default: `1pt+black`]: Stroke style of the laser

**Required Parameters:**
- `objs` [array]: All objects contained within the assembly.

**Returns:**
- `objs`, containing:
  - `objs.content` (for rendering)
  - `objs.elements` (for legend)

---

### `combine_assemblies`
**Required Parameters:**
- `assemblies` [vararg of all assemblies]

---

### `legend`
This function creates a legend box.

**Optional Parameters:**
- `labels` [array, default: `()`]: Text for each label. Array position matches `label_num-1` (e.g., if an element has `label_num: 4`, then `labels[3]` will be its text).
- `alt-text` [array of tuples, default: `()`]: Alternative text for the elements. For example, an element can be `("Beamsplitter", "PBS")`, renaming all "Beamsplitter" elements to "PBS".
- `pic_scale` [float, default: `0.7`]: Size of the elements in the legend
- `pic_text_size` [font size, default: `10pt`]: Size of the element name
- `info_text_size` [font size, default: `11pt`]: Size of the info text
- `pic_padding` [size, default: `0.5em`]: Distance between element text and picture
- `info_padding` [size, default: `0.7em`]: Distance to the info text

**Required Parameters:**
- `components`: Use `objs.elements` (the return from `assemble`)

---

## Elements (also functions)

### `element`
A general optical element.

**Optional Parameters:**
- `variant` [integer, default: `1`]: Elements can have different pictures. Try different integers (starting from 1) or check the assets folder.
- `dist` [size, default: `30pt`]: Distance to previous object
- `rot` [degrees, default: `0deg`]: Rotation of element
- `size` [float, default: `1.0`]: Size of the element
- `info_pos` [position (`none`   `top` | `right` | `bottom` | `left`), default: `none`]: Position of the info number (e.g., for labeling an element)
- `info_num` [integer, default: `-1`]: Number of the info (should be referenced in the legend)

**Required Parameters:**
- `type` [string]: A name referring to the element. Check the available names in the assets folder.

---

### `mirror`
An optical element to redirect a laser beam.

**Optional Parameters:**
- See optional parameters of `element`
- `type` [string, default: `"mirror"`]

---

### `splitter`
An optical element that can split a beam into two paths. The third path is used, e.g., in a configuration where a laser returns to the splitter.

**Optional Parameters:**
- See optional parameters of `element`
- `type` [string, default: `"beam_splitter_cube"`]
- `path3` [array]: All objects contained within the third path of the splitter. If empty, the path will not be used.

**Required Parameters:**
- `path1` [array]: All objects contained within the first path of the splitter
- `path2` [array]: All objects contained within the second path of the splitter

---

### `arrow`
Adds an arrow into the laser path.

**Optional Parameters:**
- `dist`, `size`, `info_pos`, `info_num`: See `element`
