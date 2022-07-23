# thd-thesis

This is an *unofficial* LaTeX template for use at the [Deggendorf Institute of Technology](https://th-deg.de).
This template was specifically designed to meet requirements of the "Applied Computer Science" faculty.
[Link to german requirements](https://th-deg.de/Studierende/Antraege-und-Organisatorisches/AI/Abschlussarbeiten_final_IAS_AI_LSI.pdf).
It's opinionated regarding filestructure and packages but tries to provide reasonable defaults.

**This template is provided without warranty or support.**

## Building

The project uses XeLaTeX and [makefile](makefile).
The resulting document is compiled to the `./dist` folder.
There are multiple targets:

| Target        | Action                                                    | Use Case                                              |
|---------------|-----------------------------------------------------------|-------------------------------------------------------|
| make          | Build using `latexmk`                                     | Small changes (Recommended)                           |
| make once     | One run of `XeLaTeX`                                      | When `latexmk` fails                                  |
| make all      | Multiple runs of `XeLaTeX`, `biber` and `makeglossaires`  | When adding new Acronyms, Literature, bigger changes  |
| make open     | Opens compiled pdf                                        |                                                       |
| make clean    | Removes entire build directory                            |                                                       |
---

### Naming convention

Make sure to rename [`document.tex`](./document.tex) and the variable [`MAINFILE` in the makefile](./makefile#L2) to fit the required naming convention of `Lastname-Firstname-(Bachelor|Master)arbeit` as stated in [Section 2.7 of the Guidelines](https://th-deg.de/Studierende/Antraege-und-Organisatorisches/AI/Abschlussarbeiten_final_IAS_AI_LSI.pdf).

### Installation

- [Download a LaTeX distribution for your system](https://wiki.contextgarden.net/TeX_Distributions) (Required)
- [Get Strawberry Pearl](https://strawberryperl.com) (Only Required on Windows)
- [Installing `make` on Windows](https://www.technewstoday.com/install-and-use-make-in-windows/) ([Wayback Mirror](https://web.archive.org/web/20220623033912/https://www.technewstoday.com/install-and-use-make-in-windows/)) (Only Required on Windows)


## License

This Software is provided under the [BSD-3 License](LICENSE.md).
