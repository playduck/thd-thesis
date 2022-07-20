# THD-Template

This is an *unofficial* LaTeX template for use at the [Deggendorf Institute of Technology](https://th-deg.de).
This template was specifically designed for the course "Applied Computer Science".
It's opinionated regarding filestructure and packages but tries to provide reasonable defaults.

**This template is provided without warranty or support.**

## Building

The project uses XeLaTeX and [makefile](makefile).
There are multiple targets:

| Target        | Action                                                    | Use Case                                              |
|---------------|-----------------------------------------------------------|-------------------------------------------------------|
| make          | Build using `latexmk`                                     | Small changes (Recommended)                           |
| make once     | One run of `XeLaTeX`                                      | When `latexmk` fails                                  |
| make all      | Multiple runs of `XeLaTeX`, `biber` and `makeglossaires`  | When adding new Acronyms, Literature, bigger changes  |
| make open     | Opens compiled pdf                                        |                                                       |
| make clean    | Removes entire build directory                            |                                                       |

---

The resulting document is compiled to the `./dist` folder.

- [Download a LaTeX distribution for your system](https://wiki.contextgarden.net/TeX_Distributions) (Required)
- [Get Strawberry Pearl](https://strawberryperl.com) (Only Required on Windows)
- [Installing `make` on Windows](https://www.technewstoday.com/install-and-use-make-in-windows/) ([Wayback Mirror](https://web.archive.org/web/20220623033912/https://www.technewstoday.com/install-and-use-make-in-windows/)) (Only Required on Windows)


## License

This Software is provided under the [BSD-3 License](LICENSE.md).
