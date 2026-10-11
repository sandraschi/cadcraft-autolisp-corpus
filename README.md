# AutoLISP conformance corpus

Small AutoLISP routines, each paired with the drawing it should produce. Meant as a test oracle for
an AutoLISP implementation in [CADCraft](https://github.com/storytold/cadcraft) (gaps.md E1), or any
other CAD program that runs AutoLISP.

18 cases. Cases 01-08 exercise command-level LISP (`defun`, `command`, loops, layers, dimensions).
Cases 09-18 exercise the entity level that real-world routines depend on: `entmake`, `entget`,
`assoc`/`subst`/`entmod`, `ssget` filters with `ssname` loops, `entnext` walks, `mapcar` with
`lambda`, recursion, `cond`, `polar`, and string building with `rtos`.

## Layout

```
cases/<NN-name>/routine.lsp     the routine; loading the file runs it
cases/<NN-name>/expected.json   preconditions and the expected result
SHA256SUMS                      checksums of every case file
```

## expected.json

- `preconditions.drawing`: always a new, empty drawing from the default template, current layer 0.
- `preconditions.sysvars`: system variables to set before loading. `OSMODE 0` everywhere: running
  object snaps would move the points passed to `command`. `DIMZIN 0` where `rtos` output is checked:
  `rtos` honours DIMZIN, and the metric template's default would print `12.5` for `12.50`.
- `preconditions.notes`: anything else the routine assumes (RECTANG options at their defaults; a
  text style with height 0, so TEXT asks for a height).
- `expect.entities`: every entity in model space after the run, in DXF terms:
  - `LINE` `start` `end`
  - `CIRCLE` `center` `radius`
  - `ARC` `center` `radius` `start_angle` `end_angle` (degrees, counter-clockwise as stored in DXF)
  - `LWPOLYLINE` `closed` `vertices`
  - `POINT` `location`
  - `TEXT` `insert` `height` `rotation` `text`
  - `DIMENSION` `kind` `xline1` `xline2` `rotation` `measurement`

  Each entity also has a `layer`.
- `expect.layers`: layers that must exist afterwards, with `color` (ACI) where the routine sets one.
- `expect.printed`: text the routine must print (compare after trimming leading newlines).

## Comparison rules

- Entities are compared as an unordered multiset (`compare: "unordered"`).
- Numbers match within `tolerance` (1e-9). Points are 3D; a 2D point in the routine has z = 0.
- A closed `LWPOLYLINE` matches if its vertices are the same cyclic sequence in either direction,
  starting at any vertex.
- Fields not listed are not checked (handles, colours left BYLAYER, dimension text position).

## Provenance and clean-room

Every expected value was derived by hand from the AutoLISP language and the published DXF Reference.
None was produced by, or checked against, AutoCAD or any other program, and no file here came out of
a CAD application. Where a value could be disputed (the stored angles of a clockwise 3-point arc,
the orientation DIMLINEAR picks), `expected.json` says how it was worked out. Corrections from
anyone who can verify against a reference implementation are welcome.

Cases 01-08 are adapted from the AutoLISP test fixtures of
[qcad-mcp](https://github.com/sandraschi/qcad-mcp) (MIT, same author): `_.` command prefixes,
`-LAYER` instead of `LAYER` so no dialog can open, and an `OSMODE` preamble. This corpus holds only
LISP routines and data; there is no code from QCAD or any other CAD program in it.

## License

MIT OR Apache-2.0, at your option. See `LICENSE-MIT` and `LICENSE-APACHE`.
