#import "../template.typ": prase
#prase(3, "1. podzimní série", 1)

#import "@preview/cetz:0.3.1"

#set text(15pt)

#let drawPoints(coords, highlightPoints: (), drawLines: false) = {
  let i = 0

  for coord in coords {
    if drawLines {for coord2 in coords.slice(i) {
      cetz.draw.line(coord, coord2)
    }}

    cetz.draw.circle(
      coord,
      radius: 0.1,
      stroke: none,
      fill: if highlightPoints.contains(i) { color.red } else { color.black },
    )

    i += 1
  }
}

Celkový počet trojúhelníků s vrcholy v $n$ bodech je roven $binom(n, 3)$, protože vybíráme $3$ vrcholy pro každý trojúhelník z celkových $n$ vrcholů. Pro náš případ je $n = 6$. 

$ binom(6, 3) = 6! / (3! dot (6 - 3)!) = 20 $

#align(center, cetz.canvas({
  drawPoints((
    (0, 0),
    (1, 0),
    (1.5, calc.sqrt(3) / 2),
    (1, calc.sqrt(3)),
    (0, calc.sqrt(3)),
    (-0.5, calc.sqrt(3) / 2),
  ), drawLines: true)
}))

Celkově tedy získáme $20$ trojúhelníků, my ale potřebujeme 17, takže se musíme 3 trojúhelníků zbavit. Nemůžeme změnit počet vrcholů, můžeme ale změnit jejich pozice. Když dáme #text("3 body", fill: color.red) do #text("jedné přímky", fill: color.blue), tak z nich trojúhelník sestrojit nepůjde.

#align(center, cetz.canvas({
  cetz.draw.line((-1, 0), (3, 0), stroke: color.blue)
  drawPoints((
    (0, 0),
    (1, 0),
    (2, 0),
    (1, calc.sqrt(3)),
    (0, calc.sqrt(3)),
    (-0.5, calc.sqrt(3) / 2),
  ), highlightPoints: (0, 1, 2))

}))

Takhle jsme se zbavili jednoho trojúhelníku, zbývá se zbavit ještě dalších dvou. Stačí mít další 2 trojice bodů na přímce.

#align(center, cetz.canvas({
  cetz.draw.line((-1, 0), (3, 0), stroke: color.blue)
  cetz.draw.line((2.5, -calc.sqrt(3)/2), (0.5, 3 * calc.sqrt(3) / 2), stroke: color.blue)
  cetz.draw.line((1.5, 3 * calc.sqrt(3) / 2), (-0.5, -calc.sqrt(3)/2), stroke: color.blue)

  drawPoints((
    (0, 0),
    (1, 0),
    (2, 0),
    (1.5, calc.sqrt(3) / 2),
    (1, calc.sqrt(3)),
    (0.5, calc.sqrt(3) / 2),
  ))
}))

#align(center, cetz.canvas({
  drawPoints((
    (0, 0),
    (1, 0),
    (2, 0),
    (1.5, calc.sqrt(3) / 2),
    (1, calc.sqrt(3)),
    (0.5, calc.sqrt(3) / 2),
  ), drawLines: true)
}))