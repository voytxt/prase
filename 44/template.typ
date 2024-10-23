#let prase(ročník, série, úloha) = {
  grid(
    columns: (3fr, 1fr),
    align: (left, right),
    [
      *Vojtěch Křižan* \
      Škola: Gymnázium Františka Palackého Valašské Meziříčí \
      Ročník: #ročník. \
    ],
    [
      #place(bottom + right, dy: -30pt, image("logo.svg", width: 60pt)) \
      #série \
      Úloha: *#úloha* \
    ],
  )
  line(length: 100%, stroke: .5pt)
}
