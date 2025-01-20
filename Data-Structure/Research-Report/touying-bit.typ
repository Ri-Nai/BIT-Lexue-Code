
// Stargazer theme - adapted for BIT
#import "@preview/touying:0.5.5": *
#import themes.stargazer: *

#let bit-theme(
  aspect-ratio: "16-9",
  lang: "en",
  font: "Noto Sans SC",
  ..args,
  body,
) = {
  set text(lang: lang, font: font)
  show: if lang == "zh" {
    import "@preview/cuti:0.2.1": show-cn-fakebold
    show-cn-fakebold
  } else {
    it => it
  }

  show: stargazer-theme.with(
    aspect-ratio: aspect-ratio,
    config-info(logo: image("template/assets/bit-cs.png")),
    config-colors(
      primary: rgb("#62d2a2"),
      primary-dark: rgb("#1fab89"),
      secondary: rgb("#ffffff"),
      tertiary: rgb("#359a63"),
      neutral-lightest: rgb("#fcfff5"),
      neutral-darkest: rgb("#05261e"),
    ),
    ..args,
  )

  body
}
